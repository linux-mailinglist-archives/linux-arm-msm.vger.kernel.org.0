Return-Path: <linux-arm-msm+bounces-47587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C416BA30CD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67F69188B284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD3E2206BB;
	Tue, 11 Feb 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xn1brrTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A79320F;
	Tue, 11 Feb 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280541; cv=none; b=g7t8lgEElrdq0XQiXGsTRbE/Ncr+FCTtXfkoPclqEHxVyA+a8H7EaEW7SevAIosfPP/i3mY9sRPRlwSgKWZSA4Ji/6sA1X2FHPxwMSBK16zuKV18wOPcVX4X8pBd0npX/lh/WmuJ2Be/ZiFTDUd2kL7tT+Q8QX7/AGfU6vvprI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280541; c=relaxed/simple;
	bh=dqNsW3cC15v27jSPs0dEzsu7+QJx12fycZgZDdvv0Qg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=s19WQmzx6S07qNGsuqOSEAhkBGek0CUzkHHPVQICf81eiAgWe3yFEA6gI+6K/xCs0Aaa4rvUaVxieCoLSQTsKhkAVyaSZgxaHgHeTWrasd3sMPdKj9RuCOlK0npJMmF/R3pyJz+7r6E86ha/A9kKPgBAT0So/9yaEUFFWu4lmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xn1brrTa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72D0C4CEDD;
	Tue, 11 Feb 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280541;
	bh=dqNsW3cC15v27jSPs0dEzsu7+QJx12fycZgZDdvv0Qg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Xn1brrTa8PUgjgKYSe42q6OvxHapJBaUC0V8AEU9gN1aVq/eY/Wb2zw1xQi8VzW6y
	 P6PzOx/iI6tFYe4J3CJRP/HdDUhooB3sq4yKPQxSZEkN4cncd/4hheMqrAz+GL/Uer
	 /V1LC6PRjuvkRdYyq76nJOaz66a8fJyTaieJPIatsRe2OgJZC97yljYGvQGUQJV9Ia
	 tp0lTyM3cqPl9LKEdEbfvdU2i2Yz3ijAkNhnTQ8LGXakpSimRfmmhgwl/ED5Y05/Pe
	 xxUTwsNUNpWtPQC4F/DwOy8+Q0LRwVL3gVsh3V7RGsPeYof6fnM/JNRGVIGCUuHzY8
	 KJM7Ux7ykkrcA==
Date: Tue, 11 Feb 2025 07:28:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, iommu@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
Message-Id: <173928051052.2596191.5953179871612881836.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] Add support for GPU SMMU on QCS8300


On Tue, 11 Feb 2025 10:15:52 +0530, Pratyush Brahma wrote:
> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
> Changes since v4:
> - Corrected the clocks list to be inline with clock-names
> - Removed stray whitespaces
> - Added r-by tag from Krzysztof on the bindings patch
> - Link to v4: https://lore.kernel.org/r/20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com
> 
> Changes since v3:
> - Modified the order of clock voting and properties as suggested by Konrad
> - Removed dependency on clocks in commit text as change is merged in
>   linux-next before current base commit
> 
> Link to v3:
> https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/
> 
> Changes since v2:
> Corrected typo in cover letter to include QCS8300
> Link to
> v2:https://lore.kernel.org/all/20241227104651.4531-1-quic_pbrahma@quicinc.com/
> 
> Changes since v1:
> Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
> Link to v1:
> https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/
> 
> To: Will Deacon <will@kernel.org>
> To: Robin Murphy <robin.murphy@arm.com>
> To: Joerg Roedel <joro@8bytes.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> Pratyush Brahma (2):
>       dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
>       arm64: dts: qcom: qcs8300: Add device node for  gfx_smmu
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |  3 +-
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 39 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
> ---
> base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
> change-id: 20250131-b4-branch-gfx-smmu-b03261963064
> 
> Best regards,
> --
> Pratyush Brahma <quic_pbrahma@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:0: 'gcc_gpu_memnoc_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:1: 'gcc_gpu_snoc_dvm_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:2: 'gpu_cc_ahb_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:3: 'gpu_cc_hlos1_vote_gpu_smmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:4: 'gpu_cc_cx_gmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:5: 'gpu_cc_hub_cx_int_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#






