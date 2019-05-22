Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E292670D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 17:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbfEVPjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 11:39:52 -0400
Received: from ns.iliad.fr ([212.27.33.1]:56780 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728466AbfEVPjw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 11:39:52 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 06FE020609;
        Wed, 22 May 2019 17:39:51 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id E3BAF20072;
        Wed, 22 May 2019 17:39:50 +0200 (CEST)
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Marc Zyngier <marc.zyngier@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <a7514c68-d2d3-ce9e-bc4b-f484bb5bf3cf@free.fr>
 <d1ca4d37-ce25-a285-a9ef-dfe831f3d1de@free.fr>
 <2f8db49a-759c-d560-70c1-d041beeea914@arm.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <d94e33ed-f6f2-b39a-6360-2dd9112a1183@free.fr>
Date:   Wed, 22 May 2019 17:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2f8db49a-759c-d560-70c1-d041beeea914@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed May 22 17:39:51 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2019 11:35, Marc Zyngier wrote:

> On 22/05/2019 10:17, Marc Gonzalez wrote:
> 
>> The following dmesg log caught my eye, and might be relevant:
>>
>> 	ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
>>
>> Is that bad, doctor? I don't think it would explain the crash though...
> 
> It doesn't explain it.
> 
> It is bad though: your vendor doesn't tell the kernel about the HW being
> free of Spectre-v2, and doesn't provide a mitigation either. Hopefully,
> this is a responsible vendor that will provide you with a firmware
> update that fixes it.

# cd /sys/devices/system/cpu/vulnerabilities/
# grep "" *
l1tf:Not affected
mds:Not affected
meltdown:Mitigation: PTI
spec_store_bypass:Vulnerable
spectre_v1:Mitigation: __user pointer sanitization
spectre_v2:Vulnerable

OK, so there are apparently two unmitigated vulns, spec_store_bypass
and spectre_v2.

These vulns need to be mitigated in FW because otherwise some secure
property of the secure OS could be violated? Or because disabling the
faulty optimization requires secure privileges?


Some documentation, for my own reference:

https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing/sysfs-devices-system-cpu
https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability

Regards.
