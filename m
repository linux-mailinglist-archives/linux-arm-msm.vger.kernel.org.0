Return-Path: <linux-arm-msm+bounces-27412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933D941159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 14:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C166F2853F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934461A00F1;
	Tue, 30 Jul 2024 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bHWvaI8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4D41A00DF;
	Tue, 30 Jul 2024 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340755; cv=none; b=qyfG9c2U2G7QVPf8XWHryl+xToLebPyNjSJpFAo9V6NUSkRJ7qou7XHxlbKdyldGSa8HbAzo1rqLWXB0X1w+KG/0GVyCRo9Uz0hL15WIok3LkRoJ5qSdDQRoGMBVrP682iXZzn8eYzReMGuEXCE2vloK0HCNiTgtLL99WrNwY3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340755; c=relaxed/simple;
	bh=Br5iul1IKL3n9WzMsepXe4wCxuWuLJrejZMwQltHxc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kt6ogvFcCIWg0HxCPyjlORhrftUbNSgSws+ACEGy5Ii90YYuHtRU9LvwY7KJ3dCEh1QLG1scEDfVdhONRF8E4c0MiX+cV0HNCMrWE5raLkC9d/kP+lqcELeLkXoZEzPRGobgjA4N0IIQtpC4lmAeOtB/3S9JKB4VqGEd6BLf6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bHWvaI8g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UA3P6M016748;
	Tue, 30 Jul 2024 11:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5iafdj6H+Dw
	nHZy21LrrA4/vHtwtOgC9r8TCOiDQlGg=; b=bHWvaI8gwx16R8/CcQgx5wRhPv4
	heTCWmfP1WmTpAhC4P5VCD6vGthgGUGvNc2nf/6Wg4NC0YdyWPPgKGtoappgbM0I
	V4SZjLiyZY1b8HqhPGeJ8UV5dh8KU6gk8HVg/t8TdG43FJZ/+b6pscU5IiBTlKT2
	gdmWANfjKWOq7uz2CZcIzCo9oWeBC7suB/NPK9dXoDzkZmomN/U63Lu9PaszimDA
	wG65QK2WFXdBTgncHPKkjAlvarEqtlh54cuPuoqlscwgW0B0UO987fngR5vNcM/h
	4c21BGjXjnUFwetm0/GTrHw/O4IVIOaOuh6eIocVbZhVC3NldIuXgvana6w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms4375bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UBwf73001365;
	Tue, 30 Jul 2024 11:58:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 40msykdx6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:42 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UBwfdv001324;
	Tue, 30 Jul 2024 11:58:42 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46UBwgJK001392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:58:42 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id C9DC0413B5; Tue, 30 Jul 2024 17:28:40 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
        adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
        ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_viswanat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
Cc: quic_mdalam@quicinc.com
Subject: [PATCH 6/6] mmc: sdhci-msm: Add additional algo mode for inline encryption
Date: Tue, 30 Jul 2024 17:28:38 +0530
Message-Id: <20240730115838.3507302-7-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
References: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: Wgzb38TwClZThWRfIODRej4zHS0zg-oL
X-Proofpoint-ORIG-GUID: Wgzb38TwClZThWRfIODRej4zHS0zg-oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300084

