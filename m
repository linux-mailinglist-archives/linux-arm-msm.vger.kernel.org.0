Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBBEB10914
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 16:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfEAOZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 10:25:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34290 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfEAOZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 10:25:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 197DA601C4; Wed,  1 May 2019 14:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556720746;
        bh=bDbtm8CMC90CAwMbWbrZQYJY7BBDEyAzThnSYcHAuyA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EozbuQL51YR6wuirjWo2GANM09ysjBEw0FKWqLZ74QHI6J0xUiwotvRsqZQfJvz4O
         ZjRnGKHINand56bc4sqAqgs6/YV0UvZYaMPVzeLBtVi8HEXTn7ejzx8NumTAuXl52z
         itjs0TD6+k1lL0bV4xkEBA/NbHJSwzruneNph7o4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61120601C4;
        Wed,  1 May 2019 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556720745;
        bh=bDbtm8CMC90CAwMbWbrZQYJY7BBDEyAzThnSYcHAuyA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TGXTwv7pmGksjnVhJGpyQJlF0qI5KQTjjiACABVMVOJLk1OJXMCkFtpNc0kWrH/8R
         tPiAhxrdAZujasXNx7ISwIGGyUWGDFrNJYgZDFwDWc7/PVEcxGaPZZxnE6UkhE7MNP
         EC8MIIWohEDaYQztYLNGngTn1hoAvf/W+QfMRiJU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61120601C4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Add MSM8998 Multimedia Clock Controller
 (MMCC) driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        marc.w.gonzalez@free.fr, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677642-29428-1-git-send-email-jhugo@codeaurora.org>
 <20190501034314.GE2938@tuxbook-pro>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <0513163c-5088-6168-64fb-04fa51f711fa@codeaurora.org>
Date:   Wed, 1 May 2019 08:25:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190501034314.GE2938@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/30/2019 9:43 PM, Bjorn Andersson wrote:
> On Tue 30 Apr 19:27 PDT 2019, Jeffrey Hugo wrote:
>> +static const struct of_device_id mmcc_msm8998_match_table[] = {
>> +	{ .compatible = "qcom,mmcc-msm8998" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
>> +
>> +static int mmcc_msm8998_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
> 
> Don't you want to wait for "xo" here as well?

No, I don't want to.  As far as I recall, Stephen would like to make a 
clear divide between clock providers, and clock consumers.  Since we 
have the uart issue in gcc, and gcc is pretty critical to the entire 
SoC, it seems like there is a reason (not sure I'd call it "good") to 
wait for xo there.

Here, I'm less confident in the reasoning.  mmcc is not really critical 
to the SoC, and everything it services is "optional".  If you have a 
headless system with no display output, you won't even need it.  On 
system where there is a display, I expect the realistic driver ordering 
to be that everything which consumes a mmcc clock to come up well after 
xo is available.

In short, seems like a bit of a kludge to maybe avoid an issue which 
doesn't seem like would happen.

> 
>> +	regmap = qcom_cc_map(pdev, &mmcc_msm8998_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
>> +}
> [..]
>> +MODULE_DESCRIPTION("QCOM MMCC MSM8998 Driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:mmcc-msm8998");
> 
> MODULE_DEVICE_TABLE() will provide the alias for module auto loading, so
> drop this.

Huh.  I did not know that.  Will put on the list to fixup.

> 
> Regards,
> Bjorn
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
