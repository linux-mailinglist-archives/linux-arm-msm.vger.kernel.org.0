Return-Path: <linux-arm-msm+bounces-97454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNEQCAD/s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:11:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B155282C33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A833272711
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF4D391507;
	Fri, 13 Mar 2026 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adZxjFEa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fT1rJ6+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE93914EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403747; cv=none; b=j0QrX2Ssv1skS6dtk564j290SRVJAW8l8EuG6EvBFSPMU81GaUTB9/dw8nctN+nzktqKyRQL1VU+SssPqsKsjsLrpSw94Esbv+7NzVBLD1/Va6E33FX06+Q3Ze03lefZ1ogsS1aAGsKn8TVBvvhqKhRELrg2SwbFp7OY93kASzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403747; c=relaxed/simple;
	bh=TbZHaA5vOn1udlECRr5ebxVlfa8fzityrbwOFQl8KJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJVSVvWA2V0DpsCKRkcOkok8QSpGG9zzxwdrj4M5EN7Wk2o4d0IEW+Qmo5PyrjXnNox8wwNgqi5rloeImyOF43ur5q2zNzDJJbVBu6nR14k6VdzWqFxKyC1AvTFnkfqcu9XtPn35QsO1SXYEdNVDA7rWsJp80/YAhq+r4h5OBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adZxjFEa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fT1rJ6+g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAn9XP2393888
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bP04qDOHi3y
	ZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=; b=adZxjFEaFGPXbBuc6bt0VXyFXag
	S2m5lb1E6f0ajhnfynpq83YxD3HD9bf09BKI4teFVr7Ca5fPSzvidCbS9uKYR0h5
	h0e4eXK+nZPAx8eRewuzTIH/aSSA3ZkBBulDr0nHoaSGw9n7jSd2MWGQUhe71rZz
	Zx5vVjkF3+plgtZammLSSgE4NcJnk6aFQzY7ntxCDOtr5Xf4EinX4hQz5Vq70jkM
	jFwfTw5knn/B8/lDp61qUtfJUQNp/ZPcEKOCaUI4owrF2adVLP1SOt2rObcBRjZx
	dcqTJ9F94pPwxtNRYPv6QcW596dMPQ4TEQr1YrqhOIZ8ePDnvOho+n+1aVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m86xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:09:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a019abd6aso2173296a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403744; x=1774008544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=fT1rJ6+gQhjJJzojhXe109i3VovrTPpWdD7J8UcEe+v9vrXDlcsEac6ehCU/HO2d0b
         KiRkVuvCmrOqTkUdyZ2r2AJvLkMjTrQtq70QxuE63Eh/e+on1ijRMgCGPLUOiSUU8hcS
         LzUUSG9CZ2GKNes3PY3VLk4IXeOR88OLd4o9fsPGHTBXqzZQWXjjirLDYvs0ddLDm/D6
         EdT0LJyxyS6k9nd3CqbgzXso89OGbDbWexnnjImJsckmfb+U0f11a6qiRp8BuY0WyWQF
         LfztdNhykqD36Uc2brwvIt09T1fm8wumC7kjICMDe3bkD8NbQ7d+/VNE6OEPMWS/MR+U
         yBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403744; x=1774008544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=RXSxWBZP6xhA76nTGhJtZb4Y0nBtUfA5tYFx4zgk0Sc4v/zw728zEjB6MBV//aPspp
         AHoGwhUVFSQPacCNVySmq2cOEFI2f/OMcXqvoSpANuL6FGAv0DZQM5dUPSY2VM8oJs3w
         ujuBjlE9fhToiJV3YGQwvWYzrB2P5mxeD3GPai63CIGLaPGdHnU+zXqeUTdl0hNMq/t6
         0/WstW48K2p8JJNSHXE5ROmstLr1glOyZtcVKK49sdfxCoFPzUVZuNv0RJ8Aw8gThBZk
         2AVXuUUVB4yKocPIERtFkw5Pxt1e+2bamT+Mf226DCONbMKsCr1UaelId3H3WSqpB2d5
         /Fgw==
