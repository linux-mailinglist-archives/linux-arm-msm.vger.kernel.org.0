Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385A21E7298
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406808AbgE2C3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405031AbgE2C3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:29:54 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AD6C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:29:54 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id c75so606623pga.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3l/uy9rkSgcqOcPxEDKlHX2a7wRD2FJSR8LJkg5Mydk=;
        b=PDpAVMHjMU8db05ww6y3TqOibPw36FTVxG+D7IDJUwbM1cQCQXH7DmukxiTiLAOMne
         XDEnWH4pU5A2U0tBJSbRNF8XGvgU4EX3zrSzgjE35h7Z1Lz/FioBStsmSfmf0HFIifXC
         hO4cctO+/7ye+4E9wOy7DiPLuPSct4qM9RT74aK8vz+/rsR7Yx65qWT/hN7NJSkW6WFw
         j00nHXD9zgWFtVnD0PrpN1fPnSuLkNAF5nJsD7IRvBpCyemRAgNY0oOR2inpmTaztsHq
         hLsznz5dVev3nGHMHgj8hPXVGTaOkh3O7kw4uSowLYmqtcrxJDtROsLmSxuqCgu4sODz
         eR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3l/uy9rkSgcqOcPxEDKlHX2a7wRD2FJSR8LJkg5Mydk=;
        b=aoh3spp18yZq/p4lrAqxk/fg/pc2JWsjkoAxeZttVs/7Fykk/+rWwFlC4lrJlwKqXm
         4NFrP93K0v51Dxy/ZrNW1W28mAh7qI72+hZVo3RNjS4L1dd1HmfuTGSi50kDWMfZwolE
         af55erA+Rt3UQN0+ZDAWmOkJ43eiiXShbj52mbQLW5QbbwjXSl9yAI2DTs0ZKvYtmKvP
         kGSPttFUp6Cf1a2Riqp+ZU4y1NxPXNX4mEv8EsQBfYCr/FDIsKg4yoY2pGqSJtxYD8ma
         neb3pX2N3UUk/MZVHzK25wjGAIp/K7+KFHdE/vo1+Encp/vWVMZUo20OyKQDGrP1UBGq
         y2NA==
X-Gm-Message-State: AOAM531xs5FeSjCG8mLMuyDCQlTmqIz0RFzYHvX4fNokNKFt1fjIDA7n
        Shrk94zodIuvMF/t5MQILUgDMA==
X-Google-Smtp-Source: ABdhPJxhTrem+6swxocNd1/XW0+hUviSs6g6emgO+YsgjaI4iM4SJVt84no+lZF35PTPOpy7jDNRFw==
X-Received: by 2002:a65:52cd:: with SMTP id z13mr5961753pgp.259.1590719393398;
        Thu, 28 May 2020 19:29:53 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v9sm5541381pgj.54.2020.05.28.19.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:29:52 -0700 (PDT)
Date:   Thu, 28 May 2020 19:28:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v3 5/5] regulator: qcom: labibb: Add SC interrupt handling
Message-ID: <20200529022847.GO279327@builder.lan>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-6-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528154625.17742-6-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 May 08:46 PDT 2020, Sumit Semwal wrote:

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

It would be nice to see a short summary of your changes from the
original patch here, like:

[sumit: Changed this and that]

> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> 
> --
> v2: sumits: reworked handling to user regmap_read_poll_timeout, and handle it
>      per-regulator instead of clearing both lab and ibb errors on either irq
>      triggering. Also added REGULATOR_EVENT_OVER_CURRENT handling and
>      notification to clients.
> v3: sumits: updated as per review comments of v2: removed spurious check for
>      irq in handler and some unused variables; inlined some of the code,
>      omitted IRQF_TRIGGER_RISING as it's coming from DT.
> 
> ---
>  drivers/regulator/qcom-labibb-regulator.c | 92 +++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index 634d08461c6e..695ffac71e81 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (c) 2020, The Linux Foundation. All rights reserved.
>  
> +#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_irq.h>
>  #include <linux/of.h>
> @@ -18,6 +19,7 @@
>  #define REG_LABIBB_ENABLE_CTL		0x46
>  #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
>  #define LABIBB_CONTROL_ENABLE		BIT(7)
> +#define LABIBB_STATUS1_SC_DETECT_BIT	BIT(6)
>  
>  #define LAB_ENABLE_CTL_MASK		BIT(7)
>  #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
> @@ -27,12 +29,17 @@
>  #define IBB_POLL_ENABLED_TIME		(LABIBB_ENABLE_TIME * 10)
>  #define LABIBB_OFF_ON_DELAY		(8200)
>  
> +#define POLLING_SCP_DONE_INTERVAL_US	5000
> +#define POLLING_SCP_TIMEOUT		16000
> +
>  struct labibb_regulator {
>  	struct regulator_desc		desc;
>  	struct device			*dev;
>  	struct regmap			*regmap;
>  	struct regulator_dev		*rdev;
>  	u16				base;
> +	int				sc_irq;

This is now a local variable in register_labibb_regulator().

> +	int				vreg_enabled;

bool is a better representation of this (and the vreg_ prefix doesn't
really add value).

>  	u8				type;
>  };
>  
> @@ -65,6 +72,8 @@ static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
>  	if (ret < 0)
>  		dev_err(reg->dev, "Write failed: enable %s regulator\n",
>  			reg->desc.name);
> +	else
> +		reg->vreg_enabled = 1;

