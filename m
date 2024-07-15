Return-Path: <linux-arm-msm+bounces-26204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9759317F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 17:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0191C21C67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57361EAD5;
	Mon, 15 Jul 2024 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="USzax5TC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25931C2A3;
	Mon, 15 Jul 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721059055; cv=none; b=G41tr1Z1ZYGoG1RMGvmB8Dpd+7bmQRzGJL0V54bZpCZYw/wGQECJw/b+AACg6SRd5vJ1lWwrYDq1YmREI7VCYRihWdU9xP9Fj9x7quiW9fe1BatZehy81e0Ob8Cim5ggVpOPxkscEbvxdUq9BeTjMQ/IWERr6X8AZX72EJ/hruo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721059055; c=relaxed/simple;
	bh=1sNvvVWqrt6bAKTUKmAu7FpOJl3z2ACtwrg3dBmSS3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXHqmi74vpxsanuQ1uR5mYtqznKqWL2gFrmZYcrHQy3D/27wWFXEbMl5ayHyEe4LYqOcIXG7an2fOQlOUwxyhWaEAqzT0cygLE3ClTwIW4AkqppcMtjXA2UQ1wOJjc/1JUq0OOAEkfug/N638RyFGNKlQMKcKZXu9fUgxQR8UMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=USzax5TC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FBXcmi002133;
	Mon, 15 Jul 2024 15:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZWdQH5aoA0FC5HXCnK+K66/2RLnQXwv0EX7Y7p141o=; b=USzax5TCWmnAOL82
	9mn4efCMvvoAN/+a4vGfLKJEOGAjHbaKVhc2zYNRbWfvG8dO5nNpWnu0Dqepk7e4
	AeIGxcCWUVA9XuhsVVqqEH9gYIwcHeSJqrdHsKFT/nY9xj8NEhtJ0wjoH+Rcr7H2
	3DEIi/ucyxdXamG3Q9H834fmvm6Z5jH20F9715FXzS9UQWfho3HE3/ni/xwX6O2S
	FEbSTZe26+FTE5qtk+oIS7JwOHlsdWX2jZMAkdGDtXHUDaSgQuF4gtEGlIqgp8Py
	fWoAHi4kE5+nYiW+m7JjML7M3Fel8BJIRL61jiPilsSV0BTxGGU6j2O4bZmFmqys
	Zv8yZw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bf9ecvf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 15:57:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FFvU4r020035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 15:57:30 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 08:57:28 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
Subject: [PATCH v8 2/2] firmware: qcom_scm: Add multiple download mode support
Date: Mon, 15 Jul 2024 21:26:55 +0530
Message-ID: <20240715155655.1811178-2-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715155655.1811178-1-quic_mojha@quicinc.com>
References: <20240715155655.1811178-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Oj3248EKYdsMee6q5SfiqHrzjBS_i18f
X-Proofpoint-GUID: Oj3248EKYdsMee6q5SfiqHrzjBS_i18f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_10,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407150126

Currently, scm driver only supports full dump when download
mode is selected. Add support to enable minidump as well as
enable it along with fulldump.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v8:
 - Rebased it.

 drivers/firmware/qcom/qcom_scm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 55955f675cd0..cc2de2a728b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -126,6 +126,8 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MASK		GENMASK(5, 4)
 #define QCOM_DLOAD_NODUMP	0
 #define QCOM_DLOAD_FULLDUMP	1
+#define QCOM_DLOAD_MINIDUMP	2
+#define QCOM_DLOAD_BOTHDUMP	3
 
 static const char * const qcom_scm_convention_names[] = {
 	[SMC_CONVENTION_UNKNOWN] = "unknown",
@@ -137,6 +139,8 @@ static const char * const qcom_scm_convention_names[] = {
 static const char * const download_mode_name[] = {
 	[QCOM_DLOAD_NODUMP]	= "off",
 	[QCOM_DLOAD_FULLDUMP]	= "full",
+	[QCOM_DLOAD_MINIDUMP]	= "mini",
+	[QCOM_DLOAD_BOTHDUMP]	= "full,mini",
 };
 
 static struct qcom_scm *__scm;
@@ -1927,8 +1931,7 @@ static const struct kernel_param_ops download_mode_param_ops = {
 };
 
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
-MODULE_PARM_DESC(download_mode,
-		"download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode");
+MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
 static int qcom_scm_probe(struct platform_device *pdev)
 {
-- 
2.34.1


