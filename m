Return-Path: <linux-arm-msm+bounces-67042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F52B15619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 01:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 089C754430D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 23:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5764B288CA6;
	Tue, 29 Jul 2025 23:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPCN/2y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC82288C88;
	Tue, 29 Jul 2025 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753832437; cv=none; b=H2ekRfmrusbuuetKGr/WJUSdi86PcIHAYj2tpKhJlehSgmTMOr9Bu7XVZB0zIMhfD3Hz/rBJmuJj9X8Ggm4J6MQtsBxE0iSq+Bf7NWXF+63FymtoCgv9ZTQ0xKYbn0cSV6uquqQfjKvs/7oYXd7u3cfgVqlU0MihPPPApob2GF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753832437; c=relaxed/simple;
	bh=Onxew007SZxEwm3mYe7uDFdevyTwUP0S6WlLwSP1G00=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=q6GDbRfnUz5JmggJY6xARIcm4wiNLrdEm2LxnNkeGZLxJDx0i+Qdg9Nh9yHia6bjrll40qubD0yyDGZ97TdNKhOmvpNZgN+W1v8gn/VSeTh203AP6lArrPa4yxCCqiMHQ1PrziWNC563/y8DwkKDws84vS5mn3FBpeFIhBXTlkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPCN/2y4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC9DC4CEEF;
	Tue, 29 Jul 2025 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753832436;
	bh=Onxew007SZxEwm3mYe7uDFdevyTwUP0S6WlLwSP1G00=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BPCN/2y45Tf7ZzQoV0G99b2LDNKF1UY3JLOym5aXgCUKpKpBpQ9SKYzM+F2v2de2d
	 tu7L/korytsrOJJYTK26C82HnK/QC7Z/DV5xubtCZuKKt3HFqnGCCM4IK2h+6JHgG8
	 282UUIUs6Fmh0PK9RPttcPp25ntkjKxQl0X6e87yhcWB1LXQan5H25aijBcVeOAka0
	 ru4pPvXTvCKpnwrNkQbsOB0AjbOBdcEeIZ55WkaYsg/4RkZEDcNaIEapbxnd3mcgWG
	 VF9cG7kizJAxzcxPDmIsRaR8iBarmD223oDjT+Ml0/NQWTx8Xi2F/kNlUZHTU4GU3v
	 xdORvD5SxnyEQ==
Date: Tue, 29 Jul 2025 18:40:36 -0500
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
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Violet <violet@atl.tools>
In-Reply-To: <20250729120331.287245-1-violet@atl.tools>
References: <20250729120331.287245-1-violet@atl.tools>
Message-Id: <175383135924.1119194.9883230096530969975.robh@kernel.org>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: add initial support for
 Samsung Galaxy S22


On Tue, 29 Jul 2025 12:03:29 +0000, Violet wrote:
> Changes in v7:
> - Document the reserved GPIO pins, remove pin 50 as it does not
>  need to be reserved
> - Clarify the phone isn't limited to USB 2.0 but rather USB 3.0
>  isn't implemented yet
> - Add a newline before every 'status' node
> 
> Changes in v6:
> - Remove debug features (bootargs, etc) that slipped in the v5 DTS
> - Format and organize nodes correctly based on existing DTS,
>  move "status = "okay";" to the bottom always
> - Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
>  from existing SoC .dtsi
> - Disable buttons, ufs and other features for later revision
> 
> Changes in v5:
> - Properly format the thread
> 
> Changes in v4:
> - Try to properly format the thread
> 
> Changes in v3:
> - Removed unnecessary initrd start and end addresses
> - Make sure r0q is in right order on Makefile
> - Properly format memory addresses
> - Set r0q to the correct, alphabetical order in documents
> 
> Changes in v2:
> - Attempt to format the patchset thread correctly
> 
> Signed-off-by: Violet <violet@atl.tools>
> 
> Violet (2):
>   dt-bindings: arm: qcom: document r0q board binding
>   arm64: dts: qcom: add initial support for Samsung Galaxy S22
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 147 ++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 
> --
> 2.50.1
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
 Base: tags/next-20250729 (best guess, 1/2 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250729120331.287245-1-violet@atl.tools:

arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#






