Return-Path: <linux-arm-msm+bounces-77267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47729BDC125
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6344D3E3E73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 01:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B733306497;
	Wed, 15 Oct 2025 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYUOoQYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B22FFDE4;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760493282; cv=none; b=ZxZfqYBBVwpxolzDcPIqW77+PbZa5qoOSE+WA99BgOBxm+z9ERxkjPvSEbyKK9jmBnM6AO+doxR9sD1Rw2v4UXWNSe8QPjdPQa3AjcZG3F7MfXmRp0+wzwBD9frJGn5NV218ejC4ATGuXw3hKPHRGKycvXod+PqRdE8dumTU3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760493282; c=relaxed/simple;
	bh=twQe4lNSb8Ip4QtBohU/pM2tdRR+fK+3N/4cynHxS1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JICBhjVqu51EumT1UoLvLiwb2Zcm8WaztW4dhRssEY5dTejFuL87ZAC83Fyj296yzz2CKkzDDsc41WTgK1Qo5TLliPNVmD8TTfBv0eqtaPH6HQfY4dGu1JUoriZ0wFAS6qIfjTC5UDDrLPlFc35UMSBpVhRdRhznkMzk5HbESPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYUOoQYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25F92C16AAE;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760493282;
	bh=twQe4lNSb8Ip4QtBohU/pM2tdRR+fK+3N/4cynHxS1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SYUOoQYAK5XqvmYxOH6VSFDK8m8Do+gteO/TandYpLlIHydkZI78qPb5FH9kAosCW
	 uFnHeSd7C8C76tvGCeG/OShbtevCr4IMh70POjgcTk9A3Mc+X+6s/8QQOkfR1ZPDzt
	 e65V+F0mumdIjqLb0qt7/ez0jonKjkENs8lWgjxo7cfzbI/kMa/3dOGujcAHPQf7k9
	 s7jpNY6w9I4pJxpluM/oIK631dvztQM6r008GhgofpFohhBwlgva4FXzp301OEZlNK
	 pbBLdm1Jpba+UUgijbTLmPlVTbkpfIyLXjS6Nh98fntecTuHtHeTF0SUrfv0VA3xDs
	 dvd750ITyrVzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14481CCD194;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Oct 2025 09:53:20 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-add-displayport-support-to-qcs615-devicetree-v4-3-aa2cb8470e9d@oss.qualcomm.com>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
In-Reply-To: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760493278; l=1548;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=d+cJKrXD4tfTqdXBaY3G1wbp7JyY9CM0nzg66HGu5Rc=;
 b=5hm9x33yHefPI2x0XBMqblgJfCbItC5qN6Hz9DeShMLuP/9I3VYkMY6Zv1gcLnIOU6tYnx5+H
 Fyj27Ghd1dPB+Yym4haixCYI5CVOcX275qygSfb0QC4Rl4xgdQarS6T
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Add DP connector node and configure MDSS DisplayPort controller for
QCS615 Ride platform. Include PHY supply settings to support DP output.

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



