Return-Path: <linux-arm-msm+bounces-70026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC98B2E8E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 01:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A983EA2500C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9132E9EC4;
	Wed, 20 Aug 2025 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcQwFpmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAF42E8DE5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733158; cv=none; b=NefEIaNLYxvAmnjC9eLnOJXteYXtcMKvyOk7qktow+61Onc1dRBW5ffSdRK5DLTD+VUkz+o0AmiGCVkxotTKKNB4hqAStsxZ0ucyZapLiqCT5/t0ENO0pnU0F+PFtYYo5q+BLRs/svz9BluNodRxTTJTM6EseAxoIltbo2DLsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733158; c=relaxed/simple;
	bh=14ZTHl0WyMlTosvSsdQcfG20Corab0amwL7v8YXssQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9vUPziZvbUtmKS0yxCN8k3cBMWxzNYEnGF7GUw6uhPQKtoefaQtzK7z9YEkjfGkxuBsC3tZBEDGFoHFJp/MGvxp6+mYUF3BnAo2+X6rz/xuxZl0qeMBibYcVyBamFvW8MaBp1zI6Ym5bqB2+/FgppjM5r689fYclcS6FIDKlHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcQwFpmQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFCm8D007610
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=; b=GcQwFpmQUh+ANFj9
	i6RkIhJ+aaaYEb+jAR6fb78iuDMpROs+vUQIgpCvwGm7BX0pPYSJLGmwxIbxiLWa
	nDwxqVU+MQmWYUknqHrTq5+azZxufD8AIive8+q/pTVb/Ce1/NFDRMU7By7CRMtw
	7T1Q3BDWLbUyBnGYxQriuAwSvZc56KM1EMwt1Y0iFuduBuBdTYOGL+yo4iz6vW7u
	GVdMmj8jw0AXTANtYy3K8pBSFghTZXHbff+K/t5h9vchIoRqGdKXL+lh2ISgliZ0
	D8h3NOQ2n+zt6fxI5dlbyYA2FE5wB9o56glgAWQSx4hHjSh3wpQsEapSjuimrRGo
	5PGSsA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8968n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471758845dso270730a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733154; x=1756337954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=;
        b=MHfOSxzpOX2zo7zXPfngvB9shGVrD8XeO9dtKbR3gc6VOFRk2tPQhCkxdwfoWyeqtH
         GGw2/n5BiEzvr8QZqJRz9N5a/ZQdqhsIFd4MIUqqSS8VNBm/IR9t4ghjNYHbtlotUdCS
         QT5EN+osSnx+cVXeuLiNVXJ3T/8MCEzxITvzLBALO+rysYmeeW5kotcYnOLg2mVTQCu7
         nskrjZ5+w1JoN7bbDcir67ZhmTYV6Tt454XwZMcZbxCDvII8pwL7f6xUFjiQPhLIp1b8
         zabK+AEtMPbhTDwYJe+OluiKQnjPqI7zPDNKGSEeO8RrKgQUiFrEZURSp4bL85AIrICo
         Rlig==
X-Forwarded-Encrypted: i=1; AJvYcCV0XiThdSRwK3EmgQdLoM1tN1uCXjIdeZ1E+NtbBQA7sUtajvoQ25mdnx4sP5b/2ySbViWrDSco6+OP/9Be@vger.kernel.org
X-Gm-Message-State: AOJu0YwELNvTu23euioDzDM8jGaK+WUWZpoPhp2/oXHDE9RMvxGayyh0
	4GJMhNypO62fxRGIEokcy4GnAHpDonuW8ZLQfI5sR7/IkbZzpv5Hz6IFpGrcuLNfJa7SCPjQPsR
	bPD2V4mZWzo7iR7ZyIY6I7CjL5/5dXafsGEhKh2CxAZebQAWDDkS8Op/jguvgayOfqiM=
X-Gm-Gg: ASbGncu2FToqjpaQNfpGLL/b/GI9odTfFeSCOAeiTzHFF3KvP8s4lLlYhgqLCrrHMFC
	6f7S04qBgtd01xL2lXvrJScX4lIcJkX2cQzXAn06VjSVYEpmd/Rd6bPOmsDcsaaayUyOIi/c2Ny
	NCXPDNmou74rZJAW/aokfs7OOVpcRWmKkqnKIsWRNg9PkZ0NLsMuBRXAAzCTJIKpdeoS9RFgspn
	nKuK06P8kDRCvy1SYaynsYapjLOkzA66HUOqcDhQoTnr/xpyxEdFy9OX2maQI2MUirwbnA+jrHw
	RnA64o+dWmyTcTC1tymM9y49ROWxLoKkfz25aDv4HJkCdsWmoXAiG09OimGYQU08JRKWuNmQG3w
	t4AaA56KLkAQARVsTginBL1w=
