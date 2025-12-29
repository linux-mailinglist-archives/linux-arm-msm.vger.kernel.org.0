Return-Path: <linux-arm-msm+bounces-86888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC032CE82CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71C363019B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3632E6CDF;
	Mon, 29 Dec 2025 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3NoOfFo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1672E6CAA;
	Mon, 29 Dec 2025 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767041288; cv=none; b=qBofrX9wyzKvPznuTXCRvaR8V+4bdbOwbPBti8u/ndWYhdNOeexO1ML2neeOs8rxXTZsDqXn3tFeas87cRGsWDa9xiuoONn9b+2V5Pi7LY1G0P4P/6Bfi/xRAWbvfXN1iNDJ5mEu9CkQUZf1OS2Stw0PzhntcbTIkjXIpmreyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767041288; c=relaxed/simple;
	bh=/HcHUKH9WOn4u11rA/8fd9MG7H3ox7CxfRjWpVBqbEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcBb3cbsMkZenap3ZCVoCF1E/a8zxRikR0u2YsBnY6XaxLmXuEvInKvUEEipZKpwNcjvG1STuU1YtT7/GVKCYtWuC6egaoh9ooOsliFknP7MoYCfWZobl4ItLiWvhpGKykI4ZGe48LPC1u1UEFYFhIzyJKUx9rnqNxExNnXL8/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3NoOfFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D87C4CEF7;
	Mon, 29 Dec 2025 20:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767041285;
	bh=/HcHUKH9WOn4u11rA/8fd9MG7H3ox7CxfRjWpVBqbEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d3NoOfFoKEMjGZmhbXTwwY7EDS6Ku7T3w492GkGseh+K35d9e4P6f+N2x6J+ni8Zq
	 UBN7sD7unM2e8R9CR7F+Sblj0SX4q9EevF+dx0atb+u/Ld7nkz71lHTspu0ODi1gCn
	 oStxDhEIiBGTzU7cre4vfPqp26lm/AAYu5XLJfIw1D5J8UxTsECl0TjotckY3NU/0a
	 vkAtHZOuwRrVgw69Oc8JeJbxe0RVc6xDGfzv2BOm/0IgiYd8LhNradgrGJuKykzR5J
	 R96paUuGljh+Il6QQEn1dtZ1fOzSIeViLWc80+w3OLpdmmGiwa5BWvLYGGnhhuZcOq
	 gJS2PSjSElhkw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 29 Dec 2025 21:47:41 +0100
Subject: [PATCH RFT 3/3] arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-topic-6115_2290_gpu_dbgc-v1-3-4a24d196389c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767041261; l=1458;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aO7/EdvbRTHMZ0mluFQ6+MO7rNiL4vfNS224/qLOXj8=;
 b=LN4bsZucaHqv8euXO3Ye/44gUvEgjH4WpNQ20/BaxYkzodXoPiNWwdV9m0PnkoNAG1vr+UaIO
 pboJrQisvoEBfNunZ6zbLNk5mrai9x5uA8zhE5CRjKzWNmjfiLRlSD1
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the GPU register regions, with the former existing but not
being used much if at all on this silicon, and the latter containing
various debugging levers generally related to dumping the state of
the IP upon a crash.

Fixes: 11750af256f8 ("arm64: dts: qcom: sm6115: Add GPU nodes")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 5e2032c26ea3..4dba724f2c75 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1715,8 +1715,12 @@ usb_dwc3_ss: endpoint {
 
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-610.0", "qcom,adreno";
-			reg = <0x0 0x05900000 0x0 0x40000>;
-			reg-names = "kgsl_3d0_reg_memory";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
 
 			/* There's no (real) GMU, so we have to handle quite a bunch of clocks! */
 			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,

-- 
2.52.0


