Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3713712EA33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 20:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgABTQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 14:16:46 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39478 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgABTQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 14:16:46 -0500
Received: by mail-pg1-f193.google.com with SMTP id b137so22327295pga.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 11:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0G0HGF1V+/eZV+R76M5292usDeBEi2ZV+5zg9De534I=;
        b=H+0nJyd9BP7uZVDk2tPmZAKTlaEy/XwnzS+I7Nwku0zG9asxJwolAtGlAzqxMDR2gl
         KZWwxOJVEr+COOkwgLFwvMknyUM4TYRwhpEnVD6C7txKSt/dpga6auxVMi59DCgBPwlS
         u69oUE2GoSdm8pfeAqqTKfGlYtceXi2GUyj31kyTJgJsgClPVau9ZNlYsUC78+j8tS04
         ygXnJaKBwMJLr7iwnP6iEGFYPQ6ExCzN9umd9a8UGMSA5rw64UtmDxoZe9MNLpLlWbmW
         iWbFLx3J86Gds9e5+2YbiBaldMfZvezQdVSB7EGD0dJbw8xnChjpU6iDeQlHKW4nElcl
         U7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0G0HGF1V+/eZV+R76M5292usDeBEi2ZV+5zg9De534I=;
        b=SCUMnR4jtv8sj+FxucxBKi0UeUbsmaz1CxAjj5505pxWXo+jrnjKFTz0OALui7WSrl
         qW9mMGgutGoDhWJmMHtyEbf68nTVlYYPG3ASJnZ2M2xTSpZRvLowgkt3tUv9hdeKB/o8
         a2d1hIUrUVIPHgP5DGAPApRN60kkK9qYAK1zqc0iIJBq7pM3W12m1K/6pjRi070I9ptP
         dgtgET6uaZNRbSJJUIWSR9Lmrka6uCiMzGE6x+6QyglV4PhrGSaqRSdUWiArIofQnwhl
         a18BD7MsGFGe60U5W9reR/j43hidAyNntjA3F1EI2yXWqCa+v2WzmFVqbOr5RYlHFlkZ
         HhKw==
X-Gm-Message-State: APjAAAWjozqnKAEswW+gzpHiLKXkY+27P5dEMIlKjoM2/aQUJwx6Z6Rr
        xaZ6LpRhuHmWeBpV9B4gs0hPcnbdYqU=
X-Google-Smtp-Source: APXvYqyhkEw2BAcCX9dqkNSek/hdLar87nI+t5C7ViEHXKEYX5lKV7SAhYLV/z3tt3h3wsaIWQMmqg==
X-Received: by 2002:a63:1106:: with SMTP id g6mr90795614pgl.13.1577992605410;
        Thu, 02 Jan 2020 11:16:45 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a6sm58823755pgg.25.2020.01.02.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 11:16:44 -0800 (PST)
Date:   Thu, 2 Jan 2020 11:16:42 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/9] drivers: thermal: tsens: Pass around struct
 tsens_sensor as a constant
Message-ID: <20200102191642.GA988120@minitux>
References: <cover.1577976221.git.amit.kucheria@linaro.org>
 <d18d54507b6f560349b9b2878bf8e8032ee67e2f.1577976221.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18d54507b6f560349b9b2878bf8e8032ee67e2f.1577976221.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Jan 06:54 PST 2020, Amit Kucheria wrote:

