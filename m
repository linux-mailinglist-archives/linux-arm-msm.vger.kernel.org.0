Return-Path: <linux-arm-msm+bounces-115582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gn7uHEW0RGrqzAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:31:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EBD6EA3CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kI9pmI00;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115582-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115582-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 738543015C07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 06:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EED3AA1A6;
	Wed,  1 Jul 2026 06:31:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F541376483;
	Wed,  1 Jul 2026 06:31:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887490; cv=none; b=WBJsxYKRyp0xFIhH0mXU3uzHH857IAJmu9VBTmwgGwtjNeUgJF2ebM2dml0j5DBF6ijhibL7ZoPgg1IyvvSNLwaWoUx6ugvkcGfbvFaF1Z8NlJfp181b+EEjDNWVIlvf4/xLRBHwMfq9eQaEFRkJvwYXGEIe9FgqGGHJvN+SMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887490; c=relaxed/simple;
	bh=exxebpZlsCCvHGvN/i6sD/LZDTNyC0j3gNPrZ5fnghA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SfW8RquaTRIES8vLsYuvecIwWgcIkKPIYXy21pe+zU0yIQMjG8ux+k3LPhi03MVW0DPvsVTxBKPk5I0jHX1BbQjg3YHY/LJ74zTmSKZaVPuiGuwZfoIgAhJXL45uZ2IDjj39YXQxgPpbwuFWhhf17kRQ6uA61u7xnWw2qsZYy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kI9pmI00; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lHKM138672;
	Wed, 1 Jul 2026 06:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fk6JxPZrkj7j3eYCzFyi6uLYp+Xu4ukhyl+
	Y+e7DgXo=; b=kI9pmI00lukGS0Q5GWDT2DSctFWOUHdfKYAmgJUbC2ysrh+xKB1
	Z6xqhcwDWB3YGkQ9DISOc+FRX0WYh34yofP0wR2+UdIbSjo12ugUBGW24Egy3hOO
	BCdybWHvE4p59c100vtiDB65yoZSas0K1/L/Euup6c9ovC3S43w7iPwTEVjz+8K0
	ShMRhlWvDvEvhp0fBiOoDxjfH/trMYKorsHnQys/sWOS7knSIGqAG3RBTjDr2G6j
	yXw6q3ev1e7513CL+3QeDlJOtAGaTzL8neXZG5DrfFzqfCyrgruwSRwBTJBLLOHG
	y+sR6YRJY02nbo0fGh4xkISQEMRc5lDWn4A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw2cv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 06:31:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6616VOFX017064;
	Wed, 1 Jul 2026 06:31:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjd6es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 06:31:24 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6616VO2P017057;
	Wed, 1 Jul 2026 06:31:24 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6616VOpY017051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 06:31:24 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id EB84F21050; Wed,  1 Jul 2026 14:31:22 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: purwa-evk: add DP0/DP1 audio playback support
Date: Wed,  1 Jul 2026 14:30:03 +0800
Message-Id: <20260701063003.3082899-1-le.qi@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44b43e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2uFHOZSe59OOhszJ9qQA:9
X-Proofpoint-ORIG-GUID: _Znkmv2qcWl9KUOVQLjWGxOrkSVzuXj9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NSBTYWx0ZWRfX0xhoq1DVdjEl
 kDQB/Ct0kH7PR7wXhSRYOxChkfmvNFrt57OIKlmKVBH5dDa+M9xKVZliR0W+zYhCW5KsKRsXuVJ
 CVQiJn4jlaUcofw8+F7D6xZM3uTg44A=
X-Proofpoint-GUID: _Znkmv2qcWl9KUOVQLjWGxOrkSVzuXj9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NSBTYWx0ZWRfXzL1TGSftbNio
 JpMnGi84pACsFTsPByDAI7vGkOhRGO7hyxbJKGwRpog6QuBKfhBdc/dUnB7OVLTBEE19XV7uTBt
 fSuRwGNd1FbA38wjLSeO50Z1SJu/KZ2vLZ5XV5Clk5gQj2L2zD0AOBfK/EsktaYlE8aeO4ezqge
 IO7KepzltE1EdLr9B1PiloU0o7kWob3bTRHG2nsL9qKqrAxC7HdjYiK3kEENSRvNqlnEIK8h/js
 yhnglNGPnKOkslEydTvnkeozVCm6jVEh8s/xFgK+yMBEO+CG+I9xO2U+SFg4+tODFK6e+LHnSFA
 4Okiv/JKuIzhq3DFf8zR4BxbYkaLCvDBW33iUehSmCZ1V3iVnGUDFQxouMVW1RktYvHfip8Imn6
 UP4mkEDBbYUhx7XETn8inyTHdZdjGGwAdm4Ky4mvPFBpY4t1juioOHKrmlC0GVFMuf3JCcVY0eP
 8KyXO1VWNFY0yobY/hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115582-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@oss.qualcomm.com,m:le.qi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03EBD6EA3CE

The purwa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
the sound card from exposing these playback paths. Add the missing links
to enable audio output on both DP interfaces.

This change follows the same approach as the fix for hamoa-evk.

Link: https://lore.kernel.org/all/20260210024037.3719191-1-le.qi@oss.qualcomm.com/
Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..7f1f6ad477c6 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
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
 
 	wcn7850-pmu {
-- 
2.34.1


