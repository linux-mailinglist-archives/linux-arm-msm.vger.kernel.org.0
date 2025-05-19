Return-Path: <linux-arm-msm+bounces-58452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CEABBE8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D581889C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C690E2797AE;
	Mon, 19 May 2025 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5Txd0Wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F312797A8;
	Mon, 19 May 2025 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659704; cv=none; b=pKiMJXYGsEGPJAKPGR6q9zjMFRN2m2Xd8wkDu43qb3VzfFGNDFO3cSUMQsXjJbktUnoBs9mP+nErayUyr7B5vbcRfTVCvszDCkkVm0wNxZZvCVoGwHsNrYfKPaqo0EK4i42ANFFOPjc8ImWUwZi96vvWd8dL+GC7bI49Z9uSino=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659704; c=relaxed/simple;
	bh=0AAYalNKNNjuBuiKz4oAukOeyNtjiI239FFIiB2sSaE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BTxMw8AfZXkQyjVsmTqsg1Td2YV/hEVCRQ7OljdnFCEV+ODCisBHT9aEKL4K6DLOH001om9xEGVgDPX8yrr9V7LPt9AlQ3hwWWRite1yQxFdMVaPsxz1buCv6e6RoM3VOkVwacGN5QOL5aYNe1LYvLXPTEvcT2TGvlB/8jbf8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5Txd0Wz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAF6C4CEE4;
	Mon, 19 May 2025 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747659704;
	bh=0AAYalNKNNjuBuiKz4oAukOeyNtjiI239FFIiB2sSaE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J5Txd0WzHXJLD+VKMM20JGRV5eYhplv70elXRzcYvf0PP6q6v65fJDRiBq3GpLnMh
	 +KSEO9L3QLGnf69lB2x1xu//spbSOLKxrweASnQeTu7eD0bGLvzIs27exfe1SN1IBH
	 murKoKVAXWV4ImDVpie1tSbn+UjU1I8ylJqYUX24fcHUetV2h0i3+k+TXHk/XG0yUm
	 yB8kQqdnYSoDyqNyqIwXdSIgcbDZdV9arHtuQg1dpKR9gNfXK+eHRh7BNac44034FD
	 ufmb8/RAUhm/fv05iNa7feHEb6MIM2GliFVycu7E51EeisDMw6gXyvv+tYRmMa8txq
	 qpsi7uiJ2vJfg==
Date: Mon, 19 May 2025 08:01:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
References: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
Message-Id: <174765962935.2025708.17107266351757084631.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8750: Add sound


On Mon, 19 May 2025 11:54:42 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #1:
>   - Use v2.1 compatible with v2.0 fallback (Konrad)
>   - Use hex address in <reg>
>   - Re-order nodes to keep proper sorting by unit address
> - Patch #2:
>   - Re-order codec/cpu nodes (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org
> 
> Bindings for the new Soundwire compatible:
> https://lore.kernel.org/r/20250519080453.29858-2-krzysztof.kozlowski@linaro.org/T/#u
> 
> Dependencies were merged, so this brings the necessary sound on SM8750
> MTP.  I have patches work-in-progress for QRD and also USB headset, but
> this have dependencies and need some cleanup. I will be posting these
> separately.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (2):
>       arm64: dts: qcom: sm8750: Add Soundwire nodes
>       arm64: dts: qcom: sm8750-mtp: Add sound (speakers, headset codec, dmics)
> 
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 214 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 122 ++++++++++++++++++
>  2 files changed, 336 insertions(+)
> ---
> base-commit: 0fde2d760e610a74f67eee9e757a3d4a95388f36
> change-id: 20241122-sm8750-audio-part-2-943277d85302
> 
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 Base: base-commit 0fde2d760e610a74f67eee9e757a3d4a95388f36 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-312-ga18226be95c7 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6ab0000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6ab0000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/soundwire@6ab0000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6ad0000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6ad0000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6ad0000 (qcom,soundwire-v2.1.0): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/soundwire@6ad0000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6b10000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6b10000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@6b10000 (qcom,soundwire-v2.1.0): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/soundwire@6b10000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@7630000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@7630000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: soundwire@7630000 (qcom,soundwire-v2.1.0): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/soundwire@7630000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@6ab0000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@6ab0000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/soundwire@6ab0000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@6ad0000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@6ad0000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/soundwire@6ad0000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@6b10000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@6b10000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/soundwire@6b10000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@7630000 (qcom,soundwire-v2.1.0): compatible:0: 'qcom,soundwire-v2.1.0' is not one of ['qcom,soundwire-v1.3.0', 'qcom,soundwire-v1.5.0', 'qcom,soundwire-v1.5.1', 'qcom,soundwire-v1.6.0', 'qcom,soundwire-v1.7.0', 'qcom,soundwire-v2.0.0']
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: soundwire@7630000 (qcom,soundwire-v2.1.0): compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/soundwire@7630000: failed to match any schema with compatible: ['qcom,soundwire-v2.1.0', 'qcom,soundwire-v2.0.0']






