Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F8E2D8C65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Dec 2020 09:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404802AbgLMIbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Dec 2020 03:31:21 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:33129 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404695AbgLMIbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Dec 2020 03:31:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607848262; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5YQx0yXiTWAxjyfN31qpBuzY18EzlpC4LhwwD9bSiY4=; b=rUHP/e+r2pFcDskXFH8KyrZO7vd7CHaOCuqgMUezQgTAGu8W+u6g47wtkfKgrqHKF9Kp8wXj
 7KMqashShOtJhrQoKNQ1iCqgBecV2DrS60YziRq4kY19mEoZt4TsPJCagfL95x4KSMcYOL3E
 Gl4CdnsyeDrDBDqMF2SiMDGH5sY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fd5d12995aeb115f3c5125e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 13 Dec 2020 08:30:33
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A336C433ED; Sun, 13 Dec 2020 08:30:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.204.181.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD9C2C433C6;
        Sun, 13 Dec 2020 08:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD9C2C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 5/5] clk: qcom: gcc: Add clock driver for SM8350
To:     Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-6-vkoul@kernel.org>
 <160763302790.1580929.10258660966995584297@swboyd.mtv.corp.google.com>
 <20201211054349.GS8403@vkoul-mobl>
 <160767062876.1580929.14564723998233527816@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <a6cc3d1e-4a72-63be-bf1c-5d560ecef9aa@codeaurora.org>
Date:   Sun, 13 Dec 2020 14:00:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <160767062876.1580929.14564723998233527816@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/11/2020 12:40 PM, Stephen Boyd wrote:
> Quoting Vinod Koul (2020-12-10 21:43:49)
>> On 10-12-20, 12:43, Stephen Boyd wrote:
>>>> +static struct clk_branch gcc_camera_ahb_clk = {
>>>> +       .halt_reg = 0x26004,
>>>> +       .halt_check = BRANCH_HALT_DELAY,
>>>> +       .hwcg_reg = 0x26004,
>>>> +       .hwcg_bit = 1,
>>>> +       .clkr = {
>>>> +               .enable_reg = 0x26004,
>>>> +               .enable_mask = BIT(0),
>>>> +               .hw.init = &(struct clk_init_data){
>>>> +                       .name = "gcc_camera_ahb_clk",
>>>> +                       .flags = CLK_IS_CRITICAL,
>>>
>>> Why is it critical? Can we just enable it in driver probe and stop
>>> modeling it as a clk?
>>
>> it does not have a parent we control, yeah it would make sense to do
>> that. Tanya do you folks agree ..?
>>
> 
> Maybe it is needed for camera clk controller? Have to check other SoCs
> and see if they're using it.
> 

Yes, they would have to be left enabled.

Vinod, could you please move them to probe, similar to kona/sc7180 where 
all the CRITICALs clocks are left enabled?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
