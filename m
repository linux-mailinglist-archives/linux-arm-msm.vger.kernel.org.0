Return-Path: <linux-arm-msm+bounces-36661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 598639B89C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 04:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18574282C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 03:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37916140E34;
	Fri,  1 Nov 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C3j/3/PQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E74087C;
	Fri,  1 Nov 2024 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730430950; cv=none; b=HGyjP35h5kxMJ55YTaHbvNQNfSkPfrDErVk3P8PkkajlsFwQjslRFza/Ui2hS8LVAcFzEwl3UzeV2OF/sarQaUjQaVeiFh56yhrNZiXBh0LEmpsTncQ44LBSorN3RoafL4OArE8wEF8k49cuN2mbbmYwmbnGpyoOTbzH+6y+/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730430950; c=relaxed/simple;
	bh=Qi2TIe/H41imYOUrpK/3+EKL9hZIl1AOGC+O3M7CsMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=TE8lJYiFTUr/f7lswmJfG8I9PMxiia8Ht8rSCHICCcc6ADwUlbfSc0R4a8BgwBIGLsygbt7DcOhJC3EJMuxQ/pLlaaFwCMyRHkzJg0tFe3ru8jxuLo3KarjzEm+LlH2IEMxkkHyalzqqeCDfhPnRgWY/N/i5h7sIi/dBMnWoHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C3j/3/PQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VC6aba020873;
	Fri, 1 Nov 2024 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=vHZvSGZuUkj2gV0yO1T3EufIupaO3WzaCX7FueHYY7w=; b=C3
	j/3/PQ3C5VUaOfoJefCv/BPCnJ/j/1dNqWNSR8g0Mn36MOD+SX6u7XvHtNcFqi3C
	DXFFv0Og2ToG0JBetjDO+LF2nJ74bpF7ZoA/zG/iZ9IiVNfVKeJvezT3n3k552wX
	RGbK1hdU2q40KlT9+N9g/I8Yi1TGRgO/XHmmwxFx1eU3Gew6NCaCiYpJmVd7ONuv
	2YmbsE4qW8axJ7NWN9s7loBfsFZQLSPRypMdRYu6vxMQ6Vi/KucGoVb+JJ8HtXMB
	fvgR31Opaa1Fobdv3bRX8sq6F28So56cE3mKOrT98TVb8jbca0hHQPqnAFOZk6cN
	vO3eEk8g4Q6igOJ/vHzw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1rpkjh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 03:15:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A13Fe7b010610;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgmd4td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 01 Nov 2024 03:15:40 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A13FebW010588;
	Fri, 1 Nov 2024 03:15:40 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-spuppala-hyd.qualcomm.com [10.213.108.54])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4A13Fedm010582;
	Fri, 01 Nov 2024 03:15:40 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4137148)
	id 81B65500920; Fri,  1 Nov 2024 08:45:39 +0530 (+0530)
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_gaurkash@quicinc.com, quic_neersoni@quicinc.com,
        quic_spuppala@quicinc.com
Subject: [PATCH RFC 3/6] mmc: host: add support for generate, import and prepare keys
Date: Fri,  1 Nov 2024 08:45:36 +0530
Message-Id: <20241101031539.13285-4-quic_spuppala@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241101031539.13285-1-quic_spuppala@quicinc.com>
References: <20241101031539.13285-1-quic_spuppala@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3yZCzmO_ZfrCPWeBPuYqMs4IIabEcJzc
X-Proofpoint-ORIG-GUID: 3yZCzmO_ZfrCPWeBPuYqMs4IIabEcJzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010022
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Block crypto allows storage controllers like MMC to
register ops to generate, prepare and import wrapped
keys in the kernel.

Wrapped keys in most cases will have vendor specific
implementations, which means these ops would need to have
corresponding MMC variant ops.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
---
 drivers/mmc/host/cqhci-crypto.c | 42 +++++++++++++++++++++++++++++++++
 drivers/mmc/host/cqhci.h        | 11 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
index e2a4700f3153..4a05f5a5d92c 100644
--- a/drivers/mmc/host/cqhci-crypto.c
+++ b/drivers/mmc/host/cqhci-crypto.c
@@ -141,6 +141,45 @@ static int cqhci_crypto_derive_sw_secret(struct blk_crypto_profile *profile,
 	return -EOPNOTSUPP;
 }
 
+static int cqhci_crypto_generate_key(struct blk_crypto_profile *profile,
+				     u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct cqhci_host *cq_host = cqhci_host_from_crypto_profile(profile);
+
+	if (cq_host->ops && cq_host->ops->generate_key)
+		return  cq_host->ops->generate_key(cq_host, lt_key);
+
+	return -EOPNOTSUPP;
+}
+
+static int cqhci_crypto_prepare_key(struct blk_crypto_profile *profile,
+				    const u8 *lt_key, size_t lt_key_size,
+				    u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+
+	struct cqhci_host *cq_host = cqhci_host_from_crypto_profile(profile);
+
+	if (cq_host->ops && cq_host->ops->prepare_key)
+		return  cq_host->ops->prepare_key(cq_host, lt_key,
+						  lt_key_size, eph_key);
+
+	return -EOPNOTSUPP;
+}
+
+static int cqhci_crypto_import_key(struct blk_crypto_profile *profile,
+				   const u8 *imp_key, size_t imp_key_size,
+				   u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+
+	struct cqhci_host *cq_host = cqhci_host_from_crypto_profile(profile);
+
+	if (cq_host->ops && cq_host->ops->import_key)
+		return  cq_host->ops->import_key(cq_host, imp_key,
+						 imp_key_size, lt_key);
+
+	return -EOPNOTSUPP;
+}
+
 /*
  * The keyslot management operations for CQHCI crypto.
  *
@@ -153,6 +192,9 @@ static const struct blk_crypto_ll_ops cqhci_crypto_ops = {
 	.keyslot_program	= cqhci_crypto_keyslot_program,
 	.keyslot_evict		= cqhci_crypto_keyslot_evict,
 	.derive_sw_secret	= cqhci_crypto_derive_sw_secret,
+	.generate_key		= cqhci_crypto_generate_key,
+	.prepare_key		= cqhci_crypto_prepare_key,
+	.import_key		= cqhci_crypto_import_key,
 };
 
 static enum blk_crypto_mode_num
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index 77368fb97eba..f2af8aaa4068 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -287,6 +287,9 @@ struct cqhci_host {
 };
 
 /* @derive_sw_secret: derive sw secret from a wrapped key
+ * @generate_key: generate a storage key and return longterm wrapped key
+ * @prepare_key: unwrap longterm key and return ephemeral wrapped key
+ * @import_key: import sw storage key and return longterm wrapped key
  */
 struct cqhci_host_ops {
 	void (*dumpregs)(struct mmc_host *mmc);
@@ -305,6 +308,14 @@ struct cqhci_host_ops {
 	int (*derive_sw_secret)(struct cqhci_host *cq_host, const u8 wkey[],
 				unsigned int wkey_size,
 				u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
+	int (*generate_key)(struct cqhci_host *cq_host,
+			    u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
+	int (*prepare_key)(struct cqhci_host *cq_host,
+			   const u8 *lt_key, size_t lt_key_size,
+			   u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
+	int (*import_key)(struct cqhci_host *cq_host, const u8 *imp_key,
+			  size_t imp_key_size,
+			  u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 #endif
 	void (*set_tran_desc)(struct cqhci_host *cq_host, u8 **desc,
 			      dma_addr_t addr, int len, bool end, bool dma64);
-- 
2.17.1


