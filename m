Return-Path: <linux-arm-msm+bounces-102197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJz3DNIh1WnK1AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:25:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C56B43B0EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 486D2302E81E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53E23932C6;
	Tue,  7 Apr 2026 15:21:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF7373C1A;
	Tue,  7 Apr 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575292; cv=none; b=uht5yapx/HT4aDhOP81VxBh/R7NFWGtSxSbjkMviz6EwqC00j9LOzgJbb2/o3PpXtobhH0UvUyPoVrOSmoeWHQUxAkOtXzxi625mqs8ulYwRp3TSzfhwUwGl1wvHUX25czucj7R3kShgtNsxSQe3uaVFCuel79QenDkwtLVFRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575292; c=relaxed/simple;
	bh=7id18KzmoBqRFVqDUMTfg7+j3a7tzLG9dK0b1KVHwfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sh2/8q7E6aICIar4BoElEbC8tFzl/94dHrWgzxOXRfPdK4JAXxMn4doOaPQ1o26laU8lOMebv/vZqfu42Udzadzy69Wjq8UE3B6YoTa/HKJUMh5nLK5JwC8Ttmjo8ihu0r1ijqs+YgpcmJNQaRnfFQ5UdOYowc3BdNq31BMxgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575246t87f8c8f8
X-QQ-Originating-IP: QloVjV6un4HA0p4hQWqJQR9BHrVKFTWAI1UKvv2UO8c=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10889481759113752594
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:20:04 +0800
Subject: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4336; i=sophon@radxa.com;
 h=from:subject:message-id; bh=7id18KzmoBqRFVqDUMTfg7+j3a7tzLG9dK0b1KVHwfM=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZbmr70n/51JIryruHyz9kTlo1qb3TXjfzzaNi16Q
 seWlZGPOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEwkZA3DXzn+HWpx+vlLa6by
 2eoIv2QoW7XecU9nboVXl7F8vWVkJcNfkZXb/gp6XPlucf2WuN7KS0feXM9mXrfqiUbIgWi+5EZ
 HDgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OfpDajcwo3IHobby52/yQ9jbgEkIp9+E/SwWsRrI/QjNg8rHQgtylsGZ
	skf+8YUnFY9mL8R1OIIE4Bo0kDHB3ScanLGhCaS6sFVjczrDp/E1snf11eT9husRQEgRFjf
	dFHE65DJLMPnZYOC/E4TeTrRZmKMffovTe0yB4irX1BqWqXykc/rZNfyAcdk/G7GstMr1jr
	7PPGWSB9BY7MQeRf04ntYTakm5+kAx+HnxaFnzNWkk15cJ0B28vDqru81pIjID0of+ga8Bl
	+aq3bQo10A6U0UMdd14GoJLiO+MCCoa4qAeEzxp8+vfe5m72aS6YZzMfSE+ZzNVYj9Dlaus
	7BdOa70MuOhOrwGY6s1ojf0mmXDV7EyLn8Xf0h+V1V3v83894mrG48ZxtvruPxNnXgQaB2W
	L1RroiNA0Kx2bg3cZyWBQIaTh3oPuD3+7U3iGD8Jv8P8dRFrrVvleYTWC85g8N5N5oXW3hA
	KMQRCdZKbSQyN5sM1l6iUDUzdCaqLOy74Nt3wuh/28Ji3itCQS+EXHe/2mBHwEhkg2eciIy
	WsbgOlXi+o/BKUDpeMWOkPWmIN2BXMFuv84YVL5SJRgxPynmmhxBVfzbw1nimzceIOly4aR
	VMSRRA+pSsVwl+5HgJ5SJ7s8UX3o4AlhDJmI9PZOx5p5b1PcTs0L2eZdu5J5Af1zS4i8rAL
	2qQKDLScWHbEq8bEEuaxFItJyXlE7rRt7m9/PLB3xRXVRs33D7NUJ30o+nLgHw4b+95/caW
	dcGN+9R0Hbfv5jzK7JC/obP+rBWgsInYIov4tU5QgulbaKoKVPLBYJdBvyWRG3r/8u3GcDd
	pJGNkPERhurwcorcmptXTplS6xzDQuLZdBg/ABQXdO3hjLhBB5df9S9xin2UZ5zglT93khp
	eldN9A48SpVM1Um/mU9fCz46DOWOupKaBHR9VgfOHyk82gLT/jWr6qjG0PNLT89yfujmTMX
	zuDA4Iv5cRO2CgAth2zxM4MK4GjxpPmkWrer0TZoaGz568OmBKPTNbN9QDvnReM1Dl21fIq
	ltIKAhAIiTMXDoMwyC6R/XdHhGVI75zzGF9slivinvIqBlZdmDbIiCpExOEdpB2Bt+xaOaZ
	w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.6:email,0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.814];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,radxa.com:email,radxa.com:mid,0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.5:email,0.0.0.19:email]
