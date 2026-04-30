Return-Path: <linux-arm-msm+bounces-105377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBrtNNdl82ky2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 362594A4029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B02E302881C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E1E40B6FB;
	Thu, 30 Apr 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UB65K0mw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPi/abOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DF158535
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558852; cv=none; b=iov2JuhG7PKj/QkFbneVwUbkBfM7FwfYbmNPKWMHI/BO0sRMZ4QtIIw+owWTyVoVzERYoiUobfcGp2gtaEcyvYGPzqen1u3/p/X1sNsXWzI80UlauvBNY5aj7CCQNYJTI2WV5e8Db8Ssi3Qd8CAm2fXD7ES2t/X3jBOB/lJPhBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558852; c=relaxed/simple;
	bh=ylV3TuCPVKskmzdgXHVoBHI9m2SHCKprMb4v0qcQIT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fNxIstji/h7wfpukYRbv6/xWFuLTcK398mRD43w9IG5zy/wsNAenHUpWfUcsQc0mAunkghcHPPvbbbh7WkSTv8xwho/kVxnbDfpgd48dupe3Gz0eXGmHC2bPFgaOe2ooG3eUOgOprgqr5rKvWN8tPxde5pImY2HAzSjrgZzTnMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UB65K0mw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPi/abOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UADsaO007810
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dekvHp+VR67gHTc5/sW8T9
	bG0fmDifvtGTewZf2gTHk=; b=UB65K0mwAcaShHPv/bpH6XQBmuCFK6EOpKY4TY
	EyufFWUUdIcgMcP9NSHdc4ySGXhm3AHZe5jFb4vGO+ofAGtoRsbKDeCIxYiDxnlF
	1fI2d9vUt1GR9rx6Gle4PMH4FTF1OdEhoOKI6IFYp+7R1eWD7/XgCa7uHq+wcbly
	2Y94E898P7d014sDZZhjcT8+Hp/vIAOCWxzti3VDtZ4k3dcIENaCayQOui0ARNP4
	N2RIvpLQrf4VNMkhnnkvDSeHbxw4sIpTavICUeD3dRrazjiCQJVMHZrHaSdniWtY
	JXJWf4GUPrhoewEwkeU4FJo9hEs1dx+NpkFOlvL78P1B+RYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54w96mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:20:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so531563a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558848; x=1778163648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dekvHp+VR67gHTc5/sW8T9bG0fmDifvtGTewZf2gTHk=;
        b=hPi/abOzSZYRBHgYTnKYWMHNioMARCsp4La/6UdPNpv1xBdFohimuXM5Q+0kJ3SyOz
         4zWonFIExtj4CSERBlJQCBUWuul2TJWS3hLw5AMlHMfic0nC9HSTKI0Ck8I63kBYy0GC
         k0JHeVpBV3XxbirTB4xkdgIqxNXIH6NmIZk+jR913xTb9ojPOadzuQi18c0ayH+cPse7
         4pvFaNBqBIdKNG/KMWBpeR3CxQCIrPOfYyiSKbb23FHk42VpCbJNx1xRqyNPnrLwqL6I
         ihrdmnlr/R2gQiSItUs7NU/aA5IIGHdiFpdv43zvV1pPpdX1y/zw5wksMtYcuV4pTOdK
         w1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558848; x=1778163648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dekvHp+VR67gHTc5/sW8T9bG0fmDifvtGTewZf2gTHk=;
        b=a0obyWBg3bqtDU9UD2ilfUAsTuB08X3fEbVVOEjI7OoMVpG8NzghfMzEfM9n5KUz8F
         ZCbOOOcbA9+OaNMRYIW6ykM1h1AnJ5VEsgL7B4f2Wjc8xA3fQTTwIU3nW56c4CR5Wt5/
         Qt6CSSPqZOio8jhJpKQV6qgEZ+y7wwGJk0OQegLA/XzaBbIDDXhn3VsA9eMV5tbie3ed
         vdxQ9Lg1Q2pBu7PrwDHirQ+uUm4cHwUZi1bzxeu7XDPjeBGMf/iCcXA8qFNwgbnNpS+g
         6GlvWsqnhIFR0DdUNhGjCiYROnIWOfvjdYoc3V0rT/kdVxlYmsYUrbqF8PalwOzy8pIL
         oW/Q==
X-Gm-Message-State: AOJu0YxExSiP+VLrKOyfKxHZHaBr1GNpCPuGTnU0uIldBZ/uqQ8DQfww
	OZZ5CjmZqrOgsX175D0H4F2vS6FNPsKMA9trZFzjBxktdT/fbz+eA9/plht7AAfaNncQBEvjD5s
	sEXcFzScknB90y3qZIVzdE/l9C8Fi5lfoU8uRWe1U2COM6YfIS/7bhABsgO+9hrWLOiW3
