Return-Path: <linux-arm-msm+bounces-22793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352490A150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 03:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A6191C20F56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 01:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A996CDAB;
	Mon, 17 Jun 2024 00:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mD8Drdb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237B14A8E;
	Mon, 17 Jun 2024 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585960; cv=none; b=jivXmkk/vgobeBsicgq8u2s0dRXo2fp4WTCG2IXhDKpw5QvnYVU5ZL7XN1atva4dAUdKyHxlkDIJ2s3GfvMehLYVOc1ss0fThDsffmPv3sOTIDw8TN3e9bD4f3BVKJ9GmnTql8VLQcC5KRb1TWhB7QmbbvUdXoNFqQoz7F/2VvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585960; c=relaxed/simple;
	bh=A906udgBMUvcKsbb4mKioxkfYy1Ge9qDNB2bzGvfNDo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kt/Io+hYbnx1xgZnQQrh6jjf0uuSWR82f7yUC7YlJ0X2wap6BGzyTdpysw1b9JHcYsgrI1dmrOy7dHR0pdg7aNsoY+SjDMRtwoRb5nQHOySzIbaw9n/nXB0KJ+AegyOD8C/uRxTKA5j8/iRi0CKz0W7giD+XuKmM9O7NgLqLH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mD8Drdb3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H0chfg006708;
	Mon, 17 Jun 2024 00:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63kWh98XPD34rXHy5bwMr9+lKtGSOarYaHuOY5T3NY8=; b=mD8Drdb3tObG5GT/
	/agZtgC/NjZQ5bGVpTGwj7QVdkS8zUOngVjzmzXUSmQKlA+7YYrlARP+eIqYezPm
	33Yo/ms+3749yiJFhaxl5M1JK1vZ6WkkZvmWnyl6ec+Hq6l3x9TI9ar0XMEO8gRb
	Hd7ivDYoVmEL9a2Zec7Ct+8/IjfkQ/sUxa50pFUPrrO078+PQb8WjtKeRQqa0izo
	drXO3lERIEg3LnWCyixwkMuV6tKCOzsOdOHxOQxhX9+upSxIzbuMHP+SbIgt7RZb
	ROsy6IfDDBH31crBNgxWiv0OBeTlpaxHXu9DGu0CxOjhiTE3sAB8Bf/8/rvTRP2b
	VzQtkg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1wr2fru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:59:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H0x1RP027026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:59:01 GMT
Received: from hu-gaurkash-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 16 Jun 2024 17:58:54 -0700
From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <andersson@kernel.org>, <ebiggers@google.com>,
        <neil.armstrong@linaro.org>, <srinivas.kandagatla@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <kernel@quicinc.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_omprsing@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <bartosz.golaszewski@linaro.org>,
        <konrad.dybcio@linaro.org>, <ulf.hansson@linaro.org>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <mani@kernel.org>,
        <davem@davemloft.net>, <herbert@gondor.apana.org.au>,
        <psodagud@quicinc.com>, <quic_apurupa@quicinc.com>,
        <sonalg@quicinc.com>, Gaurav Kashyap
	<quic_gaurkash@quicinc.com>
Subject: [PATCH v5 05/15] soc: qcom: ice: support for hardware wrapped keys
Date: Sun, 16 Jun 2024 17:51:00 -0700
Message-ID: <20240617005825.1443206-6-quic_gaurkash@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WM0j1XJvS4o5ad_E42UFyGbnKfyDg_uf
X-Proofpoint-ORIG-GUID: WM0j1XJvS4o5ad_E42UFyGbnKfyDg_uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170006

Now that HWKM support is added to ICE, extend the ICE
driver to support hardware wrapped keys programming coming
in from the storage controllers (ufs and emmc). This is
similar to standard keys where the call is forwarded to
Trustzone, however certain wrapped key and HWKM specific
actions has to be performed around the SCM calls.

Derive software secret support is also added by forwarding the
call to the corresponding scm api.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
---
 drivers/soc/qcom/ice.c | 119 +++++++++++++++++++++++++++++++++++++----
 include/soc/qcom/ice.h |   4 ++
 2 files changed, 112 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index d5e74cf2946b..f0e9e0885732 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -27,6 +27,8 @@
 #define QCOM_ICE_REG_BIST_STATUS		0x0070
 #define QCOM_ICE_REG_ADVANCED_CONTROL		0x1000
 #define QCOM_ICE_REG_CONTROL			0x0
