Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9040F2CEA35
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 09:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgLDIvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 03:51:54 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:21708 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729335AbgLDIvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 03:51:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607071894; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KDVVzbG9GvJL/tCyDceYZiD1rBmyxebfv3YnVVi8et4=; b=PT+tWlhtgAQS0TyWEQSM7WeuJIg2Uht2ic/BBYYmHzkdmySqj36Un+ac827o/J7Kty0q1Ydz
 Q3zXRGDtl5PYPm18LS9pM3WMdDBdtOBHj8zniaknnVwD4TJ71MpcLeKZEIyssf7iZjMNjdOp
 DAXQUVji+U1CzhaC+rZfbVAeANA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc9f87aaac9455097f0b388 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Dec 2020 08:51:06
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B5E7C43464; Fri,  4 Dec 2020 08:51:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.204.182.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A514CC433C6;
        Fri,  4 Dec 2020 08:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A514CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH 5/5] clk: qcom: gcc: Add clock driver for SM8350
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
References: <20201203070241.2648874-1-vkoul@kernel.org>
 <20201203070241.2648874-6-vkoul@kernel.org> <X8l9dRfo7qdRTAMe@builder.lan>
 <20201204043502.GJ8403@vkoul-mobl>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <302cf18a-080d-a521-8c7a-39c265fbceb8@codeaurora.org>
Date:   Fri, 4 Dec 2020 14:20:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204043502.GJ8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 12/4/2020 10:05 AM, Vinod Koul wrote:
> Hi Bjorn,
> 
> On 03-12-20, 18:06, Bjorn Andersson wrote:
>> On Thu 03 Dec 01:02 CST 2020, Vinod Koul wrote:
>>> diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
>> [..]
>>> +static int gcc_sm8350_probe(struct platform_device *pdev)
>>> +{
>>> +	struct regmap *regmap;
>>> +	int ret;
>>> +
>>> +	regmap = qcom_cc_map(pdev, &gcc_sm8350_desc);
>>> +	if (IS_ERR(regmap)) {
>>> +		dev_err(&pdev->dev, "Failed to map gcc registers\n");
>>> +		return PTR_ERR(regmap);
>>> +	}
>>> +
>>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
>>> +	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
>>> +
>>> +	/*
>>> +	 * Enable clocks required by the i2c-connected pm8008 regulators. Don't
>>> +	 * register them with the clock framework so that client requests are
>>> +	 * short-circuited before grabbing the enable/prepare locks. This
>>> +	 * prevents deadlocks between the clk/regulator frameworks.
>>> +	 *
>>> +	 *	gcc_qupv3_wrap_1_m_ahb_clk
>>> +	 *	gcc_qupv3_wrap_1_s_ahb_clk
>>> +	 *	gcc_qupv3_wrap1_s5_clk
>>> +	 */
>>
>> Isn't this a workaround inherited from the downstream control of
>> regulators from within the clock core? Does this still apply upstream?
> 
> Let me check on this bit...
> 
> Thanks
> 

No it should not apply.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