X-Gm-Gg: AeBDietYqv902UqicpDdAR+INzdFgE8o7afp04DEgY/NNGCzQI6ysI5LiygOmJHJSYJ
	ImwG+bDRfmJNUEZFKsPTdeaMnQbxs6REvS2ggSNFl79wKXDmmINxXPV2BCRFS0xCFoQKaZEHwb+
	AeQ0h43FJjb+c4w2nzxyQ8kMfzzdtIThIGB81MRS2kEFVa7llTfmkg3UNwFP4q1lece53STJQEJ
	ABry3DNgb6x8P/0mlFvCGmO8q93cNaaGmhFl4K8cZJ1f4GiK69unU8mXK2dGdsugjdba7hmn7U0
	FuJv5af+JP5m2yDjiQZMnCCeTwrYAex+hAMD//+SVJ+P6NWiz1oMNysWeFTr6YmCt7DDgqIprjt
	4E/QFSeHA53J4WBrNSidfdODF5xGTDLrP8/F0qHgM3sgzdWQw3Pa5A0393nbXeb1veA==
X-Received: by 2002:a05:6a20:918a:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a3d1c9e209mr2672106637.4.1777558848154;
        Thu, 30 Apr 2026 07:20:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:918a:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a3d1c9e209mr2672054637.4.1777558847520;
        Thu, 30 Apr 2026 07:20:47 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5ccb05sm6024073b3a.15.2026.04.30.07.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:20:46 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: monaco-evk: Enable primary USB controller in host mode
Date: Thu, 30 Apr 2026 19:50:00 +0530
Message-Id: <20260430142000.3707614-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WudKjPtYfxJ1vXFze5p2ONcqz-QOpPpn
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f36541 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8yLi3zvD0uxwaS-m9nYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: WudKjPtYfxJ1vXFze5p2ONcqz-QOpPpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NyBTYWx0ZWRfX8oyjEISZDzjZ
 VejEAo6Uc1WQcPQZsqVCQv4XOrCF+DwcuICjGKWa7AfbctCQnH+TQf4BW2aUWq3Dewd8SX6J6k6
 30vflLJ2j6s4j4Anq2ekfVesHPhWWFu98z4dbkwy0xawxTJWDtcQqB8Y9iOq31eYHfZ+O5tjeWi
 vTjf+BURxdxUA/EO8KBaddRIqsvw+NjENy4pFSBnvk5FYsmFssKFe2MprcrcEOk93otr/Id38BZ
 CxaNyPWh3YB363/+GA35BzEYFkdeBaMe91ROqqi3ycMosDMymZlbSBiGiuoE7Wya/MvjlYk1Ecy
 cHvAaMuGoO2FMPaP+fH2HJpanoOBRvQdUQqPw39FCrgrUoeAiDU1mbUoh5assxnxYSXuL+Mzyi7
 w/smp5eEe2RJUKj8QSxeDrn9TV8mKlyJI1OIhzytl+UraSOm5R0Ot13lpBzR4gUrx4ll5hAydKx
 gM3oQVh20tgwq8WoQnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300147
X-Rspamd-Queue-Id: 362594A4029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-105377-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	RCVD_COUNT_SEVEN(0.00)[7]

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

In hardware, DIP switches are present to select between USB0 and USB1 ports
for the primary Type‑C USB controller. By default, the switches are in
the OFF state, selecting the USB0 port. Add software support for both HS
and SS switches to eliminate the need for manually changing the DIP switch
position for USB1 operation. Add a USB1 hub reset pin to reset and activate
the hub after boot, ensuring proper detection from its pre‑boot inactive
state.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v2:
Split DT binding and DT patch.
Use gpio hog instead of pinctrl for usb hub reset and HS switch sel.

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/

This patch depends on:
https://lore.kernel.org/all/20260427170505.1494703-1-umang.chheda@oss.qualcomm.com/
---
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 166 +++++++++++++++++-
 1 file changed, 165 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
index 12c847c03757..2d4ef8666822 100644
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
@@ -556,6 +629,12 @@ expander5: gpio@3d {
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander5_int>;
 		pinctrl-names = "default";
+
+		usb1_ss_sel_switch_hog: usb1-ss-sel-switch-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	expander6: gpio@3e {
@@ -742,6 +821,24 @@ expander5_int: expander5-int-state {
 		bias-pull-up;
 	};
 
+	usb1_hub_reset_hog: usb1-hub-reset-hog {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	usb1_hs_sel_switch_hog: usb1-hs-sel-switch-hog {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+
 	expander1_int: expander1-int-state {
 		pins = "gpio16";
 		function = "gpio";
@@ -784,6 +881,13 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
+	usb1_intr: usb1-intr-state {
+		pins = "gpio45";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+
 	expander6_int:  expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
@@ -863,9 +967,69 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
 
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