+#define QCOM_ICE_LUT_KEYS_CRYPTOCFG_R16		0x4040
+
 /* QCOM ICE HWKM registers */
 #define QCOM_ICE_REG_HWKM_TZ_KM_CTL			0x1000
 #define QCOM_ICE_REG_HWKM_TZ_KM_STATUS			0x1004
@@ -68,6 +70,8 @@
 #define QCOM_ICE_FORCE_HW_KEY0_SETTING_MASK	0x2
 #define QCOM_ICE_FORCE_HW_KEY1_SETTING_MASK	0x4
 
+#define QCOM_ICE_LUT_KEYS_CRYPTOCFG_OFFSET	0x80
+
 #define QCOM_ICE_HWKM_REG_OFFSET	0x8000
 #define HWKM_OFFSET(reg)		((reg) + QCOM_ICE_HWKM_REG_OFFSET)
 
@@ -88,6 +92,16 @@ struct qcom_ice {
 	bool hwkm_init_complete;
 };
 
+union crypto_cfg {
+	__le32 regval;
+	struct {
+		u8 dusize;
+		u8 capidx;
+		u8 reserved;
+		u8 cfge;
+	};
+};
+
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
 {
 	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
@@ -298,6 +312,51 @@ int qcom_ice_suspend(struct qcom_ice *ice)
 }
 EXPORT_SYMBOL_GPL(qcom_ice_suspend);
 
+/*
+ * HW dictates the internal mapping between the ICE and HWKM slots,
+ * which are different for different versions, make the translation
+ * here. For v1 however, the translation is done in trustzone.
+ */
+static int translate_hwkm_slot(struct qcom_ice *ice, int slot)
+{
+	return (ice->hwkm_version == 1) ? slot : (slot * 2);
+}
+
+static int qcom_ice_program_wrapped_key(struct qcom_ice *ice,
+					const struct blk_crypto_key *key,
+					u8 data_unit_size, int slot)
+{
+	union crypto_cfg cfg;
+	int hwkm_slot;
+	int err;
+
+	hwkm_slot = translate_hwkm_slot(ice, slot);
+
+	memset(&cfg, 0, sizeof(cfg));
+	cfg.dusize = data_unit_size;
+	cfg.capidx = QCOM_SCM_ICE_CIPHER_AES_256_XTS;
+	cfg.cfge = 0x80;
+
+	/* Clear CFGE */
+	qcom_ice_writel(ice, 0x0, QCOM_ICE_LUT_KEYS_CRYPTOCFG_R16 +
+				  QCOM_ICE_LUT_KEYS_CRYPTOCFG_OFFSET * slot);
+
+	/* Call trustzone to program the wrapped key using hwkm */
+	err = qcom_scm_ice_set_key(hwkm_slot, key->raw, key->size,
+				   QCOM_SCM_ICE_CIPHER_AES_256_XTS, data_unit_size);
+	if (err) {
+		pr_err("%s:SCM call Error: 0x%x slot %d\n", __func__, err,
+		       slot);
+		return err;
+	}
+
+	/* Enable CFGE after programming key */
+	qcom_ice_writel(ice, cfg.regval, QCOM_ICE_LUT_KEYS_CRYPTOCFG_R16 +
+					 QCOM_ICE_LUT_KEYS_CRYPTOCFG_OFFSET * slot);
+
+	return err;
+}
+
 int qcom_ice_program_key(struct qcom_ice *ice,
 			 u8 algorithm_id, u8 key_size,
 			 const struct blk_crypto_key *bkey,
@@ -313,24 +372,39 @@ int qcom_ice_program_key(struct qcom_ice *ice,
 
 	/* Only AES-256-XTS has been tested so far. */
 	if (algorithm_id != QCOM_ICE_CRYPTO_ALG_AES_XTS ||
-	    key_size != QCOM_ICE_CRYPTO_KEY_SIZE_256) {
+	    (key_size != QCOM_ICE_CRYPTO_KEY_SIZE_256 &&
+	    key_size != QCOM_ICE_CRYPTO_KEY_SIZE_WRAPPED)) {
 		dev_err_ratelimited(dev,
 				    "Unhandled crypto capability; algorithm_id=%d, key_size=%d\n",
 				    algorithm_id, key_size);
 		return -EINVAL;
 	}
 
-	memcpy(key.bytes, bkey->raw, AES_256_XTS_KEY_SIZE);
-
-	/* The SCM call requires that the key words are encoded in big endian */
-	for (i = 0; i < ARRAY_SIZE(key.words); i++)
-		__cpu_to_be32s(&key.words[i]);
+	if (bkey->crypto_cfg.key_type == BLK_CRYPTO_KEY_TYPE_HW_WRAPPED) {
+		/* It is expected that HWKM init has completed before programming wrapped keys */
+		if (!ice->use_hwkm || !ice->hwkm_init_complete) {
+			dev_err_ratelimited(dev, "HWKM not currently used or initialized\n");
+			return -EINVAL;
+		}
+		err = qcom_ice_program_wrapped_key(ice, bkey, data_unit_size,
+						   slot);
+	} else {
+		if (bkey->size != QCOM_ICE_CRYPTO_KEY_SIZE_256)
+			dev_err_ratelimited(dev,
+					    "Incorrect key size; bkey->size=%d\n",
+					    algorithm_id);
+		return -EINVAL;
+		memcpy(key.bytes, bkey->raw, AES_256_XTS_KEY_SIZE);
 
-	err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
-				   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
-				   data_unit_size);
+		/* The SCM call requires that the key words are encoded in big endian */
+		for (i = 0; i < ARRAY_SIZE(key.words); i++)
+			__cpu_to_be32s(&key.words[i]);
 
-	memzero_explicit(&key, sizeof(key));
+		err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
+					   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
+					   data_unit_size);
+		memzero_explicit(&key, sizeof(key));
+	}
 
 	return err;
 }
