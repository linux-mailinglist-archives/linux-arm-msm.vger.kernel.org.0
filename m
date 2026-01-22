Return-Path: <linux-arm-msm+bounces-90181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFJhCZENcmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:44:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A83662DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7DEF8E1EAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AF442EED0;
	Thu, 22 Jan 2026 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HimcCTtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78827426D36;
	Thu, 22 Jan 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080417; cv=none; b=qyIhL30wlrgd9iH5TdEaT62CaKg9wsIt6968JZ4At66SgrS63hIiWELME3b6F8Avjeq3enrnDYFKc/NFgSUAOHdsd1tPje0cFM01VqUfSRC6nHBCTGJSY3Hh3pzfFZQ0a+giBQ8nAKRV+jstmaf1sl6bPOSUT1ZzI3ionhT4+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080417; c=relaxed/simple;
	bh=C7wVSKV3YtDT9qs8Jkz5HPzO3iweTY9GokCJkEqYblU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ULvHoyG/1PFz/z/gHytpkjmDYh2Va50tj5M/mtAGDrVTcDTxfyHWoGCfN0tR8gTOHxb0KuEY4PrqqZkMKqTboQPMbPIAjRcenRin/Nv7u7gRjrlRpg1WMt4QmIktKG4/poSvYooAH9oW0DKTJ9Tg8ZHDihvrDFytLIbIUbQ9lsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HimcCTtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M65FQX3902078;
	Thu, 22 Jan 2026 11:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nTJKBQKmWZnwItBuDOfTlPFh3X10vZlBZTY
	H3K+VAA0=; b=HimcCTtmI3cL0GJP5mnE9J2oHyMCi52xCB0QdhZlmflBq011QgY
	2qOnyx8o6yI3qkgz/BQewOhwXgMsf0uizJ4FrSLcxgayxZeGkzAWNrj2Jy6RJDDl
	xK7N7JjYWM8teXiIwqkzmmRYv/Z8pdbjnfVpgLGWCmwHC3cYGyvG0yohaZZftvnI
	///erV/3m2ZoqZ1HCpRl/zrtJjewZWZk5hkzOiY2yiRxK0fTso4ydc7x8XQ9m4ol
	h32x9pBe/ihO6EeAypntVJFOCqsfdf0kABWBkR35JUJHp55Ar3BYZNF1WWBp7RXA
	Q3ZmzOfbCFrQ+7nQ/+fnPW80qxNtqC/HU0Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khjkak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 11:13:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MBDTCt017579;
	Thu, 22 Jan 2026 11:13:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4br3gn207s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 11:13:29 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60MBDTGS017573;
	Thu, 22 Jan 2026 11:13:29 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60MBDT0m017571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 11:13:29 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 022B021BD8; Thu, 22 Jan 2026 19:13:27 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] arm64: qcom: pd-mapper: Add QCS615 power domain mappings
Date: Thu, 22 Jan 2026 19:13:18 +0800
Message-Id: <20260122111318.500262-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4MSBTYWx0ZWRfX/QL3H4Lg4DOw
 j9WCfF1Wckzw4oRQiBY+Evjmn84ksvqX01n9mO+HbHQF0LFpR3Mv72Wt66OfQhttOZiGJE06Ld6
 e0PZ9ZPPbFffaXxd9tNv7PI8O2twe0rzlCPz9rY8pwDI7GYSasxfEDsAREUE/w7MaDrBzFNgioq
 da5Sr+XW4sYvR+sI7rHVxd27OuEQthsOwnVFp71aPsaitKUu3P6EumLOB0e1SACX8aj284s2Eh5
 7OIdZdfqSSboygXpJLVD9Ja0yQqYgxAtWo6nWh9j+GPtK61yVQdJa1zWV8JFr467//tiJjHXZjr
 nh2EkL1TkLv/44xmMLFFPL2jo10iHIePdhuuTyFktVlEhhepl5Z/ilY3OCGFwJTxZrrHC/uevaB
 DVtl5W5iwFIcQHc8GUe1Xze8ABYrmLuL5ZTuf3tkRTSIeT7q5Uod8CKzLSK2TOQLESYnviqoSNx
 qMws2CkCUbSfrtvNYBw==
X-Proofpoint-ORIG-GUID: o7RVPhUMxdBCgucvelrlu-vsHvmYE3SE
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=6972065b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=I0-mpHMryRuFe5dX_KYA:9
X-Proofpoint-GUID: o7RVPhUMxdBCgucvelrlu-vsHvmYE3SE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90181-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A0A83662DB
X-Rspamd-Action: no action

Add the QCS615 domain table to the in-kernel pd-mapper so that audio
subsystems no longer rely on the userspace pd-mapper daemon.
This enables proper initialization of ADSP and CDSP domains directly
from the kernel.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..884a2db9bb08 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *qcs615_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sc7180_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd_pdr,
@@ -572,6 +580,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,qcs615", .data = qcs615_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
-- 
2.34.1


