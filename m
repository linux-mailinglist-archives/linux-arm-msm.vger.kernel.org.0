Return-Path: <linux-arm-msm+bounces-77181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65ABD9247
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4E754F3064
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59863101D1;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/Ixaf7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D913101A6;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442912; cv=none; b=YXA7beMaz/+NsEQ7nicm2PTgtdjMYfOhmA4kCuenjFqbX8B6esGQkxIeW/509S8GnUYZbUVnVLyYYjbQKPo/v/vEgDwcVJshzq9ZeHwZzY1Srdg1cECp/X0nnAXf/71k/NXkgg4AqMM6+W+eIlCjXZ3xNtnxW6LWCBSbs4KLUyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442912; c=relaxed/simple;
	bh=7OtMJ97JPx+dcN8Uzrn86Kf2LFwj/k2Cjf1hIZ3bD+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlZV4tk/jGQrdEr413j0dK7J9Gs8QffGqdb2uDaV6rNYtyYu8Pvc0aQCmzE5Bl98geLNhSIUtW3pg595s5virmQpMkfyzdJaGOUBOyw9PpO9TO8oBjtzNxHnIvkXtcAIQ/Xf3nTgjVHQ+8i0eNySru26dNavaUsmjdq85cEOxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/Ixaf7y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34176C4AF0E;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760442912;
	bh=7OtMJ97JPx+dcN8Uzrn86Kf2LFwj/k2Cjf1hIZ3bD+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z/Ixaf7y/jbInz6ZK3bIOJKblhedX0XwaQMRzK5tL+OBz+Y6SwIa+pFJ9rjf1aVn3
	 W5+g5zktUX3/Q8UIQkTIKRpx83MMwTHiHxE0STN7jkQw5VsmOcXk4699Mwh/c7YwLJ
	 6yixGDbuPBjjtmdpahr72fP2JzSrfsW4Pt0PASLIkqwmlvRXGZDgO8+8iGmPUEyKq/
	 KPPBoTaWDN3oKVaRCTWi5gleQUEnV5kwgK3KYp8TEOiJ2oxx9kix6ztwUXWpbvkJNa
	 j930l+nK22hYEA3NuuTsU/lJ2WdbwwBJ3G89gnR3P1JuYJuFLNN5nGuvFLr2vdN9oI
	 4RqMh2fiRDp1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CA4CCD193;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Oct 2025 19:54:56 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760442910; l=1566;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=/51//v+svjuZY3Iiy6UrPCdt/x4774tlFAIE0Mple+c=;
 b=7ZeEYtFTY/JFvZVoNFZpXRlV+3nVG0clQ4G2JxYgyOnwoqDD1DhKNyJ6xhgwkBNH/oHfH5zcn
 /xW0jtlXtAqAnIgbNVJAhCs8PT2QE1/ALr8KqLId0hDUod0WVSSkpCS
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Add DP connector node and configure MDSS DisplayPort controller for
QCS615 Ride platform. Include lane mapping and PHY supply settings
to support DP output.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..bb0f4b8265e4807e50d067aed8b21557d97b20dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
 		};
 	};
 
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "mini";
+
+		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
 	dp-dsi0-connector {
 		compatible = "dp-connector";
 		label = "DSI0";
@@ -423,6 +437,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l11a>;
 	status = "okay";
@@ -623,6 +646,13 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_2 {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.34.1