X-Rspamd-Queue-Id: C56B43B0EF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
bring-up of the host-controlled LPASS audio path on the Radxa Dragon
Q6A.

This variant enables the LPASS blocks and codec macros needed by the
lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
that the audio hardware is owned directly by Linux.

This DTB is an optional configuration for systems booted with the kernel
running at EL2, where direct CPU access to the LPASS hardware is
available. It is useful for users who need low-latency and fully
controllable audio.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../qcom/qcs6490-radxa-dragon-q6a-lpass-cpu.dts    | 131 +++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..2f84ef7109b5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -169,6 +169,7 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a-lpass-cpu.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a-lpass-cpu.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a-lpass-cpu.dts
new file mode 100644
index 000000000000..e7ee57372d7e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a-lpass-cpu.dts
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025-2026 Radxa Computer (Shenzhen) Co., Ltd.
+ *
+ * Direct CPU access to the LPASS hardware block on this platform is
+ * restricted by default. Booting the Linux kernel in EL2 will allow the
+ * kernel to access the LPASS hardware directly.
+ *
+ * You can achieve this by setting the Hypervisor Override BIOS setting to
+ * "Enabled" if you are using the official UEFI firmware.
+ */
+
+/dts-v1/;
+
+#include "qcs6490-radxa-dragon-q6a.dtsi"
+
+&gcc {
+	protected-clocks = <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
+};
+
+&lpass_aon {
+	status = "okay";
+};
+
+&lpass_core {
+	status = "okay";
+};
+
+&lpass_cpu {
+	status = "okay";
+
+	dai-link@5 {
+		reg = <LPASS_DP_RX>;
+	};
+
+	dai-link@6 {
+		reg = <LPASS_CDC_DMA_RX0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_TX3>;
+	};
+};
+
+&lpass_hm {
+	status = "okay";
+};
+
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_va_macro {
+	status = "okay";
+};
+
+&lpasscc {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	status = "disabled";
+};
+
+&sound {
+	compatible = "radxa,dragon-q6a-sndcard", "google,sc7280-herobrine";
+	model = "qcs6490-wcd938x-dp";
+
+	audio-routing = "IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC2", "MIC BIAS2",
+			"TX SWR_ADC1", "ADC2_OUTPUT";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai-link@0 {
+		link-name = "WCD9380 Playback";
+		reg = <0>;
+
+		cpu {
+			sound-dai = <&lpass_cpu LPASS_CDC_DMA_RX0>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+		};
+	};
+
+	dai-link@1 {
+		link-name = "DisplayPort";
+		reg = <1>;
+
+		cpu {
+			sound-dai = <&lpass_cpu LPASS_DP_RX>;
+		};
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+	};
+
+	dai-link@2 {
+		link-name = "WCD9380 Capture";
+		reg = <2>;
+
+		cpu {
+			sound-dai = <&lpass_cpu LPASS_CDC_DMA_TX3>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+	};
+};

-- 
2.53.0


