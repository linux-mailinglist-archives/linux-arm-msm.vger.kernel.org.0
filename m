Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3490E192C8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 16:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbgCYPao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 11:30:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35801 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727644AbgCYPan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 11:30:43 -0400
Received: by mail-wr1-f67.google.com with SMTP id d5so3704777wrn.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2020 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=924C0u/Y1umT/w7VDcDGK3m92p0JxqNLjvMnSevFWu0=;
        b=IXD85fVwiHpuxgiU58vzw3B2cbxZpzqp11IHiKz4gEZxV7v3NoV633H0wTDpilM1qq
         YYEFjarX1455wFrQ4ZBg4XF2mKYOmMYR4jeT71jxgqvX9L9Lz5jDC3heFoKKoqrazqYm
         fMr016ow0fVKeusy8sDyJ05G4iVZgraIjTwq4VHnc7GRbSUNYwt84915TuKOpngk0ydU
         KAtmkR7ZAzBYeCmE/sUKMnj2YX6/Wh7lfL126Afaeog7/gJ31/Sf89VNPc7wXw8AzNUP
         MenCUsyC3BaEE64lJjhlRvdJvtuW7lmlDDnbdVN+tcQ2cCIaCANSx6HMF20Nfz4Rd1LE
         j66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=924C0u/Y1umT/w7VDcDGK3m92p0JxqNLjvMnSevFWu0=;
        b=M9i2HPSvwSFXDdbOOWlEKwGgbjE0aUPJWg7sOdj4TXrk9Uj5tEZES3k6nbk0qG4tVg
         0BrmQPFzsg9lqNZJRICM9QiIbcmIMVYUt5E0/eLvYDH7DjZPlyW+w8EavODXgj3zSSIA
         7zQLMznakYHO8zIIC2T2SzZ5rVauS3zx5BVH6euqJEdRL291qNK0T7bRK4chKXlFvm6w
         rdlkj1IdhtupC37AEEjZZE+E6KYpoiAy8UdZ3SVX0Biy04naRWDLqHAPl5vViIzYC23I
         N2/HTy/iK36aK+Ja1bAvOqOZ6jh5LZ3FC7oJohnS/iO4HN72UtEpuEg+KBlWhj8Nvn0R
         sTNA==
X-Gm-Message-State: ANhLgQ1tmeltsc1y+xN2mYwVpitdTVpBOQmus+BH37e+yUouKlWhoxYT
        UYWhVW74ST8Pb893cdwgq3K6Rw==
X-Google-Smtp-Source: ADFU+vtbKn8No1r0++C1yGVpoOAGu/x17uUd3R7B6Zbh8INPeEuKj5FXJ0Qv+4XWhmJ/8V1afEoLQg==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr3853483wrt.136.1585150239595;
        Wed, 25 Mar 2020 08:30:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id q3sm23061496wru.87.2020.03.25.08.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 08:30:38 -0700 (PDT)
Date:   Wed, 25 Mar 2020 15:30:36 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V4 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200325153036.zyor2srbkdhmr2zj@holly.lan>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584985618-25689-3-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 23, 2020 at 11:16:56PM +0530, Kiran Gunda wrote:
> Add wled_cabc_config, wled_sync_toggle, wled_ovp_fault_status
> and wled_ovp_delay callback functions to prepare the driver for
> adding WLED5 support.
> 
> wled_cabc_config() ===> Used to configure the cabc register.
>                          It is applicable for wled4 and wled5.
> 
> wled_sync_toggle() ===> used to toggle the Sync register bit for the
>                         brightness update to take place.
>                         It is applicable for WLED3, WLED4 and WLED5.
> 
> wled_ovp_fault_status() ===> Used to determine if the OVP fault is triggered.
>                              It is applicable for WLED4 and WLED5.
> 
> wled_ovp_delay() ===> Provides the time to wait before checking the OVP status
>                         after wled module enable.
>                         It is applicable for WLED4 and WLED5.

These look like comments to me. Move them out of the patch header and
make them into real comments!

 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

This patch does not compile. Please fix this.


