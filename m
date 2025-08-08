Return-Path: <linux-arm-msm+bounces-68108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37962B1E588
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2964D188F394
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A02B26CE28;
	Fri,  8 Aug 2025 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGk9X8jn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5A52690C4;
	Fri,  8 Aug 2025 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644871; cv=none; b=WNqAzTULdHdG0PbDSQz54I23K04lGzV1W/iFZUR0qn/Z+u5OTs6JSlmQKZuJiQIo8V03aPSjNVDwtZi5xhtBmqN9DDhuMpsq1LPa/PG/dXVX6Qu2oIQc9q6casmHo/PsXWAI44SNYsfzffZ0okZTYSzW9ue/jJWcjNnbu1lphig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644871; c=relaxed/simple;
	bh=sVpR1dYv5o8tfh8Si5svUOMGyW2vn4V8kesXGSXn2gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z7C6hx58jcEYQUbsd6no+21xzdr7y7YNyPLPYNe9j7Un9wkrjF1X7AipXqp7D4nqUk5X70Itpk2K2rvlBQGLD3VLPpKlmBBhUX+agy5JiRgD5lQT0YCw1dynw7PO1OtXbWgGy9GTuSp9h84YzCCKPqiaybFCxabv0UwRCkhyrVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGk9X8jn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F026C4CEED;
	Fri,  8 Aug 2025 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754644871;
	bh=sVpR1dYv5o8tfh8Si5svUOMGyW2vn4V8kesXGSXn2gs=;
	h=From:Date:Subject:To:Cc:From;
	b=VGk9X8jnEH+AWZ1sED8xZca1TSyTZsoV8bGyQnhx2dWTgfMPACCcBBOrvFviOpOCj
	 tk3ehAaL/1+4s8nKoFZ8fp1+LkKAWKrr8rQRpKu5zbrJWNvT5qcQ5qTE6Uz578kEcH
	 nj+Jbq5CAqRs0jyZa81dwoKwc7Mk55vErpIYudqGtGetomthWgUyFKHzjFdi/xq9RK
	 Nxc1JkRpblUR2F3YR+29JM2ZoW2GyfzmSZo9QjAThMeVbfgcelFrljUho4AG16HIE+
	 M5XUqcAKgjUV6D7PeZWCUdE5LvDZQ8acqsIaAh5D+ESeeGY4Fw+g/mV5wWJJ8jrXlf
	 +Xo7LMx1nOliA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 08 Aug 2025 11:20:45 +0200
Subject: [PATCH] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent
 data paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGzBlWgC/x3MTQ5AMBBA4avIrDWZqp/GVUREGMyCjlaEiLtrL
 L/Few8E8kwB6uQBTycHdluEThMYln6bSfEYDRlmBVq06nDCg6q0xW5fRZa7E+ePoKg0OebG6NI
 WEGvxNPH1n5v2fT+S24afaQAAAA==
X-Change-ID: 20250808-topic-7180_qmpphy_ports-e63404331685
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754644868; l=2683;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=92zZd6eGCxTh3T5m3Hb7fztz7OYLQfUscXG/+J3D4AA=;
 b=8IaIK9N92Y+Bvw8cI23s9VWc0MP3zsbg+GOo+bt4N1sy5gXrwBiaAkM1Xpzr6WyU1kS5m2Gnh
 XAL3HbIAMiwCqhObqO2/GFdzfo/yvqBMLLu/luylBicH2sIBYbGizs9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Define ports {} for the DWC controller & the QMPPHY and connect them
together for the SS lanes.

Leave the DP endpoint unconnected for now, as both Aspire 1 and the
Chromebooks (unmerged, see [1]) seem to have a non-trivial topology.
Take the creative liberty to add a newline before its ports' subnodes
though.

[1] https://lore.kernel.org/linux-arm-msm/20240210070934.2549994-23-swboyd@chromium.org/

Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/175462129176.394940.16810637795278334342.robh@kernel.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8f827f1d8515d6113c85a2ecacf7ac364e195242..a0df10a97c7f8aa5cd468c8983e74256490d1d06 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2897,6 +2897,31 @@ usb_1_qmpphy: phy@88e8000 {
 
 			#clock-cells = <1>;
 			#phy-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint { };
+				};
+			};
 		};
 
 		pmu@90b6300 {
@@ -3070,6 +3095,26 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 				maximum-speed = "super-speed";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
@@ -3384,8 +3429,10 @@ mdss_dp: displayport-controller@ae90000 {
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
+
 					port@0 {
 						reg = <0>;
+
 						dp_in: endpoint {
 							remote-endpoint = <&dpu_intf0_out>;
 						};
@@ -3393,6 +3440,7 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
 						mdss_dp_out: endpoint { };
 					};
 				};

---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250808-topic-7180_qmpphy_ports-e63404331685

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


