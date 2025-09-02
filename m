Return-Path: <linux-arm-msm+bounces-71618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F6B402A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 15:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C3A3A307B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B215F3054EA;
	Tue,  2 Sep 2025 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nm+RopLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A13054E9;
	Tue,  2 Sep 2025 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819076; cv=none; b=daRpy/Sxgzpn+JlQ9lVNVtgbOWaLQrM2iP7TQCQMWquq9VzVzfp0M1qIhCgMub9T8ZsZRvIXWZ1ZyjwpsNuxfshvzEPgEB0vniyXNSgWcPJMKBr9YquPvzJWPvI1K+MbIbKxR7/1PKPW5wrOvIA7RbT/x9BOFAn97HUw+Gs7h6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819076; c=relaxed/simple;
	bh=7dCOweu/9WQU6ZMZ3GowAd2CrPNf7/Tdxndk6cm5lVE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bT70WYL3FoG3zqsxaihEwbjxL0oi1v/EotPyfi8d1OhYDjaBzhsZ/S3TQy8DsIKa9qQuh4qfFKSh9pyzyu5p3+gGXYqGWs2WkFkk4ZyLVZQy94br0jIXK1X/JL1bfwjqrTmf7Kp8gYtgUoJ7q6E6UZWLrLvYwwPwjIipBYzveHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nm+RopLs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFC7C4CEF5;
	Tue,  2 Sep 2025 13:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819076;
	bh=7dCOweu/9WQU6ZMZ3GowAd2CrPNf7/Tdxndk6cm5lVE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nm+RopLsIuExN744nl2jgbFsP2RAJ+7HknmsT+tkCNDTsEZ33hhSv19qSvlC2GWWy
	 arz0MewOSmQWPFU220YzH+W67D5342Z+eAVfk7OS91aE0E4yYuLaytIxbd+OUOKa1s
	 WzrjXWDEhdJuln5qo/8uaZbAHOj5cHtR2/Bp6SaCxlijgzuxFRomEqv+KQ3QjFHAZX
	 boRqDTwQChBfgPXv1Xcd4U8sNwy8+o5ZZn/JYuPJZjAY7aJPxxUnPJHaARBgYiySUI
	 kez5z1RGglVDoP0Ee/Y4xNCgv3zh/4kMohYCtYLJGg4USSRgzWx2yAchQ7kY0nMlQG
	 B22BLBQjUPcQg==
Date: Tue, 02 Sep 2025 08:17:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org
To: Dzmitry Sankouski <dsankouski@gmail.com>
In-Reply-To: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
References: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
Message-Id: <175678731004.877933.17610642849252704344.robh@kernel.org>
Subject: Re: [PATCH 0/2] starqltechn: fix max77705 device irqs


On Sun, 31 Aug 2025 01:21:20 +0300, Dzmitry Sankouski wrote:
> For max77705 charger and fuelgauge subdevice, use max77705 interrupt
> controller.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Dzmitry Sankouski (2):
>       dt-bindings: add mfd/max77705 definitions
>       arch: arm64: sdm845: starqltechn: fix max77705 interrupts
> 
>  MAINTAINERS                                             |  1 +
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 13 ++++++++-----
>  include/dt-bindings/mfd/max77705.h                      | 16 ++++++++++++++++
>  3 files changed, 25 insertions(+), 5 deletions(-)
> ---
> base-commit: 3cace99d63192a7250461b058279a42d91075d0c
> change-id: 20250830-starqltechn-correct_max77705_nodes-1162dc2d9fe7
> prerequisite-change-id: 20250830-max77705_77976_charger_improvement-e3f417bfaa56:v1
> prerequisite-patch-id: 534eff3c30a7b998f90f7be9537ff54c7f68543b
> prerequisite-patch-id: 60362587901a812e50ab0e9a2cf25eeea769ef9c
> prerequisite-patch-id: 09e302f4c28ec741f2985f858d72627d15e197f0
> prerequisite-patch-id: 195796a157978c67980cdd3e1bacbd0ae677e3a3
> prerequisite-patch-id: efdf7936ffca1f97fc550118ae9a2a0795828f88
> prerequisite-patch-id: bc2ce3683ecab7a91fe2ca00d35798d0f4ea5f80
> prerequisite-patch-id: 2547b245dce99798d36835b1d729b21b6d1906e5
> prerequisite-patch-id: 30d3ca50e1b09abd360ddf33982223cce24c6859
> prerequisite-patch-id: deac1d76b95764903b7b6c937d7d4b43ed9f74ed
> prerequisite-change-id: 20250831-max77705-fix_interrupt_handling-0889cee6936d:v1
> prerequisite-patch-id: f2f0ada814ee906cdc40b88427650d08b89a5d1a
> 
> Best regards,
> --
> Dzmitry Sankouski <dsankouski@gmail.com>
> 
> 
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
 Base: using specified base-commit 3cace99d63192a7250461b058279a42d91075d0c
 Deps: looking for dependencies matching 10 patch-ids
 Deps: Applying prerequisite patch: [PATCH 1/9] power: supply: max77705_charger: move active discharge setting to mfd parent
 Deps: Applying prerequisite patch: [PATCH 2/9] power: supply: max77705_charger: refactoring: rename charger to chg
 Deps: Applying prerequisite patch: [PATCH 3/9] power: supply: max77705_charger: use regfields for config registers
 Deps: Applying prerequisite patch: [PATCH 4/9] power: supply: max77705_charger: return error when config fails
 Deps: Applying prerequisite patch: [PATCH 5/9] power: supply: max77705_charger: add writable properties
 Deps: Applying prerequisite patch: [PATCH 6/9] power: supply: max77705_charger: rework interrupts
 Deps: Applying prerequisite patch: [PATCH 7/9] power: supply: max77705_charger: use REGMAP_IRQ_REG_LINE macro
 Deps: Applying prerequisite patch: [PATCH 8/9] power: supply: max77705_charger: implement aicl feature
 Deps: Applying prerequisite patch: [PATCH 9/9] power: supply: max77976_charger: fix constant current reporting
 Deps: Applying prerequisite patch: [PATCH] mfd: max77705: rework interrupts

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com:

arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#address-cells', '#interrupt-cells', '#size-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#






