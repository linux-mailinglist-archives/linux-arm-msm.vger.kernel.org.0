Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8CA2438BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 12:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHMKjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 06:39:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMKjq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 06:39:46 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF8AC206A4;
        Thu, 13 Aug 2020 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597315185;
        bh=TWydt69E31XoB01H3gVdHDzdQbsd2O4Gh1nyh2dthuk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TG+TdSTyyjFkf2ylVgb99HLo6AfeTTG1DjP4k1HOdzJZBOwGuzPCwpIqNfkhpZAd0
         Ev031unx4MiV0PePocfeA+Hw+5qNS8s/um2OZc+1s+MInabuyro71jbdr9yjsdtj0U
         IuL+ewyuVlHzydevPcDVlFP8UfmZXtIWN7tmnojI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k6Ae7-001l9U-Cb; Thu, 13 Aug 2020 11:39:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 13 Aug 2020 11:39:43 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add KRYO4XX gold CPU core to spectre-v2 safe list
In-Reply-To: <20200813094041.GA9894@willie-the-truck>
References: <20200813081834.13576-1-saiprakash.ranjan@codeaurora.org>
 <20200813090324.GB9829@willie-the-truck>
 <89f0f41514e547533c3fa66364e5a2ac@codeaurora.org>
 <20200813094041.GA9894@willie-the-truck>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <ff6fa7bd817d49e8ef9bee5c1e13d99c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: will@kernel.org, saiprakash.ranjan@codeaurora.org, catalin.marinas@arm.com, andre.przywara@arm.com, mark.rutland@arm.com, suzuki.poulose@arm.com, swboyd@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-13 10:40, Will Deacon wrote:
> On Thu, Aug 13, 2020 at 02:49:37PM +0530, Sai Prakash Ranjan wrote:
>> On 2020-08-13 14:33, Will Deacon wrote:
>> > On Thu, Aug 13, 2020 at 01:48:34PM +0530, Sai Prakash Ranjan wrote:
>> > > KRYO4XX gold/big CPU cores are based on Cortex-A76 which has CSV2
>> > > bits set and are spectre-v2 safe. But on big.LITTLE systems where
>> > > they are coupled with other CPU cores such as the KRYO4XX silver
>> > > based on Cortex-A55 which are spectre-v2 safe but do not have CSV2
>> > > bits set, the system wide safe value will be set to the lowest value
>> > > of CSV2 bits as per FTR_LOWER_SAFE defined for CSV2 bits of register
>> > > ID_AA64PFR0_EL1.
>> > >
>> > > This is a problem when booting a guest kernel on gold CPU cores
>> > > where it will incorrectly report ARM_SMCCC_ARCH_WORKAROUND_1 warning
>> > > and consider them as vulnerable for Spectre variant 2 due to system
>> > > wide safe value which is used in kvm emulation code when reading id
>> > > registers. One wrong way of fixing this is to set the FTR_HIGHER_SAFE
>> > > for CSV2 bits, so instead add the KRYO4XX gold CPU core to the safe
>> > > list which will be consulted even when the sanitised read reports
>> > > that CSV2 bits are not set for KRYO4XX gold cores.
>> > >
>> > > Reported-by: Stephen Boyd <swboyd@chromium.org>
>> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> > > ---
>> > >  arch/arm64/kernel/cpu_errata.c | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/arch/arm64/kernel/cpu_errata.c
>> > > b/arch/arm64/kernel/cpu_errata.c
>> > > index 6bd1d3ad037a..6cbdd2d98a2a 100644
>> > > --- a/arch/arm64/kernel/cpu_errata.c
>> > > +++ b/arch/arm64/kernel/cpu_errata.c
>> > > @@ -545,6 +545,7 @@ static const struct midr_range
>> > > spectre_v2_safe_list[] = {
>> > >  	MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
>> > >  	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
>> > >  	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
>> > > +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
>> >
>> > We shouldn't be putting CPUs in the safe list when they have CSV2
>> > reporting
>> > that they are mitigated in hardware, so I don't think this is the right
>> > approach.
>> >
>> 
>> Ok but the only thing I find wrong in this approach is that it is a
>> redundant
>> information because CSV2 is already advertising the mitigation, but 
>> again
>> CSV2 check is done first so it doesn't really hurt to add it to the 
>> safe
>> list because we already know that it is safe.
> 
> It simply doesn't scale. That's why CSV2 exists in the first place, so 
> we
> don't have to modify the kernel everytime a new CPU is invented.
> 
>> > Sounds more like KVM should advertise CSV2 for the vCPUs if all of the
>> > physical CPUs without CSV2 set are on the safe list. But then again, KVM
>> > has always been slightly in denial about big.LITTLE because you can't
>> > sensibly expose it to a guest if there are detectable differences...
>> >
>> 
>> Sorry but I don't see how the guest kernel will see the CSV2 bits set 
>> for
>> gold CPU cores without actually adding them to the safe list or 
>> reading the
>> not sanitised value of ID_AA64PFR0_EL1 ?
> 
> Well that's for somebody to figure out in the patch. I'm just saying 
> that
> adding cores to the safe list when they already have a CSV2 field 
> conveying
> the same information is the wrong approach. The right appproach is for 
> KVM
> to expose CSV2 as set when the system is not affected by the erratum.

A sensible way to fix this would be with something like that:

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 077293b5115f..2735db21ff0d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1131,6 +1131,9 @@ static u64 read_id_reg(const struct kvm_vcpu 
*vcpu,
  		if (!vcpu_has_sve(vcpu))
  			val &= ~(0xfUL << ID_AA64PFR0_SVE_SHIFT);
  		val &= ~(0xfUL << ID_AA64PFR0_AMU_SHIFT);
+		if (!(val & (0xfUL << ID_AA64PFR0_CSV2_SHIFT)) &&
+		    get_spectre_v2_workaround_state() == 
ARM64_BP_HARDEN_NOT_REQUIRED)
+			val |= (1UL << ID_AA64PFR0_CSV2_SHIFT);
  	} else if (id == SYS_ID_AA64ISAR1_EL1 && !vcpu_has_ptrauth(vcpu)) {
  		val &= ~((0xfUL << ID_AA64ISAR1_APA_SHIFT) |
  			 (0xfUL << ID_AA64ISAR1_API_SHIFT) |


         M.
-- 
Jazz is not dead. It just smells funny...
