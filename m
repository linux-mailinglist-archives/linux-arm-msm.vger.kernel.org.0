Return-Path: <linux-arm-msm+bounces-68857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E3B23D35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 02:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F72F583EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 00:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB151EF389;
	Wed, 13 Aug 2025 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoP9mL0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862531DE3A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045434; cv=none; b=rohe3S4hJAMJEwbn1YTQwwyxVuvlONCnMZ4V+6QpnYklmvKZiTzUM3cM3YwENOF6gvBKB+Si41gjoE0tNv2GBeypUWBXIbyxw56sPb+OxYEOoX0AR+7d/UnhgqkfpoA6taMgqU1813nPQNkz6U3WqpsY+zVCDWfZ31DlYeSQW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045434; c=relaxed/simple;
	bh=pKHQi5q0rF4Zjn7LuFjE5W8ncYtz1oBEEOgTdSaapz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lymhHEcb/wrkkZF27Gfdqx3IDAAeLbPa87p4nz6VtLbE5FcpaikeqbuCbaj/TM2+B87Hy0Ow58RaGTprDRo6Jw6+RoQWxJjAX8wMT4W6oSF7ECTHh+TbOZnb7V6o7gDQyUnfOZ+9BwzUcpZH1JxkR92vt6J2hOJV/X7qbZePRQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoP9mL0+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CK5H3B006385
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+IO/mYYyn556/HWuKEpMTj/0Tt68TcQ9XKAg4TOT0A=; b=KoP9mL0+5p9sVY5g
	DB+MjLf0Ot0KNG+qSe3KtuAJNplE80NHP1+TMqGVmsHUGck7syVisYXR8IH28s1H
	WiRuZXFRqr60rH9Npqn6JVrO/C7Hm1kl/XjrtCLkxMWZrM3jgOpxHReTp+/vKWHg
	RL8lFgwJYj/EIJ33JFiCfQaqb0n0qbErhvvhClbPcS1YoqcFqmq0pXP3mLWeHCT+
	x+UqLi0ReH3XZM8tHJolPV/d2kYu63MOPaY5rf/edyfRBNRA2VQJex+G9nY3NXvU
	pRHuj8GCoxixxiMAku5PnqQFto+IjLolHKzGQlJ4u4Juy2z6U5s6Efwac/XKHXzZ
	BmMMxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjnqc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2425364e0b2so70028185ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 17:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045430; x=1755650230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+IO/mYYyn556/HWuKEpMTj/0Tt68TcQ9XKAg4TOT0A=;
        b=cjOqdsjg/a6z8g86HaAyivl6y0LaXMsmUWvyk9ziNTmPdhkdvnA9CLkiDSsthvI4Ri
         +qWgG5pdCWhuiAfTSyUofbCwW0CzEmpdKoHfh1x4y1AoPhsyBX6AcE3ivzDa+OcUOMyt
         zc7ZjnCcy/3+nrcxJDXanS7zixRJZyBOV6sXTCWI3Ee+G0GRGpJ7f/H9AM+clGgfYSLH
         qK8Xv/E6cJLJpOxiylqzmKvwdBORNIxl+eICnvYqHBRNSVoRaOQ4QnmSCUZmmqJlnZdP
         thccc++uQ+7j68sx705vhWMLnY1IIdtDFrQM6HX/DQ2+mRXvErN93w0CB5PhBV2ePhLW
         d56w==
X-Forwarded-Encrypted: i=1; AJvYcCUBS85CiIvyhnQmX44XB3Py5tqM6VWjyIjY51WAfKIJ30RZpp0L7vHkSR2ICGV/kZ79Q3qpa8jpwKbPh9xb@vger.kernel.org
X-Gm-Message-State: AOJu0YyBmv/mwMv6cZZxr4TQmcXzi1ZBV74ZiNFmBk95dF7/dtjvM62f
	noWg8ASjUqT8UyJwuQhT2CYyc/CA5E3Z5ZEa7/3PTC0Ek7BTpvU2BRkhq4bTOANkadiSjNtVpZ1
	CPkh/5wxGNq74GjQSqhWNPRXTFDsDTGDCnh3dvhFx5T4ywkaAb7gWxT6cixyuVHFY8iE=
X-Gm-Gg: ASbGncuIjvJG6oT4c5Vk+IYsAVMbJtJf7drobRxS+Z172vt5vJjFCa8o7QfJPOyGuL+
	MxYHjRnvx4vgeOsyhiZULxpmNFCUNZ9zLtPUPQLlWY9Anej3nsOVRxQI2nNROhYCk2K3x6ABCs5
	ZlIe178BoWCzGFnpLn19Nss7mTRgU/rN+CXd8sOWn7hqXLChSW02zV75yxxpdP2KHUN3gpyzQWW
	RmRbZp3guhax0GahYAg4QwLmfPcaTrBgqJi73W2jIu+mGtGIhFGDpeeeCZOuReJdd0W+HhVC+RV
	K1OfO/FQ4xKjEPScAUTIqEtY80a5msU1td6WDOV68T+A7BLS0ufxR+Y/yx68OyJBfciWrLCKEd+
	9foZwFNnqAULJQGDkKrDJx40=
X-Received: by 2002:a17:902:db10:b0:242:86e4:3d86 with SMTP id d9443c01a7336-2430d10df6amr19174095ad.8.1755045430194;
        Tue, 12 Aug 2025 17:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXqDrIPqSDRuMX+/u3XPMvQEItZdm1JDG7Hzxm2pbqkxQe9lDrS+2GxflzEd97bkgHKl+fEQ==
X-Received: by 2002:a17:902:db10:b0:242:86e4:3d86 with SMTP id d9443c01a7336-2430d10df6amr19173735ad.8.1755045429681;
        Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:36 -0700
Subject: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX9cyPRZhfbLUT
 zaRkCdfLtAVIyFXSE35kUDIM04cfJ04CAivw5gWw/Coedx/sE0f4t2cdDwOo6quwdfvzMeHZNTt
 ULFdoUWALYhroRnuwz2F8SFzzB1cewYWPhTgibBLUbZSehws70GLlYLUG+ZILeAaHqTcyHdb6fh
 kyVtBKYKVwIukpGjmOdFScxlSzIucZ9yBHSEuwuYpveDXORvf5MGPpX4i+ELIkUiovY1fwO1xss
 BPgD+jG+nLjit51XdgwbHPB4Nd9oeFVoFryZRORwPscgkQ5/jgduzR42rhgZd0QXf3ZO826gfbr
 6BNdYhqc18Y2VWODrD0klBIeojrI1v2P4b2iGDLn5eGlDi0REmxE5iGUk0mbDnuEwj1PdGXo+Cf
 li8Xmj8g
X-Proofpoint-GUID: sTNXZuTUh1h7HRjrw4MCPp6WMR2sSH4O
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689bde37 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sTNXZuTUh1h7HRjrw4MCPp6WMR2sSH4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
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


