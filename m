Return-Path: <linux-arm-msm+bounces-66165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF7B0E6FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 01:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F31AA16A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E93328B4F9;
	Tue, 22 Jul 2025 23:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEt2PGAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09203284B29;
	Tue, 22 Jul 2025 23:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753226117; cv=none; b=UlewSzW1UkVuIQMHPOZkCdeCsXDTOAk35C/ap8ls8hv1155yZ0d/Bjzs1pcN6YXm+MmJBv5d13VIlGEm0p2wkjGgxAOQeHjzUhrib8fW3XbJWjfGiWvvSh6/c6C7bTddzkZ+jY85sIKPBhKUORS8rPbwaH0ycHWuRmAvgaIi5w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753226117; c=relaxed/simple;
	bh=UqlNTA7JpT4KUuNIEYauBrg3bYK6Ig4nUYCq9onOfYU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nSTYiV5grti2aoxV0dN38B+OoDJu9n4O7edEEMNdWjD509y3Wi3jMtiBS8E2HvQkgX8Kk72cuekjnsXsV1vRRQWFdl0IsQlVVEeZTZgGRMnYmDxf/LbZA/DttX93N3ix1Mzl9ol+8c0a2PkE+IHrFatXw1Y2gKKuDOhd9yVyqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEt2PGAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6218FC4CEEB;
	Tue, 22 Jul 2025 23:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753226116;
	bh=UqlNTA7JpT4KUuNIEYauBrg3bYK6Ig4nUYCq9onOfYU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IEt2PGAiY0s6KrwUndGjm83jdMfrGtAbGSpYQymWBnrsfQh+7FZvDDbPw62JraU1r
	 JULf2Ip6aF7eSVlzbpIdj0VAVBxJGYSyi05r+48dTHeL7rBy53W1kjXvW8j/BRSmSL
	 +xy4hs4LfyFGeYADmRwl+gKCMlwkmPHKcteLzN76mW+9SkBFZT4xYvRDhgdpliVtZe
	 JsGPyEKj5j/dmFV85jXh1PA6Eyl0Bn1LQqoSs8z+XlhdfC2JRE2WXC1NgmN7blQIHh
	 Ne4Y+MSak+WkIiFJu4W0LBIA0hkR9EEhREGoV562Qu/jzU0iCu0+rmpX5D8wfzQBIF
	 XvjqHHCxFI1/Q==
Date: Tue, 22 Jul 2025 18:15:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@oss.qualcomm.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
Message-Id: <175322585194.629714.3675361832955503635.robh@kernel.org>
Subject: Re: [PATCH 0/7] Refactor sa8775p/qcs9100 to common names
 lemans-auto/lemans


On Tue, 22 Jul 2025 20:19:19 +0530, Wasim Nazir wrote:
> This patch series refactors the sa8775p and qcs9100 platforms and introduces
> a unified naming convention for current and future platforms (qcs9075).
> 
> The motivation behind this change is to group similar platforms under a
> consistent naming scheme and to avoid using numeric identifiers.
> For example, qcs9100 and qcs9075 differ only in safety features provided by
> the Safety-Island (SAIL) subsystem but safety features are currently
> unsupported, so both can be categorized as the same chip today.
> 
> Since, most of our platforms are IoT-based so "lemans" can be served as the
> default IoT variant, with "lemans-auto" derived from it. Accordingly:
>   - qcs9100/qcs9075 and its associated IoT platforms are renamed to lemans
>     which needs different memory-map. So, latest memory-map is updated
>     here as per IOT requirements.
>   - sa8775p and its associated platforms are renamed to "lemans-auto", which
>     is derived from "lemans", that retains the old automotive memory map to
>     support legacy use cases.
>   - Both lemans & lemans-auto are serving as non-safe chip and if needed
>     additional dtsi can be appended in the future to enable safety features.
> 
> Additionally:
>   - Refactor common daughter cards used in Ride/Ride-R3 platforms into a
>     common configuration. Also, introduce new files for different ethernet
>     capabilities in Ride/Ride-r3. Since Ethernet functionality in Ride/Ride-r3
>     is currently broken upstream, this patch focuses only on refactoring.
>   - Include support for qcs9075 EVK[1] platform as lemans-evk. Currently,
>     basic features are enabled supporting 'boot to shell'.
>   - Remove support for qcs9100-ride, as no platform currently exists for it.
> 
> Funtional impact to current boards with refactoring:
>   - No functional change on auto boards i.e sa8775p ride/ride-r3 boards
>     (renamed as lemans-auto ride/ride-r3), and it is verified by comparing
>     decompiled DTB (dtx_diff).
>   - qcs9100 ride-r3 (renamed as lemans-ride-r3) is having new memory-map
>     and rest other functionalities are still same.
> 
> [1] https://lore.kernel.org/all/20250612155437.146925-1-quic_wasimn@quicinc.com/
> 
> 
> ---
> Wasim Nazir (7):
>   arm64: dts: qcom: Rename sa8775p SoC to "lemans"
>   arm64: dts: qcom: Update memory-map for IoT platforms in lemans
>   arm64: dts: qcom: lemans: Separate out ethernet card for ride &
>     ride-r3
>   arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on
>     daughter cards
>   arm64: dts: qcom: lemans: Rename boards and clean up unsupported
>     platforms
>   dt-bindings: arm: qcom: Refactor QCS9100 and SA8775P board names to
>     reflect Lemans variants
>   arm64: dts: qcom: Add lemans evaluation kit (EVK) initial board
>     support
> 
>  .../devicetree/bindings/arm/qcom.yaml         |  16 +-
>  arch/arm64/boot/dts/qcom/Makefile             |   8 +-
>  ...8775p-ride.dts => lemans-auto-ride-r3.dts} |  44 +--
>  ...{qcs9100-ride.dts => lemans-auto-ride.dts} |  14 +-
>  arch/arm64/boot/dts/qcom/lemans-auto.dtsi     | 104 +++++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 291 ++++++++++++++++++
>  .../{sa8775p-pmics.dtsi => lemans-pmics.dtsi} |   0
>  ...775p-ride.dtsi => lemans-ride-common.dtsi} | 168 ----------
>  .../qcom/lemans-ride-ethernet-88ea1512.dtsi   | 205 ++++++++++++
>  .../qcom/lemans-ride-ethernet-aqr115c.dtsi    | 205 ++++++++++++
>  ...qcs9100-ride-r3.dts => lemans-ride-r3.dts} |  12 +-
>  .../dts/qcom/{sa8775p.dtsi => lemans.dtsi}    |  75 +++--
>  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  47 ---
>  13 files changed, 884 insertions(+), 305 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dts => lemans-auto-ride-r3.dts} (11%)
>  rename arch/arm64/boot/dts/qcom/{qcs9100-ride.dts => lemans-auto-ride.dts} (18%)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk.dts
>  rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)
>  rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi} (87%)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi
>  rename arch/arm64/boot/dts/qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} (36%)
>  rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} (99%)
>  delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
> 
> 
> base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
> --
> 2.49.0
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
 Base: using specified base-commit 05adbee3ad528100ab0285c15c91100e19e10138

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250722144926.995064-1-wasim.nazir@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#






