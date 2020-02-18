Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C3F162E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgBRSVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:21:45 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:45373 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726225AbgBRSVp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:21:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582050104; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PByvNvUejMgA8YdPUEQ84Jkgung4Y3EMULErG7G/60c=; b=ik0aU/tb18Bfox+Pzpsw3JzDYNcS60eTA+GcBVO/wtqwE9Eeg/aBPnBOBv7BwpKmT0GRbEuT
 kAfvxlZ8G3Qv+jLpErsiqhZiyi1MxrNFU0GFg2GBN41DmyYy7jxFWSscCtcHJIpSNCFZSBTk
 cRSpwdIzxTkQ76HHOr7HHJiK6uM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c2b37.7f6e36ebcf48-smtp-out-n01;
 Tue, 18 Feb 2020 18:21:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81817C4479F; Tue, 18 Feb 2020 18:21:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.107] (unknown [183.83.146.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 316FAC4479C;
        Tue, 18 Feb 2020 18:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 316FAC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: Introduce QCOM Modem clock
 bindings
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
 <1580357923-19783-3-git-send-email-tdas@codeaurora.org>
 <20200130180915.E025D20CC7@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <e4177a21-7a6f-8077-af62-15b6253845a6@codeaurora.org>
Date:   Tue, 18 Feb 2020 23:51:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200130180915.E025D20CC7@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/30/2020 11:39 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-01-29 20:18:42)
>> Add device tree bindings for modem clock controller for
>> Qualcomm Technology Inc's SC7180 SoCs.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   include/dt-bindings/clock/qcom,gcc-sc7180.h |  5 +++++
>>   include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++
> 
> Split this into two as well.
> 

I have taken care of this in the next patch series.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
