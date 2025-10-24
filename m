Return-Path: <linux-arm-msm+bounces-78676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D20C0462D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9741D4EA9CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B6D274650;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdafIRZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD926E718;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283308; cv=none; b=RKYbNOGjVGsLqTTz2/7dUYLG1OU1lSyO9LIYmJpgn1YmUNRATuQDP88DRdDd5K8ohoEw5hIvOqavYOCW+ABsgcMX9K/rlXZfmR1+LiN5DXAuYU9TED82JtpzC7hdziPp6OWwJj2u6SUbsxhCPdoAdcOmszy4pktz2Q3nm97pbLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283308; c=relaxed/simple;
	bh=1PpDbGpgY4dzRgY+vH8ul2HZA2Cp9+EGVGMa5SCxg10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLvAPQP6eQEgNrTViCfU93B/6kQChQj42w9qSdtLtpVOKfq8ORN0y9POFGreNJdI/bN0Gr8LO6pry7KpuoZm1imQno687zDazvNkIBqaxe/28Sjz2XLIiTy52aGoRI8e6BkRZI1Q88fly23qZbdmpU8FNYeIJPmFJFKOwI1REuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdafIRZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CBDFC19423;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761283308;
	bh=1PpDbGpgY4dzRgY+vH8ul2HZA2Cp9+EGVGMa5SCxg10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qdafIRZg6V6UR9Ul/GVLbCeRfQMcOrpefV9zViqo+jiED5ooT+QY3kIDg+wPSZEZZ
	 oNjCnADp5BtdaJneIWNQ7KKfZKfhiE6yWjXwKAWkJpROUdgXE40NqTogj276wNhXSP
	 twiDN1b5nk+S6wMN3JJA8avKZsNCURucF7eIvkTQBB5cmE1dw/kq1JqTc6/HPRAreN
	 v+IhHccQ+mYxnqj8g4U7YxpQ0gK/2/zsATdstDDETlg0KzgXFCfCFgZT6WQ4FEmwyd
	 BCsb6hnsytjSzfsNPdeU+dyQQeXp079VTSxuEvIlzCzDktJLLlJVYfhVO/ReTnwwjl
	 YvK+wNQHkb5Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134A7CCF9E9;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Fri, 24 Oct 2025 13:21:04 +0800
Subject: [PATCH v6 4/4] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-add-displayport-support-to-qcs615-devicetree-v6-4-c4316975dd0e@oss.qualcomm.com>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761283306; l=1609;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=JmlkVx4dUAhZ5F1vLUkFJ0Z5DidCHic/hFr/kjEqXbo=;
 b=Iwn5UbKhK6yMWWnfDCu4c4XoOCSF5jK/xYy0o/gmZBiF7b2rAmakFSzEfOJd6oncL+hJ4IzPq
 QOjseqh2BBgAwhR4IC4jI9dGx09WiLJTOjA9Dx5/kdQDpGakKZTpiq3
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Add DP connector node and configure MDSS DisplayPort controller for
QCS615 Ride platform. Include PHY supply settings to support DP output.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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



