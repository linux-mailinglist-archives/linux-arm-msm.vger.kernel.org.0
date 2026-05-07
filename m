Return-Path: <linux-arm-msm+bounces-106415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGVYKfea/Gk6RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:00:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C284E9C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C1B83017518
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B715D388E61;
	Thu,  7 May 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA4EOTNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02B3FA5C8;
	Thu,  7 May 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162335; cv=none; b=CEtPmD4ns4l5V/ztahEgED/2GWdFf/DTJaadyWmeOakBM8lF5UGaP9yA212u1WGYEUnlp6IcNXQLUhsiKS+KbO5jRNGLvrhlKJmwQmqxNugjos6GImRPzHJX9doGTmXUsrc67a/jLO53UE0HGoa563YHJ6Hft/Ry0Ch7Jbkqs+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162335; c=relaxed/simple;
	bh=pWN1tm8nZNOT0XG5ryHp80jePWSnZUt8hXAyxHFDYpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=IvXoYVG+Gq4izYtbOhmZREsb3Wvds4xGgl3N0GLYIpHJ/POw3Z05PpFEij6FvLm5SVbh3/aMWkA4kKqKhCtRjpy4i34ckooulHJNXJnbf5cb2t8ywGVa42wsDZ1xn/eGMJCP7iboNq+WmP/6AgGwUfjwq8/5odTWDHIMYwuO5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA4EOTNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A3MW71669566;
	Thu, 7 May 2026 13:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yq5tN4gZmg+Gb8GFy2k9Qi
	wRNzgmPGqYty++0/GNZ9M=; b=AA4EOTNv+KcYUayi1IRhBS5mLyGHLPC9ddoBZ/
	zwIBGCVH/MA1mdmzWjc5U1NhWtTKd/+Kqsl1R/+MAGagEuIQLu0IKG0UoR4Nsupr
	6jmW4sEq+6EynYJg/ilcmrvXoyhqU3dSGpWmYUuaS6RRUPnBiWhqjROotnWXoGoD
	g2l63QUuEx/8zd2quQdb3q+Nq5ifW3ErtWmxE62b1gZvyHk5fPUJpx7tnSx6Umfg
	fCdTcLxSkE+udnuMc+8UXfxFh0gfvOfmx4OgJ7E/MAc4oT6Hjk6QueRHuzCUU/cJ
	Uewo37K48da59F0vuWaWxrzJ7e0gc+mv3ajUo1aQHhybKS5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p25ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 13:58:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 647Dwp80015111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 May 2026 13:58:51 GMT
Received: from hu-raryan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 7 May 2026 06:58:49 -0700
From: Raj Aryan <raryan@qti.qualcomm.com>
Date: Thu, 7 May 2026 19:27:15 +0530
Subject: [PATCH] soc: qcom: spmi-pmic: add SUBTYPEs for
 Glymur/Kaanapali/SM8750 PMICs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260507-fury-v1-1-d24e4bb5b774@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADqa/GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3bTSokrdJBNLY3PjVAOLFMNUJaDSgqLUtMwKsDHRsbW1AOO69r1
 WAAAA
X-Change-ID: 20260507-fury-b49373e08d1e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Kamal
 Wadhwa" <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash
	<jishnu.prakash@oss.qualcomm.com>,
        Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778162328; l=2507;
 i=raryan@qti.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=pWN1tm8nZNOT0XG5ryHp80jePWSnZUt8hXAyxHFDYpY=;
 b=YzqHkUQ/3ScbqcAXPYsDiu56JXHceXzW+Xngo0q3EpikMpslg3QMphJyy9uD9EHOIS68J/V8D
 Rr1voqWBUszCvkNGB9wR0uyMAN1p9BM2toTrM5UomYyeEyWMZuy7y3Y
