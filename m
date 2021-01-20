Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6772FCE7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 11:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733081AbhATKfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 05:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732891AbhATKUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 05:20:23 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C49C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 02:19:28 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6EC241FB32;
        Wed, 20 Jan 2021 11:19:26 +0100 (CET)
Subject: Re: [PATCH] power: reset: qcom-pon: Add power on/off reason info
To:     Jun Nie <jun.nie@linaro.org>, john.stultz@linaro.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, david.brown@linaro.org, amit.pundir@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210120040602.3966608-1-jun.nie@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <eab4d683-6a97-7b90-7549-54a940d8b487@somainline.org>
Date:   Wed, 20 Jan 2021 11:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210120040602.3966608-1-jun.nie@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 20/01/21 05:06, Jun Nie ha scritto:
> Add power on/off reason message for debug.
> 

Hello Jun,

> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>   drivers/power/reset/qcom-pon.c | 124 ++++++++++++++++++++++++++++++++-
>   1 file changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 4a688741a88a..012b87f5ab1d 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -12,6 +12,11 @@
>   #include <linux/reboot-mode.h>
>   #include <linux/regmap.h>
>   
> +#define PON_REASON1			0x08
> +#define PON_WARM_RESET_REASON1		0x0a
> +#define PON_WARM_RESET_REASON2		0x0b
> +#define PON_WARM_RESET_TFT		BIT(4)

PON_WARM_RESET_MASK_TFT, perhaps?

> +#define POFF_REASON1			0x0c
>   #define PON_SOFT_RB_SPARE		0x8f
>   
>   #define GEN1_REASON_SHIFT		2
> @@ -23,6 +28,41 @@ struct pm8916_pon {
>   	u32 baseaddr;
>   	struct reboot_mode_driver reboot_mode;
>   	long reason_shift;
> +	int pon_trigger_reason;
> +	int pon_power_off_reason;
> +	unsigned int warm_reset_reason1;
> +	unsigned int warm_reset_reason2;

warm_reset_reason[2]?

> +};
> +
> +static const char * const pm8916_pon_reason[] = {
> +	[0] = "Triggered from Hard Reset",
> +	[1] = "Triggered from SMPL (sudden momentary power loss)",
> +	[2] = "Triggered from RTC (RTC alarm expiry)",
> +	[3] = "Triggered from DC (DC charger insertion)",
> +	[4] = "Triggered from USB (USB charger insertion)",
> +	[5] = "Triggered from PON1 (secondary PMIC)",
> +	[6] = "Triggered from CBL (external power supply)",
> +	[7] = "Triggered from KPD (power key press)",
> +};

Triggered from => Triggered by?

> +
> +static const char * const pm8916_poff_reason[] = {
> +	[0] = "Triggered from SOFT (Software)",
> +	[1] = "Triggered from PS_HOLD (PS_HOLD/MSM controlled shutdown)",
> +	[2] = "Triggered from PMIC_WD (PMIC watchdog)",
> +	[3] = "Triggered from GP1 (Keypad_Reset1)",
> +	[4] = "Triggered from GP2 (Keypad_Reset2)",
> +	[5] = "Triggered from KPDPWR_AND_RESIN"
> +		"(Simultaneous power key and reset line)",
> +	[6] = "Triggered from RESIN_N (Reset line/Volume Down Key)",
> +	[7] = "Triggered from KPDPWR_N (Long Power Key hold)",
> +	[8] = "N/A",
> +	[9] = "N/A",
> +	[10] = "N/A",
> +	[11] = "Triggered from CHARGER (Charger ENUM_TIMER, BOOT_DONE)",
> +	[12] = "Triggered from TFT (Thermal Fault Tolerance)",
> +	[13] = "Triggered from UVLO (Under Voltage Lock Out)",
> +	[14] = "Triggered from OTST3 (Overtemp)",
> +	[15] = "Triggered from STAGE3 (Stage 3 reset)",
>   };
>   
>   static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
> @@ -42,10 +82,49 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
>   	return ret;
>   }
>   
> +/*
> + * This function stores the PMIC warm reset reason register values. It also
> + * clears these registers if the qcom,clear-warm-reset device tree property
> + * is specified.

... and where is the handling for what you are explaining here?
I don't see any property read anywhere and you are just clearing
the REASON1 register without any checks.

Also, "these registers" plural means that you wanted to clear both
REASON1 and REASON2, right?

Please either fix the comment or the code, as the intention is unclear.

> + */
> +static int pm8916_pon_store_and_clear_warm_reset(struct pm8916_pon *pon)
> +{
> +	int rc;
> +
> +	rc = regmap_read(pon->regmap,
> +			 pon->baseaddr + PON_WARM_RESET_REASON1,
> +			 &pon->warm_reset_reason1);
> +	if (rc) {
> +		dev_err(pon->dev,
> +			"Unable to read addr=%x, rc(%d)\n",
> +			PON_WARM_RESET_REASON1, rc);
> +		return rc;
> +	}
> +
> +	rc = regmap_read(pon->regmap,
> +			 pon->baseaddr + PON_WARM_RESET_REASON2,
> +			 &pon->warm_reset_reason2);
> +	if (rc) {
> +		dev_err(pon->dev,
> +			"Unable to read addr=%x, rc(%d)\n",
> +			PON_WARM_RESET_REASON2, rc);
> +		return rc;
> +	}

You are reading subsequent registers: using regmap_bulk_read here
would be not only shorter, but would also avoid unlocking and relocking 
a mutex for "basically no reason".

> +
> +	/* keeps the register in good state */
> +	regmap_update_bits(pon->regmap,
> +			   pon->baseaddr + PON_WARM_RESET_REASON1,
> +			   ~0, 0);
> +	return 0;

Is there any reason why you're using regmap_update_bits instead of just
a regmap_write? Is there anything I missed?

> +}
> +
>   static int pm8916_pon_probe(struct platform_device *pdev)
>   {
>   	struct pm8916_pon *pon;
> -	int error;
> +	int error, index;
> +	unsigned int val, cold_boot;
> +	u16 poff_sts = 0;
> +	u8 buf[2];
>   
>   	pon = devm_kzalloc(&pdev->dev, sizeof(*pon), GFP_KERNEL);
>   	if (!pon)
> @@ -75,6 +154,49 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, pon);
>   
> +	error = pm8916_pon_store_and_clear_warm_reset(pon);
> +	if (error)
> +		dev_err(pon->dev,
> +			"Unable to store/clear WARM_RESET_REASONx registers\n");
> +

