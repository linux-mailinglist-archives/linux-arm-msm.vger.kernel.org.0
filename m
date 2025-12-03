Return-Path: <linux-arm-msm+bounces-84136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31325C9D96B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 03:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42253A8194
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 02:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECDB23AB87;
	Wed,  3 Dec 2025 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEZ/f56A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFH9z1j5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA171C84BC
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729766; cv=none; b=AT8wT9fjXe/OsVdNtMAMsuXsjwkz10M+sFJjaMl58o1H9CkD6wpufdLDjaOfuqdkbadUK/ykCn0aTxerF+YWezthDmjr2DolmakX2gukHK5Vq+Bx+pDJfWmXNiClxI7Yp1qYicpf82eYyIiviPBQs5oPjpM/qEblthAsnNci+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729766; c=relaxed/simple;
	bh=n2Cwd/TAJaHTUELcbZYC9HaOKmoXe7I3p/aesU+TT9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nduJSQgbbegQULM1XEeibQSGKBgsqYDb0V5SqHA2Eey5zVVABvTzyx4WbrdjX2+gDPWf0BKT3s/tMp3puExmZzO1AX0PS/PphWjXJeHUAVDUFX5IfRhjukvkUs2ecOsxsTOy3IBL7tY+tdM7ysE7Ick+rt1X4qIK+dacMJKmtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEZ/f56A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFH9z1j5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2Lprx04011467
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 02:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6J0fOYrabni6kE9p26d/Ka
	LZBnkexG2p2ykADbHzGu4=; b=BEZ/f56Ap8yrR321vpJTcqp66/xt0JChccaaOO
	MPM6AtwrDiisVkRuhBRbolc16E/JhT4LSyQmbzu1IaPToM/huymt+12twG212PV1
	8FEof0xFPstUlUCKP9GbTogde8NWflBTdv/GvfGdHa8Re1mZEVtDlreOMqlvIJrP
	arujC6YGe0US6ZP+sj9ylfKJKYKaFKhlVu3IYgaQ2XJ5OKn4YXuURsredp8vUasU
	JmSpES2BW3naQk1aKXe65mHtpbTdFIK/duRwZkMoluqF2GCsiMU1ZeW8exub8N3h
	UkKNehbMGfqTG8dpohqRpKlXIlMmyd1io1EYeWD6/CnW6P3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8d9gnnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 02:42:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f8a2ba9eso108203905ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 18:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764729763; x=1765334563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6J0fOYrabni6kE9p26d/KaLZBnkexG2p2ykADbHzGu4=;
        b=dFH9z1j5jKX6z/UeG7sDp0tT0RtVu0C2jRVFN5VdyIhpr8noUfAYDKMbuRAZSgQKp0
         Geum/e9ZemytvcN+8QS6g00gQDeS+c7QNRWM08Cy0ieNyuZi0Lc2myEW6SsJbeBszSzq
         8x+qBfkLBqPZ4p/rj3hJyH10fFG/Pm92dfgGQ2Pu0yA4C3AVyZuPFFaE8JlusVVbw8Ve
         s0vu0zf0V1GvaEdjDedCKl97ureBVSBGQeaKRxVQzTvqZwH/7a8TaZFbznZtwo+SYTuV
         9cqnI8/KW53b/CINJ3jgeSc6MdN31uun1yLeMv1TMMiPXqP5im2d+hzJVZQ8ndoTbwN/
         zrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764729763; x=1765334563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J0fOYrabni6kE9p26d/KaLZBnkexG2p2ykADbHzGu4=;
        b=dCUB1mF2h8iqB8lmhOPR814fTIPArL6f27Bo03TfJsP7cv4YTTUDjxXQ7+FRQP0rWp
         prPEN4VTU4Itw3g/ssVox4gM3KlKFDleGqV3H3H+79qifGphT6OhP/HNBJ/WaHdqSrtJ
         F+0YaLlhO2y/n4T9mWlmuQTPxRfF1M4siNdN0a3vUo3KFqhOIkl7cU+NCwmhE/U1eaZO
         qDrDHeuL2Ylewi1vIjleymufYSozeqa7yeaNVGfjKvOWWWYSAjzVVksu6Clt8uU064cZ
         B3FrcTk/UBgHutPekY+5efqkwJ56KQRtk9YgXKF8KQrB6VGF33rNUMG9el1y8+fJLR4y
         g3Vg==
X-Gm-Message-State: AOJu0YxpSEcSDNje1E0uAnPWESMUE5V0Xcpt2Yt8Zj8lONUgkVL2corZ
	IuO4OFPZzVolG4fTWuUhv96Cv2+PnCtp/GZ3UO9Gpi1p23tmJTTNwPAjesi25rQA7kkFHQsu7SF
	BSeN7rCKlDFtzXmDc3ZW6WbR2etiWUVtBRMDm58ohfd6FIFvPBxlHWDU77Q8Y8MmtkM7R
