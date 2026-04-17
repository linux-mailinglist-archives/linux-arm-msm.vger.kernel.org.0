Return-Path: <linux-arm-msm+bounces-103546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBgENhtQ4mnx4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:22:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA541C85A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FC2F303DAAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCC22F260C;
	Fri, 17 Apr 2026 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iACiFt+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkPqhne4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABDE2E7179
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439225; cv=none; b=fxPhOmEfeDSiHweg+Sby0vVfakIxXNUipjYUJlP6Lc861rcw/kbL4s2s6Ueb+FrZ+i8H39t7/fWYc7AmCvP9UPSro3W3PyLHeadBwLc/dCCfpOBReRPITAFLw0+BkdQG5uTBAFnAUnfmcg0eo5aWK/D3WaDPnVFE2hXOeCefLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439225; c=relaxed/simple;
	bh=a+WFpFLZBsaqzg12XI/jkp56yPXr8RkKvea/iafe0U4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e/HE434YIhylOuB68TYOq9SAaVLrMYfKYHUyiOZnqy6MUOiPKly9fr27zNXIFd03N2Xq/silJZn8e5/H64X66yGGZtR5zzAOhoYhRgF3+hXZCDqOJidMjizRFDwaW031EM88F4xwctHaHoLNakWZsZG2P+DAaWttklY2ERmiKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iACiFt+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkPqhne4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H9wvf61323861
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=06tNW4cbqK3OdZ2r2WgitT
	1IYug+KY06HCOgPE4ReZ0=; b=iACiFt+IQ4yvCMbk3D5uQT80Q7FwpC3I8/NJWj
	2U3sc5GQF7Nj22aWcWobHETi1IuwqzvqjBYX2HgNZxMTTbD4Awqq7h6KFEkTfx0r
	ljJW2HyAYkF+l1GU7GcOIoRE+7UPLTQv3GH5wpwJkZV8XaeHXmRQYGEQ1bJljnse
	f/mkpprlzG4SgRDfc9jt9AeR66KrVW0gViIlyezVyqMGxwLwfJ0SzLPr7xE7UIxZ
	KH7aHew+D1WmZVjr0li71x6CABv0uDQdc5jFLAtCwNLz9hj6uU4P33WoDOFseWOq
	D+7hUD2QLtTr1Lr/UmksRcesYW0qUY08R6pW+WNVWJiJPrKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy29m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:20:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso8457895ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439223; x=1777044023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06tNW4cbqK3OdZ2r2WgitT1IYug+KY06HCOgPE4ReZ0=;
        b=SkPqhne4uqmXZmFQY5RdK6b+vlpAkkp7Bcd6SDI6Lf5thFsBxBNeLz7R0RzmbvjLID
         U888Lv6A/ciFtymU6xFrXstVAmCDAj8a2m4sacdfzAn9Le89twsbRHD+1Lgs1il+rIXy
         YPyYAgBjWcpka8v3lvDD5ZnkNn4hV5FIWvzdZaTSdzwK8mAd8HwMx4ivciZUXaHQSH3Y
         Gv7nn4wTeuz5Ei9lsyTVXM2Vu4wYHLs+wHtLjcNHJDlkqt526F4tCLhYUaTGzx02jp8J
         kcD5IJq53TPEOf25E6VRwu2h4MmeZvnlz2mAXhnOf9g5GmlvfgPMJlycWjW8Ock/sS3p
         t1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439223; x=1777044023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06tNW4cbqK3OdZ2r2WgitT1IYug+KY06HCOgPE4ReZ0=;
        b=bAvGR8HW/BxBZ+2DI/HoA0625+J5b0G7fZlWqDXeMJxMbgJGBtuZG5fYZgErnCFS2M
         eVryN7d6jVbs/mABUbfX6Rm7aPGWkzfkXd9EpUjcOMC33cbejojc/+BMniRwR204D8L4
         Af0FuZD8lV6kWPIyeH2nvmcqG+ARML2zlB9/gE6zf+wG96mUdPbIwCvJ3JIMOb5FmoPj
         r5JoSkori3Dv6CC8hslBcszMMjCVMgslZK+88dDXvH2yXb80IObhaimVwVIsSwXsHziN
         2HNg6kVLnypMvTk8BY7TXu8qIpQX/EreKvXGtUlh9UpHfnUnKrEdlNPEyOrFG1jTCIPJ
         XNNQ==
