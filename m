Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9A041AE9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbhI1MSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:18:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42753 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240503AbhI1MSz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:18:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632831436; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3YxpkI8yDoGtSj31ff3dv3bwdiRI/L0P/ZZXyQghP1k=;
 b=kWtI/TXNd1BjtNs+k9yu2cv8Xr0V0kbfl6k90hSh58w/rdfpZllwCJPZTIc2tIxXBk/hKbkU
 uuAmb1bIneiih6IcOPkCSzWUvP4CsfWsp5ocMgAtQwfycelARnxgfS+9Us15sA8daLS6Nm8c
 GJIOP7IEvBKwqBy+yJs27OiT8DQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 615307b9713d5d6f96782ba1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:16:57
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97176C43639; Tue, 28 Sep 2021 12:16:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BECDC43619;
        Tue, 28 Sep 2021 12:16:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 17:46:54 +0530
From:   skakit@codeaurora.org
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] regulator: Add a regulator driver for the PM8008 PMIC
In-Reply-To: <20210917153837.GB4700@sirena.org.uk>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-4-git-send-email-skakit@codeaurora.org>
 <20210917153837.GB4700@sirena.org.uk>
Message-ID: <fbd80685df0a86b30868187e2556d67f@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

Thanks for reviewing the changes!

On 2021-09-17 21:08, Mark Brown wrote:
> On Fri, Sep 17, 2021 at 04:15:37PM +0530, Satya Priya wrote:
> 
>> +static int pm8008_regulator_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +	int rc;
>> +	u8 reg;
>> +
>> +	rc = pm8008_read(pm8008_reg->regmap,
>> +			LDO_ENABLE_REG(pm8008_reg->base), &reg, 1);
>> +	if (rc < 0) {
>> +		pr_err("failed to read enable reg rc=%d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	return !!(reg & ENABLE_BIT);
>> +}
> 
> This could just be regulator_is_enabled_regmap().  There's also a lot 
> of
> instances in the driver where it's using pr_err() not dev_err() (and
> similarly for the debug prints).
> 

Okay, I'll use the helper regulator_is_enabled_regmap() here and remove 
this completely.

>> +
>> +static int pm8008_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
>> +	int rc, current_uv, delay_us, delay_ms, retry_count = 10;
>> +	u8 reg;
> 
> This is the regmap helper.
> 

Okay, I'll use regulator_enable_regmap().

>> +	/*
>> +	 * Wait for the VREG_READY status bit to be set using a timeout 
>> delay
>> +	 * calculated from the current commanded voltage.
>> +	 */
>> +	delay_us = STARTUP_DELAY_USEC
>> +			+ DIV_ROUND_UP(current_uv, pm8008_reg->step_rate);
>> +	delay_ms = DIV_ROUND_UP(delay_us, 1000);
> 
> Set poll_enable_time and implement get_status() then this will be
> handled by the core.
> 

Anyway I will be removing this API.

>> +static int pm8008_regulator_disable(struct regulator_dev *rdev)
>> +{
> 
> Use the regmap helper.
> 

Ok, I'll use regulator_disable_regmap.

>> +	rc = pm8008_write_voltage(pm8008_reg, min_uv, max_uv);
>> +	if (rc < 0)
>> +		return rc;
> 
> This is the only place where write_voltage() is called, may as well 
> just
> inline it.
> 

Okay.

>> +	init_voltage = -EINVAL;
>> +	of_property_read_u32(reg_node, "qcom,init-voltage", &init_voltage);
> 
> Why does this property exist and if it's needed why is it specific to
> this device?  It looks like the device allows you to read the voltage 
> on
> startup from the regmap.
> 

I think it is not necessary, will remove it.

>> +	init_data = of_get_regulator_init_data(dev, reg_node,
>> +						&pm8008_reg->rdesc);
>> +	if (init_data == NULL) {
>> +		dev_err(dev, "%s: failed to get regulator data\n", name);
>> +		return -ENODATA;
>> +	}
>> +	if (!init_data->constraints.name) {
>> +		dev_err(dev, "%s: regulator name missing\n", name);
>> +		return -EINVAL;
>> +	}
> 
> Just let the core find the init data for you, there is no reason to
> insist on a system provided name - that is an entirely optional 
> property
> for systems to use, there is no reason for a regulator driver to care.
> 

OK, I will remove this if check.

>> +	init_data->constraints.input_uV = init_data->constraints.max_uV;
>> +	init_data->constraints.valid_ops_mask |= REGULATOR_CHANGE_STATUS
>> +						| REGULATOR_CHANGE_VOLTAGE;
> 
> This is absolutely not something that a regulator driver should be
> doing, the whole point with constraints is that they come from the
> machine.
> 

Okay I will remove this.

>> +static int pm8008_parse_regulator(struct regmap *regmap, struct 
>> device *dev)
>> +{
>> +	int rc = 0;
>> +	const char *name;
>> +	struct device_node *child;
>> +	struct pm8008_regulator *pm8008_reg;
>> +
>> +	/* parse each subnode and register regulator for regulator child */
>> +	for_each_available_child_of_node(dev->of_node, child) {
>> +		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
>> +		if (!pm8008_reg)
> 
> You shouldn't be doing this, just unconditionally register all the
> regulators supported by the chip.  If they don't appear in the DT 
> that's
> totally fine - it gives read only access which can be useful for
> diagnostics.

Okay will remove this check as well.

-Satya Priya.
