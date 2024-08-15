Return-Path: <linux-arm-msm+bounces-28667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91133953A06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46A802885C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBEB13C906;
	Thu, 15 Aug 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UosvM8nW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F57E575;
	Thu, 15 Aug 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746499; cv=none; b=PUEOr8SJbct3Swgr+m7GGcoLTtH999MSe9JDyNC1KxFPF4eqZMbE1vxlumLNUj4r3sdNwK3jTYi+njBb/bUhpqyjZIiYb2oZodBGj56dK/hK1NOFaPe98vr3JrpeYziXaAOlqDQ7Bz3jw3s3gFyDvrxMGg7lHB79lxkc4W7cJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746499; c=relaxed/simple;
	bh=diYV9osNdJvqoDbHuYA8YOJY5C7lrvFht85iaxRDS8k=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=YRVrSLkgq9ayQJrh3Tbw/GQxQPMYk+2cgcdGvDFtvegCv5BO2DAPljDRTc20bcplWAgLuSF752xNmiM6vR1yGqfxAW45z+o0bltKEMeAhtkq2ysEigfxmhYdS3gjedfOilF+68MqZRgbchpm0iUBDnVWqHFEzBrqzMLkCFZYY5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UosvM8nW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20992C32786;
	Thu, 15 Aug 2024 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723746499;
	bh=diYV9osNdJvqoDbHuYA8YOJY5C7lrvFht85iaxRDS8k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UosvM8nWhkr6Dxq7W5TIu3l2czw+5/EfTJGOETZwUwF6UH4L6tkpSAFWP/WvVyXM5
	 suHdUhrR2u9Psm/PwcAACqQw2YaXsRUhG/gsfoujnRc1r6BExDrtw+NKY2Uz78FGog
	 8T81yLP9DGu9/4eAnxUgPwQwbPUqLEShLFrDi6fZj/vT8uTupzDMV9/R5IczDOkKdo
	 tOmNJyxZupXD3H1Mg2QU5LjKR6IrFOqcmb0zTdIQ4TEQsayeb1ZSfr0lOCuRK+Lcwq
	 e+bvmeVr3EkvD2omQANRuyShOl0ZixXeukF8r9MvF+jTswqyw81gBO7S7a8XzVBHKE
	 bQb1NrcVCjk3A==
Date: Thu, 15 Aug 2024 12:28:18 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marcus Glocker <marcus@nazgul.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
References: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
Message-Id: <172374583455.2827038.7584455596512370219.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Add initial DTS for Samsung Galaxy Book4 Edge


On Thu, 15 Aug 2024 12:36:40 +0200, Marcus Glocker wrote:
> This DTS adds initial support for the Samsung Galaxy Book4 Edge laptop.
> Keyboard, Touch-pad, and UFS are working.  The Touch-screen needs further
> investigation, and is therefore disabled for now.
> 
> Changed from v2:
> - Squash Makefile patch to new DTS file patch.
> 
> Changed from v1:
> - Provide the patch in the expected format.
> - Added missing bindings.
> - Removed sound node.
> - Changed regulator syntax to be consistent.
> - Changed touchscreen node comment, and removed false pin definition.
> - Rename ufshc@ to ufs@.
> 
> Marcus Glocker (6):
>   dt-bindings: crypto: Add X1E80100 Crypto Engine
>   dt-bindings: phy: Add X1E80100 UFS
>   dt-bindings: ufs: Add X1E80100 UFS
>   arm64: dts: qcom: Add UFS node
>   dt-bindings: arm: Add Samsung Galaxy Book4 Edge
>   arm64: dts: qcom: Add Samsung Galaxy Book4 Edge DTS
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  .../crypto/qcom,inline-crypto-engine.yaml     |   1 +
>  .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     |   2 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../x1e80100-samsung-galaxy-book4-edge.dts    | 959 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        |  71 ++
>  7 files changed, 1037 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts
> 
> --
> 2.39.2
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-samsung-galaxy-book4-edge.dtb' for v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv:

arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: phy@1d87000: clocks: [[2, 0], [52, 242]] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: phy@1d87000: 'vdda-phy-max-microamp', 'vdda-pll-max-microamp' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






