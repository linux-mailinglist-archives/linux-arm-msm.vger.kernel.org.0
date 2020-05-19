Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3511DA52F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 01:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgESXLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 19:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgESXLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 19:11:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB93FC061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 16:11:24 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci21so372687pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 16:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L+7QJAXBjfTJ+AlH8byb/3GiDycgpsRF9Sq5WXCPucY=;
        b=gP5wxnBJxBWcrtjyMluDLMiPyewrNncS64EHHgPp+B5M8VlvjmUGx3plaFVco31aMq
         RpFy1n//+8JzRGeWcxluhSfKMAb4bNWo7nwYZzBfU8POB1X1AmxCynz0skXCltH2HQEc
         7rTCq5vn0/i63H17WVk0pZRzPfQDeXMnCyl8akbVKV0twSLso7DvVGxJ39T5EpPoWFIg
         +CO+9Vv9YQe4Y6IR1i0xtrt/IiYjROFyjYoaUwA7Fzh/h9FK36M7fWdKjXoJANNSQ1Og
         hATkgP4m864O55Qhe5bEq83CnP7uAAZ2b4wekCdoeL/zGL4u1qJUi/9loHAQGjjg/B+e
         303Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L+7QJAXBjfTJ+AlH8byb/3GiDycgpsRF9Sq5WXCPucY=;
        b=dCYkWktz20MH5tzr+R/k/64QIDgL+CdgN2rCaWJRMSmw/KFmpj1xb78UfmHkexPUip
         eYHkfHUTeipKjZXRaeNpFGswYh9QcZxK/3ItdYP/rCFuDsvxutaE/9htwDTs+UkWoHRT
         hntJjA3uBQZZV2AuVifP9hoRjq8CL4DIhR6QchUAK+88ts3c8pYg3XN7qZngNLF/T7yS
         FR6UYj3Fvlikd+aIRi3NqTejSiCpnaFNFD6xU70J9Ax5SxyP3mUPU5raOHz/jAjfCIAx
         Q/VAo2s3KrmqGqvqeSJPoYyfjUaAJwuPnuo2T3DGoQI1DyBl3Xc2qTu/uHHA7RKRYFvN
         zWeQ==
X-Gm-Message-State: AOAM5333M5RdgL7mGb7AqpB9BW+wgHYgJzKQFt2Z+xSXL8wsThSDC8J2
        l6jdjIn63/UH6Q2SubB0O8Tt0Q==
X-Google-Smtp-Source: ABdhPJys9s8J9INgrU+CaIvU8ZNjpSsags3R398v5suCHgwKjLcqI84WmnxzgQHtjdRMxu8rJp4+Dw==
X-Received: by 2002:a17:90a:21cf:: with SMTP id q73mr1953058pjc.230.1589929884107;
        Tue, 19 May 2020 16:11:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s2sm473945pjs.9.2020.05.19.16.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 16:11:23 -0700 (PDT)
Date:   Tue, 19 May 2020 16:10:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: Fix passing invalid reference to
 qrtr_local_enqueue()
Message-ID: <20200519231002.GD2165@builder.lan>
References: <20200519181416.4235-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519181416.4235-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 May 11:14 PDT 2020, Manivannan Sadhasivam wrote:

> Once the traversal of the list is completed with list_for_each_entry(),
> the iterator (node) will point to an invalid object. So passing this to
> qrtr_local_enqueue() which is outside of the iterator block is erroneous
> eventhough the object is not used.
> 
> So fix this by passing NULL to qrtr_local_enqueue().
> 
> Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  net/qrtr/qrtr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
> index 7ed31b5e77e4..2d8d6131bc5f 100644
> --- a/net/qrtr/qrtr.c
> +++ b/net/qrtr/qrtr.c
> @@ -854,7 +854,7 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	}
>  	mutex_unlock(&qrtr_node_lock);
>  
> -	qrtr_local_enqueue(node, skb, type, from, to);
> +	qrtr_local_enqueue(NULL, skb, type, from, to);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
