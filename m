Return-Path: <linux-arm-msm+bounces-33524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4183994661
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 265071C22DA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC741D1757;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnCysVzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778F61D1303
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386224; cv=none; b=cBuVg/ws9hBZzbBJrurFQ+fWh4+Q0nR2mTdyffVveY7dNIbCiya7ZBJNVRIqUo97OEwjKsOf0RyAo+ez4KazwaZfJjx+cLOjRBlyoGyI9rzmZFm6+qFXrbV+dnIklc7ebhOE/20BBa+F/QgfiM4kld9jksVyHMOw+nR1D5Y/XmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386224; c=relaxed/simple;
	bh=EgbCQaEy7fewueYzDfprjYLeKyf18oJeRwxNPJL3gAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMsUIzjCBjgY7GBNf9K5WKtjLHj3j2fUWfA4bdzy7sdET0ZhAvC6n1/X4Moc0O0vE02f6mSg4VlJNFYS4lJswlVs3oE7IBjrvEvwuwKMjLVTNGu+dkw9AIxfWZC8oFOwLUAA2ssr4wFi9hbi86HlKe90GzSw98fs+xbLxrxUxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnCysVzu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 479A2C4CEC7;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728386224;
	bh=EgbCQaEy7fewueYzDfprjYLeKyf18oJeRwxNPJL3gAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AnCysVzuY9+BzE80Q8omTxUB35mKgK6wTOT2Yv03Eq/gEwdMUXlYc1ya72EF8OO//
	 cP3mpY/u1JpX757vL0CYYDEB7GxJX/rVZsiI5vbFZ1TXKt2Km80us58ZOxjZVvWvOw
	 Aqls2r2r4qCss9Z+24hVP2VdNaNAeIldr4iletUNnR0gesmwSmKbKrf39METm+g5UJ
	 tKjaXxa7/5Cojy73nFZd0HDJ1oZbj4S90qOl3ViginIu+irk+vvNuoipiOdawVWPUt
	 2IbTiRM7mQbs10T83Z7+nCQYrm09caQJJCGgm7VN5hd4w8nYvA6eUg2lg9R8I3tIqX
	 6aW2Hh8IChB8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B48ECEF150;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
From: Renjiang Han via B4 Relay <devnull+quic_renjiang.quicinc.com@kernel.org>
Date: Tue, 08 Oct 2024 16:46:34 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: add video DT for qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-add_qcs615_video-v1-1-436ce07bfc63@quicinc.com>
References: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
In-Reply-To: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: kernel@quicinc.com, Renjiang Han <quic_renjiang@quicinc.com>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728386222; l=3460;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=/Bx9teN1YmKVEZFAZmCAcYjiC5RdA6hKz5QrvyVujYA=;
 b=AKtNMAPx5tz1SYWSdXlpCt3fjK4AcYJdDTuyyKRTBP2ud0g9ZzkCMjtCdW7/edj6dNUvDZsNF
 zwlQRAD6H1iAKAX+xvvVEbDqyzK3OhyMfJh9WNc90HiwW3/G6U0r7WK
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Endpoint-Received: by B4 Relay for quic_renjiang@quicinc.com/20241001
 with auth_id=235
X-Original-From: Renjiang Han <quic_renjiang@quicinc.com>
Reply-To: quic_renjiang@quicinc.com

From: Renjiang Han <quic_renjiang@quicinc.com>

1. add video DT in the qcs615.dtsi
2. enable video codec in the qcs615-ride.dts

Change-Id: I80017997005878145a22fc8f38c0ffb653938aee
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 75 ++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 73a8213cbbea58715677855c71b5b94e6c534711..c54e01640d4e455b1f985a553b6c5a83be31090e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -262,6 +262,18 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&venus {
+	status = "okay";
+
+	video-decoder {
+		status = "okay";
+	};
+
+	video-encoder {
+		status = "okay";
+	};
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&qup_i2c2_data_clk &ioexp_intr_active &ioexp_reset_active>;
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 1379900f753eff64d17fb1fe106b6a859e7f1aa3..a28a53ac500241f589a45f419ee3cfb8b64bca8b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1525,6 +1525,81 @@ usb_dwc3: usb@4e00000 {
 
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,qcs615-venus";
+			reg = <0x0 0xaa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				"vcodec0_core", "vcodec0_bus";
+
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+
+			operating-points-v2 = <&venus_opp_table>;
+
+			interconnects = <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem", "cpu-cfg";
+
+			iommus = <&apps_smmu 0xe40 0x20>,
+				 <&apps_smmu 0xe44 0x20>;
+
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+			video-decoder {
+				compatible = "venus-decoder";
+				status = "disabled";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				status = "disabled";
+			};
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133330000 {
+					opp-hz = /bits/ 64 <133330000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-380000000 {
+					opp-hz = /bits/ 64 <380000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+
+				opp-460000000 {
+					opp-hz = /bits/ 64 <460000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,qcs615-videocc";
 			reg = <0 0xab00000 0 0x10000>;

-- 
2.34.1