No I see why you add these wrappers around the regmap in the previous
patch.

My request to not print an error message on enable/disable errors
remains.

>  
>  	return ret;
>  }
> @@ -78,6 +87,8 @@ static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
>  	if (ret < 0)
>  		dev_err(reg->dev, "Disable failed: disable %s\n",
>  			reg->desc.name);
> +	else
> +		reg->vreg_enabled = 0;
>  
>  	return ret;
>  }
> @@ -88,11 +99,70 @@ static struct regulator_ops qcom_labibb_ops = {
>  	.is_enabled		= qcom_labibb_regulator_is_enabled,
>  };
>  
> +static irqreturn_t labibb_sc_err_handler(int irq, void *_reg)
> +{
> +	int ret;
> +	u16 reg;
> +	unsigned int val;
> +	struct labibb_regulator *labibb_reg = _reg;
> +	bool in_sc_err, scp_done = false;
> +
> +	ret = regmap_read(labibb_reg->regmap,
> +			  labibb_reg->base + REG_LABIBB_STATUS1, &val);
> +	if (ret < 0) {
> +		dev_err(labibb_reg->dev, "sc_err_irq: Read failed, ret=%d\n",
> +			ret);
> +		return IRQ_HANDLED;
> +	}
> +
> +	dev_dbg(labibb_reg->dev, "%s SC error triggered! STATUS1 = %d\n",
> +		labibb_reg->desc.name, val);
> +
> +	in_sc_err = !!(val & LABIBB_STATUS1_SC_DETECT_BIT);
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
> +

Empty line

Regards,
Bjorn

> +		reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
> +
> +		ret = regmap_read_poll_timeout(labibb_reg->regmap,
> +					reg, val,
> +					!(val & LABIBB_CONTROL_ENABLE),
> +					POLLING_SCP_DONE_INTERVAL_US,
> +					POLLING_SCP_TIMEOUT);
> +
> +		if (!ret && labibb_reg->vreg_enabled) {
> +			dev_dbg(labibb_reg->dev,
> +				"%s has been disabled by SCP\n",
> +				labibb_reg->desc.name);
> +			scp_done = true;
> +		}
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
>  static int register_labibb_regulator(struct labibb_regulator *reg,
>  				const struct labibb_regulator_data *reg_data,
>  				struct device_node *of_node)
>  {
>  	struct regulator_config cfg = {};
> +	int ret;
>  
>  	reg->base = reg_data->base;
>  	reg->type = reg_data->type;
> @@ -108,6 +178,28 @@ static int register_labibb_regulator(struct labibb_regulator *reg,
>  	reg->desc.poll_enabled_time = reg_data->poll_enabled_time;
>  	reg->desc.off_on_delay = LABIBB_OFF_ON_DELAY;
>  
> +	reg->sc_irq = -EINVAL;
> +	ret = of_irq_get_byname(of_node, "sc-err");
> +	if (ret < 0) {
> +		dev_err(reg->dev, "Unable to get sc-err, ret = %d\n",
> +			ret);
> +		return ret;
> +	} else
> +		reg->sc_irq = ret;
> +
> +	if (reg->sc_irq > 0) {
> +		ret = devm_request_threaded_irq(reg->dev,
> +						reg->sc_irq,
> +						NULL, labibb_sc_err_handler,
> +						IRQF_ONESHOT,
> +						"sc-err", reg);
> +		if (ret) {
> +			dev_err(reg->dev, "Failed to register sc-err irq ret=%d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
>  	cfg.dev = reg->dev;
>  	cfg.driver_data = reg;
>  	cfg.regmap = reg->regmap;
> -- 
> 2.26.2
> 