X-Forwarded-Encrypted: i=1; AJvYcCXM33JtuJwv0es42GqiLaICZnBxm4dJWtiTc7r6jb8HNPLtpHPwX3Bn2vxeyyH87UWiz52okdHtu3WW9eKy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7Gg1IC6BkuoRSZKIRYdytEC13esLeQaOLoidvFj4CRGyOaJe
	LQTSAPQpJhkIotN7g1yz741vJO2y9pCNK5d0hCXHUj5rULImsdJraWuBC+WfT5AATytwvwb/plT
	xWQb1ORYPueEpamn65eMh6mvkUR8EN1W5FPbHV+Tr11dWEu7RXjppjnIk2RKZvHGhzQet
X-Gm-Gg: ATEYQzwsfe6AjFAl99dhZPN8fIbVZUpAGKhGJZP+iGOExsxpA3QtAooVs2qLfJ77g8+
	DrmllhSGLzeMneANuTEi+CXEADmnECnSo3HxGHphE/U49mKCnM8fGdnwLFqIZxZR+hXn4g6gTQN
	QUSnJEIDCt3myb1YwxsDpqUEnhBBAY6TBlZ9UJeEpZy+R6FAnk2rQraIuXpF0s/n9rdXfKHn8ap
	2IqT/IFMUPN4zXr/VvF2ZJ0rkE8Wk8plIqcPxvrXvJi120lmMLwviVNLAIq6MtclNtSjmb+QAwb
	Xu1GgJE3ZcuwOmmXQH6T1pjbu/ol03xQMEbfxrFvyNxwe4rdMTroq8whO3x/Sj3pb46RIESptDP
	hAMqekaAD3A9NQebRKlMWiVkOMhczSzEJ7v272fTGgNkze7V390GSMnxSpLnglg0KXSi2N32snF
	dXZVhDlxWIqwoSZ0B2RPUeFB4ejt2NpLeijgND
X-Received: by 2002:a17:90b:3f85:b0:359:8a78:5696 with SMTP id 98e67ed59e1d1-35a21e39beemr2475418a91.1.1773403744272;
        Fri, 13 Mar 2026 05:09:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:359:8a78:5696 with SMTP id 98e67ed59e1d1-35a21e39beemr2475386a91.1.1773403743835;
        Fri, 13 Mar 2026 05:09:03 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:09:03 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V5 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Fri, 13 Mar 2026 17:38:14 +0530
Message-Id: <20260313120814.1312410-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nLNuGSeouXKZDZv2ULKJL-CU-EN9tZ-a
X-Proofpoint-GUID: nLNuGSeouXKZDZv2ULKJL-CU-EN9tZ-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfXzmys+9EL/E+M
 g1ZB2dRN+S16oDgKYG3gXr3tbRn+WtQfQZqDpCXFUQxO2tzyFC3BBGRvFfrus0Xku8lM6firaw2
 Uzos4P3JWQXdLnfh074m3xY+IaropO27PQt97507esEjCN9/HScz0JbHCmMaLHOd/1c1OXa+KvB
 N/qmvPGUNt5XJBfnc8RbgIc9W1UI4e/AXF9ZFVnwgeiaelWuevsjFNqGft4xTMFfknD5BiW4cKT
 X6KcX4b2sG5MFy94R80Zp4rsCM6bNL3Rj/nDLRyihwUNiA6WVf7esulpXs47PoK3PSmRr7lNTKS
 UyNXuhhfTUY6KG3zi/YGXuSQjSxKRWSWT3TF4+bbUlw3Vp2sAuD0YatEW+o2DrY5AQUrlJ/H6Tv
 4y3/h3iGCUovHzd+DUIqoVX1iBW1rvplqhQsSJudCfdpglWC0H9/z32T43zpdWa0vMJ2SQSmWGh
 rzclfg/hcNUiQGZDJFQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b3fe61 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ePUXPMwdJMzpUIYWY5YA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97454-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B155282C33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..6b7f91a3a968 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -485,6 +485,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1


