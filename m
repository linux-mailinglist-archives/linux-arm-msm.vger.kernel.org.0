Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B2E108E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 16:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfEAOSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 10:18:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58616 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfEAOSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 10:18:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BE37E6070D; Wed,  1 May 2019 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556720279;
        bh=0aqe2NSNc+0Ukh9jtPftcKQpZUYtmIxjy4sFRvVfaQ0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BTYLyeqHPQp09GZCrUVC3AT7iokJFaS6RS/sPVOUqZWiVJ15MiFpIJn8I6YXhbZyM
         K3aWlMCGi8nDfHfbIgRMWdI7PFc0gt5R8864wzR9Ynlnjy1aZl+nI5OiOsAtQQEHKZ
         0gXQzIIwIbhC3s1ROgqUPlICtCSPgmCUcUBlXm/w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A1B0602F8;
        Wed,  1 May 2019 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556720279;
        bh=0aqe2NSNc+0Ukh9jtPftcKQpZUYtmIxjy4sFRvVfaQ0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BTYLyeqHPQp09GZCrUVC3AT7iokJFaS6RS/sPVOUqZWiVJ15MiFpIJn8I6YXhbZyM
         K3aWlMCGi8nDfHfbIgRMWdI7PFc0gt5R8864wzR9Ynlnjy1aZl+nI5OiOsAtQQEHKZ
         0gXQzIIwIbhC3s1ROgqUPlICtCSPgmCUcUBlXm/w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1A1B0602F8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 2/6] arm64: dts: msm8998: Add xo clock to gcc node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org, marc.w.gonzalez@free.fr,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677531-29291-1-git-send-email-jhugo@codeaurora.org>
 <20190501033548.GC2938@tuxbook-pro>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <14d71a86-4bf7-b5f1-3efa-0938bd838ce3@codeaurora.org>
Date:   Wed, 1 May 2019 08:17:58 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190501033548.GC2938@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/30/2019 9:35 PM, Bjorn Andersson wrote:
> On Tue 30 Apr 19:25 PDT 2019, Jeffrey Hugo wrote:
> 
>> GCC is a consumer of the xo clock.  Add a reference to the clock supplier
>> to the gcc node.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> (Although I prefer clock-names following clocks)

Huh, I didn't even realize I did that until you pointed it out.  Feel 
free to adjust when you apply, or if there is another spin I'll fix it.

> 
> Regards,
> Bjorn
> 
>> ---
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 574be78..9c88801 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -709,6 +709,8 @@
>>   			#reset-cells = <1>;
>>   			#power-domain-cells = <1>;
>>   			reg = <0x100000 0xb0000>;
>> +			clock-names = "xo";
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>   		};
>>   
>>   		tlmm: pinctrl@3400000 {
>> -- 
>> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
