Return-Path: <linux-arm-msm+bounces-71486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA22B3F3FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A67189B709
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3482E2E5429;
	Tue,  2 Sep 2025 04:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXg/LiFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2C2E3AF5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788986; cv=none; b=tZIJLKQ28kkXSq4b9goqHQTmumai3g+WMiisPhRdFedFbjW9nZFn/yBx61hVxyRRU8YurhtLuf9yYcCA2bq6hnl6OZ10WYNmmcpYnohsFNlydJQtd/jd1UsRaBWP4zHSenuZDIofEGouzCxkm2P3K2iW2K+Gfwgh0n1XWjO8a/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788986; c=relaxed/simple;
	bh=14ZTHl0WyMlTosvSsdQcfG20Corab0amwL7v8YXssQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUjdXFgi5wQP4TFE1x1fipQTs/G9FIjrs6fZ7zvJAzanoIjOq4CvbzKERBO8kXvWDe+Qk9vE5H/floQJKOrAeUkKdZpfR5VIbaP7MShlQdWVoxunMljqF0uE+VqSHdn18+VT7rYqCEUKd6giH/FowIRTc/7lGeTZJ5NF3QzpAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXg/LiFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SEnv022405
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=; b=YXg/LiFVAsACtXPJ
	+FHkmpIRGMsYlEsL0KYdLYbObGiQRj/cX6RuLEEzDDPlXk3kDAw/H4NGVYAL06QL
	8AqO0Yk3wWtFZqZTHpBr6SoVNaZBlL7NHOrDD8GsQEOtDVh9IC9Z8PopLkodv48C
	Nuz8FCGn8dKw4iQUK2nRC0xt/LzErQ28L/PAaeynvIVKiSREsFt8Hrs+iaMYEaUM
	ZUCPEYSy94EKx863nLQESFDzlyLhD8L2YO99/+oOMnHrKpGedGlT+d2E69ewvwcw
	emY0dj2eWKheYm3ynZsAZgLChtQCtV99W2fJBY7swROvrg50EIvNb1xY03x23nWT
	QPp/qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp6pbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:56:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f59889so52414025ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788982; x=1757393782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=;
        b=Jq5Tocg4ouU/SSmiIlWsg3ohxNkkrx3BFcEoEaykfz1IrrYeYCVOeOaHSEghfuQk2W
         /NowONy0RHYDO+Sw5zRJtRrryjGeSNT5Ffif4TC0iSYB6V7GGaf70mrIg0CKZvSrg9QR
         H7nP5gy+iKsLrvt6jEf+3I8jYu6QslnsFotNkMAMzTq4SuiDPc+f8Uazw40D8h+aruxZ
         rmkzIqA/aQRHiko8YN4GduGzDAJ9PDq80EAlKYs6ErQmBjlgo9ilH0HdxNtvIPbDbiJN
         Fi18/QJG/dclpBDE1kxPk8uXs87r3eKUl17jznEzO5Fxf82LwLtktmlUHn+q1p5bzwvt
         69Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVeAdBBdcJH6XFt17q68rRrxh0TSLiE4ycW31XgXeVyRKN88fmEGmIebDV5ns/8awuHwUCPrposKL0T9lPN@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMY8B38b9iVqLTkg6wiD8ZZcIk7MpKyJ3DLD1TrBts2QJbq0X
	zdThEMgd3yFzpztdLvx56Q6ea2evFVKYaZvW6/YwvkvxjEMdPqRgvpdjRD6S4ZyOvnMdHT/qtmW
	JzWNG4Nzgwa2/BF2/mh3UV3TaPtRjVOLHoYnUQIaAIAfa6XW1xEuhblWADYoJ7ma4Mno=
X-Gm-Gg: ASbGncut8I8KV1m2GqhT6DEYK4LL16+a6Jm6XqjmhF45WMO9hD8RV/HaQZMY6CIGED2
	w80aAnhks2TGufh/Mqr3eVNwCYV/2oT8dW7kKqWMZcIdyN1vzzekx2aApe+bMxFWK8df+Y90sTI
	REDL0vUZgRWk4TrlE1aL6Ghvx+mvJnZg31iOlR004eRFVrDLdxFtTrhRCQI3zrNJokzwhuGZrYM
	rHF2W0pL+jafAOwjxETzvNYB23C1OPS39MDS+MI5Pdq8sB2OzscedDn2/6BM5yvRTK4Is8qhkrk
	s6xsdybtxAxUwiI8XSyS86bcJzX1tgZnA/KAV4lFJSQUZ4IojuudzrvyIm+w0Qffg9IBLzr3el6
	66pNyuoo4WlYpU5GauWmDOXY=
X-Received: by 2002:a17:902:ce8e:b0:24a:d582:fb9f with SMTP id d9443c01a7336-24ad582ff3amr71120445ad.34.1756788982043;
        Mon, 01 Sep 2025 21:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwKlUPTcvvuepjIGRNGAAh0Ajjaqx7aWVyJoqopok9+dG27RrtPW9DkeRIgzIE6PKFiGoxdQ==
X-Received: by 2002:a17:902:ce8e:b0:24a:d582:fb9f with SMTP id d9443c01a7336-24ad582ff3amr71120045ad.34.1756788981551;
        Mon, 01 Sep 2025 21:56:21 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:20 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:54 -0700
Subject: [PATCH v9 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-7-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Proofpoint-GUID: KgQLYN6AxAa1UDhrR10l8L1y6OHwZEdZ
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b678f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KgQLYN6AxAa1UDhrR10l8L1y6OHwZEdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1Y2SbRhRVnLH
 6fN9MEIDWPDHcJsuhUGbZqqqLr3YSPOmbrEC7HZZ/GAXHk6kkDlL0ZnoOz9/H90CqTg0U5twGJJ
 dE4eN8pVJLS/ELN9YD7r2Ih3JgvRFGOyv5A1e3gA2Kt1ypf29pqUQaJ3riMO8XLa3qVXqmzLBl2
 L822M3mTEL+tMRQ/TztGdtOIToSOBCxNgdx8NYFXX1HmFBag8KevfWxOi1WLOKc3aBcG62r0FbI
 Yt/p2iqp18wMSg/nbrhpBp6go3qo6qFUUraQfTeie1WyCqGGOszoNP+an/RGivR2JAMtDQFd/W2
 +yvJ3aGZXDrHwW2vpbHxE11mmchA09gq9lcpJK4ctWZciydAZv1VEdoqGMzCKuwxex1s5moBJKC
 /ndAglu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

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


