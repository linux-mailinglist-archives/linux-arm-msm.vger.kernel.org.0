Return-Path: <linux-arm-msm+bounces-34772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE89A28B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989F61F231C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 16:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BEF1DF735;
	Thu, 17 Oct 2024 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDJCHyA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7771DF729;
	Thu, 17 Oct 2024 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182376; cv=none; b=MSp4mAM/mS9C77ohAgyEqh23DXSEO4lbyVxd+yCnW3XYUEndg72N8BU3zaVZEfOmZ3DYFrcOzvtgSuk0HcTl1wbPelXIGR2Rv+EMQTNAP2VOwXioVFiEqGLPlurbHRaEmnrsmDwkbRw5i0/+VkgcwTIfFSQUEEBfiMuZvWr7yLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182376; c=relaxed/simple;
	bh=u/AOxycLcfkoJAjmY6tPiXwToUz7DAoyR2JU0MwNCaY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=GA3F6XfVCZ0wjHMEZfHC03yHBLbiV85UGdNIOGf9Nd6umYsbdj3qEeGn9dWcCpTX8zWOfEo8VM7Ts9/9nhx8Jkb4yzoNgGNbr+mjoU3XZ9z423Ayzg+ehVTw6JR5wK9zdEKiNqbCQ1+sRiRyg6xaJCCMdRhnE4nt9aHAJj+XmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDJCHyA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D649C4CECD;
	Thu, 17 Oct 2024 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182375;
	bh=u/AOxycLcfkoJAjmY6tPiXwToUz7DAoyR2JU0MwNCaY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QDJCHyA1WxG9qgTRsVPZe7SP0yFSO1Vu5N2NM/pqucGbiBA09gDBhCaXZT0VwkLJQ
	 NPRIZxpYv963y8JFPLQegGnA89MMIakCyzIwMsIumNbBhcXMSlqDiPmwTAhE5JScUU
	 Dq7O5zqP4/H88mOY9+POsAefeB3HE+KNki2qZo9i5nm9Ft/I/bS0vmelHc/WiSI0d8
	 +r/IXCtuRF3M6LnBi7Uusct375HLSrMeV6lK758R90PylKfRwTvG07pTjyFBryAank
	 qeMWdXjtcWNupcr8LfhtLeUpPIDJc5/ELGtKPv5kyjTwin2oro/VJaUkCmb3/lTcI7
	 WTvS0Rqj/2vEw==
Date: Thu, 17 Oct 2024 11:26:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, johan+linaro@kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, tephan.gerhold@linaro.org, 
 tudor.laurentiu.oss@gmail.com, Bryan.Kemp@dell.com, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241016202253.9677-1-alex.vinarskis@gmail.com>
References: <20241016202253.9677-1-alex.vinarskis@gmail.com>
Message-Id: <172917870972.3590012.9225999226267740070.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] X1E Dell XPS 9345 Improvements 1


On Wed, 16 Oct 2024 22:15:47 +0200, Aleksandrs Vinarskis wrote:
> First round of improvements.
> 
> * Add experimentally discovered edp enable gpio. Drop panel info, as it is
> now documented in [1]
> * Add Johan Hovold's fix for nvme regulator
> 
> [1] https://lore.kernel.org/all/CAD=FV=Wu3vaY4Rtw4OZwgAf_b44JpDsKJhUa-EXiuu1hn3aJoQ@mail.gmail.com/
> 
> Aleksandrs Vinarskis (2):
>   arm64: dts: qcom: x1e80100-dell-xps13-9345: route edp-panel enable
>     gpio
>   arm64: dts: qcom: x1e80100-dell-xps13-9345: fix nvme regulator boot
>     glitch
> 
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-dell-xps13-9345.dtb' for 20241016202253.9677-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1bfc000: resets: [[53, 37], [53, 36]] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1c06000: clocks: [[53, 107], [53, 109], [33, 1], [53, 111], [53, 113], [53, 115]] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1c0e000: clocks: [[53, 96], [53, 98], [33, 0], [53, 100], [53, 102], [53, 104]] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#






