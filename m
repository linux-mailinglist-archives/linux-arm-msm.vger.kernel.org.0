Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484CD31873
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 01:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfEaXxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 19:53:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34139 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfEaXxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 19:53:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id c14so4701110pfi.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 16:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YVUicJtFNpg9LS2eUN0p9C4lJlLU1ZzpFVm+kG4Mmsc=;
        b=iDSL6asy9oJDz0ITouJHC9YafFm5lbev0OPiiaK24otvLODJhfsbItMp64HA5gYbnk
         FcBXYnFutIm0Ab6zw0HRENRW6tLRmPqJJbisOBiFyNuwG6hX3QvVOEhyJL266jK7BvRJ
         cILKe/3cYdsVvKmYb/SS3Ha0BLqGkrh5q8TjRflH6vzIbtUUpIr27Y5cAOJWFFJkU3wL
         iOu9j9EU/JtJ6o9UGZrI06O1w/50K1C/DR85OvziZw3D1uu7AYElTN30UtEOMxwizCRV
         wU5bgUsH+64LAO7SGRz1xziIYxbGuKRkgABFipjBfmpZv2Ek0QLvACZwvYTB53EoBI58
         LXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YVUicJtFNpg9LS2eUN0p9C4lJlLU1ZzpFVm+kG4Mmsc=;
        b=CngJTkMvbPkNO4XcNYcf3C78n+sm5qik4se3oETTuS23FQZc1wPC7jy9bexNmG1Ox5
         5P3CBN5g0sgUsm+EJLNsaY4jfKYuaQK3O7fHpNurBATAGjb8MIW2qMNR2e5mCk7DTjfx
         X0YGIZUX6SRpx1H/vuWLjdYjojXGJj93zYogV1oAHNAyWoQ4jNXPDCohEXIXn0S2bymT
         2maMy3CjVXaYo8vLoXxya5HP7kXrScYuirFLRTTs1ITngVR9M/6UTyBDWivBfufv1x3D
         dT8hm9DdKKoOWcndaiwxUcFOKsyfLZ22bnTSx6yrXqXufrGCPbQdzMa5/99jgWzE9y9Z
         +kXw==
X-Gm-Message-State: APjAAAUX8sx5mt3iDc+h3O+G4Nu+kCAtsW8Hnk8EakCNEROHL4T30+Y6
        PedBidtLMK1atdwS5RG6Iulq3g==
X-Google-Smtp-Source: APXvYqwSKeci9s9z03nIWTNGcxZdnmy4Xkzan3hUzZWZb8b36coZ9Y/IOVc3WKClr6VnRIt/9wSQ5Q==
X-Received: by 2002:aa7:8ece:: with SMTP id b14mr3524226pfr.244.1559346785080;
        Fri, 31 May 2019 16:53:05 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a11sm8293347pff.128.2019.05.31.16.53.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 16:53:04 -0700 (PDT)
Date:   Fri, 31 May 2019 16:53:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH 2/2] reset: qcom-pon: Add support for gen2 pon
Message-ID: <20190531235302.GD25597@minitux>
References: <20190531234734.102842-1-john.stultz@linaro.org>
 <20190531234734.102842-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531234734.102842-2-john.stultz@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 31 May 16:47 PDT 2019, John Stultz wrote:

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
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8998.dtsi |  2 +-
>  drivers/power/reset/qcom-pon.c       | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index d3ca35a940fb..051a52df80f9 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -39,7 +39,7 @@
>  		#size-cells = <0>;
>  
>  		pm8998_pon: pon@800 {
> -			compatible = "qcom,pm8916-pon";
> +			compatible = "qcom,pm8998-pon";
>  
>  			reg = <0x800>;
>  			mode-bootloader = <0x2>;

We want to take this through arm-soc and the rest through Sebastian's
tree, so please provide the dts update in a separate commit.

Apart from that this looks good!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 3fa1642d4c54..d0336a1612a4 100644
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
> @@ -30,15 +34,18 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
>  
>  	ret = regmap_update_bits(pon->regmap,
>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
> -				 0xfc, magic << 2);
> +				 0xfc, magic << pon->reason_shift);
>  	if (ret < 0)
>  		dev_err(pon->dev, "update reboot mode bits failed\n");
>  
>  	return ret;
>  }
>  
> +static const struct of_device_id pm8916_pon_id_table[];
> +
>  static int pm8916_pon_probe(struct platform_device *pdev)
>  {
> +	const struct of_device_id *match;
>  	struct pm8916_pon *pon;
>  	int error;
>  
> @@ -60,6 +67,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  		return error;
>  
>  	pon->reboot_mode.dev = &pdev->dev;
> +	pon->reason_shift = of_device_get_match_data(&pdev->dev);
>  	pon->reboot_mode.write = pm8916_reboot_mode_write;
>  	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
>  	if (error) {
> @@ -73,8 +81,9 @@ static int pm8916_pon_probe(struct platform_device *pdev)
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
