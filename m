Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1091B131029
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 11:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgAFKSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 05:18:23 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:26875 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726212AbgAFKSV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 05:18:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578305901; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1OHQW4/xD2XUS1jStNjnGNpG1EuF7f1TD2E/Qky6pv4=; b=sjpMTO63FfJc3lLcwYKnPyLg+CcJfufiKwMXtyzAJtXHfGSYA0adseRkGPdMxeFppEKACtKP
 UEv+6XYY3N2AH6Qil107Wh/064gQBrkkjkPd6i44Ob1zGwtCUlFvGB6ifTF9/CWcCM5y/8GX
 grk/Y9XVNK33HOmxa8BFxBWt58I=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e130965.7efd9b990848-smtp-out-n02;
 Mon, 06 Jan 2020 10:18:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA5E5C447A1; Mon,  6 Jan 2020 10:18:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31D34C433CB;
        Mon,  6 Jan 2020 10:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31D34C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/2] clk: qcom: rpmh: skip undefined clocks when
 registering
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1577790048-18263-1-git-send-email-tdas@codeaurora.org>
 <1577790048-18263-2-git-send-email-tdas@codeaurora.org>
 <20200102005700.1EAAE20672@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <806299af-38fb-05e4-7fd5-9e2344a53f8d@codeaurora.org>
Date:   Mon, 6 Jan 2020 15:48:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200102005700.1EAAE20672@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for your review comments.

On 1/2/2020 6:26 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-12-31 03:00:47)
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 7ed313a..05cbe6f 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -462,7 +464,8 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>>
>>                  ret = devm_clk_hw_register(&pdev->dev, hw_clks[i]);
>>                  if (ret) {
>> -                       dev_err(&pdev->dev, "failed to register %s\n", name);
>> +                       dev_err(&pdev->dev, "failed to register %s\n",
>> +                                                       hw_clks[i]->init->name);
> 
> After register clk_hw::init is NULL. This will probably oops. It would
> be better to save off the name before registering.
> 

Will take care in the next patch series.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