X-Developer-Key: i=raryan@qti.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzOSBTYWx0ZWRfXzXvu+7d9FwLV
 IBLJIGfdn3g/7dD5sB6yAPBuxWRWPa2QXNe8XVNGrgas60D/zSE0uzUuJbz2shb51g7d/2VUuBx
 PsWkOjiDpt7AvaeSRCRBPEOfu0QmZX+L7F3EoqsUVk1QTmPftIvDc/DfAqKprS06wo3i/lUHoj+
 jP45kwbHNqHLZCxtBZ+8z0o52chYY6yVuFrl5Ty0x0IxgMFPWnkUV1DI96otA/rWgp3FVA3zHnU
 GFrreELteUMTUMfh+pMxM3h5dWYO2sS/gxMlGx2o8R38jFgN/NBzTMgAQVjSn/+BJaX15So3UJq
 6Y7wGp41/ZhTPHVKr18bOmlESngoXM3ZP8ThrreYe4Y1GcplsMi74FYR7Q8mH34RXcGTJX0XOYu
 vsjku49MxvmT7vcV9Wy0cRbtdrbdRBd7fUrGpN2PsnK026R8dCOPbYNlxsaXVpJTBJS8ZIyz6Ff
 j6BHY88hC7Sv8jbvTUg==
X-Proofpoint-GUID: ebL6d1rxkVSG5qgb3dVo9ZigfVqGhYWz
X-Proofpoint-ORIG-GUID: ebL6d1rxkVSG5qgb3dVo9ZigfVqGhYWz
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc9a9c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JKkqLcDX6m04qQSuEEcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070139
X-Rspamd-Queue-Id: 17C284E9C0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106415-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glymur-crd:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[raryan@qti.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Glymur, Kaanapali, and SM8750, PMIC info is not being properly populated
in qcom_socinfo. Its shows `unknown` as PMIC subtypes are
not updated in the socinfo.

root@glymur-crd:/sys/kernel/debug/qcom_socinfo# cat pmic_model
unknown (92)
root@glymur-crd:/sys/kernel/debug/qcom_socinfo# cat pmic_model_array
unknown (92)
unknown (93)
unknown (98)
unknown (98)
unknown (97)
unknown (97)
unknown (96)
unknown (96)

Update the SUBTYPE info for PMICs present on Glymur,Kaanapali and
SM8750 boards, to fix this issue.

Also, there are some PMIC subtypes present in the socinfo but not
present in the spmi header file, add these entries to keep both definitions
aligned.

Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c        |  8 ++++++++
 include/soc/qcom/qcom-spmi-pmic.h | 15 ++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..76dc6499ad67 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -188,7 +188,15 @@ static const char *const pmic_models[] = {
 	[80] = "PM7550",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
+	[86] = "PM8750B",
+	[87] = "PMD8028",
 	[91] = "PMIV0108",
+	[92] = "PMK8850",
+	[93] = "PMH0101",
+	[95] = "SMB2370",
+	[96] = "PMH0104",
+	[97] = "PMH0110",
+	[98] = "PMCX0102",
 };
 
 struct socinfo_params {
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index 2cf9e2d8cd55..997fa18d70fe 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -50,9 +50,22 @@
 #define PMR735B_SUBTYPE		0x34
 #define PM6350_SUBTYPE		0x36
 #define PM4125_SUBTYPE		0x37
+#define PM8010_SUBTYPE		0x41
+#define PM8550VS_SUBTYPE	0x45
+#define PM8550VE_SUBTYPE	0x46
+#define PMR735D_SUBTYPE	0x48
+#define PM8550_SUBTYPE		0x49
+#define PMK8550_SUBTYPE	0x4a
 #define PMM8650AU_SUBTYPE       0x4e
 #define PMM8650AU_PSAIL_SUBTYPE 0x4f
-
+#define PM8750B_SUBTYPE	0x56
+#define PMD8028_SUBTYPE	0x57
+#define PMK8850_SUBTYPE	0x5c
+#define PMH0101_SUBTYPE	0x5d
+#define SMB2370_SUBTYPE	0x5f
+#define PMH0104_SUBTYPE	0x60
+#define PMH0110_SUBTYPE	0x61
+#define PMCX0102_SUBTYPE	0x62
 #define PMI8998_FAB_ID_SMIC	0x11
 #define PMI8998_FAB_ID_GF	0x30
 

---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260507-fury-b49373e08d1e

Best regards,
-- 
Raj Aryan <raryan@qti.qualcomm.com>