X-Gm-Message-State: AOJu0YxecGiLNK9dsTclQ1gx5tVe8O4LUhFpPHH1J64KhBUdkoAJaVTr
	jWqgoPIvimWvOkeD5zyLiJqVSPbsTCfy333Bgu15af8oIaqWCvHdLCmC+/E47JvobPeD5VRAWMp
	BJHwFvfiiplcUhYX+CIqItero8PtSID/AhDYhSSI13bAJcgaV2fVYJMvDSlDUn2JCg+i+
X-Gm-Gg: AeBDieuwzj0sEdqaunHiaKiJteC8EIWlLWFt6JXeIIgQv42eEumuBQLka8f1Q7Z69wO
	v+kYdSMk1XZB9CAl51c5Miln5pJcpOiIRV61LdDo8p1DJWZlgyZ9LrvmbDTgTe2Ve4iRBFvh5vR
	IOpqjMhmbx61dfzKEqm7kYsaWUa5QuSyUYgLX7pyMy5wEF+AKe0U2hCFC6V2gZtf3MOEX2lE6dc
	I1WBIwFCW2jYck3P17vGePmcfiijk6NnKPerZRBdAcxGlzOWm1mqdAAj7cHPRFHkEJqTm27EWmY
	kogaDlb5VrbAHXToJDcGaptG8hS8I9/GRV/I3rNLUln/zicaAuLiqVfQiLtWeGoztjgWP+UBZgb
	ehSlFHjbxcj2QHFLlutQsZWyZPEU/MmbeMxPieyGR0SaX9T/sR1wqBEs+znP5mRK2AQ==
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr24678205ad.28.1776439222561;
        Fri, 17 Apr 2026 08:20:22 -0700 (PDT)
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr24677855ad.28.1776439221995;
        Fri, 17 Apr 2026 08:20:21 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm23491605ad.9.2026.04.17.08.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:20:21 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB controller in host mode
Date: Fri, 17 Apr 2026 20:50:14 +0530
Message-Id: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dtC494XLYM1kN2meWiVCb1O-weWe5RED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfX36yuJ8LAvgCI
 GoCTjxFNO/mNcVid1VkgLkTxx+urb4AzF5keSRyUDJ3TzJfYg+gv5pxJMq2ZiXCxfYUqaSV1kNH
 ZHElUR/i+pTtpBTJXuqMHVPKu44Lld8svHYBeVi+XQPL4ztmahQ3OSKdSl85q8MnNYtuoKxQTql
 jSQR+Uo/nJbLD1iWYl0BGVh/L+ASpRy5BWwiTymEREz/b7NnDNDSH21Jc8LFqkjy/87xyEDDwpD
 RXxq6cO3Wvt97PqkQNiEY39i8bD98g1kghR6q+Sbqsl9pG2OKSWafE9JV6xn30UTFOTzyUKuaJT
 Y652Ic6jmOfRU9xpIZKH2CU1kggOc1e5qdetNcTvSvG3K36Sj280kQb95Ip4eBMzZdUksmEJlrr
 a2+9QDJN33MoP/hkAZ9+/BRqjp2tVqkdMsX+tLMsHPMDBrHEdcX/h0WOjmwt4IHY3GtfzflV6TR
 bFIzdTIqQkF1ZRDgy9A==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e24fb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MCf0qIOZ10eql2xmLHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dtC494XLYM1kN2meWiVCb1O-weWe5RED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103546-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.4:email,0.0.0.47:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4DA541C85A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable primary USB controller in host mode on monaco EVK Platform.

Primary USB controller is connected to a Genesys Logic USB HUB GL3590
having 4 ports. The ports of hub that are present on lemans EVK standalone
board are used as follows:-
1) port-1 is connected to HD3SS3220 Type-C port controller.
2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
for Bluetooth. This port is to be used only if user optionally replaces the
WiFi card with the NFA765 chip which uses USB for Bluetooth.

