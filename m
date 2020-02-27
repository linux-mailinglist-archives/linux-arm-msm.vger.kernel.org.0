Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2E170D66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 01:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgB0AoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 19:44:11 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:28750 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727987AbgB0AoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 19:44:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582764250; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JcRs9mZiMthRLxtoA2Yryvm9oBuTfwKq6aDUtbfP5vU=; b=NvO7YTyQganRJbADGEdmoFX5c6ub+sGr0s+9C3Shu3jqlxasISIW4C6Cgx+08mOf7mOfusk3
 c7KEBKEUkp9t6ms01hEz+W6dlikfUWPgrMVl7EpHZF5FFyZxC/NG2h31xj/k2L5Y4JoIaIUf
 WzkwM2hRa+dg3ELxUQeoC6X8tOQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5710d2.7f2ecfabded8-smtp-out-n02;
 Thu, 27 Feb 2020 00:44:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 950B4C4479D; Thu, 27 Feb 2020 00:44:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.134.65.5] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5982CC43383;
        Thu, 27 Feb 2020 00:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5982CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [PATCH v2 1/3] dt: psci: Add arm,psci-sys-reset2-type property
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
 <1582577858-12410-2-git-send-email-eberman@codeaurora.org>
 <20200226120918.GA21897@lakrids.cambridge.arm.com>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <edcf310c-8808-f210-1044-cfd2191e9e3d@codeaurora.org>
Date:   Wed, 26 Feb 2020 16:44:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226120918.GA21897@lakrids.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/26/2020 4:09 AM, Mark Rutland wrote:
> On Mon, Feb 24, 2020 at 12:57:36PM -0800, Elliot Berman wrote:
>> Some implementors of PSCI may relax the requirements of the PSCI
>> architectural warm reset. In order to comply with PSCI specification, a
>> different reset_type value must be used.
> 
> This reads as-if you're saying the firmware isn't spec compliant, and
> this is a workaround in order to get the expected behaviour.
> 
> Can you please elaborate on what you mean by "relax the requirements"
> here? What's your firmware doing or not doing that you want to avoid?
> 
>> The alternate PSCI SYSTEM_RESET2 may be used in all warm/soft reboot
>> scenarios, replacing the architectural warm reset.
> 
> I assume you mean SYSTEM_REET2's SYSTEM_WARM_RESET reset? Please call
> that out explicitly by name -- it makes this easier to look up, and
> if/when more architectural resets are added the commit message won't
> become ambiguous.

I can reword to:

Some implementors of PSCI may wish to generally use a different reset type
than SYSTEM_WARM_RESET. For instance, Qualcomm SoCs support an alternate
reset_type which may be used in more warm reboot scenarios than
SYSTEM_WARM_RESET permits (e.g. to reboot into recovery mode).

> 
>>
>> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/arm/psci.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 8ef8542..469256a2 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -102,6 +102,11 @@ properties:
>>        [1] Kernel documentation - ARM idle states bindings
>>          Documentation/devicetree/bindings/arm/idle-states.txt
>>  
>> +  arm,psci-sys-reset2-param:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +        reset_param value to use during a warm or soft reboot.
> 
> A "soft" reboot isn't a PSCI concept, so I'm worried this is just
> hooking up magic values for Linux internals.> 
> I'd like to better understand what you're trying to achieve here.

In Qualcomm use cases, we do not always want to preserve memory to caller's
(i.e. Linux) exception level. For instance, crash recovery mode runs in
higher exception level and would not continue booting into Linux except
through a hard reset. Also, this early firmware doesn't have the ability to
understand device tree or ACPI tables to know what memory to preserve.

Per discussion with Sudeep and Charles, this use case violates PSCI
specification for SYSTEM_WARM_RESET reset type, but would be appropriate
for a vendor-specific reset type. Thus, Qualcomm firmware supports a
vendor-specific reset type which does not have the requirement to preserve
memory to caller's EL or to describe what memory is to be preserved in DT
or ACPI. If this vendor-specific reset type is used, then firmware checks
various registers (e.g. download mode [1]) to alter the restart flow (e.g.
to enter recovery mode). If no alternate flow is requested, then firmware
would boot back into Linux, preserving memory.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/qcom_scm.c?h=v5.6-rc3#n1120

Thanks,
Elliot

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
