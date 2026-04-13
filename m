Return-Path: <linux-arm-msm+bounces-102870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE2QAApz3Gn1RAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:37:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E83E74DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8707D3007E01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 04:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFA22D063E;
	Mon, 13 Apr 2026 04:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMsdj71n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24A40DFD5;
	Mon, 13 Apr 2026 04:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776055044; cv=none; b=nSJixZmofrPAeHP3EV2fpe4BVt1Qbp1MNux4beuQYj5BnSbzQbNLPnxzzOFlputRLIplrPb8ngZM8twO+obeY1xPf6GmSdij3d0PxDO6JgZTgKnP2S/fw9SNCoqyBnZXobm49cWLQ16vePol4umsagJjBXQgq5Z0U2xFFZcRl0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776055044; c=relaxed/simple;
	bh=u8olDRAn+hl0hJ5Z1mDghlaD5HAs5h5t5DJwPvfPy/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZktS2EI4Ca2dAax7xP6GV0Vf8fIPVeDzrT0CxrZojOPybgTVi2kGsTIXF1vXtP74YFAXpnZMCglwlV6rU4vSUgXdmhSpvnfpO6EH0tDifuG9a/+IOoMmHYeMoVsiMBTYz7qpePabMqINv2l7FwLxZWji+ykZ3qTbgAXUlILZGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMsdj71n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CLLhXO370987;
	Mon, 13 Apr 2026 04:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=14x57Xoq7vInBfNcDrCeYK+uyMrJyTwhQQh
	pVMXu+0Y=; b=iMsdj71n5yU0vp0gYytHCR14qGaGxrc5Fhi4DUolQVQtbqS/c+r
	AiHcc7Ds5lFvPDbk/vba8ODk+2mltBcRm0Kdue6DngbqfSP+oq+wIzhh6/Eete5c
	rStk889JCtLzQvsMyux0LJFPdLGKISXjnIQPCtGt7dbDnzdUlhtdRuoJ/BpzSkBe
	2WihcwFd2SJOi8M30ln1uizJ5pEaLA2R5dMR4CTBuzwtXwzentyBg/FItq674Nyi
	TqI+4OaDPOUiB0wH+Qv+h3gzVanW2emEUVbqedoPLlAlcpZzkBDWR/N43/naVoUq
	LMtZThpDY58Cyyuy/uvZetP/QHO3JWyJgnA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhun2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 04:37:20 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63D4bJ6x020456;
	Mon, 13 Apr 2026 04:37:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4dg5gqqd5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 04:37:19 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63D4bJ91020357;
	Mon, 13 Apr 2026 04:37:19 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 63D4bJh0020226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 04:37:19 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id 1B0B36B0; Sun, 12 Apr 2026 21:37:19 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: lemans: Enable DISPLAY-PORT
Date: Sun, 12 Apr 2026 21:37:13 -0700
Message-Id: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA0MSBTYWx0ZWRfXy28nrRt+gDnJ
 LmhQZ8jqtV8e4HbgrbQbvFpHFRoQvdHgcctQdPSO5fBOVVL6g+FpW2V8HF6UNSRJ/CERdjr23TG
 7JutKD/TGB1uLKldAIAwl/qdCUhp4TsaUvFG+vU3EbFmGh1o0pidskNIOnlI7W2ilM0iIGzG5V5
 KcYWhHh2+Gv/UpShJsElFO4/GT3yWHy4Y0zZGLKJvYmRLJO8aE9iSFYiyNqsJ3Y+94U84z3YxVA
 KVTRrVb6J+n/v/601Wwh5cvbIBCothkZybd5PrYCpTpxVGah3oTdu+gtZpWDwddo1eemHMpbyQ2
 W6XCwy7rnfOrjy+JUdpu4YOBInYCBwUyeP/vQqv40w1dAAVbyw830TKxjjdhS2F8gvvVMifvxEK
 P3QuiNMc8VlDQpBGdvvmi4O8TS6kOnGtS7G7gJkIulgwQaocjuntlD7IcN5Cuvbv43m+Hip6DUp
 Ocm+505goUkIzqplDlw==
X-Proofpoint-ORIG-GUID: 01GAHORaMxHXcuXD4nxvkEk1SrIIGeyw
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dc7300 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=A_ssk2uQ36vgysvW6AMA:9
X-Proofpoint-GUID: 01GAHORaMxHXcuXD4nxvkEk1SrIIGeyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130041
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102870-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 416E83E74DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add dailinks for DISPLAY-PORT to enable audio functionality
on edp0.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..daed18b1e6f5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -130,6 +130,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss0_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vbus_supply_regulator_0: regulator-vbus-supply-0 {
-- 
2.34.1


