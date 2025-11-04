Return-Path: <linux-arm-msm+bounces-80175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CF1C2ECC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3CDB189B98F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D201122D4D3;
	Tue,  4 Nov 2025 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6Klvi7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55EC22A1E1;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762220028; cv=none; b=Rq1uFghCuheSe7e5LBq0G9WZHhA9NQ1XJ+m/Z+CT3oSY59r2EjEyOHQU+IBqW789Dq8rkMeYhoSKzYGg51KWsLxPHGe0d+3cEYKgBnITGCRBH5966z9uxZMQ89THQombx0QJXrpWN07ter0TQqcXPsJK8OfhilX/2HmdgaswTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762220028; c=relaxed/simple;
	bh=dKK/EqIbC7RXoHraufPxWjhKrP9sGcj1RRvh9auQVQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWCd14YLWvKTvj8LmxjJ3FU/a+9DNehkYwlXJD1zJAPyVOhjUXNDwq7Mnaud7Pfo1wXggqyJAdspBo7nQpGLHnsyllVh+jmc2G9KObFFqTOk9AiRKYLsbj+WOdlknw4KzEuPOqqcDhVSy52cEsXC0BHxX0MLV9Y8Teinph1pDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6Klvi7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D49AC2BC9E;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762220027;
	bh=dKK/EqIbC7RXoHraufPxWjhKrP9sGcj1RRvh9auQVQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e6Klvi7roYXtebOvJjNGRSPopYcOrO98WYA8Oo1llRlfIW1r9e6NT+QU/k8cj1vcw
	 4GOdtZa8ZxcrKH/RH6zzNyDb6K0RESRemL2LF2mg8SSmPnkwtbmkLwG/7kAv+b4PGQ
	 2h5ZHG95cRhU8Sns3wHkzpl9ZsyRBnIJA52GZTwh0Md4FmbK4rDiRxqTaCZnGTLJq6
	 Ky/uMl2Mdj0UXBWN9J4a8JYcMg0sawRdnFC+P/h0S52dtmmPAvI6w9MIg8aLveDtdt
	 POuRxxwFNHt3DklWQ1c+ivaeuX7mGUslsYQkxzdb9Zxqrte62E3+5Ik4tPP+RQq16x
	 Bmrxlmm+6vepw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2538ECCFA06;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 04 Nov 2025 09:33:26 +0800
Subject: [PATCH v7 4/4] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-add-displayport-support-to-qcs615-devicetree-v7-4-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
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
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762220025; l=1609;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=UefwVFw5JL4lAwuEgs1CevP0v8Ntkh5qwaIuq5AJOpU=;
 b=vWo74HSLzDxGqV9nALtuOvNxJ4/G6KqBt8qKUbQ0evnO2cCkUudGnXfRgqCXmmitkHWsywbpJ
 cQdzLxao6hwC55cLwalIAZrLlQOdiEDXToatSwUMs193Eq5xlaFBkja
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
index be67eb173046f9e4ac58157f282c3af41e53d374..5a24c19c415e3fa92e3b543ed48b2fcd6b20c6ca 100644
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
@@ -624,6 +647,13 @@ &usb_qmpphy {
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



