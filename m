Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF0C25AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 01:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfEUXQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 19:16:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43332 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfEUXQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 19:16:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 86E71607B9; Tue, 21 May 2019 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558480568;
        bh=+jSNZFHR8oxhJlcKZe3RijVp+XSrRaP7ibrFVpJPGYo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QoAgv0uvrwdWIzPUE3akGuiwYdRS7NFcTwloRo7FlI1H49f+on5eGjsHQHui0L2JS
         6spjX900DDK1L7I73QAjbF1Wb7ivSi61MWqdwu/k6jCp3IIKQkpIW5Pci7SYXTClYM
         +MFMgBWwW2Ah4RfeKONlG1gBZDI8LKRf6aZLaZLM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9A5D60709;
        Tue, 21 May 2019 23:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558480567;
        bh=+jSNZFHR8oxhJlcKZe3RijVp+XSrRaP7ibrFVpJPGYo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TVnemmSHEL3rVzGL2SUldtcMbo/f1NjShoAsHNfn1ecsobie8qQU7z4momS4pF6w4
         FgxHD8E9AQV7c9os/aEtV7OCTjXYuw9s5hsg4mxY3Vduxf9X2gPY3Gx6xihOXs7GH6
         Mm1Kjan5DbB74sETz3+33+hfcOEHrXM9tfELOCAE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9A5D60709
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
To:     Mark Brown <broonie@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
Date:   Tue, 21 May 2019 17:16:06 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521185054.GD16633@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/21/2019 12:50 PM, Mark Brown wrote:
> On Tue, May 21, 2019 at 09:53:15AM -0700, Jeffrey Hugo wrote:
> 
>> -	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
>> +	/* second common devices don't have VOLTAGE_RANGE register */
>> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2) {
>> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, &lsb, 1);
>> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_MSB, &msb, 1);
>> +
>> +		uV = (((int)msb << 8) | (int)lsb) * 1000;
> 
> This overlaps with some changes that Jorge (CCed) was sending for the
> PMS405.  As I was saying to him rather than shoving special cases for
> different regulator types into the ops (especially ones that don't have
> any of the range stuff) it'd be better to just define separate ops for
> the regulators that look quite different to the existing ones.

Sorry, I hadn't paid attention to that discussion.  Reviewing it now.
> 
>> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
>> +					      unsigned selector);
>> +
>> +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
>> +					      unsigned selector)
> 
> Eeew, can we not have better names?

I'm open to suggestions.  Apparently there are two register common 
register schemes - the old one and the new one.  PMIC designs after some 
random point in time are all the new register scheme per the 
documentation I see.

As far as I an aware, the FT426 design is the first design to be added 
to this driver to make use of the new scheme, but I expect more to be 
supported in future, thus I'm reluctant to make these ft426 specific in 
the name.

> 
>> +static unsigned int spmi_regulator_common2_get_mode(struct regulator_dev *rdev)
>> +{
>> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u8 reg;
>> +
>> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_MODE, &reg, 1);
>> +
>> +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
>> +		return REGULATOR_MODE_NORMAL;
>> +
>> +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
>> +		return REGULATOR_MODE_FAST;
>> +
>> +	return REGULATOR_MODE_IDLE;
>> +}
> 
> This looks like you want to write a switch statement.

It follows the existing style in the driver, but sure I can make this a 
switch.

> 
>> +spmi_regulator_common2_set_mode(struct regulator_dev *rdev, unsigned int mode)
>> +{
>> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u8 mask = SPMI_COMMON2_MODE_MASK;
>> +	u8 val = SPMI_COMMON2_MODE_LPM_MASK;
>> +
>> +	if (mode == REGULATOR_MODE_NORMAL)
>> +		val = SPMI_COMMON2_MODE_HPM_MASK;
>> +	else if (mode == REGULATOR_MODE_FAST)
>> +		val = SPMI_COMMON2_MODE_AUTO_MASK;
> 
> This needs to be a switch statement, then it can have a default case to
> catch errors too.
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
