Return-Path: <linux-arm-msm+bounces-92236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJmnK+akiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:12:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A110D646
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AC583001039
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68054344D8C;
	Mon,  9 Feb 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lgz1Ov5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1423A344D82;
	Mon,  9 Feb 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628313; cv=none; b=Kk+hTcBa+CnYeyPsgvevHndcSzGyG8P9GIq53QFi1tvXYs8pgJpLh7BvFQY3k5Q8ENq0//na1CxTt0v/luY//RwtSdBvurxMtj52pi0moneIoQpku1xi6FuVVJNjvUxQig2AJf2XL6bWRbPDUctsBkdvHzsRpZULd5ZMUhdWGAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628313; c=relaxed/simple;
	bh=vEh1U0ZX//KtB9WjS8xBOcIxUuoGp00mep4hoKolQCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RjpQ3cw33V8SHdrQWk3eIPAQllu7iW+cAdPhZyBIm6LWMuIrbuVAvwL3lTq8KcZTmyj52RgIo50Ig9l7bsGgZLA7rnamO0kKLgaa2Ugd0u0fnNtGQNyqkiHrsS8DcDLg3uNS6ULh7/xWo+pU9/ndd0/doa+HwlcWxHzB4ua9U6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgz1Ov5c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194T35s2599731;
	Mon, 9 Feb 2026 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xv5fOLNe5UwU1iNEU4BFmv2n0Wu0I7AkZt+
	KpFOjBNI=; b=Lgz1Ov5ctNZKHXjTb8a6KiiV1oHuk9xWUiCXTnspUwXQoKxA1vj
	2g2TfS5xKwOOLQoO22WVw0zb45pxYCBWj0ueMGti0OPEcFAYu5jO/F22k7xsIWUk
	/9HGHVyUuf+cILokRuNVxUi4lhv7GnrO62cJBgKMs7GekGQrawhLAtPASf8kSS+k
	cKMrrjoZxIfinlXXtEGCBNanjbAecK9hb7mB4c1cwiCUu4AbGFG19dwFPmcc0Pn/
	zdTkdVVBCNmnW+bG7ZSUfvs4PKwxnIGuazNqoO1IrDoJLgok+kEFvz28AKDSLAwA
	d5oDf3gGFIEuRgT+uFjEd/VhDhuvy+SehKw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78kh0w1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 09:11:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6199Bkh8018377;
	Mon, 9 Feb 2026 09:11:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4c5xfmara0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 09:11:46 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6199Bk2V018370;
	Mon, 9 Feb 2026 09:11:46 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6199BjQ8018368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 09:11:46 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 563EF22BA9; Mon,  9 Feb 2026 17:11:44 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio DAI links
Date: Mon,  9 Feb 2026 17:11:39 +0800
Message-Id: <20260209091139.622756-1-le.qi@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=6989a4d5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=VBQhRQNOqmZIPPVlxasA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NiBTYWx0ZWRfX6wAxsnzjY695
 PEQOk/dig9AiHBxj+1VKuBa2NoexGhog7O2t9RbyXz6rcANbXopMXGcBTGD2+bKO25+ZiJEgtgG
 MU0QGqm9bGnS5CCSjdxrYJQdLF+Q3CzZdeAIj24Gz/JswlcEx0FYGCP4+lYPYXO3HmVbhCQ78Oy
 jzQt/MdXcnbgyOZXh5nu93pLmC1Hnyrf43J2DQ862HnfnMdW9YYIFnPR4NerGQFHyKVWWp3FoyL
 woa35VUIzC+lY8RjKrBNsLhgFnn/VokewNSsu15PpQDDvD49XtU6//BjXvGzsTImRC0UkGeHplE
 Ez7vRP5WQDEgn0WSnNpkOfYkJ+N5007Mf5XqNDMEB4PrfBOzQKTTIgyppmQa5S21G6zG3j446Gu
 DmemY/nL9yHqEPFFzqRvgd0yxfz1BitR+CqSrVUBGeAf0OpbxBZ1UawMpRgevkXg/Gd9ZVkKdpB
 70w5klD2zbXAwoHCWTQ==
X-Proofpoint-GUID: jbo4rgr86GL75TV-Qjs2iJ9zbG2d5hRo
X-Proofpoint-ORIG-GUID: jbo4rgr86GL75TV-Qjs2iJ9zbG2d5hRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92236-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2D1A110D646
X-Rspamd-Action: no action

Add DAI links for DP0 and DP1 playback and set sound-name-prefix
for both DisplayPort endpoints in the hamoa-evk DTS.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 2390648a248f..821e754ed537 100644
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
@@ -902,6 +934,7 @@ &mdss {
 
 &mdss_dp0 {
 	status = "okay";
+	sound-name-prefix = "Display Port0";
 };
 
 &mdss_dp0_out {
@@ -910,6 +943,7 @@ &mdss_dp0_out {
 
 &mdss_dp1 {
 	status = "okay";
+	sound-name-prefix = "Display Port1";
 };
 
 &mdss_dp1_out {
-- 
2.34.1


