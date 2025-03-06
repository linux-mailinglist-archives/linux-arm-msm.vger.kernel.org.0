Return-Path: <linux-arm-msm+bounces-50556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F659A5547F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C493188970B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237B326E63B;
	Thu,  6 Mar 2025 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efa3mE7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C4126B0B8;
	Thu,  6 Mar 2025 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284766; cv=none; b=O/0nca/xdCpHhMQ+cmDqbNPW1wCcINfNvRjcBWqHmA2mAT7Wjibu4bVmMxE039SSvmdYmiVlK2AEDuB8euQRaRpNi8UVBLRe2dTNyZfltlH/CsbNiKf3YBMnwjrbrCoV9ry0q+L6zLJJYYf57Xb1dh0W08FZHn8dx9+38u87VZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284766; c=relaxed/simple;
	bh=lwAaODSSkqHKy+lcOcpuXU7amU02IOXnR3U8lDPLoNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hn6fOCJi85dGO6uiq8ZwdKpmcj52VNOpjRjWfiiGVbLaHA6aJMDOdPVtsqvgK9LD0nEN86WNeMD5nsj1g8HAGZpSGwzKX5yi3BZLJYVXQR3WKF0CcuOjQCyUiG47iDp7Zul4stiJsnkQ7zR6mxDpJBQZ7QE5A9gpZjS4mEPcVxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efa3mE7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66242C4CEE0;
	Thu,  6 Mar 2025 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284765;
	bh=lwAaODSSkqHKy+lcOcpuXU7amU02IOXnR3U8lDPLoNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Efa3mE7ghQXjJ0ma7Gt3irJEbEpWwKw3KwCO6fALZm0W1ZsB49SR6nv3UYZjo0eQx
	 ZYepuLtCdrq6EPkLdHB/ZiWDQB7zq1evj6fRfpz9HmO7UzIft/nTm3xSASd85u1gGY
	 +m88ep3tjVdlBhMTFTx9fUr5kxBtmVNnPZdmGSk8PHjve1gIYPCK57On+998XAL46D
	 kh8FfzoJy0SyXeOrO8WftRVVdDi180ovUH/MS9QB71uCKL83M1yEr9KK4M+PPP5xLv
	 g9JwRMi183yO8urYavV007ARdyBEw752St2KvbtEubNYcvCqcOMdR8Yx0ako497BRW
	 4rPccUCx3KoFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:20 +0100
Subject: [PATCH 08/11] arm64: dts: qcom: sc8180x: Rename AOSS_QMP to
 power-management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1128;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QcbLDu/JCvSajtmQcGni6Wyw36X/N/6SEY8kvKIxueo=;
 b=4UMnnCCJ66VxjcdU9W4oGDTTTiJxJZgM/3w/SYgUgaeFIQDHsbFLPpXhJNzOV14PaTm9QOzP+
 wKKurTO7DcrDGua94u3nrX6aH6aI40l4kTZX9LdeS6OBzHEXHw5tPtl
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The node is currently named power-controller, which requires the device
underneath is a power domain provider. Rename it to align with other
SoCs and resolve this sort of warnings:

power-controller@c310000: '#power-domain-cells' is a required property

Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 28693a3bfc7fefd883a7dee69a406235317c3047..f142eb63b8d7f443a8df2334cf3c205353762893 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3524,7 +3524,7 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		aoss_qmp: power-controller@c300000 {
+		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,sc8180x-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;

-- 
2.48.1


