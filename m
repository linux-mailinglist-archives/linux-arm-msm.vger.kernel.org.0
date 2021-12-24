Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B909447F07F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Dec 2021 19:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241828AbhLXSHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Dec 2021 13:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239382AbhLXSHJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Dec 2021 13:07:09 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2906CC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Dec 2021 10:07:09 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t19so14792895oij.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Dec 2021 10:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4WwkxD9pRsYNmxI5wJenMz61e+2fgc2AqpBuPszq2ec=;
        b=RbXc0A07i189egi89NZXRTEqbxCb9KwdACbYmsqaXqiOGmfribp+2gFQgcsuJCGdBd
         jawfI1a7zsBghKnXIlDW7YZvmodr3pPce2rdVwl5KID+z+nPRmX3U7UbIQje37R9olq+
         fntQorCcgI8ik+8Y5dP5ZYA1jRKnK5+vS+bMtHT79uFh09hIck7bW0ZIARnzmNLIB5Kf
         CeulPv8RenriKuwquuOYJ4OESwTeugUFdnu0Xx3afSs8nyaNj7bqY/Q7ak77+V4EZ5q7
         XZKExRJv82hKWylcltqro9dO/ujOc6JinLOo/kOFuJAq6DMtCwh6DSMaWssM4hREhWbJ
         Eb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4WwkxD9pRsYNmxI5wJenMz61e+2fgc2AqpBuPszq2ec=;
        b=vEyAfEQUxJ4Mdba1iGdzUGKM/Cfia584KP952v71BkVQST8J1C5VFSthmjBYdMzU4s
         S2JGjde0ifdwkn6L4rYLWxv43j2Itic6qAXakZ+HgTrbcgS8O57I9BCr51BEByMAw4rZ
         gj2Nk8weUBnyBO7Dyfkzu8nRSqVvVcbGQYQzatl+galqUYSmT9MMo5gcyjSifq/bQFLp
         qfixmV4c6hkoC9J4O2b1ZPvnnuo3U/tW2eg9U5vGI98bxz1Goi7xSufa3NYri4V12GLB
         XWPksVXZ1Bo2kZIKWnjH6cnKKSopIaLwk0NfB8x6De+TgeeO0oYnR73U+GvBECapmzYl
         1aFQ==
X-Gm-Message-State: AOAM532J45I1NR/Op2Lo1IxYofNBNcUBi+FcBLeeRHS6YK46SZYZ9Z7q
        zlgHbt9Fbjd5HTnuaE8Yk61a3g==
X-Google-Smtp-Source: ABdhPJzJoKsrdaRl4JDv5CJ93Xuh7aO3Rr8Y4L/8xojES8sfdfdDcC9F1afkDy+uY0g7UIxoouFa9Q==
X-Received: by 2002:a05:6808:e87:: with SMTP id k7mr5929610oil.16.1640369228274;
        Fri, 24 Dec 2021 10:07:08 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bg38sm1801972oib.40.2021.12.24.10.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 10:07:07 -0800 (PST)
Date:   Fri, 24 Dec 2021 10:08:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get
 the interrupt
Message-ID: <YcYMi4QthNLF3j/f@ripper>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Dec 08:13 PST 2021, Lad Prabhakar wrote:

> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi,
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 7040293c2ee8..0f29a08b4c09 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1526,13 +1526,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctrl->base))
>  		return PTR_ERR(ctrl->base);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "no slimbus IRQ resource\n");
> -		return -ENODEV;
> -	}
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
>  
> -	ret = devm_request_irq(dev, res->start, qcom_slim_ngd_interrupt,
> +	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
>  			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "request IRQ failed\n");
> -- 
> 2.17.1
> 