X-Received: by 2002:a05:6a20:7d9f:b0:243:78a:82b9 with SMTP id adf61e73a8af0-24330abb5ccmr362762637.51.1755733153939;
        Wed, 20 Aug 2025 16:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFO5ag3pP9Jmy1XnNqoDJrAVQY6JrjsksFuA5qgnNEDHF9eaBUcb+mKI+G+v8N1kvMmPm7Hg==
X-Received: by 2002:a05:6a20:7d9f:b0:243:78a:82b9 with SMTP id adf61e73a8af0-24330abb5ccmr362716637.51.1755733153451;
        Wed, 20 Aug 2025 16:39:13 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:12 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:54 -0700
Subject: [PATCH v8 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-7-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfXysaanE49xjHV
 jdWKnwMuf9Qk3YFHJDSsbmcPSQPnYM//0/OmA5JrC0K8X4NMG8mK0J/3xX8j1/MbIbs4WtRxsS2
 opbfKSWI0LIYDmadsu2qDuUBQ4zbBPA5KrjB+6p2ZC4sIcrBVlY1jLsL9AM8GZHpHVKHAWwi6YK
 oz9G+3y1ilkp5Fs1AMVgNd5h++7zqlgbBHeaog89W1VD29+sEpPoeGvewaP2aFui/rgpZslekvX
 G/V4McliNglYAB1EOICjHgL5kG61OA0fB3D6dEllZ3V1unvpwr186TNj3CIqJr9x2SUamRV21m1
 To5/O60LZd2vNqb7/PIZ5jXPkxWmzJ16qkxzmXiUfs9bMhjOfqttxeleu/yRCduw0E6oi/LAqfC
 2yxmRT+QAbtEfkcviERVF4O3e/syYg==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a65ca3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KILOkO920qZMjHevevOAxI0WAPWfzzpR
X-Proofpoint-ORIG-GUID: KILOkO920qZMjHevevOAxI0WAPWfzzpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Reviewed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 63 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 12e448669b8b..9f232e53115e 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -110,7 +110,19 @@ static int qcom_tzmem_init(void)
 	return 0;
 }
 
-static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+/**
+ * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
+ * @paddr: Physical address of the memory to share.
+ * @size: Size of the memory to share.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function creates a SHM bridge
+ * for the given memory region with QTEE. The handle returned by this function
+ * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
 {
 	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
 	int ret;
@@ -118,17 +130,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
+	if (ret) {
+		dev_err(qcom_tzmem_dev,
+			"SHM Bridge failed: ret %d paddr 0x%pa, size %zu\n",
+			ret, &paddr, size);
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
+
+/**
+ * qcom_tzmem_shm_bridge_delete() - Delete a SHM bridge.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function deletes the SHM bridge
+ * for the given memory region. The handle must be the same as the one
+ * returned by qcom_tzmem_shm_bridge_create().
+ */
+void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+	if (qcom_tzmem_using_shm_bridge)
+		qcom_scm_shm_bridge_delete(handle);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_delete);
+
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	int ret;
 
 	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
-					 size_and_flags, QCOM_SCM_VMID_HLOS,
-					 handle);
+	ret = qcom_tzmem_shm_bridge_create(area->paddr, area->size, handle);
 	if (ret)
 		return ret;
 
@@ -141,10 +185,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 {
 	u64 *handle = area->priv;
 
-	if (!qcom_tzmem_using_shm_bridge)
-		return;
-
-	qcom_scm_shm_bridge_delete(*handle);
+	qcom_tzmem_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index b83b63a0c049..48ac0e5454c7 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -53,4 +53,19 @@ DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 
+#if IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle);
+void qcom_tzmem_shm_bridge_delete(u64 handle);
+#else
+static inline int qcom_tzmem_shm_bridge_create(phys_addr_t paddr,
+					       size_t size, u64 *handle)
+{
+	return 0;
+}
+
+static inline void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+}
+#endif
+
 #endif /* __QCOM_TZMEM */

-- 
2.34.1