Since this doesn't appear to be an issue (you're not returning when
this error happens), perhaps this can be a dev_dbg.

> +	/* PON reason */
> +	error = regmap_read(pon->regmap, pon->baseaddr + PON_REASON1, &val);
> +	if (error < 0)
> +		dev_err(pon->dev, "read power on reason register failed\n");
> +

Perhaps you should initialize the "val" variable, since you're using it
regardless of whether the regmap_read succeeded or failed.

> +	index = ffs(val) - 1;

....and then, if you make the "val" variable predictable, you can make
sure that index never holds a negative value...

> +	cold_boot = !(pon->warm_reset_reason1
> +		      || (pon->warm_reset_reason2 & PON_WARM_RESET_TFT));
> +	if (index >= ARRAY_SIZE(pm8916_pon_reason) || index < 0) {
> +		dev_info(pon->dev,
> +			 "PMIC Power-on reason: Unknown and '%s' boot\n",
> +			 cold_boot ? "cold" : "warm");
> +	} else {
> +		pon->pon_trigger_reason = index;

...which makes you able to eventually make the pon_trigger_reason field
also unsigned, if that makes sense (and if it does, do the same for the
pon_power_off_reason field as well).

> +		dev_info(pon->dev,
> +			 "PMIC Power-on reason: %s and '%s' boot\n",
> +			 pm8916_pon_reason[index],
> +			 cold_boot ? "cold" : "warm");
> +	}
> +

Nit:
For the print, I would propose, instead, something like
"PMIC Power-on reason: %s from %s boot"

to produce a (imo) nicer looking string like
"PMIC Power-on reason: Triggered by (the-reason) from (cold/warm) boot"

> +	/* POFF reason */
> +	error = regmap_bulk_read(pon->regmap,
> +				 pon->baseaddr + POFF_REASON1,
> +				 &buf[0], 2);
> +	if (error) {
> +		dev_err(pon->dev, "Unable to read POFF_RESASON regs\n");

Typo!

> +		return error;
> +	}
> +	poff_sts = buf[0] | (buf[1] << 8);

I think you wanted to write:
poff_sts = get_unaligned_le16(buf);

> +	index = ffs(poff_sts) - 1;
> +	if (index >= ARRAY_SIZE(pm8916_poff_reason) || index < 0) {
> +		dev_info(pon->dev, "PMIC: Unknown power-off reason\n");
> +	} else {
> +		pon->pon_power_off_reason = index;
> +		dev_info(pon->dev, "PMIC: Power-off reason: %s\n",
> +			 pm8916_poff_reason[index]);
> +	}
> +

Also, what about keeping the prints in a "consistent" format?
"PMIC Power-off reason: %s"

>   	return devm_of_platform_populate(&pdev->dev);
>   }
>   
> 

Regards,
- Angelo
