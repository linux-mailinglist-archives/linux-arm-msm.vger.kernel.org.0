Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9734E18AC4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 06:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgCSFhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 01:37:42 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:38855 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725970AbgCSFhm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 01:37:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584596261; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CQCEPvvCGvjhPFGRaKNikUAsx4+h7xrA2QxZN1jGhEk=; b=fMCTkMnApUn/oOaU0SYfYFk8gZMMIYQhj9QOfXS8i1+tCt0O7RGfpT4176CCTKF1SBMzjbzR
 yx6aXsa2WZrvlXIwEAFPx9triktzbaLFMQ33LMwc7HPg/82ulOkSLfMsCTOcYa+sTpFlCI/4
 eEdv8SIYEKLz060YbFjWFLwk54M=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e73051e.7fd79f2ddc00-smtp-out-n03;
 Thu, 19 Mar 2020 05:37:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F833C433BA; Thu, 19 Mar 2020 05:37:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.82.140.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DB67C433CB;
        Thu, 19 Mar 2020 05:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7DB67C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org
References: <1584211798-10332-1-git-send-email-tdas@codeaurora.org>
 <1584211798-10332-2-git-send-email-tdas@codeaurora.org>
 <20200318220443.GA16192@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <2ceccbac-b289-03d0-665b-6e9ca57b4333@codeaurora.org>
Date:   Thu, 19 Mar 2020 11:07:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318220443.GA16192@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/19/2020 3:34 AM, Rob Herring wrote:
> On Sun, 15 Mar 2020 00:19:56 +0530, Taniya Das wrote:
>> The Modem Subsystem clock provider have a bunch of generic properties
>> that are needed in a device tree. Add a YAML schemas for those.
>>
>> Add clock ids for GCC MSS and MSS clocks which are required to bring
>> the modem out of reset.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-sc7180.h        |  7 ++-
>>   include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++++
>>   3 files changed, 80 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/clock/qcom,sc7180-mss.yaml#
> 
> See https://patchwork.ozlabs.org/patch/1254940
> Please check and re-submit.
> 
Hi Rob,

Thanks, I have fixed it in the next patch series.

Is there a way to catch these before submitting? As I do not see these 
errors on my machine.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