Add support for AES-XTS-128, AES-CBC-128 and AES-CBS-256 modes for
inline encryption. Since ICE (Inline Crypto Engine) supports these
all modes

Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 10 ++----
 drivers/soc/qcom/ice.c       | 65 +++++++++++++++++++++++++++++++-----
 2 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e113b99a3eab..fc1db58373ce 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1867,17 +1867,11 @@ static int sdhci_msm_program_key(struct cqhci_host *cq_host,
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	union cqhci_crypto_cap_entry cap;
 
-	/* Only AES-256-XTS has been tested so far. */
 	cap = cq_host->crypto_cap_array[cfg->crypto_cap_idx];
-	if (cap.algorithm_id != CQHCI_CRYPTO_ALG_AES_XTS ||
-		cap.key_size != CQHCI_CRYPTO_KEY_SIZE_256)
-		return -EINVAL;
 
 	if (cfg->config_enable & CQHCI_CRYPTO_CONFIGURATION_ENABLE)
-		return qcom_ice_program_key(msm_host->ice,
-					    QCOM_ICE_CRYPTO_ALG_AES_XTS,
-					    QCOM_ICE_CRYPTO_KEY_SIZE_256,
-					    cfg->crypto_key,
+		return qcom_ice_program_key(msm_host->ice, cap.algorithm_id,
+					    cap.key_size, cfg->crypto_key,
 					    cfg->data_unit_size, slot);
 	else
 		return qcom_ice_evict_key(msm_host->ice, slot);
diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index fbab7fe5c652..f387b884c516 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -19,6 +19,9 @@
 
 #include <soc/qcom/ice.h>
 
+#define AES_128_CBC_KEY_SIZE			16
+#define AES_256_CBC_KEY_SIZE			32
+#define AES_128_XTS_KEY_SIZE			32
 #define AES_256_XTS_KEY_SIZE			64
 
 /* QCOM ICE registers */
@@ -161,36 +164,80 @@ int qcom_ice_suspend(struct qcom_ice *ice)
 }
 EXPORT_SYMBOL_GPL(qcom_ice_suspend);
 
+static int qcom_ice_get_algo_mode(struct qcom_ice *ice, u8 algorithm_id,
+				  u8 key_size, enum qcom_scm_ice_cipher *cipher,
+				  u32 *key_len)
+{
+	struct device *dev = ice->dev;
+
+	switch (key_size) {
+	case QCOM_ICE_CRYPTO_KEY_SIZE_128:
+		fallthrough;
+	case QCOM_ICE_CRYPTO_KEY_SIZE_256:
+		break;
+	default:
+		dev_err(dev, "Unhandled crypto key size %d\n", key_size);
+		return -EINVAL;
+	}
+
+	switch (algorithm_id) {
+	case QCOM_ICE_CRYPTO_ALG_AES_XTS:
+		if (key_size == QCOM_ICE_CRYPTO_KEY_SIZE_256) {
+			*cipher = QCOM_SCM_ICE_CIPHER_AES_256_XTS;
+			*key_len = AES_256_XTS_KEY_SIZE;
+		} else {
+			*cipher = QCOM_SCM_ICE_CIPHER_AES_128_XTS;
+			*key_len = AES_128_XTS_KEY_SIZE;
+		}
+		break;
+	case QCOM_ICE_CRYPTO_ALG_BITLOCKER_AES_CBC:
+		if (key_size == QCOM_ICE_CRYPTO_KEY_SIZE_256) {
+			*cipher = QCOM_SCM_ICE_CIPHER_AES_256_CBC;
+			*key_len = AES_256_CBC_KEY_SIZE;
+		} else {
+			*cipher = QCOM_SCM_ICE_CIPHER_AES_128_CBC;
+			*key_len = AES_128_CBC_KEY_SIZE;
+		}
+		break;
+	default:
+		dev_err_ratelimited(dev, "Unhandled crypto capability; algorithm_id=%d, key_size=%d\n",
+				    algorithm_id, key_size);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "cipher: %d key_size: %d", *cipher, *key_len);
+
+	return 0;
+}
+
 int qcom_ice_program_key(struct qcom_ice *ice,
 			 u8 algorithm_id, u8 key_size,
 			 const u8 crypto_key[], u8 data_unit_size,
 			 int slot)
 {
 	struct device *dev = ice->dev;
+	enum qcom_scm_ice_cipher cipher;
 	union {
 		u8 bytes[AES_256_XTS_KEY_SIZE];
 		u32 words[AES_256_XTS_KEY_SIZE / sizeof(u32)];
 	} key;
 	int i;
 	int err;
+	u32 key_len;
 
-	/* Only AES-256-XTS has been tested so far. */
-	if (algorithm_id != QCOM_ICE_CRYPTO_ALG_AES_XTS ||
-	    key_size != QCOM_ICE_CRYPTO_KEY_SIZE_256) {
-		dev_err_ratelimited(dev,
-				    "Unhandled crypto capability; algorithm_id=%d, key_size=%d\n",
-				    algorithm_id, key_size);
+	if (qcom_ice_get_algo_mode(ice, algorithm_id, key_size, &cipher, &key_len)) {
+		dev_err(dev, "Unhandled crypto capability; algorithm_id=%d, key_size=%d\n",
+			algorithm_id, key_size);
 		return -EINVAL;
 	}
 
-	memcpy(key.bytes, crypto_key, AES_256_XTS_KEY_SIZE);
+	memcpy(key.bytes, crypto_key, key_len);
 
 	/* The SCM call requires that the key words are encoded in big endian */
 	for (i = 0; i < ARRAY_SIZE(key.words); i++)
 		__cpu_to_be32s(&key.words[i]);
 
-	err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
-				   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
+	err = qcom_scm_ice_set_key(slot, key.bytes, key_len, cipher,
 				   data_unit_size);
 
 	memzero_explicit(&key, sizeof(key));
-- 
2.34.1