@@ -338,7 +412,21 @@ EXPORT_SYMBOL_GPL(qcom_ice_program_key);
 
 int qcom_ice_evict_key(struct qcom_ice *ice, int slot)
 {
-	return qcom_scm_ice_invalidate_key(slot);
+	int hwkm_slot = slot;
+
+	if (ice->use_hwkm) {
+		hwkm_slot = translate_hwkm_slot(ice, slot);
+	/*
+	 * Ignore calls to evict key when HWKM is supported and hwkm init
+	 * is not yet done. This is to avoid the clearing all slots call
+	 * during a storage reset when ICE is still in legacy mode. HWKM slave
+	 * in ICE takes care of zeroing out the keytable on reset.
+	 */
+		if (!ice->hwkm_init_complete)
+			return 0;
+	}
+
+	return qcom_scm_ice_invalidate_key(hwkm_slot);
 }
 EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
 
@@ -348,6 +436,15 @@ bool qcom_ice_hwkm_supported(struct qcom_ice *ice)
 }
 EXPORT_SYMBOL_GPL(qcom_ice_hwkm_supported);
 
+int qcom_ice_derive_sw_secret(struct qcom_ice *ice, const u8 wkey[],
+			      unsigned int wkey_size,
+			      u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	return qcom_scm_derive_sw_secret(wkey, wkey_size,
+					 sw_secret, BLK_CRYPTO_SW_SECRET_SIZE);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_derive_sw_secret);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 1f52e82e3e1c..dabe0d3a1fd0 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -17,6 +17,7 @@ enum qcom_ice_crypto_key_size {
 	QCOM_ICE_CRYPTO_KEY_SIZE_192		= 0x2,
 	QCOM_ICE_CRYPTO_KEY_SIZE_256		= 0x3,
 	QCOM_ICE_CRYPTO_KEY_SIZE_512		= 0x4,
+	QCOM_ICE_CRYPTO_KEY_SIZE_WRAPPED	= 0x5,
 };
 
 enum qcom_ice_crypto_alg {
@@ -35,5 +36,8 @@ int qcom_ice_program_key(struct qcom_ice *ice,
 			 u8 data_unit_size, int slot);
 int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
 bool qcom_ice_hwkm_supported(struct qcom_ice *ice);
+int qcom_ice_derive_sw_secret(struct qcom_ice *ice, const u8 wkey[],
+			      unsigned int wkey_size,
+			      u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
 struct qcom_ice *of_qcom_ice_get(struct device *dev);
 #endif /* __QCOM_ICE_H__ */
-- 
2.43.0


