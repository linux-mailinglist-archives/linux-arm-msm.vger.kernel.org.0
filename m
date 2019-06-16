Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36E9547682
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 20:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfFPSzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 14:55:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35800 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfFPSzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 14:55:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id p1so3152041plo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 11:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nByq7PxBYO/HndonaLBb5oHmEIAYGRGMS68VxuzBGRk=;
        b=giYKqR3uuQzsw5eaDqiRp2acTNqFnPZNGfkvdyqIK6e9DdG1wdGpT2902CyfnnL0+V
         gQV/aJZxaJ766T6k8+tdS9q6HW3KDh1ON4bIkNDME3gU/wcQzaLxtbC5DMFeOI1oZA7/
         Vi0T1Efpctouh5bCEQWcjjTvLDLMvGyKAezVaGE0pIjmDJJSB0vQjP13WPB3uxVAWzXH
         grHH4ruo8iX4GTXQYV3nWBhGHy6qSq59TnG7lWUepXuSUDu3hKnm1vR0eqdKeHDvECRh
         Fqgyr2FnnzfW15sdK1rzgQS07lJkkV4w1FTg2PGUDgsQC3e1j+2LJ8eKpFLS9INoLzW+
         0c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nByq7PxBYO/HndonaLBb5oHmEIAYGRGMS68VxuzBGRk=;
        b=dKG76YLPW9wUSQwFUZ4OHsOE74uRCBOrGobIlrrfPxUFMmJsYqO0uVlb/O5KGU4ZQC
         WeyMMRy1LL22bYbhj3LZ4FNrAmH9SCIfhB423y4lFTPdBf5C4RZbAL2CR55LftkkMNXw
         d6/CWXJ8WwdJOudQx7CeEXZQfs7tisVsMR0LNLBVFJh8Yh4OjelqHCUe/YrhAjmHHqzw
         IXqy/b4olrnPK/6eb0ynYufmWPoUtN74gqiBHjjUBGmAisfxJLBoFrN0XhIAOYF2dQhj
         n78FLxtMhkHwYEyEb+eAlQUnrDaT0A9zn9rH5Tbra8xn1PLNyQqJ9Y4s3rGtDJIhn8tS
         3biw==
X-Gm-Message-State: APjAAAXtyb69q8N7ixBx/KzxEkJEqiHKtLz15vaSgqlG22CJeO/woZer
        O1R+C7yVj9LAaOucu8Lf5Nzi3kSkxHs=
X-Google-Smtp-Source: APXvYqzUHZZlZnoW14+Duy31K1F+WZSjH7lpsaz63YuG6cjBQRIqHcMWMDFgTS9Bd5mK9+hjxuMVbg==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr103472422plc.2.1560711350661;
        Sun, 16 Jun 2019 11:55:50 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m41sm12325765pje.18.2019.06.16.11.55.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:55:49 -0700 (PDT)
Date:   Sun, 16 Jun 2019 11:56:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] reset: qcom-pon: Add support for gen2 pon
Message-ID: <20190616185637.GE31088@tuxbook-pro>
References: <20190614231451.45998-1-john.stultz@linaro.org>
 <20190614231451.45998-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614231451.45998-2-john.stultz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 14 Jun 16:14 PDT 2019, John Stultz wrote:

> Add support for gen2 pon register so "reboot bootloader" can
> work on pixel3 and db845.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> 

Sebastian, please take the first two patches through your tree and we'll
pick the dts patch through arm-soc.

Regards,
Bjorn

> v2:
> * Split out dts changes into separate path
> * Minor cleanups and remove unused variables
> ---
>  drivers/power/reset/qcom-pon.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 3fa1642d4c543..22a743a0bf28c 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -14,11 +14,15 @@
>  
>  #define PON_SOFT_RB_SPARE		0x8f
>  
> +#define GEN1_REASON_SHIFT		2
> +#define GEN2_REASON_SHIFT		1
> +
>  struct pm8916_pon {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	u32 baseaddr;
>  	struct reboot_mode_driver reboot_mode;
> +	long reason_shift;
>  };
>  
>  static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
> @@ -30,7 +34,7 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
>  
>  	ret = regmap_update_bits(pon->regmap,
>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
> -				 0xfc, magic << 2);
> +				 0xfc, magic << pon->reason_shift);
>  	if (ret < 0)
>  		dev_err(pon->dev, "update reboot mode bits failed\n");
>  
> @@ -60,6 +64,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  		return error;
>  
>  	pon->reboot_mode.dev = &pdev->dev;
> +	pon->reason_shift = (long)of_device_get_match_data(&pdev->dev);
>  	pon->reboot_mode.write = pm8916_reboot_mode_write;
>  	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
>  	if (error) {
> @@ -73,8 +78,9 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id pm8916_pon_id_table[] = {
> -	{ .compatible = "qcom,pm8916-pon" },
> -	{ .compatible = "qcom,pms405-pon" },
> +	{ .compatible = "qcom,pm8916-pon", .data = (void *)GEN1_REASON_SHIFT },
> +	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
> +	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
> -- 
> 2.17.1
> 
