Return-Path: <linux-arm-msm+bounces-86887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EDDCE82C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BBAD30173B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9265B2E719C;
	Mon, 29 Dec 2025 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/h7Hyry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14842E62C6;
	Mon, 29 Dec 2025 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767041282; cv=none; b=WhPCVR7c+r36IHy0GJoOuHwNsZ9+sajnayxYVTR1tyXF9UK13MTWh0jrXGJf3CPvZMdsMn1oYo2C5L2zi3FtP4+9IE9Z/VhPq5TZV8fWBm96Y9m/41E8Q8g6m0TpuFhMPLeqFOU8dsOg+JD62qraddM1UDxKQ6cPUW9C3KAHSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767041282; c=relaxed/simple;
	bh=gkumClht7zx29/B83YcBFN/GkuT84+EDxn57FN6zFdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+5JLvuZC5ql1XWmTzQZ102tYr10VmoTSE1VkuSFQSwZx3fSFAIEURyCQn55hzx0xAoXA+bhdVbji0wcK6nzw1UegJh94sa96103bQI1kK+V8d2DmaodFGo/nuymyTK6s9hSyE4v8+nPVgAw7FPyJYBG0QVypUlvYjafqhQfjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/h7Hyry; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAF7C19422;
	Mon, 29 Dec 2025 20:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767041280;
	bh=gkumClht7zx29/B83YcBFN/GkuT84+EDxn57FN6zFdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G/h7HyryUvZcoKMptS8kbGgGQ9+s1B+cakwpQNO3HtOdKrgnupY4Ud3uVBTXVRc8f
	 ah1tKTcX7iJVMMz9XLjGnS2AHLZCItFT47x3xD1NuHfci5A0D7sXRk55r+sRU+q2LF
	 FdY8gd0aQtpBJ4XOuKcd+aJPGUDMzEYnzaZtCEKSYmq/v6jM/JU/ABu//RyZd0tl94
	 kkD4qGehHHlotIkHlyR40yU22NPK+8WkjTCvKbQqZdYqiyVDY+91OW1jHdF+gZXfNI
	 MLrvSefqfDhjWE/Fmh4oB1C9UcreOj8HVOXkuqG4HnNAF29F/S9cvnp5Mc787cHR1r
	 gMaZ9Uf6Vm0nA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 29 Dec 2025 21:47:40 +0100
Subject: [PATCH RFT 2/3] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767041261; l=1394;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Ed7Ru8FNSvUGpqMZKedhA/ib/MjVW4zSC6WOqEnGhNA=;
 b=v4b2pWQAuvOjUDK1ag4LiaU9auMc0cvoffcLp6BUuedNnFylLKDQbwGMr232B7NiqdpXSURum
 1cNGpbp2mbvC+sFaqtAqArmmv4zZQNLnZzoxCL8QwIm5MPzmhjtAkdr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the GPU register regions, with the former existing but not
being used much if at all on this silicon, and the latter containing
various debugging levers generally related to dumping the state of
the IP upon a crash.

Fixes: 4faeef52c8e6 ("arm64: dts: qcom: qcm2290: Add GPU nodes")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..969ae1378db2 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1591,8 +1591,12 @@ usb_dwc3_ss: endpoint {
 
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000200", "qcom,adreno";
-			reg = <0x0 0x05900000 0x0 0x40000>;
-			reg-names = "kgsl_3d0_reg_memory";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
 
 			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
 

-- 
2.52.0


