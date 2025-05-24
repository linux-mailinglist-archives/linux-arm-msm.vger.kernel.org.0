Return-Path: <linux-arm-msm+bounces-59272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C43AAC2D21
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 04:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2662D9E5022
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 02:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E0D198E63;
	Sat, 24 May 2025 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UM9hphXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE22DCC1C;
	Sat, 24 May 2025 02:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748054469; cv=none; b=I597qXJnCxnyUxopOk+ookmABMxr3pPqztF48eRmXLzP50mOeh11WmrQnEVWN03pDBF507cK7YmXdKfQ2Stp8sDsg+VoSd0myhR0NdGeEt6LYI9yMNPXjL2+lfF+35pKDN3zEowPFuVNHlgMfbUEURbaNIuf2egeSbh1//MnmUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748054469; c=relaxed/simple;
	bh=9N6vJ1zJxFw9+690svPBoBzidDB7D5LNcL1y5z3rzKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eg4TUGwsaERmmxOhYlWYlwdCvQ6RwbOc05h9jpJRZOyWB3cHChqutO3n8WWuZxuUL5TuZhPM/85R3Xq5gKt5uxNNBWri0s3Bh6n/IJcz8wZSaqJoAKpeG1hycxB1IgE3C1XLHskNWTLe0LAr6doawZwOia6iAMzudfDV0L4D/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UM9hphXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76440C4CEE9;
	Sat, 24 May 2025 02:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748054468;
	bh=9N6vJ1zJxFw9+690svPBoBzidDB7D5LNcL1y5z3rzKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UM9hphXWzj9nOLYc7mdVJa4gEgM1DCIBKWTVbAjyF9XnnB3O1ugxPPlMyqKoAQhA0
	 9LJnZHG/8CndBl6Y4BSZeiiI/0ee7cFoKt8x6SMbpHdyNA/GJ+tZZHyZE5foCQar1e
	 xR6e+iLE6i5ATdzTFh/ZGer4K1a+qMjzZ42oEc4YiEMlTjf0h7aK9sUZplWyJN2p+i
	 msoFFXbZwSHf1C65EIhDuuFNWesRAK26udSG7VnScoOsbHTNc4aRrziHyN6oHI93Gj
	 yL8Wre4qirSnqfOd9I4GmYGfEUV1KiHB+Cfy4K0B320NV128WFQPKJnaTD2228A+bI
	 sEpLcZvr0JCQA==
Date: Fri, 23 May 2025 21:41:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Song Xue <quic_songxue@quicinc.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: Add PSCI SYSTEM_RESET2
 types
Message-ID: <v57xfmnmf26zs5unsl5zy4flar76hlpjwnohioctlqowkxicx4@g4svxqdgqk4f>
References: <20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com>
 <174532908966.1111913.12713682553446003215.robh@kernel.org>
 <1fab200f-c7fd-4772-ae8b-6b8f4f1f4adb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fab200f-c7fd-4772-ae8b-6b8f4f1f4adb@quicinc.com>

On Thu, Apr 24, 2025 at 01:59:04PM +0800, Song Xue wrote:
> 
> 
> On 4/22/2025 9:38 PM, Rob Herring (Arm) wrote:
> > 
> > On Tue, 22 Apr 2025 15:39:54 +0800, Song Xue wrote:
> > > Add properties to support Bootloader and Edl mode for PSCI system
> > > reset2 reboot modes. The cookie and magic values set will be used
> > > by SYSTEM_RESET2 call.
> > > 
> > > Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> > > ---
> > > Dependencies:
> > > Link to bindings and driver changes:
> > > https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
> > >   arch/arm64/boot/dts/qcom/qcs615.dtsi     | 2 +-
> > >   2 files changed, 8 insertions(+), 1 deletion(-)
> > > 
> > 
> > 
> > My bot found new DTB warnings on the .dts files added or changed in this
> > series.
> > 
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to reply
> > unless the platform maintainer has comments.
> > 
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> > 
> >    pip3 install dtschema --upgrade
> > 
> > 
> > This patch series was applied (using b4) to base:
> >   Base: using specified base-commit e21edb1638e82460f126a6e49bcdd958d452929c
> > 
> > If this is not the correct base, please add 'base-commit' tag
> > (or use b4 which does this automatically)
> > 
> > New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com:
> > 
> > arch/arm64/boot/dts/qcom/qcs615-ride.dtb: psci (arm,psci-1.0): 'reset-types' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
> > 	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
> > 
> My patch is depend on the bindings:https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-1-b2cf4a20feda@oss.qualcomm.com/
> 

This dependency has not yet been accepted, so there's nothing I can do
with your patch. Please resubmit it once the dependencies have been
accepted.

Thanks,
Bjorn

> In this bindings, we can see the property definition of 'reset-types' which
> only has "mode-" property.
> 
> Best regards,
> Song Xue
> > 
> > 
> > 
> > 
> 

