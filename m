Return-Path: <linux-arm-msm+bounces-35475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5F9AB6A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 21:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B5C2820C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 19:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E681C9EC0;
	Tue, 22 Oct 2024 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dWvWBENQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68381145A1C;
	Tue, 22 Oct 2024 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729624926; cv=none; b=DhTyRc67UIft3BH7HwawbUFjZdEqMiJbqbeTRy6xMLRp3Nyi3ISQJBA6Wtd1mEqPfQFdaHtrBRet7oBulcNpdGobXmkkL1DQvQWo/rdRMPrKhGHsthJZXkxk0N8L5Kl+pwMJqE1Ycji9BpunZGSVfcw8BVHqND6ZMG/gd13oR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729624926; c=relaxed/simple;
	bh=HedsURPxO+izpoIV2gScFCA9J6aHDDCpiRXKJsa6+G0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UMM4Et/9W2+6Z2LOXFKF41iH0AaRdVHM/44jjEt7AIHTWIQ6DkPUA5rWoEWiBfDPyIomJ1+Lyj+o15SjHFI6Un4WnbGZ1BpTEFJnU3jgAh48NbxaQps+BYa+VN+q3ebaJzQEpEHmaEyy9ZicIMR/hNlj6WsqubEmkGYCldpqIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dWvWBENQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MIEsXH017119;
	Tue, 22 Oct 2024 19:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D+UKC341jhbqcwWUZeSgsz
	3KKYVs9wK+9odKhq3fhBU=; b=dWvWBENQrXKQTyAjMqc/JfsbdCE/zyv0/F9Bgx
	0rib0juEIrzm5jtLfDmefFyFsVKsgs2DCr8zSQC1kiKtTh1rlukKpyEgf6VxRl1N
	B/4kdJyOj8E9ZuYA6JQZG8p6tLmYNYY7121QLre6DSEhjdxE/hg8XF7/zy44cYey
	gA4WTlT1e8r8ucubsJoJcuVC/g+OIIQAXcQnoPJeSgZ9dmL+GjHA9No1r4+ahkG+
	Pf/HJ9aQQ+8OTwr/gDPxDxack7k9B0kGNdWMBrdRKkd9csvsYm8lsCXn4x3MNOfv
	XRG+eSHBCFna2nbSoWlW8jqVhkC1ijpsSSEyM3cj95fYLO1w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqdd7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 19:21:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MJLwNb013185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 19:21:58 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 12:21:56 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qingqing
 Zhou" <quic_qqzhou@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH v3] firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling
Date: Wed, 23 Oct 2024 00:51:48 +0530
Message-ID: <20241022192148.1626633-1-quic_kuldsing@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NZyv92ICcgJZkbCDDpCyp110jqJLdBxl
X-Proofpoint-GUID: NZyv92ICcgJZkbCDDpCyp110jqJLdBxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220125

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
qcom_scm for unsupported platforms. Currently, tzmem interprets this as
an unknown error rather than recognizing it as an unsupported platform.

Error log:
[    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
[    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4

To address this, modify the function call qcom_scm_shm_bridge_enable()
to remap result to indicate an unsupported error. This way, tzmem will
correctly identify it as an unsupported platform case instead of
reporting it as an error.

Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge operations")
Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
v3:
- Split patch series as it's a fix and required for other dependent patches.
v2:
- Link: https://lore.kernel.org/linux-arm-msm/20241014111527.2272428-1-quic_kuldsing@quicinc.com/
v1:
- Link: https://lore.kernel.org/linux-arm-msm/20241005140150.4109700-1-quic_kuldsing@quicinc.com/
 
 drivers/firmware/qcom/qcom_scm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fba3ac676d1d..478538604225 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_cmd_info {
 };
 
 #define QSEECOM_MAX_APP_NAME_SIZE		64
+#define SHMBRIDGE_RESULT_NOTSUPP		4
 
 /* Each bit configures cold/warm boot address for one of the 4 CPUs */
 static const u8 qcom_scm_cpu_cold_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
@@ -1361,6 +1362,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
 
 int qcom_scm_shm_bridge_enable(void)
 {
+	int ret;
+
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
 		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
@@ -1373,7 +1376,15 @@ int qcom_scm_shm_bridge_enable(void)
 					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
 		return -EOPNOTSUPP;
 
-	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	if (ret)
+		return ret;
+
+	if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
+		return -EOPNOTSUPP;
+
+	return res.result[0];
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-- 
2.34.1


