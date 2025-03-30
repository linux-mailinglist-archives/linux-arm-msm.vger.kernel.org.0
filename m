Return-Path: <linux-arm-msm+bounces-52828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F5A75834
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 01:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C87D216913A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 00:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93388F9D6;
	Sun, 30 Mar 2025 00:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdUBkeZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62927BE67;
	Sun, 30 Mar 2025 00:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743294424; cv=none; b=j+Z1v3yeaSqVev8A3zVzx3HuHCu6plTFfeUfEEcEGdRBe3XyAMx7Mj/KUSZZh+gug5Yv8XJdNPTdBJHknVzlFDtNb/CblNOcDZzz6A+ruo+SGqh3jp889k0bIIqIIgmTtKh2Mz5I7cG4WK+058gifBh8SW0DINkAw+PQg9vOzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743294424; c=relaxed/simple;
	bh=b0F7467aEG7DzDFGd9ol0RCuuenPU43Brdhx0Mg6PWA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CTC+bFfnZlK74myZm93viTZemVsTdwJfifYSfZqPlmfc9ow62JHOltgIPKuEm+8Wpda96H2/LiY+ld9YI0AYu49QEzWkEKllfuJMf9dkByH6DgLLWoVqxLmc5pinwLXgyJaB+TtkJngslnRgdbot4GLJxc8i1SWm4rubRaDPBlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdUBkeZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B242FC4CEE2;
	Sun, 30 Mar 2025 00:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743294423;
	bh=b0F7467aEG7DzDFGd9ol0RCuuenPU43Brdhx0Mg6PWA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GdUBkeZUplmvI3ds3JEadHxdNTivatxZcAOSvlZvP6kJb3w/rL9NV35yw88tec1My
	 jAVQR1g1ld/SXS6ttw3XF7GKPd4iemtrCV4r3m7ZhzkUvk/EJ1BtKHYAsq0mlFfWKa
	 AfIi2EXo2EqCziJgcPQ6ObxOZNjq9pHxjPVmTCH+ubKGuOU5OcHi7rUmwH2y7gRqGh
	 8Px+0U00Kl4T6gBe5d+djFq5z/+wR44mpqyaJPAAZlcnTG8GH0QjRu7bwY7BNbsE09
	 tjjZxxjupZQTfYH6XjUsMT2PIRKnhfZIAseBE/yzLeMZyxR/NwRZ8AeHZmvKc8Qkxz
	 4WC+iEXC9KCzQ==
Date: Sat, 29 Mar 2025 19:27:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 konradybcio@kernel.org
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
In-Reply-To: <20250328084629.1290797-1-loic.poulain@oss.qualcomm.com>
References: <20250328084629.1290797-1-loic.poulain@oss.qualcomm.com>
Message-Id: <174329418150.2439798.14888603110347410917.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm2290: Add crypto engine


On Fri, 28 Mar 2025 09:46:29 +0100, Loic Poulain wrote:
> Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v2: Remove redundant iommu streams already covered by the SMR masks
> 
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250328084629.1290797-1-loic.poulain@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: dma@1b04000: $nodename:0: 'dma@1b04000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: crypto@1b3a000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcm2290-qce', 'qcom,qce'] is too long
	['qcom,qcm2290-qce', 'qcom,qce'] is too short
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,qcm2290-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,qcm2290-qce' is not one of ['qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
	'qcom,ipq4019-qce' was expected
	'qcom,sm8150-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#






