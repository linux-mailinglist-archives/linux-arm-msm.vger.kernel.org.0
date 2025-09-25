Return-Path: <linux-arm-msm+bounces-75146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69DB9FF0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B4C75E4332
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59942C11E7;
	Thu, 25 Sep 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGO09OcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BA2C11CF;
	Thu, 25 Sep 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809553; cv=none; b=p1A6WfnWG9XEpgzmvqGLQ+eCyWn7ZyPfVAAG31vlqnwo7eQ6yzsLjs+w7iV2i1xUiHCHfNQg+Z1AdkGQlEkHhAbMr+s1wLGuUgqQpJ3ys0K2v4K8g6v6SJ0SYOrI+h9wHRr1/v52VFa3riecRRo4+FniDoScabWocep9WkAqOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809553; c=relaxed/simple;
	bh=45sNohOdgqpRrnKmZqLr3TowaEBvAp7Eccog+QljG2g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OR9f2ef+FgQGxlnIs1tJkMaflhLrMAJo6/20Z3XIBp2qmU9NJ+TI5ghasgQPUpqIF3E89tnMHRMhyus1jfpoGxvjWhz0kG7O89N8/YNdVjMqCp5MXf+4rInk1PLuOw9Xnc6b8TSbU9dwyEWT52iaiuUkVJTuJRu80eIb2AaHYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGO09OcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E59C4CEF5;
	Thu, 25 Sep 2025 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809552;
	bh=45sNohOdgqpRrnKmZqLr3TowaEBvAp7Eccog+QljG2g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EGO09OcGbEjlYra5EMSMXzIs096VW7kFsgBPeCOnhz2ihb3ib6XGcAuOFY0j4Yygk
	 JftCzDgv9T1XmBXqwc/aLyPdyA2ooIcfxVASoEcXVugIg9Qi0rZbWVChEwOk11e4Ek
	 Tx+/9krd7ZUn6I3bpoHW8y89491qBGfgdbIDMdUQwVJKtDgA76ws7QxRYN+TQNU9hS
	 1pTjqaryVBunjVYLiASedFpipSHAhZf1AXGszul3SM4u2mtySR3r6gC4pAYBNoEgCC
	 Q+OKr9H84mIeb9nw6XsKZqzS4k30w8rudpf56dGVP1nYf211MNjTJtsNsgj7l0ccgi
	 BmwjM2bS6yxvQ==
Date: Thu, 25 Sep 2025 09:12:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
In-Reply-To: <20250925040246.8454-1-newwheatzjz@zohomail.com>
References: <20250925040246.8454-1-newwheatzjz@zohomail.com>
Message-Id: <175880948940.820227.6318085829775855857.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019


On Thu, 25 Sep 2025 12:02:44 +0800, Jingzhou Zhu wrote:
> Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
> It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
> or the sdm850 platform. This series adds mainline Linux support for this
> device using device tree.
> 
> Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
> ---
> Jingzhou Zhu (2):
>   dt-bindings: arm: qcom: Document Huawei MateBook E 2019
>   arm64: dts: qcom: Add support for Huawei MateBook E 2019
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/sdm850-huawei-matebook-e-2019.dts    | 967 ++++++++++++++++++
>  3 files changed, 969 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> 
> --
> 2.47.3
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250924 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250925040246.8454-1-newwheatzjz@zohomail.com:

arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: pinctrl@3400000 (qcom,sdm845-pinctrl): i2c5-hid-active-state: 'oneOf' conditional failed, one must be fixed:
	'bias-pull-up', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	False schema does not allow True
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#
arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: rsc@179c0000 (qcom,sdm845-rpmh-apps-rsc): regulators-0:smps4: Unevaluated properties are not allowed ('enable-active-high' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: regulators-0 (qcom,pm8998-rpmh-regulators): smps4: Unevaluated properties are not allowed ('enable-active-high' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#