X-Gm-Gg: ASbGncsW2kiwMJxNeRpq9fQbFDAv4wn7uONWVbqmsE7JJJiot/ALlo5UZDmqjnS3gQd
	2FjaQ37qXi8avQezWHX/XnmAfpXEKfFyXkZqhLKQeyaBB4moCPV8nBmfr5x00gmIygCFvarNzOD
	LeaOnrulT+Qql1VQh0QZrDqyHRvWAGPOzlqwZqdlXtRm28KlLPRWVEqptD6Doyotam2lLMYsgHc
	u0mbKyBhvDR0+OpfgEKaLNQdgzjIXn/MVnVKqryIF3CuBWsRD5th8C+SLyC1NQ7z0fl+uEMBSYw
	rDutPxCaQJAhWuRDLzfq6x/9g4TrPBlJwqG3ZYlQFp66Ps2IhGgwKB5vX+e39r+UUXuS/VSDBmD
	zNJ69XA1f8DrqnHe3wudIITyYHqEgKnlhAI1YvHQaZ2s=
X-Received: by 2002:a17:903:1904:b0:295:82c6:dac0 with SMTP id d9443c01a7336-29d68413cd5mr8817155ad.36.1764729762747;
        Tue, 02 Dec 2025 18:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEY2SiS+QBF7QKtw/pEjHFIt8JIlc/HL+2O1mJPHSLQoLHa0h6vRC4Ppc/gWKaD7Ghq5IpSA==
X-Received: by 2002:a17:903:1904:b0:295:82c6:dac0 with SMTP id d9443c01a7336-29d68413cd5mr8816915ad.36.1764729762292;
        Tue, 02 Dec 2025 18:42:42 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb4af8bsm167055845ad.81.2025.12.02.18.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 18:42:41 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swati.agarwal@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: lemans-evk: Add host mode support for USB1 controller
Date: Wed,  3 Dec 2025 08:12:10 +0530
Message-Id: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251128-swati-65461d354617
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764729121; l=3890; i=swati.agarwal@oss.qualcomm.com; s=20251128; h=from:subject:message-id; bh=n2Cwd/TAJaHTUELcbZYC9HaOKmoXe7I3p/aesU+TT9g=; b=6snyPJOSjzAamdMn3m+Whx9umo7OOBA92NNcDkTLOSvWMnGXPT/LcC/uIzYPidonijw7GzeAZ oyqidQKWb7GBM655cIyQNwjgnSdf/qlg3WYvWZOHeaRPt4SjMyPNuxV
X-Developer-Key: i=swati.agarwal@oss.qualcomm.com; a=ed25519; pk=CRv1JUBrT3lJEOqYA3Zf4ReTZUX1p56NJetptdDvO9w=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAxOSBTYWx0ZWRfX3rPJ/yogEV3Y
 xHTYhoWA4j5WFiFDRe0MbYKLRm7NzyUI5XRm5fZTgfWE8qlXZ2XVPyZ4hSdYY8ZwB2gUphR0oQf
 oI3hX4AVxtZVZOHHb/EsV7quf+FcQKJCFZOD8Merh0mnxwypHNwCnlgKQpR3K5JDbsFeyzpHaqf
 OtxokGxWOvyaGjhAZqV7DwgFUilDKqjdNP+qN3oDHyfrrzJRoTrDihC0j15eEl27dJa+ADvA2P4
 /sVdfnQhyJL/GTevBcPnVYlBKDVVhJXq3mJaF3Y02wvWZkxA7zxX1dQY0JoKZFg81Wpqd6eI2st
 3dTSXnOwdAbrtPOdtTvxCHD/vx0TvtqW/H2ynB9Nv5lqrF42bSaFCDjZAIMUZZdu5hfyDCf5417
 TlqHyze89JMsDhBEy6sIfUb5fbNwJA==
X-Authority-Analysis: v=2.4 cv=A7th/qWG c=1 sm=1 tr=0 ts=692fa3a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5NWFI8P5lWpHo6fsVrQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: fD46bdSMgFFe1Oir91RjG9AA9K7coODs
X-Proofpoint-GUID: fD46bdSMgFFe1Oir91RjG9AA9K7coODs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030019

Enable Host mode support for USB1 controller on EVK Platform.

For secondary USB Typec port, there is a genesys USB HUB sitting in between
SOC and HD3SS3220 Type-C port controller and SS lines run from the SoC
through the hub to the Port controller. Mark the second USB controller as
host only capable.

Added HD3SS3220 Type-C port controller along with Type-c connector for
controlling vbus supply.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
This patch depends on:
https://lore.kernel.org/all/20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 102 ++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 2536ebe36edbfd146e07d5698779767acff87ab4..07389593b3cd4728357255d47156c6861cbabb5e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -67,6 +67,34 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "dual";
+		power-role = "dual";
+
+		vbus-supply = <&vbus_supply_regulator_1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_hs_ep: endpoint {
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_47_in_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -140,6 +168,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_1: vbus-supply-regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_1";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -527,6 +565,36 @@ hd3ss3220_out_ep: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
+		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_id>, <&usb1_intr_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_47_in_ep: endpoint {
+					remote-endpoint = <&usb1_con_ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_47_out_ep: endpoint {
+				};
+			};
+		};
+	};
+
 };
 
 &i2c18 {
@@ -690,6 +758,14 @@ usb0_intr_state: usb0-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb1_intr_state: usb1-intr-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -849,6 +925,12 @@ usb_id: usb-id-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {
@@ -903,6 +985,26 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };

---
base-commit: 9371fd3173173c0e128e869ab7101bd971a36b1e
change-id: 20251128-swati-65461d354617

Best regards,
-- 
Swati Agarwal <swati.agarwal@oss.qualcomm.com>


