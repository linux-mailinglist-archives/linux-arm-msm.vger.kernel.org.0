Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6381D2EF7E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 20:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbhAHTIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 14:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbhAHTIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 14:08:01 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5DFC0612EA
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 11:07:21 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id j20so10686281otq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 11:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZUAethWNhH5AHx5KYoc6HZtfXoHcLGcf1uweSJlTtuQ=;
        b=HIYSnkY6Q7NycBEnnzZTwlknao8S/k+ofvs35eTg12dgKAGFrf4QPFQxMY6E1SIgnx
         v4QZHpNSykgXpIWURlxkqeUK+hK5WQe6/LeKsJ03BpDbXhaO4a17+4ebdvVbKCiei8+m
         JRobCWgFbKwMMrEso6/h1ZN86HrDAtZk0ChgT/gJ2CuWElTkCZXLfIclf20+pmdTLNZb
         DwrZOyqNMlzbEEcyV+DKY27yQ31lDOQ6h0BSDNM0/OBmo5kVHt/ka4zs2MaXzl4PjhW6
         +vhP23PRPuv2xZvwZTpuEeKehk58fssuGFnMH6UurAqg/Aa2T10znWt0sirPaDukiYHv
         V5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZUAethWNhH5AHx5KYoc6HZtfXoHcLGcf1uweSJlTtuQ=;
        b=HCnTnRyAYt86QZW8+nYZ9zJBJ2TnSBlODE4vgoiZpwydJjHRRzQ1o6Ku5WAOvL/HiA
         Dbrjl9qJYGEwe8sMyTCj7RMIRF1lbttYiybEqwIftDL5z7X+xUfLlVTrN77xl0Z6sHn1
         b7KKBh1lb8cKXbBDxT4I4GyxQx6jWcAvp6YsGbG06CUGvTy1oNLveFCOu9PPKlxfSb7Y
         aRRUbufH20H8Pk2vRKqAH4kQk5cQ1prIJ4ODql0U71jIaFXwVN/QJ2NSBDFgIXAWThLZ
         qfUKuERTdKlQEZnCq6k1jz97Qs5WRD5Uy/W8tBGkoWx+MZVWAnW0U6W4SIOk7jVc+Bx3
         fmGA==
X-Gm-Message-State: AOAM533t0SBdAP9y/vC0KJ88hUPLz4M+Yo3jZnwQMmnO2PDDPN+Li4dL
        Mic44sT/RX4o4/+gfJxOd7taYw==
X-Google-Smtp-Source: ABdhPJwN6edFPoEXuLXbsc15EfSSsy2/6NGLVvzgZzPWVaB9Jywig4wbVCFey3P93N2p9vvNRyHHTg==
X-Received: by 2002:a9d:d6b:: with SMTP id 98mr3578384oti.227.1610132840865;
        Fri, 08 Jan 2021 11:07:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q18sm1890780ood.35.2021.01.08.11.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 11:07:19 -0800 (PST)
Date:   Fri, 8 Jan 2021 13:07:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 04/17] media: camss: Make ISPIF subdevice optional
Message-ID: <X/itZVFeM0XeV9Sx@builder.lan>
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-5-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108120429.895046-5-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 Jan 06:04 CST 2021, Robert Foss wrote:

> This driver supports multiple architecture versions of the Qualcomm ISP.
> The CAMSS architecure which this driver is name after, and with the
> introduction of this series, the Titan architecture.
> 
> The ISPIF is IP-block that is only present in the CAMSS architecture.

"is an IP-block"

> In order to support the Titan architecture, make the ISPIF an optional
> subdevice.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-ispif.c   | 144 ++++++++++--------
>  .../media/platform/qcom/camss/camss-ispif.h   |   3 +-
>  drivers/media/platform/qcom/camss/camss.c     | 113 +++++++++-----
>  drivers/media/platform/qcom/camss/camss.h     |   2 +-
>  4 files changed, 160 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
[..]
> -int msm_ispif_subdev_init(struct ispif_device *ispif,
> +int msm_ispif_subdev_init(struct camss *camss,
>  			  const struct resources_ispif *res)
>  {
> -	struct device *dev = to_device(ispif);
> -	struct platform_device *pdev = to_platform_device(dev);
> +	struct ispif_device *ispif = camss->ispif;
> +	struct platform_device *pdev = to_platform_device(camss->dev);

It seems like several of the changes in this function is replacing
dev with camss->dev. If you retained a struct device *dev = camss->dev;
you would avoid this.

>  	struct resource *r;
>  	int i;
>  	int ret;
>  
> +	if (res == NULL && ispif == NULL)

Afaict this function is called conditional on camss->ispif != NULL, and
I don't see anything that would cause res to becomes NULL if is hasn't
been before this change.

So I think this check is unnecessary?

> +		return 0;
> +
> +	ispif->camss = camss;
> +
>  	/* Number of ISPIF lines - same as number of CSID hardware modules */
> -	if (to_camss(ispif)->version == CAMSS_8x16)
> +	if (camss->version == CAMSS_8x16)
>  		ispif->line_num = 2;
> -	else if (to_camss(ispif)->version == CAMSS_8x96 ||
> -		 to_camss(ispif)->version == CAMSS_660)
> +	else if (camss->version == CAMSS_8x96 ||
> +		 camss->version == CAMSS_660)
>  		ispif->line_num = 4;
>  	else
>  		return -EINVAL;
>  
> -	ispif->line = devm_kcalloc(dev, ispif->line_num, sizeof(*ispif->line),
> -				   GFP_KERNEL);
> +	ispif->line = devm_kcalloc(camss->dev, ispif->line_num,
> +			sizeof(*ispif->line), GFP_KERNEL);
>  	if (!ispif->line)
>  		return -ENOMEM;
>  
[..]
> @@ -1393,6 +1410,9 @@ void msm_ispif_unregister_entities(struct ispif_device *ispif)
>  {
>  	int i;
>  
> +	if (!ispif)
> +		return;

I like this, but later in the patch you make the calls to this function
conditional on ispif != NULL. You should only need one of the checks.

Regards,
Bjorn
