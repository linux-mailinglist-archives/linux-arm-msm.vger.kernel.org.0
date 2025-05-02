Return-Path: <linux-arm-msm+bounces-56501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85939AA72A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8D44A783B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC5C246794;
	Fri,  2 May 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="avXQrZa1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6664F23C516;
	Fri,  2 May 2025 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190505; cv=none; b=qVk1R8FnA+GPY6TbV/DSUsPtxNXg6TlBswluCVJxMxVGYOqFzVqZ8u8P2t9p8/d6vxm6/cbeW9yjklvmJ5I8qufs6YeJUVkedC5sCuFt90sWMyTkeCN/LmJAUbDilRen7OYAsg+AX6rly1fzjve4xOK3EICQfW4a48lUu5HhRs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190505; c=relaxed/simple;
	bh=Vr7F6UmAx3IrmOszyFQx5ludxkteP8QYXfmMfxEeDQ4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DmSCWh7xEXybRd/XGVl5zWiSvdOE7QZmbPQugOyTYGHywwebTCMry4ecYzPcNxIB0zU4cSDMKH6CXu6hw1qeq4Ofy/4+lNLxuLsiM4eeA8nK6gOrFinLmQ/kyd0bwFCU8oWTiayeqZaCTFlHAsiD3K0FEJs6FxMVayzIWyJV0wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=avXQrZa1; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746190500; bh=Vr7F6UmAx3IrmOszyFQx5ludxkteP8QYXfmMfxEeDQ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=avXQrZa1QLEIvROFUfO5+gq6TjwJm6/q7QA2HynNN9KbB+2JL0TVOLMQU2vAYBAyg
	 cARo8EQi0jAndXbzNV4cbyEETOy/+PJfDtE2iI26BYCU0o3h+7wLDTJq+3vEls2ILW
	 3ONoq6WamobddozvDzX/qF6LgDbVLDjss8nUGyZLZRL36MaDDGY4Dec1sIIzrZCXOA
	 evBBxXfqDB7BDIc01SSigzJm7ao4JCsTRelu8Ca7iDEe0EE2ZwY/mQ1EWeffwMg2uF
	 jNcLKCXzcHdKTOOJaVGfbXZZt1GlBT6s8c2Dq/8SNCxlNR271do2Jk4u85BGSFHrgK
	 jZv8Hn7r//z7w==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 2A42FD348;
	Fri,  2 May 2025 17:55:00 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 May 2025 17:55:00 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Jens Glathe
 <jens.glathe@oldschoolsolutions.biz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA
 devices
In-Reply-To: <86o6wbguv1.wl-maz@kernel.org>
References: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
 <20250501-sc-el2-overlays-v1-5-9202e59e3348@trvn.ru>
 <86o6wbguv1.wl-maz@kernel.org>
Message-ID: <9e5c2e9b6685e7a621cca926530bd271@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marc Zyngier писал(а) 02.05.2025 15:38:
> On Thu, 01 May 2025 18:03:45 +0100,
> Nikita Travkin <nikita@trvn.ru> wrote:
>> 
>> WoA devices using x1e/x1p use android firmware to boot, which notably
>> includes Gunyah hypervisor. This means that, so far, Linux-based OS
>> could only boot in EL1 on those devices.
>> 
>> However Windows can replace Gunyah upon boot with it's own hypervisor,
>> and with the use of tools such as "slbounce", it's possible to do the
>> same for Linux-based OS, in which case some modifications to the DT are
>> necessary to facilitate the absence of Gunyah services.
>> 
>> Add a EL2-specific DT overlay and apply it to x1e/x1p WoA devices to
>> create -el2.dtb for each of them alongside "normal" dtb.
>> 
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile      | 36 +++++++++++++++++---------
>>  arch/arm64/boot/dts/qcom/x1-el2.dtso   | 46 ++++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi |  2 +-
>>  3 files changed, 71 insertions(+), 13 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..7a818045ef098b44632df45253d32e31c5c7aeed
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +
>> +/*
>> + * x1 specific modifications required to boot in EL2.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
>> +&gpu_zap_shader {
>> +	status = "disabled";
>> +};
>> +
>> +/*
>> + * When running under Gunyah, this IOMMU is controlled by the firmware,
>> + * however when we take ownership of it in EL2, we need to configure
>> + * it properly to use PCIe.
>> + */
>> +&pcie3 {
>> +	iommu-map = <0 &pcie_smmu 0x30000 0x10000>;
>> +};
>> +
>> +&pcie4 {
>> +	iommu-map = <0 &pcie_smmu 0x40000 0x10000>;
>> +};
>> +
>> +&pcie5 {
>> +	iommu-map = <0 &pcie_smmu 0x50000 0x10000>;
>> +};
>> +
>> +&pcie6a {
>> +	iommu-map = <0 &pcie_smmu 0x60000 0x10000>;
>> +};
>> +
>> +&pcie_smmu {
>> +	status = "okay";
>> +};
>> +
>> +/*
>> + * The "SBSA watchdog" is implemented in software in Gunyah
>> + * and can't be used when running in EL2.
>> + */
>> +&sbsa_watchdog {
>> +	status = "disabled";
>> +};
> 
> I also carry this [1] patch to correctly route MSIs from pcie5 to the
> ITS. There is no reason not to. The same treatment could be applied to
> pcie3, but I never tried it.
> 

Oh, interesting... I will add 

    &pcie3 { msi-map = <0 &gic_its 0xb0000 0x10000>; };
    &pcie5 { msi-map = <0 &gic_its 0xd0000 0x10000>; };

to the overlay then. (At least I hope the base value falls in line with
the rule so far, while I know how to confirm iommu-map via acpi tables,
not sure where this one is described, if at all)

Will send a v2 shortly, thanks!

Nikita

> Thanks,
> 
> 	M.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20241024161814.1827514-1-maz@kernel.org/

