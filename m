Return-Path: <linux-arm-msm+bounces-92394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLV8IbaaimlsMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:40:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8A116609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF0E9302B53A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E912E2E06ED;
	Tue, 10 Feb 2026 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOKs0GJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C42765C4;
	Tue, 10 Feb 2026 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691249; cv=none; b=fZxFZG6nEAg33RNszPtFXcyTRYs0xKc27eLCSpcxx4eY4LO0w9wTRnb3BCQ51/tMzcQyAFLZ0w52gQwlb7OE3bHPg4LWsUVzIGSk53X5QlTeU/66i+H4CHm8EOtWX7vaUrR/UiWQ85lYtSKtz9nkpW6NfeeSwKZTPHaRrJ409GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691249; c=relaxed/simple;
	bh=EWVrmiGP1Ta1dxnMlhbD/c18JLRdG5zqf71p7WG9vJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XiI9xxgouh37kgT8gFIYE0Q2r0/ExZRoUHlcgp41/rsPi2NH1VqfxixFaG5+YDuUtAydQtLq5uuA9kCwLV87+hMfGy4axN+f48MSbi+t/2bbuDW/SxTcpeLcA2vo3I9Fyxe+e2Mo1RMsGH4P72mNRDx83qG/G/s2g/QB9e4WrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOKs0GJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619M1oav3081419;
	Tue, 10 Feb 2026 02:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xx2W3DUhT0sZ1ENsQ1QLhtBAsn8pP+D3ve0
	OWVm35Hg=; b=UOKs0GJtkBQVrbqt55QUoK0r2m3JWTxXISNXp4fdq5Jhx8IYF+1
	UOrVgs3BpgDS0WZLPu7AG85KciA2aJPK9faWOatHOTlKcF/Zoj59YtrgGXacSAMC
	c03Ax8vAeXti35aMRhP6WIRKzoamoRH6ocAmHSA2dZAM3rFA3r2ZGjbCWHpZl+oz
	C3+Sr0DvhEi3umf6ttiANdP+jD9PLQYo39FF3Z9ZH+TeEsZvJpReIHXOFBkL9SfF
	JKc2pEb+F7E+tL1dmG3NyzABmyUO9oSWM3RKUnJ2Dczy4gtyqINVG3lsn+xVArjo
	nt3l8D3R35sIbbF/5X33Gs8YrnCbYCqGFWw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7gauactv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 02:40:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61A2efKU011894;
	Tue, 10 Feb 2026 02:40:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4c5xfmh0rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 02:40:41 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61A2efqk011888;
	Tue, 10 Feb 2026 02:40:41 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 61A2ee0u011877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 02:40:41 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id EB9F522BA1; Tue, 10 Feb 2026 10:40:39 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support
Date: Tue, 10 Feb 2026 10:40:37 +0800
Message-Id: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OYLrEaXPB2q1wnCsr3BnN4ml2gM2S2Nc
X-Authority-Analysis: v=2.4 cv=eP4eTXp1 c=1 sm=1 tr=0 ts=698a9aad cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=omMfa-84sFiCIu6eK1wA:9
X-Proofpoint-GUID: OYLrEaXPB2q1wnCsr3BnN4ml2gM2S2Nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyMSBTYWx0ZWRfXxTXMffAYcB05
 P8wDCSi9F02eAj/VLnkSuiROB+7VyyeBF/kkTlPP4XXdmccB+DK7VAkKW0FpQQaTd2oTrrvYP1Q
 06ZzD1p9MQVIWe9hNjRq6k+q7prS69WqVI/MmmhWYLN93MWpt1iuRLqM8xTlFd0fPPS3cwFxxXy
 amQd0tQYQTup6W3C/AfFsrEjHMN6YZXQTACx1Ax+EEL7NqHstlHF9t0ACrBH6bTHAXj2CM35kX3
 i4kwun0MT0iwEZ9lsjlvaMTgwus7LIxtdg7fqOGIpZzOySh+CLn8jLWb8UyoI+O/bEUf7NksE1d
 naS5yueZec1PCNegsHw2hJ5CedLCbfLRCHLEqyqaLJv2hx13Dwx894kreTP1CWo3fxw7XHmekx6
 VXdGHSQgAtEjmKBrMZGJclkWubjPlzrvHEFLVyzJfKpxrn4h4ytuBq7XvL6+pPeBY3xCoOSr5Kt
 epA1okavMh5LwkCauhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100021
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92394-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 04A8A116609
X-Rspamd-Action: no action

The hamoa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
the sound card from exposing these playback paths. Add the missing links
to enable audio output on both DP interfaces.

---
Changelog:

v2:
  - Changed commit message to explain motivation
  - Removed redundant sound-name-prefix properties for DP0/DP1, since these
    are already defined in the SoC DTSI.
  - v1-link: https://lore.kernel.org/all/20260209091139.622756-1-le.qi@oss.qualcomm.com/

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 2390648a248f..4428c8f45493 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -616,6 +616,38 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp0-dai-link {
+			link-name = "DP0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		dp1-dai-link {
+			link-name = "DP1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	usb-1-ss0-sbu-mux {
-- 
2.34.1


