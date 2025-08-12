Return-Path: <linux-arm-msm+bounces-68745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18474B224E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C39D425B67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527BB2ECD36;
	Tue, 12 Aug 2025 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGAWVHTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256972EBDC1;
	Tue, 12 Aug 2025 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995701; cv=none; b=aqGYkFGz26sIjIh+OBl8QDAe+896CvxxKDmS0pCTlRbR+zP6hw+6tc3KgQK7OZF4VrBWizM+U9lZGSWM9Bm7lahiVVMCZzj8lZJg+mtVFYgthOuB8U1w9boQ3vHsw20nBI3N+fpyaL4xZaPOV/uL19SqeJ4uLhR9PlXwu+u4Erk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995701; c=relaxed/simple;
	bh=qJuZ1zfPMACXkpwdurJoB/v+S2kyjw+gslo+Q0ciylw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kfkHaClR18gnObDNN16TOh28m5pkP3atzRL4KjeHb7ljyVCvC2g0CQjxN+8pugtFsB126YLZH/b9X1xbersNXooeeDWLkl5GAShMkbwzJqX9HPJLnz6qoOwPwTKjEb3deNZNgmM4jKq2AGlZ/mtbYlkXn+KFYnCwFK25WIenmQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGAWVHTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B645C4CEF0;
	Tue, 12 Aug 2025 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754995700;
	bh=qJuZ1zfPMACXkpwdurJoB/v+S2kyjw+gslo+Q0ciylw=;
	h=From:Date:Subject:To:Cc:From;
	b=uGAWVHTVio83+Y7dzKzwpZWVyKiin9jVAANSIW169aaS22UsHavud+ZKRr9X8dG+W
	 C0pvO+QhaV0CucGkpAE4hIVj+UrXQAf5aZqSmum0VtUotQRgKhQ7StwGSQrcOOrXfB
	 E6zvBj/7GufCvDIJySk+yR7BGGYBlh8KtA+Pa5CWZFqsX0mA2/PRl9roceurLwFv4c
	 9WKyRUgM1oz12SJvHhphOHTRDKrGQXTVi/OpEWuEfHNLM2fdS6UM5GKPwnZTJVP39Z
	 BYDw7xIsqNqNAJfX7zUG74B6/iMEWO5aZJH2cfsR9PtyX1nwz6QmkqXaRKfl+GiX/1
	 nP69dgt0KJWog==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 12 Aug 2025 12:48:15 +0200
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent
 data paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-7180_qmpphy_ports-v2-1-7dc87e9a1f73@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO4bm2gC/4WNWwqDMBREtyL3u5E8fKT96j6KiMS0Xqgm5lqpS
 Pbe6Ab6M3AG5swOZANaglu2Q7ArEropgbxkYIZuelmGfWKQXJZcc80W59GwWmjezqP3w9Z6FxZ
 itlIFL5QSlS4hrX2wT/ye5keTeEBaXNjOo1Uc7X/nKpg46r42pbxK0d0dUT5/urdx45ingCbG+
 AME3IjyxQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754995698; l=3405;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lSzhXLpPZoVQAthuBtMb1HCovEwgwFgei9iOzdI/0o0=;
 b=f/3JtEIbg+zOj8QQDQaRKOEkNNI8yiTCUH8IPz5fkdJ9z8nz5DoGQ1yRqw8U77pmdtZC9Btvh
 E7MT8QRRG8sCSlWxoGNuFFi+FTqWHgegooH7tVQnZ7sHjE13MjN1ucB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

USB connector bindings describe a ports subnode, which describes how
its High-/SuperSpeed data lines (as well as the SBU pins for Type-C)
are connected.

On Linux, skipping the graph results in the 'connect_type' sysfs
attribute returning 'unknown', instead of 'hotplug' or similar. This in
turn is parsed by some operating systems (such as CrOS), to e.g. make
security policy decisions.

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
Changes in v2:
- Tell the story of what this change is useful for
- Leave DP lines unconnected, IIUC Nikita will submit changes for the
  Acer laptop separately after giving it a test (i.e. no code change)
- Link to v1: https://lore.kernel.org/r/20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com
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