Remaining 2 ports will become functional when the interface plus mezzanine
board is stacked on top of corekit:

3) port-2 is connected to another hub which is present on the mezz through
which 4 type-A ports are connected.
4) port-3 is used for the M.2 B key for a 5G card when the mezz is
connected.

Primary USB Controller
          ↓
GL3590 USB Hub (4 ports)
    |
    |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
    |
    |-- Port 2 → Mezzanine USB Hub (when mezz attached)
    |
    |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
    |
    |-- Port 4 → M.2 E‑Key Slot
                         (Default: BT via UART;
                          USB only if NFA765 module is installed)

Mark the primary USB controller as host only capable and add the HD3SS3220
Type-C port controller along with Type-c connector for controlling vbus
supply.

In hardware, there are dip switches provided to operate between USB1 port 0
and port 1 for primary Type-C USB controller. By default, switches will be
off operating at USB0 port. After bootup to HLOS, it will be operated in
USB1 port. Added support in the software for both HS and SS switches as
usb1_hs_sel_switch and usb1_ss_sel_switch to avoid manually changing the
dip switch position for USB1 port to function. Also, added usb1_hub_reset
pin for USB1 hub to get detected after bootup as USB1 hub will be in
inactive state before bootup.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 173 +++++++++++++++++-
 1 file changed, 172 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
index 12c847c03757..6316a8270f57 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
@@ -23,6 +23,37 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "host";
+		power-role = "source";
+
+		vbus-supply = <&usb1_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_hs_ep: endpoint {
+					remote-endpoint = <&usb_hub_2_1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_1_in_ep>;
+				};
+
+			};
+		};
+	};
+
 	connector-2 {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		label = "micro-USB";
@@ -77,6 +108,15 @@ dp1_connector_in: endpoint {
 		};
 	};
 
+	usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	usb2_vbus: regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb2_vbus";
@@ -445,6 +485,39 @@ lt8713sx_dp1_out: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		interrupts-extended = <&tlmm 45 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 13 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_1_in_ep: endpoint {
+					remote-endpoint = <&usb1_con_ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_1_out_ep: endpoint {
+					remote-endpoint = <&usb_hub_3_1>;
+				};
+			};
+		};
+	};
 };
 
 &i2c1 {
@@ -556,6 +629,13 @@ expander5: gpio@3d {
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander5_int>;
 		pinctrl-names = "default";
+
+		gpio5-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "usb1_ss_sel_switch";
+		};
 	};
 
 	expander6: gpio@3e {
@@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
 		bias-pull-up;
 	};
 
+	usb1_hub_reset: usb1-hub-reset-state {
+		pins = "gpio7";
+		function = "gpio";
+		output-enable;
+		output-high;
+		bias-disable;
+	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	usb1_hs_sel_switch: usb1-hs-sel-switch-state {
+		pins = "gpio14";
+		function = "gpio";
+		output-enable;
+		output-high;
+		bias-disable;
+	};
+
 	expander1_int: expander1-int-state {
 		pins = "gpio16";
 		function = "gpio";
@@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
+	usb1_intr: usb1-intr-state {
+		pins = "gpio45";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	expander6_int:  expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
@@ -863,9 +971,72 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_hub_reset &usb1_hs_sel_switch>;
 
 	status = "okay";
+
+	usb_hub_2_x: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+
+		peer-hub = <&usb_hub_3_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&usb1_con_hs_ep>;
+				};
+			};
+
+			/*
+			 * Port-4 is connected to M.2 E key connector on corekit.
+			 */
+			port@4 {
+				reg = <4>;
+
+				usb_hub_2_4: endpoint {
+				};
+			};
+		};
+	};
+
+	usb_hub_3_x: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+
+		peer-hub = <&usb_hub_2_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_3_1: endpoint {
+					remote-endpoint = <&hd3ss3220_1_out_ep>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_3_4: endpoint {
+				};
+			};
+		};
+	};
 };
 
 &usb_1_hsphy {
-- 
2.34.1


