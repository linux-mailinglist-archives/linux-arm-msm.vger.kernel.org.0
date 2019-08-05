Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9194827B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 00:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbfHEWtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 18:49:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38643 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbfHEWtg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 18:49:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id z14so3236464pga.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eRULxEnfuJ6z59hMCQXAvm9BHOXszvRh9MwRF5O1Bws=;
        b=S2MBrMacN+dYlhkL81oHvr54zEFrun+a9BYuxX5f1fmUgWQTd3HHnrjAPVG+gQfi1j
         rxQ4Cr4ylrPNhLmySbUuyM8XyW/xi6B+HhMFtOhx9DCEJRCDNwSnN1HMIcbxiigrzYbm
         EAmfmFhlH0qWS4CjESpTOj6x89hjChm9/etOzT587sk8V0JDREONMSqkY+i6UTrnrmW2
         i63WGiQ2YWiXU7WdgGS54MPASBegBOCx9TLw6k8PbpxxbhU5zzBT+zKNvHELaqUwR7eA
         0KeH+oRmOr84NB5zxeUyY2A3fuBnE2lc+mG2tIGSXZQ/YQT4ekOqeBG8Vl6Zk3uWGGeQ
         a2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eRULxEnfuJ6z59hMCQXAvm9BHOXszvRh9MwRF5O1Bws=;
        b=kpLaokXgn/ngOa0v/6rqnd1PhkRrXf+ic1i+jgMaAzuxhQCvZRd8NYaiF91xrTBpn7
         0l/0RM5CaiYt5W5hD2IXlhSJnaelBGlz0AnvuF57aHJp9CvrLRx/m2zY3bKcZqT3wHKM
         iTHLSAQV7saG2RYx4wzSk9Ex1hDdUGNPoASqkswVvfptg3/Lw+v9ZS0dQlBfNkL8FBCW
         gpZ1QCiEzmjlTmjGyFnOLEXLvvtm76Ck9REcdGN6KiDQnuas6vtIrANbmsskCKA+pqAf
         y3u7bd2gYyZ3WVZ2QgNFjP3eVgQFOrWOwO9+xf7kwXOpJsk0Ty7hebHDCZSz7urTX+/L
         WX/w==
X-Gm-Message-State: APjAAAWY+rDEYzR94WWPBjbxybURCM3gFFDjNGUSiUIsiO64h7x1NxbW
        IGEsJq0HHM8Z6hgJyBhAF4eB5bO6cH0=
X-Google-Smtp-Source: APXvYqylGTV4UGyqBMoDCj097zl3IRlSvbcAo8xrO2z7ThsKGgbubG5XVOYAvrwXBSdMJ5UPDIs3gA==
X-Received: by 2002:a63:9e43:: with SMTP id r3mr225055pgo.148.1565045375696;
        Mon, 05 Aug 2019 15:49:35 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y10sm85131247pfm.66.2019.08.05.15.49.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 15:49:35 -0700 (PDT)
Date:   Mon, 5 Aug 2019 15:49:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Add of_node_put() before return
Message-ID: <20190805224932.GB6470@builder>
References: <20190804162201.5838-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190804162201.5838-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 04 Aug 09:22 PDT 2019, Nishka Dasgupta wrote:

> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in two places.
> Issue found with Coccinelle.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index f3585777324c..29fbab55c3b3 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1338,12 +1338,15 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>  			continue;
>  
>  		ngd = kzalloc(sizeof(*ngd), GFP_KERNEL);
> -		if (!ngd)
> +		if (!ngd) {
> +			of_node_put(node);
>  			return -ENOMEM;
> +		}
>  
>  		ngd->pdev = platform_device_alloc(QCOM_SLIM_NGD_DRV_NAME, id);
>  		if (!ngd->pdev) {
>  			kfree(ngd);
> +			of_node_put(node);
>  			return -ENOMEM;
>  		}
>  		ngd->id = id;
> -- 
> 2.19.1
> 
