Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0887A336EA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 10:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhCKJP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 04:15:57 -0500
Received: from z11.mailgun.us ([104.130.96.11]:64266 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231904AbhCKJP2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 04:15:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615454127; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1HuCv2zVnv2tpAzUSqF8U758lZQ7MZTMxyLOOq6ria8=; b=XVVqyJUHkP0s6uYpbfEHYl0lavYAk6QpxJM4hhzMVYcfRRTs7DqhQvCrxLi3R0iTO3mzELqf
 o27y+svk0o60YleQWJcRQt9O1nxPY93NJixBO95PZK0fszPn3+glW6l5hFDIjVtBQPtIw94i
 SRWBZZB5gjpgb5tc6CBRbiIRCX0=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6049dfa9bb6300df75161c32 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 09:15:21
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E02DDC433CA; Thu, 11 Mar 2021 09:15:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [49.207.203.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8957C43461;
        Thu, 11 Mar 2021 09:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8957C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 00/13] Add binding updates and DT files for SC7280 SoC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <YElgnuH6ZEoMOgdj@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a4f03a1c-880b-ebf5-ad7e-387e1b5c61e4@codeaurora.org>
Date:   Thu, 11 Mar 2021 14:45:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YElgnuH6ZEoMOgdj@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/11/2021 5:43 AM, Bjorn Andersson wrote:
> On Fri 12 Feb 01:28 CST 2021, Rajendra Nayak wrote:
> 
>> This series includes a few minor binding updates and base device tree
>> files (to boot to shell) for SC7280 SoC and the IDP board using this SoC.
>>
>> The series is dependent on a few driver patches to merge first, for
>> gcc, rpmhcc and pinctrl
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=484517
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=484489
>> https://lore.kernel.org/patchwork/patch/1379831/
>>
> 
> I'm not able to find v2 of this series, but plenty of patches that
> depends on its content. Do I somehow miss it, or is it coming?

I did post v2 [1], and will post v3 shortly addressing some of
the feedback from Stephen on v2. I was waiting on the rpmh clock
fix to come out [2], which addresses the question about the XO clock
frequency [3] in DT

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
[2] https://lore.kernel.org/patchwork/patch/1393159/
[3] https://lore.kernel.org/patchwork/patch/1389019/

> Regards,
> Bjorn
> 
>> Maulik Shah (3):
>>    arm64: dts: qcom: sc7280: Add RSC and PDC devices
>>    arm64: dts: qcom: Add reserved memory for fw
>>    arm64: dts: qcom: sc7280: Add cpuidle states
>>
>> Rajendra Nayak (5):
>>    dt-bindings: arm: qcom: Document SC7280 SoC and board
>>    dt-bindings: firmware: scm: Add SC7280 support
>>    arm64: dts: sc7280: Add basic dts/dtsi files for SC7280 soc
>>    dt-bindings: qcom,pdc: Add compatible for sc7280
>>    arm64: dts: qcom: SC7280: Add rpmhcc clock controller node
>>
>> Sai Prakash Ranjan (4):
>>    dt-bindings: arm-smmu: Add compatible for SC7280 SoC
>>    arm64: dts: qcom: sc7280: Add device node for APPS SMMU
>>    dt-bindings: watchdog: Add compatible for SC7280 SoC
>>    arm64: dts: qcom: sc7280: Add APSS watchdog node
>>
>> satya priya (1):
>>    arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
>>   .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
>>   .../bindings/interrupt-controller/qcom,pdc.txt     |   1 +
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
>>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>   arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  47 ++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 596 +++++++++++++++++++++
>>   8 files changed, 654 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/sc7280.dtsi
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
