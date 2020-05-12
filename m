Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE88E1CEC6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 07:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgELFZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 01:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725776AbgELFZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 01:25:46 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADE7C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 22:25:45 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b8so4882310plm.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 22:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qY4tIWDJLygZQYEHexbugEUDcuN3ImOXtPyRSj2Tmbo=;
        b=UqL+G4svk3bMMRb1G1HJ83F+j3EPH3Vh6vnvyxepjH08v+uIeRrDEaRwEi6iY3uK/O
         eQZdIBa2yFiAzh7ndKZerzIKrMybuDYA3tR1BgJ94Ko6EtNJVHmJfK2ZaV0sWOjPhFOT
         7l41urSld5o73mzAeptvdKcPymsEKPm/NfZkgH59wZXQkCBzZm2yAR4eh2BCZjgKytIZ
         jMpHkSbiWADXMwdqdVf/YZxp9doSfSplRjuLDCT9HGmGiOsRVsFDlcxP8zHd0tUQaKUV
         47TP9BrLyQRkFjoNj387MAXQUVYlYw0CLi/ob8h5bd9e3HgCEsQwSHA3JQ/kSaZH07R8
         SJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qY4tIWDJLygZQYEHexbugEUDcuN3ImOXtPyRSj2Tmbo=;
        b=Yj/fB1DHv25J1nakY7iUuoHQvZ9xthW0wK2ROlitGr1NGxRfvER/tdmHXLnm4k90rh
         8pKatnFrBVAmCkuP2eoeb4AlHP9T04z3ymca9AeIWSnKeY9qh6U2KO2cWk1nKpElrymi
         JmDcllSIXSUcRjNHk1anRIibs42pSqZfyKj36Fm7Xf3K5Qa6enxEYOV+7gTLWY6aKhOh
         ihGaO/LeDzhpkp42WDnR3jV4ryGeqCHoQp31wyVW+EQRV3v5mARyhUtlcRSo/5YlNtG4
         ixTcb/vFt0gbr/2oR8fRWh4+eXXWMAKBXReemX1N19rbsGp7AB6wTR0N1v/6NCLH04/b
         +o9w==
X-Gm-Message-State: AOAM5327fbfCcv2uEJAczuBj3vcakauv3b3KmJWGGQaetSy0iIP7k//e
        qx+kjaw+m0HuAVdo+gaKhzf5SQ==
X-Google-Smtp-Source: ABdhPJxLiAh4YWUEEFs84ClWwP2pdJ/iMPgKckY4JWQXIdGqJrQGjpc5bov6yWSLe1sONjTFXGjpLg==
X-Received: by 2002:a17:902:9f97:: with SMTP id g23mr1640890plq.30.1589261145272;
        Mon, 11 May 2020 22:25:45 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z13sm11733513pjz.42.2020.05.11.22.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 22:25:44 -0700 (PDT)
Date:   Mon, 11 May 2020 22:25:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [v2 4/4] regulator: qcom: labibb: Add SC interrupt handling
Message-ID: <20200512052541.GF1302550@yoga>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-5-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508204200.13481-5-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 May 13:42 PDT 2020, Sumit Semwal wrote:

> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> Add Short circuit interrupt handling and recovery for the lab and
> ibb regulators on qcom platforms.
> 
> The client panel drivers need to register for REGULATOR_EVENT_OVER_CURRENT
> notification which will be triggered on short circuit. They should
> try to enable the regulator once, and if it doesn't get enabled,
> handle shutting down the panel accordingly.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> 
> --
> v2: sumits: reworked handling to user regmap_read_poll_timeout, and handle it
>     per-regulator instead of clearing both lab and ibb errors on either irq
>     triggering. Also added REGULATOR_EVENT_OVER_CURRENT handling and
>     notification to clients.
> ---
>  drivers/regulator/qcom-labibb-regulator.c | 103 +++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index a9dc7c060375..3539631c9f96 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2019, The Linux Foundation. All rights reserved.
>  
> +#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_irq.h>
>  #include <linux/of.h>
> @@ -18,11 +19,15 @@
>  #define REG_LABIBB_ENABLE_CTL		0x46
>  #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
>  #define LABIBB_CONTROL_ENABLE		BIT(7)
> +#define LABIBB_STATUS1_SC_DETECT_BIT	BIT(6)
>  
>  #define LAB_ENABLE_CTL_MASK		BIT(7)
>  #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
>  
>  #define POWER_DELAY			8000
> +#define POLLING_SCP_DONE_INTERVAL_US	5000
> +#define POLLING_SCP_TIMEOUT		16000
> +
>  
>  struct labibb_regulator {
>  	struct regulator_desc		desc;
> @@ -30,6 +35,8 @@ struct labibb_regulator {
>  	struct regmap			*regmap;
>  	struct regulator_dev		*rdev;
>  	u16				base;
> +	int				sc_irq;
> +	int				vreg_enabled;
>  	u8				type;
>  };
>  
> @@ -112,9 +119,10 @@ static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
>  		return ret;
>  	}
>  
> -	if (ret)
> +	if (ret) {
> +		reg->vreg_enabled = 1;
>  		return 0;
> -
> +	}
>  
>  	dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
>  	return -EINVAL;
> @@ -140,8 +148,10 @@ static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
>  		return ret;
>  	}
>  
> -	if (!ret)
> +	if (!ret) {
> +		reg->vreg_enabled = 0;
>  		return 0;
> +	}
>  
>  	dev_err(reg->dev, "Can't disable %s\n", reg->desc.name);
>  	return -EINVAL;
> @@ -153,6 +163,70 @@ static struct regulator_ops qcom_labibb_ops = {
>  	.is_enabled		= qcom_labibb_regulator_is_enabled,
>  };
>  
> +
> +static irqreturn_t labibb_sc_err_handler(int irq, void *_reg)
> +{
> +	int ret, count;
> +	u16 reg;
> +	u8 sc_err_mask;
> +	unsigned int val;
> +	struct labibb_regulator *labibb_reg = (struct labibb_regulator *)_reg;

No need to explicitly typecast a void *.

> +	bool in_sc_err, reg_en, scp_done = false;

reg_en is unused.

> +
> +	if (irq == labibb_reg->sc_irq)

When is this false?

> +		reg = labibb_reg->base + REG_LABIBB_STATUS1;
> +	else
> +		return IRQ_HANDLED;
> +
> +	sc_err_mask = LABIBB_STATUS1_SC_DETECT_BIT;
> +
> +	ret = regmap_bulk_read(labibb_reg->regmap, reg, &val, 1);

Just inline reg->base + REG_LABIBB_STATUS1 in this call.

> +	if (ret < 0) {
> +		dev_err(labibb_reg->dev, "Read failed, ret=%d\n", ret);
> +		return IRQ_HANDLED;
> +	}
> +	dev_dbg(labibb_reg->dev, "%s SC error triggered! STATUS1 = %d\n",
> +		labibb_reg->desc.name, val);
> +
> +	in_sc_err = !!(val & sc_err_mask);
> +
> +	/*
> +	 * The SC(short circuit) fault would trigger PBS(Portable Batch
> +	 * System) to disable regulators for protection. This would
> +	 * cause the SC_DETECT status being cleared so that it's not
> +	 * able to get the SC fault status.
> +	 * Check if the regulator is enabled in the driver but
> +	 * disabled in hardware, this means a SC fault had happened
> +	 * and SCP handling is completed by PBS.
> +	 */
> +	if (!in_sc_err) {

	if (!(val & LABIBB_STATUS1_SC_DETECT_BIT)) {

> +
> +		reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
> +
> +		ret = regmap_read_poll_timeout(labibb_reg->regmap,
> +					reg, val,
> +					!(val & LABIBB_CONTROL_ENABLE),
> +					POLLING_SCP_DONE_INTERVAL_US,
> +					POLLING_SCP_TIMEOUT);
> +
> +		if (!ret && labibb_reg->vreg_enabled) {

Wouldn't be fine to assume that if you get a short circuit IRQ the
regulator is enabled?

If you are worried about racing with a disable this won't work anyways,
and you better enable_irq()/disable_irq() in regulator enable/disable,
respectively.

> +			dev_dbg(labibb_reg->dev,
> +				"%s has been disabled by SCP\n",
> +				labibb_reg->desc.name);
> +			scp_done = true;
> +		}

If you flip the poll check around you will get here by not being in an
short-circuit condition and you conclude that the regulator is still on;
in which case you can just return here.

That way you can drop in_sc_err and scp_done and flatten below
conditional section.

> +	}
> +
> +	if (in_sc_err || scp_done) {
> +		regulator_lock(labibb_reg->rdev);
> +		regulator_notifier_call_chain(labibb_reg->rdev,
> +						REGULATOR_EVENT_OVER_CURRENT,
> +						NULL);
> +		regulator_unlock(labibb_reg->rdev);
> +	}
> +	return IRQ_HANDLED;
> +}
> +
>  static int register_labibb_regulator(struct qcom_labibb *labibb,
>  				const struct labibb_regulator_data *reg_data,
>  				struct device_node *of_node)
> @@ -181,6 +255,29 @@ static int register_labibb_regulator(struct qcom_labibb *labibb,
>  	reg->desc.type = REGULATOR_VOLTAGE;
>  	reg->desc.ops = &qcom_labibb_ops;
>  
> +	reg->sc_irq = -EINVAL;
> +	ret = of_irq_get_byname(of_node, reg_data->irq_name);
> +	if (ret < 0)
> +		dev_dbg(labibb->dev,

Isn't this an error?

> +			"Unable to get %s, ret = %d\n",
> +			reg_data->irq_name, ret);
> +	else
> +		reg->sc_irq = ret;
> +
> +	if (reg->sc_irq > 0) {
> +		ret = devm_request_threaded_irq(labibb->dev,
> +						reg->sc_irq,
> +						NULL, labibb_sc_err_handler,
> +						IRQF_ONESHOT |
> +						IRQF_TRIGGER_RISING,

Omit IRQF_TRIGGER_RISING and let that come from DT.

> +						reg_data->irq_name, labibb);
> +		if (ret) {
> +			dev_err(labibb->dev, "Failed to register '%s' irq ret=%d\n",
> +				reg_data->irq_name, ret);
> +			return ret;
> +		}
> +	}
> +

Regards,
Bjorn

>  	cfg.dev = labibb->dev;
>  	cfg.driver_data = reg;
>  	cfg.regmap = labibb->regmap;
> -- 
> 2.26.2
> 
