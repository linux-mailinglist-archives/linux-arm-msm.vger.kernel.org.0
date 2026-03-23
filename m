Return-Path: <linux-arm-msm+bounces-99187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PujIVAXwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:34:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1E2F02C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F17783023794
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8BF38B7B4;
	Mon, 23 Mar 2026 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LKoctHhn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8E2BEC3F;
	Mon, 23 Mar 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261372; cv=none; b=iwvj5D7sNv2eHrUqsyBaFoNDHHLr5peCrhuJ72zOVzprbe1YrL/UKjBfhzLSwAfHzJTAJVNKz6duhEnSthLqd29ivQhfijyGvNhykb/XYEfaVPoA1b+2y2JWCoQq9desqYNiMiyHvcJFpL17PcKBNkIjaa0i4w3t2RjdO2QNI/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261372; c=relaxed/simple;
	bh=4AdY9mXEYKV7JvwfUdqLlPz2v9cWHTJ1UjTizN8ERac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aJHoU2O8HEweQFVfTnNeXl6C62cJde/PatUU+kDt9lhEc1HVy7B/e9vfd4Ei/GDqI7xKNJZqjI/b2dXXDgelZNmcebZFSNz8DoTxqdilqpp2UiBsXNx9vBJXMewwtRoI9gxIXN5IA75Yk5JQoSVq4bKyX4HAnSCi1g8mVSTrIMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LKoctHhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tkO21627278;
	Mon, 23 Mar 2026 10:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M9SUr+nS+ufjroTrcpJBAW+s0gpj5VOlKY9
	X2rkPiv0=; b=LKoctHhnYyLKuibCM/YGGkKKduQLUKKer8ww5XNt3hSRBD1k2KL
	VJZvBlBWrrabEvitoxNBbtO6ACGE9OZ/Rh/5J2+VKnBYCT2W5xd+pvFBkR0THMGM
	jjzxqz+ENtMOxKYls76mFNN5Tznbi+Y77pPv4XMtN+828yr0gWvaoSW4uwStC/51
	vKF1h+HzTbOfr4QzCjh2NDGN8VZOVOLaMYQl6dpEcw5VnrZnnHIUlEdEnXcUNzH9
	abDR/AQja0ZKllch0SMUKZJ/LaTMhWa8VnxYDtvNnPcPLFPzcvmmBbW9QkLKqqfZ
	HFA21PyMDd9ckPDYB6GWKt2r1Se9Vyoc8ig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0h6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:22:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62NAMXhG018902;
	Mon, 23 Mar 2026 10:22:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d1mdm6dn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:22:33 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62NAMXKj018895;
	Mon, 23 Mar 2026 10:22:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 62NAMXcS018873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:22:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 4F6585A1; Mon, 23 Mar 2026 15:52:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for panel nt37801
Date: Mon, 23 Mar 2026 15:52:29 +0530
Message-Id: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1146d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8 a=Msm59h0HKFRdTJYaiMcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: joJKW53E4eLwPmDvhvV0V_3oyEQOjswd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MCBTYWx0ZWRfX4GGElf7bpJR/
 mqJ/6HTWZs2Xr5aY/qeWq5Uv57vx87sOTCuykddgBb72bjnuBaRYx5NC2qkNz3+2D8WNdimqsfn
 NkIhub+d0S6pcfjyWz7zCQXLL0QyeGP3l8l6PhFclAdeAIDePIvb4FcaaIOjRwPr6RXjKYhIW6N
 2GAyBxesPQzi4D2ng/Z4Q+6ouua2dodOMJNFBT3BOAh5mk14tUfRYgdgNVool/+gXLQYoAgZpbG
 QseVtvFuiseNluevq5LXsJ7XCdZuUy/6YmhgNkkRPcTo4yg/JzGaYwScwVsMaHbyGmhiDw85xQV
 uvsyKcyjPkbpICNwkIKkQB5IuvnfXG6Wi3Plq/WBdHU47bPV5vCnokV5R6xzL2Ioe/BzOKIqf/z
 eWWxV08uqjD4HRiAVJGJJbvIE+GjhYwdwuIw5a3yq2vjyDcxxxcykc3a7nD6xNxr2vjZr7V3z0m
 H2gJqn8EExKuPipHCow==
X-Proofpoint-ORIG-GUID: joJKW53E4eLwPmDvhvV0V_3oyEQOjswd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230080
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99187-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:email,quicinc.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 90B1E2F02C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..6ba4e69bf377 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
-- 
2.34.1


