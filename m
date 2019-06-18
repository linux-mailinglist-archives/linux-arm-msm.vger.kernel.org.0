Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12BAD4998B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 08:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfFRG5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 02:57:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58622 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFRG5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 02:57:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1CA5C60A97; Tue, 18 Jun 2019 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560838887;
        bh=P/SMdVYW3xpmJ2Q4KDX7a1RxqgZ4fB6O25+9ELAvFv0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=exxVVQS+DhZ5lgqd7XyoOG1zaCEUC/LF0+kvf2iP9swzn+vt7RaDl5vk+MjNy5FVD
         Ywygtpymi0g3f/p8CYiJMYOAcY9EfXXu/jxVldroqNQuBgzUbbolEzAz2sD6g4s9Ui
         RtotTSPWpJgS/yqsOd4zjZ5W8Apn+1lzzs4mH1M0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.187] (unknown [223.227.13.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F87F6086B;
        Tue, 18 Jun 2019 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560838886;
        bh=P/SMdVYW3xpmJ2Q4KDX7a1RxqgZ4fB6O25+9ELAvFv0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NPm9hCzmuhyKVsZyn8hbkcX8YSJ5pi/gvp/pg1kQ1XCgDqKhoF6TnknfiYu+X9+C0
         c3/hb6Rs3IPpsotqxQdniYDwfRJN68XpMx1re/CV6XWNCYx3c6tWIQSoL6O7VNcHcI
         4hISthxJq6LvGrmfFCoedZ6kCkdqorNJ7x+9KqsU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F87F6086B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
To:     Mark Brown <broonie@kernel.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
 <20190613172518.GN5316@sirena.org.uk>
From:   Nisha Kumari <nishakumari@codeaurora.org>
Message-ID: <577d6e90-0bed-ff2e-32dc-e64c3118458f@codeaurora.org>
Date:   Tue, 18 Jun 2019 11:51:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190613172518.GN5316@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/13/2019 10:55 PM, Mark Brown wrote:
> On Wed, Jun 12, 2019 at 04:30:51PM +0530, Nisha Kumari wrote:
>
>> +static int qcom_labibb_read(struct qcom_labibb *labibb, u16 address,
>> +			    u8 *val, int count)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(labibb->regmap, address, val, count);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi read failed ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
> This (and the write function) are utterly trivial wrappers around the
> corresponding regmap functions...
Yeah, i will use the regmap functions directly wherever required
>
>> +static int qcom_labibb_masked_write(struct qcom_labibb *labibb, u16 address,
>> +				    u8 mask, u8 val)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(labibb->regmap, address, mask, val);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi write failed: ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
> ...as is this but it changes the name for some reason.
Yeah, i will use the regmap functions directly wherever required
>
>> +static int qcom_enable_ibb(struct qcom_labibb *labibb, bool enable)
>> +{
>> +	int ret;
>> +	u8 val = enable ? IBB_CONTROL_ENABLE : 0;
> Please write normal conditional statements, it makes things easier to
> read.  Though this function is so trivial it seems better to just inline
> it into the callers.
Sure, I will do that
>
>> +static int qcom_lab_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	val = LAB_ENABLE_CTL_EN;
>> +	ret = qcom_labibb_write(labibb,
>> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
>> +				&val, 1);
> Why not just use regmap_write()?  It'd be clearer.
Sure, I will do that
>
>> +	labibb->lab_vreg.vreg_enabled = 1;
> What function does this serve?  It never seems to be read.
Its used in next patch for handling interrupts
>
>> +	ret = qcom_labibb_write(labibb,
>> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
>> +				&val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Write register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +	/* after this delay, lab should get disabled */
>> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
> I'm not clear that these status checks are actually a good idea, and if
> they are it feels like they should be factored out into the framework -
> these are just regular enable or disable followed by the usual dead
> reckoning delay for completion and then a get_status() call to confirm
> if the operation worked.  That's not at all driver specific so if it's
> useful the core should do it for all regulators with status readback and
> if you didn't do it you could use the standard regmap helpers for these
> operations.
Sure, I will do that
>
>> +static int qcom_lab_regulator_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return val & LAB_STATUS1_VREG_OK_BIT;
>> +}
> Please use the standard helper for this, and this is a get_status()
> operation not an is_enabled() - it checks if the regulator is working,
> not what status was requested.
ok
>
>> +	while (retries--) {
>> +		/* Wait for a small period before reading IBB_STATUS1 */
>> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +
>> +		ret = qcom_labibb_read(labibb, labibb->ibb_base +
>> +				       REG_IBB_STATUS1, &val, 1);
>> +		if (ret < 0) {
>> +			dev_err(labibb->dev,
>> +				"Read register failed ret = %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		if (val & IBB_STATUS1_VREG_OK_BIT) {
>> +			labibb->ibb_vreg.vreg_enabled = 1;
>> +			return 0;
>> +		}
>> +	}
> This is doing more than the other regulator was but it's not clear why -
> is it just that the delays are different for the two regulators?
LAB regulator comes up in first try, so we did not added much delay in 
that like IBB. Planning to make equal no of retries for both in next 
patch so that code can be reused.
>
>> +static int register_lab_regulator(struct qcom_labibb *labibb,
>> +				  struct device_node *of_node)
>> +{
>> +	int ret = 0;
>> +	struct regulator_init_data *init_data;
>> +	struct regulator_config cfg = {};
>> +
>> +	cfg.dev = labibb->dev;
>> +	cfg.driver_data = labibb;
>> +	cfg.of_node = of_node;
>> +	init_data =
>> +		of_get_regulator_init_data(labibb->dev,
>> +					   of_node, &lab_desc);
>> +	if (!init_data) {
>> +		dev_err(labibb->dev,
>> +			"unable to get init data for LAB\n");
>> +		return -ENOMEM;
>> +	}
> The core will parse the DT for you.
ok
