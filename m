Return-Path: <linux-arm-msm+bounces-54960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D90A96D17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 15:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0E616C022
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3059C284675;
	Tue, 22 Apr 2025 13:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ox0YFe1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F5C283CB7;
	Tue, 22 Apr 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329134; cv=none; b=gWVuQaM6NjpPm+9uHgHv3Z9QdC5cjgiiljqnoplIvAx9+nJnJl1pJJawuG2ldg8hQJyOiSz8cvWgGJHTiVVZTXEYEZ+9u1JMpXNyS4uQ+loTExwKIvj/++w5oFBKjjCEqbSHB6aKJSbA05QJ9lSzg9gKIJOg7MIe1QFReirwh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329134; c=relaxed/simple;
	bh=p+xn3jOonIgfJyv3cyPJsUoHSKSwu7zbUq+3berdi+Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WSpOvARAr8mRpgUACzaeGDLdXtczi5BDQ9g6ZrJpR+71W+JcoXJy+Y0E2D18EHGoQHyJ00Co8J0RWzGPL2t5gvNJ0hQvcSJGcRTBpjKvOtDruLxFfsWfKjiVKM8tQfdNAeMhnU37m1K3lmHhebdwnghh6e3ZZwQoj9vgcn46OX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ox0YFe1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12434C4CEEC;
	Tue, 22 Apr 2025 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745329133;
	bh=p+xn3jOonIgfJyv3cyPJsUoHSKSwu7zbUq+3berdi+Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ox0YFe1OKlv00myMPjwMz8L1HIUmUfkBpdZxj5kSYsZNzpiaZ0tHND41JUZPSsDHB
	 pkP2RwaL1k4mkPnhO6n4QbqgYuJRNFeC/7xq/ZHbzALPDgzbgWGeygGFnkftSxDhz0
	 hVHc+ooUX8SGogt6nK7a9N4V2cKFS3IcM1ZWFH4yWqP1K87hdX3yHQ32k+QF+WzfJc
	 FL77uCMA5+psm3m2BdFQrUDLuqakoD3x2tDjkjP82to//uANvA5Vta9DJjQla1EBEI
	 /Y6FloR6rQ+Fo5D96bcgyLjbB+AXtfKc9ImP5mXnv0fULUCsW3RMaKsrcrS4ggyO3l
	 3dRByhv5CDk3A==
Date: Tue, 22 Apr 2025 08:38:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 kernel@quicinc.com, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
To: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com>
References: <20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com>
Message-Id: <174532908966.1111913.12713682553446003215.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: Add PSCI SYSTEM_RESET2
 types


On Tue, 22 Apr 2025 15:39:54 +0800, Song Xue wrote:
> Add properties to support Bootloader and Edl mode for PSCI system
> reset2 reboot modes. The cookie and magic values set will be used
> by SYSTEM_RESET2 call.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> ---
> Dependencies:
> Link to bindings and driver changes:
> https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi     | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit e21edb1638e82460f126a6e49bcdd958d452929c

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: psci (arm,psci-1.0): 'reset-types' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#