> All the sensor data is initialised at init time. Lock it down by passing
> it to functions as a constant.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/qcom/tsens-8960.c   |  2 +-
>  drivers/thermal/qcom/tsens-common.c | 14 +++++++-------
>  drivers/thermal/qcom/tsens.h        |  6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-8960.c b/drivers/thermal/qcom/tsens-8960.c
> index a383a57cfbbc..2a28a5af209e 100644
> --- a/drivers/thermal/qcom/tsens-8960.c
> +++ b/drivers/thermal/qcom/tsens-8960.c
> @@ -245,7 +245,7 @@ static inline int code_to_mdegC(u32 adc_code, const struct tsens_sensor *s)
>  	return adc_code * slope + offset;
>  }
>  
> -static int get_temp_8960(struct tsens_sensor *s, int *temp)
> +static int get_temp_8960(const struct tsens_sensor *s, int *temp)
>  {
>  	int ret;
>  	u32 code, trdy;
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index c8d57ee0a5bb..c2df30a08b9e 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -128,7 +128,7 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
>   * Return: Temperature in milliCelsius on success, a negative errno will
>   * be returned in error cases
>   */
> -static int tsens_hw_to_mC(struct tsens_sensor *s, int field)
> +static int tsens_hw_to_mC(const struct tsens_sensor *s, int field)
>  {
>  	struct tsens_priv *priv = s->priv;
>  	u32 resolution;
> @@ -160,7 +160,7 @@ static int tsens_hw_to_mC(struct tsens_sensor *s, int field)
>   *
>   * Return: ADC code or temperature in deciCelsius.
>   */
> -static int tsens_mC_to_hw(struct tsens_sensor *s, int temp)
> +static int tsens_mC_to_hw(const struct tsens_sensor *s, int temp)
>  {
>  	struct tsens_priv *priv = s->priv;
>  
> @@ -275,7 +275,7 @@ static int tsens_threshold_violated(struct tsens_priv *priv, u32 hw_id,
>  }
>  
>  static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
> -				struct tsens_sensor *s, struct tsens_irq_data *d)
> +				const struct tsens_sensor *s, struct tsens_irq_data *d)
>  {
>  	int ret;
>  
> @@ -346,10 +346,10 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
>  
>  	for (i = 0; i < priv->num_sensors; i++) {
>  		bool trigger = false;
> -		struct tsens_sensor *s = &priv->sensor[i];
> +		const struct tsens_sensor *s = &priv->sensor[i];
>  		u32 hw_id = s->hw_id;
>  
> -		if (IS_ERR(priv->sensor[i].tzd))
> +		if (IS_ERR(s->tzd))
>  			continue;
>  		if (!tsens_threshold_violated(priv, hw_id, &d))
>  			continue;
> @@ -457,7 +457,7 @@ void tsens_disable_irq(struct tsens_priv *priv)
>  	regmap_field_write(priv->rf[INT_EN], 0);
>  }
>  
> -int get_temp_tsens_valid(struct tsens_sensor *s, int *temp)
> +int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
>  {
>  	struct tsens_priv *priv = s->priv;
>  	int hw_id = s->hw_id;
> @@ -486,7 +486,7 @@ int get_temp_tsens_valid(struct tsens_sensor *s, int *temp)
>  	return 0;
>  }
>  
> -int get_temp_common(struct tsens_sensor *s, int *temp)
> +int get_temp_common(const struct tsens_sensor *s, int *temp)
>  {
>  	struct tsens_priv *priv = s->priv;
>  	int hw_id = s->hw_id;
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index be364bf1d5a6..70dc34c80537 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -67,7 +67,7 @@ struct tsens_ops {
>  	/* mandatory callbacks */
>  	int (*init)(struct tsens_priv *priv);
>  	int (*calibrate)(struct tsens_priv *priv);
> -	int (*get_temp)(struct tsens_sensor *s, int *temp);
> +	int (*get_temp)(const struct tsens_sensor *s, int *temp);
>  	/* optional callbacks */
>  	int (*enable)(struct tsens_priv *priv, int i);
>  	void (*disable)(struct tsens_priv *priv);
> @@ -494,8 +494,8 @@ struct tsens_priv {
>  char *qfprom_read(struct device *dev, const char *cname);
>  void compute_intercept_slope(struct tsens_priv *priv, u32 *pt1, u32 *pt2, u32 mode);
>  int init_common(struct tsens_priv *priv);
> -int get_temp_tsens_valid(struct tsens_sensor *s, int *temp);
> -int get_temp_common(struct tsens_sensor *s, int *temp);
> +int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp);
> +int get_temp_common(const struct tsens_sensor *s, int *temp);
>  int tsens_enable_irq(struct tsens_priv *priv);
>  void tsens_disable_irq(struct tsens_priv *priv);
>  int tsens_set_trips(void *_sensor, int low, int high);
> -- 
> 2.20.1
> 
