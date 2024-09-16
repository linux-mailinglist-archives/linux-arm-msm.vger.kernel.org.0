Return-Path: <linux-arm-msm+bounces-31812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1889979DA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C030B228B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22661494A8;
	Mon, 16 Sep 2024 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hz7PPh4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068814900B;
	Mon, 16 Sep 2024 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477125; cv=none; b=NcDQKx8oX2gl381uzpiCENOaxkq0iiLtSI54C5KTYUZeH1XEwFv9yDJCKu0nvYCmFFnf5phFfXuLQsWPQIqUbVuyr4NanSXqs2mu/hgxo8Y13f4vftHjF4x4FUGkknHLAGIB1hxQsroB3NUq+zj5YyUspQpcBHV8z6N6Ie4ntqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477125; c=relaxed/simple;
	bh=Ifc+Z515nGmOJfijfj91jhXJWyi8xFaVLjBUFszzRFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/VGmOm09heyO17j9MzIMidzskslDsvHT+x9+tS8U5/X41MjVGz1RSgwgMazgwSwwxGl0/TaVjLTZ6k9jedpKq4T842I4+sygJmgyK+fFtFnH9VQST2L2QVy+W82B8Pga0adzt1WLqsx/lqREpuGXBJRt1nx6HlUc7xp5kD2+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hz7PPh4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FM94rG020571;
	Mon, 16 Sep 2024 08:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/g1y7Oa6pAXIOYx5tbG1L7nPwwl90J1rUk/TLSvAG9Y=; b=hz7PPh4vgzUcjzQ4
	KdN7oRcLcVJ9UJenmH1DWX8bPbJ5TeirdCpg+aQI5BRbdV5cxhKZGcC9DuTqXmdQ
	XstQG2jsEDdyKEu4etylr5JcCdtYILD+pwv2LhXb2tp3dkrmJT7dssQDPYPg17Fz
	7nIs4cn9/huxxqz9cqEKmD6IOYba5LLA6xMRy8r1aoN5cf1YsHizMPMGLzgDyqAU
	4mBGT+XN1VTgCBEekaRFJmvlL5OCyJaw1QfoObLXYTG8iT4OVXUBgjFbqfl7JXLx
	y9UdGRNOhRMo/V5v/KPJDAdfhuh4CV2s1tMg202qcz1kIicS2fbMAOyj0/OFlPMh
	ZHD4Fw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4heud71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 08:58:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48G8wNNu006762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 08:58:23 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Sep 2024 01:58:17 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <axboe@kernel.dk>, <song@kernel.org>, <yukuai3@huawei.com>,
        <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>,
        <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ritesh.list@gmail.com>, <ulf.hansson@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <kees@kernel.org>,
        <gustavoars@kernel.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-raid@vger.kernel.org>,
        <dm-devel@lists.linux.dev>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH v2 3/3] mmc: sdhci-msm: Add additional algo mode for inline encryption
Date: Mon, 16 Sep 2024 14:27:41 +0530
Message-ID: <20240916085741.1636554-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hdI8lqcDWWvvLB46JeOU4II4fRasrJTo
X-Proofpoint-GUID: hdI8lqcDWWvvLB46JeOU4II4fRasrJTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160056

Add support for AES-XTS-128, AES-CBC-128 and AES-CBS-256 modes for
inline encryption. Since ICE (Inline Crypto Engine) supports these
all modes

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* No change

Change in [v1]

* Added AES-XTS-128, AES-CBC-128, AES-CBS-256 algo mode support

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
index 50be7a9274a1..da0c1dfa6594 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -20,6 +20,9 @@
 
 #include <soc/qcom/ice.h>
 
+#define AES_128_CBC_KEY_SIZE			16
+#define AES_256_CBC_KEY_SIZE			32
+#define AES_128_XTS_KEY_SIZE			32
 #define AES_256_XTS_KEY_SIZE			64
 
 /* QCOM ICE registers */
@@ -162,36 +165,80 @@ int qcom_ice_suspend(struct qcom_ice *ice)
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


