Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1981E78A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 10:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE2IqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 04:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgE2IqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 04:46:24 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C28C03E969
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 01:46:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q24so929452pjd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XiIwcIBaCjacNvQQiGLxskNtGMHCMoH6FbpJtFd+1bk=;
        b=xeh7YBtNLEg/HSHajEUKqjg00CUU1WpaXmJGLNkGlhAEyBmFt0sUQ+SEm4iiDCg6Ap
         4hiWdMIri0YvFdptKT236rPnFWAse7EO0mwSgX3dwsi41CIjD5XNM+TpZIXfU0wCkWEa
         F4/S+lzMYxRF4Uvl31ZjzVoEpXMr4ml7Nyh4EKm/gpF2qlJtdNIfcv3d0zdx/eIm3Wyl
         95Bh9PElu3SB0xXOKliink64R6ECiTuBIX4geW1ol4dHZyLEhMz8Bbv2EBwuhD886IHu
         t3+Ovs+G1V6GSYC8sV89Fzj2PGmJ2Uocd19lpFoDNjaHWms+7zgLhy4LtR7JumPEGtTD
         jWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XiIwcIBaCjacNvQQiGLxskNtGMHCMoH6FbpJtFd+1bk=;
        b=bfZLh2Iii88Ze86hO0ITPgzosI93iTBm6GKTEQ83RsysUmhC0fnL47AC59VwM2CCy0
         QbJ7Kv8qfBhN6y6ZsbWo0prFXMTCJoFvGkbx2AgN5dIW/94Ki1WdQ1VIXlqlyUuWhIC6
         jODuHAhfkO3nUUkuPsZ7LVanz9Kw7Wmm6RGJeTR36v1IeOXggXA76ir4Al39uQZOiMw4
         KctrLnUc2/Tu4DLG2Hr98zPnT+ochB70UktXX2KjY1R23+94oqMWS+WIMzQVRW1t1X9G
         zJCfEuJIoLAw42xntY4xerTHxSggS0ulrMDDpBbm3sD6fHZi3y6vOSfrM6VgLifhK6Lx
         gHXQ==
X-Gm-Message-State: AOAM533a92/GtX19Dgq2wbTI7WsZlbJ4WlKvnObaQKBY1OF/fUybrSQj
        8dC/Qsoxqh84ZkJIqtMujino
X-Google-Smtp-Source: ABdhPJw2IVsRy1qcylsIEgJDPGvIMlFPrIHQgr9qNQXu3NhWSVtIWrdCs97oISksqqFQyrjbCnIsZw==
X-Received: by 2002:a17:902:8218:: with SMTP id x24mr7894288pln.150.1590741983196;
        Fri, 29 May 2020 01:46:23 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6417:1d6e:1408:1e13:b32e:6edf])
        by smtp.gmail.com with ESMTPSA id i29sm6950738pfk.38.2020.05.29.01.46.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 01:46:22 -0700 (PDT)
Date:   Fri, 29 May 2020 14:16:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Chris Lew <clew@codeaurora.org>
Cc:     davem@davemloft.net, bjorn.andersson@linaro.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: Allocate workqueue before kernel_bind
Message-ID: <20200529084613.GA23769@Mani-XPS-13-9360>
References: <1590707126-16957-1-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590707126-16957-1-git-send-email-clew@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 28, 2020 at 04:05:26PM -0700, Chris Lew wrote:
> A null pointer dereference in qrtr_ns_data_ready() is seen if a client
> opens a qrtr socket before qrtr_ns_init() can bind to the control port.
> When the control port is bound, the ENETRESET error will be broadcasted
> and clients will close their sockets. This results in DEL_CLIENT
> packets being sent to the ns and qrtr_ns_data_ready() being called
> without the workqueue being allocated.
> 
> Allocate the workqueue before setting sk_data_ready and binding to the
> control port. This ensures that the work and workqueue structs are
> allocated and initialized before qrtr_ns_data_ready can be called.
> 
> Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> Signed-off-by: Chris Lew <clew@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  net/qrtr/ns.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index e7d0fe3f4330..c5b3202a14ca 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -712,6 +712,10 @@ void qrtr_ns_init(void)
>  		goto err_sock;
>  	}
>  
> +	qrtr_ns.workqueue = alloc_workqueue("qrtr_ns_handler", WQ_UNBOUND, 1);
> +	if (!qrtr_ns.workqueue)
> +		goto err_sock;
> +
>  	qrtr_ns.sock->sk->sk_data_ready = qrtr_ns_data_ready;
>  
>  	sq.sq_port = QRTR_PORT_CTRL;
> @@ -720,17 +724,13 @@ void qrtr_ns_init(void)
>  	ret = kernel_bind(qrtr_ns.sock, (struct sockaddr *)&sq, sizeof(sq));
>  	if (ret < 0) {
>  		pr_err("failed to bind to socket\n");
> -		goto err_sock;
> +		goto err_wq;
>  	}
>  
>  	qrtr_ns.bcast_sq.sq_family = AF_QIPCRTR;
>  	qrtr_ns.bcast_sq.sq_node = QRTR_NODE_BCAST;
>  	qrtr_ns.bcast_sq.sq_port = QRTR_PORT_CTRL;
>  
> -	qrtr_ns.workqueue = alloc_workqueue("qrtr_ns_handler", WQ_UNBOUND, 1);
> -	if (!qrtr_ns.workqueue)
> -		goto err_sock;
> -
>  	ret = say_hello(&qrtr_ns.bcast_sq);
>  	if (ret < 0)
>  		goto err_wq;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
