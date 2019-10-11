Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AACC0D3DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 12:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfJKKuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 06:50:39 -0400
Received: from foss.arm.com ([217.140.110.172]:56332 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbfJKKuj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 06:50:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3FF28;
        Fri, 11 Oct 2019 03:50:38 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 039E23F703;
        Fri, 11 Oct 2019 03:50:36 -0700 (PDT)
Date:   Fri, 11 Oct 2019 11:50:11 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     suzuki.poulose@arm.com, linux-arm-kernel@lists.infradead.org,
        catalin.marinas@arm.com, will@kernel.org, Dave.Martin@arm.com,
        andrew.murray@arm.com, jeremy.linton@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, bjorn.andersson@linaro.org
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
Message-ID: <20191011105010.GA29364@lakrids.cambridge.arm.com>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 11, 2019 at 11:19:00AM +0530, Sai Prakash Ranjan wrote:
> On latest QCOM SoCs like SM8150 and SC7180 with big.LITTLE arch, below
> warnings are observed during bootup of big cpu cores.

For reference, which CPUs are in those SoCs?

> SM8150:
> 
> [    0.271177] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_AA64PFR0_EL1. Boot CPU: 0x00000011112222, CPU4: 0x00000011111112

The differing fields are EL3, EL2, and EL1: the boot CPU supports
AArch64 and AArch32 at those exception levels, while the secondary only
supports AArch64.

Do we handle this variation in KVM?

> [    0.271184] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_ISAR4_EL1. Boot CPU: 0x00000000011142, CPU4: 0x00000000010142

The differing field is (AArch32) SMC: present on the boot CPU, but
missing on the secondary CPU.

This is mandated to be zero when AArch32 isn' implemented at EL1.

> [    0.271189] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_PFR1_EL1. Boot CPU: 0x00000010011011, CPU4: 0x00000010010000

The differing fields are (AArch32) Virtualization, Security, and
ProgMod: all present on the boot CPU, but missing on the secondary
CPU.

All mandated to be zero when AArch32 isn' implemented at EL1.

> SC7180:
> 
> [    0.812770] CPU features: SANITY CHECK: Unexpected variation in
> SYS_CTR_EL0. Boot CPU: 0x00000084448004, CPU6: 0x0000009444c004

The differing fields are:

* IDC: present only on the secondary CPU. This is a worrying mismatch
  because it could mean that required cache maintenance is missed in
  some cases. Does the secondary CPU definitely broadcast PoU
  maintenance to the boot CPU that requires it?

* L1Ip: VIPT on the boot CPU, PIPT on the secondary CPU.

> [    0.812838] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_AA64MMFR2_EL1. Boot CPU: 0x00000000001011, CPU6: 0x00000000000011

The differing field is IESB: presend on the boot CPU, missing on the
secondary CPU.

> [    0.812876] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_AA64PFR0_EL1. Boot CPU: 0x00000011112222, CPU6: 0x1100000011111112
> [    0.812924] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_ISAR4_EL1. Boot CPU: 0x00000000011142, CPU6: 0x00000000010142
> [    0.812950] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_PFR0_EL1. Boot CPU: 0x00000010000131, CPU6: 0x00000010010131
> [    0.812977] CPU features: SANITY CHECK: Unexpected variation in
> SYS_ID_PFR1_EL1. Boot CPU: 0x00000010011011, CPU6: 0x00000010010000

These are the same story as for SM8150.

> Can we relax some sanity checking for these by making it FTR_NONSTRICT or by
> some other means? I just tried below roughly for SM8150 but I guess this is
> not correct,
> maybe for ftr_generic_32bits we should be checking bootcpu and nonboot cpu
> partnum(to identify big.LITTLE) and then make it nonstrict?
> These are all my wild assumptions, please correct me if I am wrong.

Before we make any changes, we need to check whether we do actually
handle this variation in a safe way, and we need to consider what this
means w.r.t. late CPU hotplug.

Even if we can handle variation at boot time, once we've determined the
set of system-wide features we cannot allow those to regress, and I
believe we'll need new code to enforce that. I don't think it's
sufficient to mark these as NONSTRICT, though we might do that with
other changes.

We shouldn't look at the part number at all here. We care about
variation across CPUs regardless of whether this is big.LITTLE or some
variation in tie-offs, etc.

Thanks,
Mark.

> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index cabebf1a7976..207197692caa 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -164,8 +164,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>         S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_FP_SHIFT, 4, ID_AA64PFR0_FP_NI),
>         /* Linux doesn't care about the EL3 */
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_EL3_SHIFT, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_EL2_SHIFT, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_EL2_SHIFT, 4, 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
> ID_AA64PFR0_EL0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
>         ARM64_FTR_END,
>  };
> @@ -345,10 +345,10 @@ static const struct arm64_ftr_bits
> ftr_generic_32bits[] = {
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 24, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 20, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 16, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 12, 4, 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 12, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 8, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 4, 4, 0),
> -       ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 0, 4, 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 4, 4, 0),
> +       ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, 0, 4, 0),
>         ARM64_FTR_END,
>  };
> 
> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
