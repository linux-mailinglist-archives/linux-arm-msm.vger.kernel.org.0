Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C241FFEDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 01:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgFRXoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 19:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgFRXoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 19:44:24 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD18AC0613EF
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 16:44:24 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 35so3174957ple.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 16:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yvMb0a2c10861vhwKbOrdUepqOFkOOTrJVCk2dRfuZY=;
        b=ceY3GOfJpNh0ZC/Fk/jOULWNhQVbB5DWH9hsXiIJPYBcRUoNpbt1Qsj/70w29kdaD+
         Wl7AaXV1XouuHHR8bDaZ++vSMCCFR4atOHlv7cRBBxVkOKKkaeKN54Pc3hJsrRvL15XB
         L0o+v/kLgFBNzOCDuE/RR/SdvLQIchUdVhIhwMifEVe0Zzy5lhyreetnLITGYGsnqaBP
         bNDkldIDaNGYip8xamFAVWn3Wz1D7aSrUEVUe7YeaavLcmxNRF91YY7AEDcJNYCG9Rnf
         t/w8tOcnYbO3kh1D/edX4na0mJuVD7Y0LUmTeh1GX5SV2ExvQrWX7AuO7rSRBNk0ftr4
         YEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yvMb0a2c10861vhwKbOrdUepqOFkOOTrJVCk2dRfuZY=;
        b=nBdsVnYfkwzDjfkPBPyndySUyUVOllQvxjKaWLKR4EjI59nMrAuc728sk3hHAOei8C
         98nsnmSKaJDPnmz98NruAG0Z+CkGKMxA/qSgBwEmDk3x86dc/5BdyuVpQuf178S0RrHj
         DHPqKPc+2SgUKHkJtLLyi+0s7ceUhGvGzDFWeHeD5nM+t9xVF46cSqzgH2bBuB62k75y
         G/x14F2r7Uj/OtP5CmD9Bk8xjtCJHBhc7KPyvzYByNJScL+fFf6FHmXGnN7pkXEGRrLM
         OvJfYFxHzqJVQopVhPSQT8ZnJNru+vtCmArTlwLqPs8ebwTtUEV3V9/B/pJvAe5mnN78
         AlKA==
X-Gm-Message-State: AOAM533M4E+9aDeZ/4710RRFslc9tqVblykTjZUaByei9mOvoHlR+6PK
        5FvNCMLlVE4E2hkZeP1McLWQ1g==
X-Google-Smtp-Source: ABdhPJyNWW8E/cNTuVgEqsGVFJm/OQSR0fcdze58ugdAUPV3L4aNzeiuPCG4YmpZJ7ubSzIfsKricQ==
X-Received: by 2002:a17:902:b216:: with SMTP id t22mr5527631plr.181.1592523863778;
        Thu, 18 Jun 2020 16:44:23 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h9sm3967767pfe.32.2020.06.18.16.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 16:44:22 -0700 (PDT)
Date:   Thu, 18 Jun 2020 16:44:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v4 1/5] regulator: Allow regulators to verify enabled
 during enable()
Message-ID: <20200618234420.GI11847@yoga>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602100924.26256-2-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 02 Jun 03:09 PDT 2020, Sumit Semwal wrote:

> Some regulators might need to verify that they have indeed been enabled
> after the enable() call is made and enable_time delay has passed.
> 
> This is implemented by repeatedly checking is_enabled() upto
> poll_enabled_time, waiting for the already calculated enable delay in
> each iteration.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> --
> v2: Address review comments, including swapping enable_time and poll_enabled_time.
> ---
>  drivers/regulator/core.c         | 58 +++++++++++++++++++++++++++++++-
>  include/linux/regulator/driver.h |  5 +++
>  2 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 7486f6e4e613..d9ab888da95f 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -2347,6 +2347,32 @@ static void _regulator_enable_delay(unsigned int delay)
>  		udelay(us);
>  }
>  
> +/* _regulator_check_status_enabled

Please make all your kerneldoc follow:
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

> + *
> + * returns:
> + *          1 if status shows regulator is in enabled state
> + *          0 if not enabled state
> + *          else, error value as received from ops->get_status()
> + */
> +static inline int _regulator_check_status_enabled(struct regulator_dev *rdev)
> +{
> +	int ret = rdev->desc->ops->get_status(rdev);
> +
> +	if (ret < 0) {
> +		rdev_info(rdev, "get_status returned error: %d\n", ret);
> +		return ret;
> +	}
> +
> +	switch (ret) {
> +	case REGULATOR_STATUS_OFF:
> +	case REGULATOR_STATUS_ERROR:
> +	case REGULATOR_STATUS_UNDEFINED:
> +		return 0;
> +	default:
> +		return 1;
> +	}
> +}
> +
>  static int _regulator_do_enable(struct regulator_dev *rdev)
>  {
>  	int ret, delay;
> @@ -2407,7 +2433,37 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
>  	 * together.  */
>  	trace_regulator_enable_delay(rdev_get_name(rdev));
>  
> -	_regulator_enable_delay(delay);
> +	/* If poll_enabled_time is set, poll upto the delay calculated
> +	 * above, delaying poll_enabled_time uS to check if the regulator
> +	 * actually got enabled.
> +	 * If the regulator isn't enabled after enable_delay has
> +	 * expired, return -ETIMEDOUT.
> +	 */
> +	if (rdev->desc->poll_enabled_time) {
> +		unsigned int time_remaining = delay;
> +
> +		while (time_remaining > 0) {
> +			_regulator_enable_delay(rdev->desc->poll_enabled_time);
> +
> +			if (rdev->desc->ops->get_status) {
> +				ret = _regulator_check_status_enabled(rdev);
> +				if (ret < 0)
> +					return ret;
> +				else if (ret)
> +					break;
> +			} else if (rdev->desc->ops->is_enabled(rdev))
> +				break;
> +
> +			time_remaining -= rdev->desc->poll_enabled_time;
> +		}
> +
> +		if (time_remaining <= 0) {
> +			rdev_err(rdev, "Enabled check failed.\n");
> +			return -ETIMEDOUT;
> +		}
> +	} else {
> +		_regulator_enable_delay(delay);
> +	}
>  
>  	trace_regulator_enable_complete(rdev_get_name(rdev));
>  
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

I read this as "how long should we stay in the poll loop". I think it
would be better describes as something like "The polling interval to use
while checking that the regulator was actually enabled".

Regards,
Bjorn

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