> ---
>  drivers/video/backlight/qcom-wled.c | 188 ++++++++++++++++++++++--------------
>  1 file changed, 118 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3d276b3..a3daf9e 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -147,6 +147,7 @@ struct wled {
>  	u32 max_brightness;
>  	u32 short_count;
>  	u32 auto_detect_count;
> +	u32 version;

Why does some of the changes here use function pointers and other parts
use if/else networks (wled->version == X) ?

Overall I almost wonder if the reduced clarify that comes from function
pointers is actually adding much value?


>  	bool disabled_by_short;
>  	bool has_short_detect;
>  	int short_irq;
> @@ -155,6 +156,10 @@ struct wled {
>  	struct wled_config cfg;
>  	struct delayed_work ovp_work;
>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
> +	int (*wled_cabc_config)(struct wled *wled, bool enable);
> +	int (*wled_sync_toggle)(struct wled *wled);
> +	int (*wled_ovp_fault_status)(struct wled *wled, bool *fault_set);
> +	int (*wled_ovp_delay)(struct wled *wled);
>  };
>  
>  static int wled3_set_brightness(struct wled *wled, u16 brightness)
> @@ -237,7 +242,7 @@ static int wled_module_enable(struct wled *wled, int val)
>  	return 0;
>  }
>  
> -static int wled_sync_toggle(struct wled *wled)
> +static int wled3_sync_toggle(struct wled *wled)
>  {
>  	int rc;
>  	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
> @@ -255,6 +260,46 @@ static int wled_sync_toggle(struct wled *wled)
>  	return rc;
>  }
>  
> +static int wled4_ovp_fault_status(struct wled *wled, bool *fault_set)
> +{
> +	int rc;
> +	u32 int_rt_sts, fault_sts;
> +
> +	*fault_set = false;
> +	rc = regmap_read(wled->regmap,
> +			wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS,
> +			&int_rt_sts);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to read INT_RT_STS rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = regmap_read(wled->regmap,
> +			wled->ctrl_addr + WLED3_CTRL_REG_FAULT_STATUS,
> +			&fault_sts);
> +	if (rc < 0) {
> +		dev_err(wled->dev, "Failed to read FAULT_STATUS rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	if (int_rt_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
> +		*fault_set = true;
> +
> +	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT)
> +		*fault_set = true;
> +
> +	if (*fault_set)
> +		dev_dbg(wled->dev, "WLED OVP fault detected, int_rt_sts=0x%x fault_sts=0x%x\n",
> +			int_rt_sts, fault_sts);
> +
> +	return rc;
> +}
> +
> +static int wled4_ovp_delay(struct wled *wled)
> +{
> +	return WLED_SOFT_START_DLY_US;
> +}
> +
>  static int wled_update_status(struct backlight_device *bl)
>  {
>  	struct wled *wled = bl_get_data(bl);
> @@ -275,7 +320,7 @@ static int wled_update_status(struct backlight_device *bl)
>  			goto unlock_mutex;
>  		}
>  
> -		rc = wled_sync_toggle(wled);
> +		rc = wled->wled_sync_toggle(wled);
>  		if (rc < 0) {
>  			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
>  			goto unlock_mutex;
> @@ -298,6 +343,25 @@ static int wled_update_status(struct backlight_device *bl)
>  	return rc;
>  }
>  
> +static int wled4_cabc_config(struct wled *wled, bool enable)
> +{
> +	int i, j, rc;
> +	u8 val;
> +
> +	for (i = 0; i < wled->cfg.num_strings; i++) {
> +		j = wled->cfg.enabled_strings[i];
> +
> +		val = enable ? WLED4_SINK_REG_STR_CABC_MASK : 0;
> +		rc = regmap_update_bits(wled->regmap, wled->sink_addr +
> +					WLED4_SINK_REG_STR_CABC(j),
> +					WLED4_SINK_REG_STR_CABC_MASK, val);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
>  #define WLED_SHORT_DLY_MS			20
>  #define WLED_SHORT_CNT_MAX			5
>  #define WLED_SHORT_RESET_CNT_DLY_US		USEC_PER_SEC
> @@ -345,9 +409,10 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
>  
>  static void wled_auto_string_detection(struct wled *wled)
>  {
> -	int rc = 0, i;
> -	u32 sink_config = 0, int_sts;
> +	int rc = 0, i, delay_time_us;
> +	u32 sink_config = 0;
>  	u8 sink_test = 0, sink_valid = 0, val;
> +	bool fault_set;
>  
>  	/* Read configured sink configuration */
>  	rc = regmap_read(wled->regmap, wled->sink_addr +
> @@ -376,14 +441,9 @@ static void wled_auto_string_detection(struct wled *wled)
>  	}
>  
>  	if (wled->cfg.cabc) {
> -		for (i = 0; i < wled->cfg.num_strings; i++) {
> -			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
> -						WLED4_SINK_REG_STR_CABC(i),
> -						WLED4_SINK_REG_STR_CABC_MASK,
> -						0);
> -			if (rc < 0)
> -				goto failed_detect;
> -		}
> +		rc = wled->wled_cabc_config(wled, 0);

Be consistent with the argument (elsewhere it is true/false).


> +		if (rc < 0)
> +			goto failed_detect;
>  	}
>  
>  	/* Disable all sinks */
> @@ -427,18 +487,17 @@ static void wled_auto_string_detection(struct wled *wled)
>  			goto failed_detect;
>  		}
>  
> -		usleep_range(WLED_SOFT_START_DLY_US,
> -			     WLED_SOFT_START_DLY_US + 1000);
> +		delay_time_us = wled->wled_ovp_delay(wled);
> +		usleep_range(delay_time_us, delay_time_us + 1000);
>  
> -		rc = regmap_read(wled->regmap, wled->ctrl_addr +
> -				 WLED3_CTRL_REG_INT_RT_STS, &int_sts);
> +		rc = wled->wled_ovp_fault_status(wled, &fault_set);
>  		if (rc < 0) {
> -			dev_err(wled->dev, "Error in reading WLED3_CTRL_INT_RT_STS rc=%d\n",
> +			dev_err(wled->dev, "Error in getting OVP fault_sts, rc=%d\n",
>  				rc);
>  			goto failed_detect;
>  		}
>  


> -		if (int_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
> +		if (fault_set)
>  			dev_dbg(wled->dev, "WLED OVP fault detected with SINK %d\n",
>  				i + 1);
>  		else
> @@ -478,30 +537,30 @@ static void wled_auto_string_detection(struct wled *wled)
>  	}
>  
>  	/* Enable valid sinks */
> -	for (i = 0; i < wled->cfg.num_strings; i++) {
> -		if (wled->cfg.cabc) {
> -			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
> -						WLED4_SINK_REG_STR_CABC(i),
> -						WLED4_SINK_REG_STR_CABC_MASK,
> -						WLED4_SINK_REG_STR_CABC_MASK);
> -			if (rc < 0)
> +	if (wled->version == 4) {
> +		for (i = 0; i < wled->cfg.num_strings; i++) {
> +			if (sink_config &
> +			    BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
> +				val = WLED4_SINK_REG_STR_MOD_MASK;
> +			else
> +				/* Disable modulator_en for unused sink */
> +				val = 0x0;
> +
> +			rc = regmap_write(wled->regmap, wled->sink_addr +
> +					  WLED4_SINK_REG_STR_MOD_EN(i), val);
> +			if (rc < 0) {
> +				dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
> +					rc);
>  				goto failed_detect;
> -		}
> -
> -		if (sink_config & BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
> -			val = WLED4_SINK_REG_STR_MOD_MASK;
> -		else
> -			val = 0x0; /* Disable modulator_en for unused sink */
> -
> -		rc = regmap_write(wled->regmap, wled->sink_addr +
> -				  WLED4_SINK_REG_STR_MOD_EN(i), val);
> -		if (rc < 0) {
> -			dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
> -				rc);
> -			goto failed_detect;
> +			}
>  		}
>  	}
>  
> +	/* Enable CABC if it needs to be enabled */

If it needs to be enabled?


> +	rc = wled->wled_cabc_config(wled, true);
> +	if (rc < 0)
> +		goto failed_detect;
> +
>  	/* Restore the feedback setting */
>  	rc = regmap_write(wled->regmap,
>  			  wled->ctrl_addr + WLED3_CTRL_REG_FEEDBACK_CONTROL, 0);
> @@ -570,29 +629,19 @@ static bool wled_auto_detection_required(struct wled *wled)
>  static int wled_auto_detection_at_init(struct wled *wled)
>  {
>  	int rc;
> -	u32 fault_status, rt_status;
> +	bool fault_set;
>  
>  	if (!wled->cfg.auto_detection_enabled)
>  		return 0;
>  
> -	rc = regmap_read(wled->regmap,
> -			 wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS,
> -			 &rt_status);
> +	rc = wled->wled_ovp_fault_status(wled, &fault_set);
>  	if (rc < 0) {
> -		dev_err(wled->dev, "Failed to read RT status rc=%d\n", rc);
> -		return rc;
> -	}
> -
> -	rc = regmap_read(wled->regmap,
> -			 wled->ctrl_addr + WLED3_CTRL_REG_FAULT_STATUS,
> -			 &fault_status);
> -	if (rc < 0) {
> -		dev_err(wled->dev, "Failed to read fault status rc=%d\n", rc);
> +		dev_err(wled->dev, "Error in getting OVP fault_sts, rc=%d\n",
> +			rc);
>  		return rc;
>  	}
>  
> -	if ((rt_status & WLED3_CTRL_REG_OVP_FAULT_STATUS) ||
> -	    (fault_status & WLED3_CTRL_REG_OVP_FAULT_BIT)) {
> +	if (fault_set) {
>  		mutex_lock(&wled->lock);
>  		wled_auto_string_detection(wled);
>  		mutex_unlock(&wled->lock);
> @@ -811,17 +860,12 @@ static int wled4_setup(struct wled *wled)
>  					wled->cfg.string_i_limit);
>  		if (rc < 0)
>  			return rc;
> -
> -		addr = wled->sink_addr +
> -				WLED4_SINK_REG_STR_CABC(j);
> -		rc = regmap_update_bits(wled->regmap, addr,
> -					WLED4_SINK_REG_STR_CABC_MASK,
> -					wled->cfg.cabc ?
> -					WLED4_SINK_REG_STR_CABC_MASK : 0);
> -		if (rc < 0)
> -			return rc;
>  	}
>  
> +	rc = wled4_cabc_config(wled, wled->cfg.en_cabc);
> +	if (rc < 0)
> +		return rc;
> +
>  	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
>  				WLED3_CTRL_REG_MOD_EN,
>  				WLED3_CTRL_REG_MOD_EN_MASK,
> @@ -835,7 +879,7 @@ static int wled4_setup(struct wled *wled)
>  	if (rc < 0)
>  		return rc;
>  
> -	rc = wled_sync_toggle(wled);
> +	rc = wled->wled_sync_toggle(wled);
>  	if (rc < 0) {
>  		dev_err(wled->dev, "Failed to toggle sync reg rc:%d\n", rc);
>  		return rc;
> @@ -951,7 +995,7 @@ static u32 wled_values(const struct wled_var_cfg *cfg, u32 idx)
>  	return idx;
>  }
>  
> -static int wled_configure(struct wled *wled, int version)
> +static int wled_configure(struct wled *wled)
>  {
>  	struct wled_config *cfg = &wled->cfg;
>  	struct device *dev = wled->dev;
> @@ -1035,12 +1079,13 @@ static int wled_configure(struct wled *wled, int version)
>  	if (rc)
>  		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
>  
> -	switch (version) {
> +	switch (wled->version) {
>  	case 3:
>  		u32_opts = wled3_opts;
>  		size = ARRAY_SIZE(wled3_opts);
>  		*cfg = wled3_config_defaults;
>  		wled->wled_set_brightness = wled3_set_brightness;
> +		wled->wled_sync_toggle = wled3_sync_toggle;
>  		wled->max_string_count = 3;
>  		wled->sink_addr = wled->ctrl_addr;
>  		break;
> @@ -1050,6 +1095,10 @@ static int wled_configure(struct wled *wled, int version)
>  		size = ARRAY_SIZE(wled4_opts);
>  		*cfg = wled4_config_defaults;
>  		wled->wled_set_brightness = wled4_set_brightness;
> +		wled->wled_sync_toggle = wled3_sync_toggle;
> +		wled->wled_cabc_config = wled4_cabc_config;
> +		wled->wled_ovp_fault_status = wled4_ovp_fault_status;
> +		wled->wled_ovp_delay = wled4_ovp_delay;
>  		wled->max_string_count = 4;
>  
>  		prop_addr = of_get_address(dev->of_node, 1, NULL, NULL);
> @@ -1186,7 +1235,6 @@ static int wled_probe(struct platform_device *pdev)
>  	struct backlight_device *bl;
>  	struct wled *wled;
>  	struct regmap *regmap;
> -	int version;
>  	u32 val;
>  	int rc;
>  
> @@ -1203,18 +1251,18 @@ static int wled_probe(struct platform_device *pdev)
>  	wled->regmap = regmap;
>  	wled->dev = &pdev->dev;
>  
> -	version = (uintptr_t)of_device_get_match_data(&pdev->dev);
> -	if (!version) {
> +	wled->version = (uintptr_t)of_device_get_match_data(&pdev->dev);
> +	if (!wled->version) {
>  		dev_err(&pdev->dev, "Unknown device version\n");
>  		return -ENODEV;
>  	}
>  
>  	mutex_init(&wled->lock);
> -	rc = wled_configure(wled, version);
> +	rc = wled_configure(wled);
>  	if (rc)
>  		return rc;
>  
> -	switch (version) {
> +	switch (wled->version) {
>  	case 3:
>  		wled->cfg.auto_detection_enabled = false;
>  		rc = wled3_setup(wled);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
