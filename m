Return-Path: <linux-arm-msm+bounces-62562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B6AE8F71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 22:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B0D1C277E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFA52DFA42;
	Wed, 25 Jun 2025 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdN691cv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9C2DECDB;
	Wed, 25 Jun 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883121; cv=none; b=pWSF0ohjMNIOHt2uI+lOsgF7mWilFnkVzZEY+d9eTIMD4+uDTwVduXtARLc1xEC71tpW1GWOkKHMWXiJ+2xMu95Kweh4jL9cyicg+2hMO8faShe+1rcSYRbbSsop+Ws6hV6syr1pa19F80ODgX2mSyIwzGXK49bO7yaGMHjszE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883121; c=relaxed/simple;
	bh=6ToECW9kPBEKK7RGJMMg68/E5fqSoBAUWn6G5wMFHgA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kFso3RpwIqXcOa2rTY8R0qy9IzQBdShb8Gqh7t1VoZVarUJ86ebSdxwTZSguIwUkZ3FWGeVKX5e7b3SMbcmJD4douLB5ORkGt5iVPM19Na3EfgheD4z0yZw/QvW8d0IE/k6/ZHlnzzIITObe66HDylxw3yEVKqTvs7ea7TLvRRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdN691cv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C598C4AF09;
	Wed, 25 Jun 2025 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750883120;
	bh=6ToECW9kPBEKK7RGJMMg68/E5fqSoBAUWn6G5wMFHgA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jdN691cv/uE6j/6d0w1FkmmLp29wYsTLbTFpWVSnvABAptQSFUGkDLk6F2NrvqV2b
	 drRBUdJrtJZBQ4fwKU97E3LtuGGrvuPLA5tiSzn8Ln0ldObR0Zjd3TpbclIXSJLBYY
	 8RbEH0ZeKfM9rPnA4ckd2Ou8Usgb6KwsCDqn/DE5EjN0z9bokIWi2lIjie/CMxrtn/
	 FfqdJcj/9uLJo1qPlMudBaNvLs9qd/qWgkdR1147SCvfCMpw8Dm77Msw5SlWou5vbB
	 KB0sFVpKbOmidqJ6Jn8ElrOq2Kxwph0wPZDzKFEUGtdVJDwResdln5l7OmxqZPOzvL
	 kAzglU8TaaTrw==
Date: Wed, 25 Jun 2025 15:25:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
Message-Id: <175088289522.2146749.4187657021418891835.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add WiFi/BT node for qcs615 ride board.


On Wed, 25 Jun 2025 15:55:05 +0800, Yu Zhang(Yuriy) wrote:
> This patch series depends on:
> - PCIe
> https://lore.kernel.org/all/20250527072036.3599076-1-quic_ziyuzhan@quicinc.com/
> 
> Changes in V2:
> - Correct the version metadata of the previous patch.
> - Separate the modifications to the DTS and DTSI files into different
>   commits.
> - Formatting: adjust layout based on reviewer feedback.
> - Updated the email address.
> - Link to v1:
>   https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/
> 
> Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
> ---
> Yu Zhang(Yuriy) (2):
>       arm64: dts: qcom: qcs615: add a PCIe port for WLAN
>       arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 131 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
>  2 files changed, 140 insertions(+)
> ---
> base-commit: 025c0cda9c75d499b71b8e02123fea56a13b324d
> change-id: 20250625-qcs615-1ead9e48be1c
> prerequisite-message-id: <20250527072036.3599076-1-quic_ziyuzhan@quicinc.com>
> prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
> prerequisite-patch-id: 6d12fa7481ee4900276912d2a7071a9474e62404
> prerequisite-patch-id: 7f2e951982cabbae366b1ff516f4cfa233746427
> prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98
> 
> Best regards,
> --
> Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
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
 Base: base-commit 025c0cda9c75d499b71b8e02123fea56a13b324d not known, ignoring
 Base: attempting to guess base-commit...
 Base: failed to guess base
 Deps: looking for dependencies matching 4 patch-ids
 Deps: Applying prerequisite patch: [PATCH v6 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie phy bindings for QCS615
 Deps: Applying prerequisite patch: [PATCH v5 2/4] dt-bindings: PCI: qcom,pcie-sm8150: document qcs615
 Deps: Applying prerequisite patch: [PATCH v5 3/4] arm64: dts: qcom: qcs615: enable pcie
 Deps: Applying prerequisite patch: [PATCH v6 3/3] arm64: dts: qcom: qcs615-ride: Enable PCIe interface

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000 (qcom,rpmh-rsc): 'vreg_conn_1p8', 'vreg_conn_pa', 'wcn6855-pmu' do not match any of the regexes: '^pinctrl-[0-9]+$', '^regulators(-[0-9])?$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#






