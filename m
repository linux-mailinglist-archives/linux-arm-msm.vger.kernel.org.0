Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EBC403083
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 23:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346475AbhIGV6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 17:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbhIGV62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 17:58:28 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9C0C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 14:57:21 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u1so9123plq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 14:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UWv6lZCk1njoRineiSM3TW0+5Sxz+XHi+1n+wOw/Lfs=;
        b=LF90ewmSHX3tGtab+JEX+fD3jiqBMljGIQrnOiOoR+otGO83eE6yt87wkv/Id9RbBN
         AUZcq7ByXH++uVxQ5DO/ubto9b+w2k+IDsaI/GLy2LX13ezGR8NehSRovIHRNzqlO2/C
         jVkNbt+oyxjEgL5QlgJhXUmcTDUSEn9LdmNfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UWv6lZCk1njoRineiSM3TW0+5Sxz+XHi+1n+wOw/Lfs=;
        b=hvAKcrAyeQV4e89WAZLrHEIGQOvx6SoLZJp9/csldUQqT+L+2j/pnXe7qa6LFlJLU/
         +3Lb2gganMmcIhdx4w1gF6eA0ZbjH0cR4ybaIMj+tvJkbsjIVvFHAra8+A54It0KSyIS
         IQoOdDGK6+r/5jw61SfCh/o+mGJMMcrLtH9U5AhhZIucu1y4vJBHp3qeBAyX3/M1jKF6
         IjpxoN7vRk3YyZDKJ8R/8gFGYNlukSgKSNDaQK5pMOJdYVzJOKYn+asdGeBlT5m0eYin
         kDGCOv1hMiFpivg+ER8w5Zy6ulZJUEJ+xNxlzCnLY6aikvsmV5VmLLrWr/m9q7FV5Vdv
         MxdQ==
X-Gm-Message-State: AOAM5324z0bAp6imEDbfB+v+MCF+7Kmjlp4ZxQeHZe6stolTIeS0Q8z5
        3bqLb7DnMnInuTzZEpIJBu3Y1A==
X-Google-Smtp-Source: ABdhPJyp91BpVqX+NyOUYvFtBYcXP8qWYZx7lahqDgCsp7jBqmEKqLGNVma4UojWH7cIhX0QMuQAxQ==
X-Received: by 2002:a17:902:c410:b0:138:ad8f:865b with SMTP id k16-20020a170902c41000b00138ad8f865bmr177803plk.79.1631051841144;
        Tue, 07 Sep 2021 14:57:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id p9sm120188pgn.36.2021.09.07.14.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 14:57:20 -0700 (PDT)
Date:   Tue, 7 Sep 2021 14:57:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drivers: thermal: tsens: add timeout to
 get_tem_tsens_valid
Message-ID: <YTfgPmp5gzP6FyqR@google.com>
References: <20210907212543.20220-1-ansuelsmth@gmail.com>
 <20210907212543.20220-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210907212543.20220-2-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 07, 2021 at 11:25:43PM +0200, Ansuel Smith wrote:
> The function can loop and lock the system if for whatever reason the bit
> for the target sensor is NEVER valid. This is the case if a sensor is
> disabled by the factory and the valid bit is never reported as actually
> valid. Add a timeout check and exit if a timeout occurs. As this is
> a very rare condition, handle the timeout only if the first read fails.
> While at it also rework the function to improve readability.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/thermal/qcom/tsens.c | 40 +++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index b1162e566a70..1ff244176beb 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -599,26 +599,38 @@ int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
>  	int hw_id = s->hw_id;
>  	u32 temp_idx = LAST_TEMP_0 + hw_id;
>  	u32 valid_idx = VALID_0 + hw_id;
> +	unsigned long timeout;
>  	u32 valid;
>  	int ret;
>  
>  	/* VER_0 doesn't have VALID bit */
> -	if (tsens_version(priv) >= VER_0_1) {
> +	if (tsens_version(priv) == VER_0)
> +		goto get_temp;
> +
> +	ret = regmap_field_read(priv->rf[valid_idx], &valid);
> +	if (ret || valid)
> +		goto check_valid;
> +
> +	timeout = jiffies + msecs_to_jiffies(20);
> +	do {
> +		/* Valid bit is 0 for 6 AHB clock cycles.
> +		 * At 19.2MHz, 1 AHB clock is ~60ns.
> +		 * We should enter this loop very, very rarely.
> +		 */
> +		ndelay(400);
>  		ret = regmap_field_read(priv->rf[valid_idx], &valid);
> -		if (ret)
> -			return ret;
> -		while (!valid) {
> -			/* Valid bit is 0 for 6 AHB clock cycles.
> -			 * At 19.2MHz, 1 AHB clock is ~60ns.
> -			 * We should enter this loop very, very rarely.
> -			 */
> -			ndelay(400);
> -			ret = regmap_field_read(priv->rf[valid_idx], &valid);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> +		if (ret || valid)
> +			goto check_valid;
> +	} while (time_before(jiffies, timeout));
> +
> +	return -ETIMEDOUT;
> +
> +check_valid:
> +	/* Check ret of valid bit read */
> +	if (ret)
> +		return ret;
>  
> +get_temp:
>  	/* Valid bit is set, OK to read the temperature */
>  	*temp = tsens_hw_to_mC(s, temp_idx);

I still think that something like this would be clearer than the
multiple jumps to 'check_valid':


	ret = regmap_field_read(priv->rf[valid_idx], &valid);
	if (ret)
		return ret;

	timeout = jiffies + msecs_to_jiffies(20);

	while (!valid) {
		/* Valid bit is 0 for 6 AHB clock cycles.
		 * At 19.2MHz, 1 AHB clock is ~60ns.
		 * We should enter this loop very, very rarely.
		 */
		ndelay(400);
		ret = regmap_field_read(priv->rf[valid_idx], &valid);
		if (ret)
			return ret;

		if (time_after(jiffies, timeout))
			return -ETIMEDOUT;
	};

That said, I'm just a random dude, so my opinion isn't really important,
as long as the maintainers are happy with the change :)
