Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B4F1E721D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 03:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390747AbgE2Biw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 21:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390722AbgE2Biu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 21:38:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C5FC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 18:38:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 124so523966pgi.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 18:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TdQg+fivBnczs2lb7tarAIsmkoEmc6eowGbAVZodCK0=;
        b=Hw6+Tuard4AD3/vUIts7Cbac2h+EizLNBIGuRfgksogG1PQk5znvug5MG4ZNXdeoWY
         r/iv5pXaNa8pjSF0+ZNYjbZ/iOlk3Ga1qoaJSjVA66HuWJUpeRpNWMY/jBWITtEVft8n
         JmQfThjT8G69YGm88lTyQJW6A0w8sxM+4V7dVnd37rNX7XmiVdx13yftMHoMulWWiDnx
         cDZ1N+mLZptgB0PLFwkZQz35Q/lFJPPHNgm2q8m2xV6MXhIOxabMiRVlHv6BbyKwA0gJ
         nR5fN9klhY9kcwwlE4NoP6y7hvfvmIemgSWkNimxP21uieX2wj9x6ztgjSLV0QGGlSPj
         I5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TdQg+fivBnczs2lb7tarAIsmkoEmc6eowGbAVZodCK0=;
        b=oQrYBMIwNFf2P9iqX+lZ4/tr3+IojArSRkRBtfkKeHWOotOxH9+VEprqoqAV37pqkd
         GqpU3mNwg3la+yK2GLHJBvN9QR1LqcWaT7iLYGe8UAFY1lnyk2vFTXZKeUG8rdpp1m3M
         y+iXhetpJ94GfYfK+ky9NczCJeNmn0Ml0yYVCIRP/pcXaUsi37V53PnO6Guk1cQdVkle
         5mVeuaUzFVN/KwwJEi5EtCk/5JEgkspiTQTYChlP0Hor/HhcDUDMsh4kHrrp+eKUJqVC
         dTgms1dI2ZayU8veJlpTgSexE+IeSeDK3brsilcJwb58txoYklVCWozSfdrqShmhlgAb
         DlPQ==
X-Gm-Message-State: AOAM532UaSDqjHupJ/4wvi87CMUzAOi1olVXU4dQNdOBMp3FrcxBA5dy
        J6ujlz6Ka5kEgeVG/tc7H2etng==
X-Google-Smtp-Source: ABdhPJxOTmTsMKTFLK6nGt+6SuzLQpgZHZ8QORG/lxSaXzWRBDQLvtLtNKdQvhDfCWgfBGWI9YkgTQ==
X-Received: by 2002:a63:451c:: with SMTP id s28mr6059359pga.340.1590716329674;
        Thu, 28 May 2020 18:38:49 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w19sm5750068pfq.43.2020.05.28.18.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:38:49 -0700 (PDT)
Date:   Thu, 28 May 2020 18:37:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v3 1/5] regulator: Allow regulators to verify enabled
 during enable()
Message-ID: <20200529013743.GL279327@builder.lan>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528154625.17742-2-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 May 08:46 PDT 2020, Sumit Semwal wrote:

> Some regulators might need to verify that they have indeed been enabled
> after the enable() call is made and enable_time delay has passed.
> 
> This is implemented by repeatedly checking is_enabled() upto
> poll_enabled_time, waiting for the already calculated enable delay in
> each iteration.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>  drivers/regulator/core.c         | 28 ++++++++++++++++++++++++++++
>  include/linux/regulator/driver.h |  5 +++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 7486f6e4e613..06199f182114 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -2409,6 +2409,34 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
>  
>  	_regulator_enable_delay(delay);

My interpretation of "enable_time" (i.e. the value of delay) is that it
denotes the maximum time it will take for the regulator to turn on, and
the purpose of this patch is to be able to handle cases where we can
poll the hardware to see if it completed earlier.

So I think you should flip the meaning of your two variables around,
making "delay" the total time to sleep and the newly introduced
"poll_enabled_time" the interval at which you check if the hardware
finished early.

Regards,
Bjorn

>  
> +	/* If set, poll upto poll_enabled_time uS to see if the regulator
> +	 * actually got enabled.
> +	 * For each iteration, wait for the enable_time delay calculated
> +	 * above already.
> +	 * If the regulator isn't enabled after poll_enabled_time has
> +	 * expired, return -ETIMEDOUT.
> +	 */
> +	if (rdev->desc->poll_enabled_time) {
> +		unsigned int time_remaining = rdev->desc->poll_enabled_time;
> +
> +		while (time_remaining > 0) {
> +			/* We've already waited for enable_time above;
> +			 * so we can start with immediate check of the
> +			 * status of the regulator.
> +			 */
> +			if (rdev->desc->ops->is_enabled(rdev))
> +				break;
> +
> +			_regulator_enable_delay(delay);
> +			time_remaining -= delay;
> +		}
> +
> +		if (time_remaining <= 0) {
> +			rdev_err(rdev, "Enabled check failed.\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
>  	trace_regulator_enable_complete(rdev_get_name(rdev));
>  
>  	return 0;
> diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
> index 29d920516e0b..bb50e943010f 100644
> --- a/include/linux/regulator/driver.h
> +++ b/include/linux/regulator/driver.h
> @@ -322,6 +322,9 @@ enum regulator_type {
>   * @enable_time: Time taken for initial enable of regulator (in uS).
>   * @off_on_delay: guard time (in uS), before re-enabling a regulator
>   *
> + * @poll_enabled_time: Maximum time (in uS) to poll if the regulator is
> + *                          actually enabled, after enable() call
> + *
>   * @of_map_mode: Maps a hardware mode defined in a DeviceTree to a standard mode
>   */
>  struct regulator_desc {
> @@ -389,6 +392,8 @@ struct regulator_desc {
>  
>  	unsigned int off_on_delay;
>  
> +	unsigned int poll_enabled_time;
> +
>  	unsigned int (*of_map_mode)(unsigned int mode);
>  };
>  
> -- 
> 2.26.2
> 
