Return-Path: <linux-arm-msm+bounces-59478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39333AC48DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 08:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B0F3BD936
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 06:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2096020E315;
	Tue, 27 May 2025 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqqw/CxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA7720A5E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329053; cv=none; b=dpm91t+7hrMZxv0ziwSv+F1+9/BG+0sNUHzQBo+X10q52piN6WI9/N7DZVur4Kgm97gVxrZJN79T5GFe8o+e7CsGFONDb/fsp/lTQHXuTLCq1PcvWl7jcM25/Pm5n0QOlXHpXOz/PbvOy559lwCogZujNnSl58WcUeBLSJSF5tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329053; c=relaxed/simple;
	bh=7/v8pHGMu5tZ7WvXe6QKV3wxG6RFDr9pfxy66V1wC00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3NijRrULyViE1Mca/s8KroPpbF8L8L6VluouBpzszXvSCDqXMD2u27roYnE52ZWo9Esl9S3tYQ8eDlVFNU4IFwc6RlraH8AMUOm9uBTYyACVQgetHGg8E4JUi80VKlPs7UsLLotWNu/fWY3q9w1kQWPNXVa/57496882gLnrrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqqw/CxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R001VR027040
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7p5wIcucyhHrQxwAItjNvN0FjGJcDbXXW5crNDRZCE=; b=gqqw/CxBBoqY5ULM
	fhcwR2ESp+lUhMttOnb6nQUvjxqQbxsjrr+MgvEYDEZOzFFqdqhVRCcr9XCA3d8D
	1dJmXS2w2BEJswAvb/fF64dW6c8lxAUNLcwPgyGUM0jKknOq/lfBYoAsNtTG79ei
	/timmgLU6ND9wxd1rSg6PC6NcKobi5/7jKSEMeERXmZ117DvyM7wN0pEmeFjJhyT
	PhlbVzAJLncHtJySvLPpezCG89r68mdEbBPmhjOm15NZjYvqve0klavWogw6WU3y
	Lqlmr7ywNB+Eip+HMH4LsMcfHaOBIjSykk1mS1X5yKIjenZcM3DQRtDsxiapt9Qx
	DLGt/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66we4f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742b6705a52so4303889b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 23:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329048; x=1748933848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7p5wIcucyhHrQxwAItjNvN0FjGJcDbXXW5crNDRZCE=;
        b=ZnqmThwKyAhd6YHduEEc9qextooRNyAfpRjUKoJ6GOZT7Lqj/lI5QDbh7OcFp6fBtD
         94IwvYmGXo64rE8fDyN9p9hBcgr5sa26pcLowFP32O2iAVWHb1ot0ICCby0GVQBdso83
         YiMic/0X05ustGY2mJdhvItddwnUtD0fCK+1GL+mRwF+CbHHIBCHkX060LzbUx1S2yLm
         LkzLbPZG0aKspoAAmJLA853uSjSChRXblCHgqRJYtZbRtBWNH8KuhB2j2xhEHRybF6G5
         hBbXOdCbzPXCDjmIrFtK2/zhetb05KOsZWpeSPzJq09joL/wXqN8yGAS/jj6lLsHUczX
         8O7g==
X-Forwarded-Encrypted: i=1; AJvYcCXZPM2vZJ79pKMUg6h5Q5CXf1mKehwKdjF2uNsf1OfH2hIFZXNKJxr7oi2GUYx16ZrLx2cM2tBh7YpXRMTe@vger.kernel.org
X-Gm-Message-State: AOJu0YxUj8KLcCxjUocxx+I6PQDL+5G0TyZ+O9WnTEmzAIz97UIXeJVG
	L7wI5CcVoV3pF3Q41KZpSNNgRqz85XxcdX0NQ1HcKOAWplc93ly1QsU7T1qIWqewnDjUjCUR8HP
	5tXvho2vd9dD1YvFbYDPBtauhX89a31gU2vYa1RITFYe1S7wt49n/JE9UtXKE9z6yz7U=
X-Gm-Gg: ASbGncuc1xOZrL3+Ad9Ab/8QqL0hh/ijikBxRpm5D9iF1GpJSq/DL5kMF1p3XX3XjlJ
	6ax1S9eyxn4MWVbCjazH7dDvkzreUYzFe2q5Nriji2BqtQ+HK5yoeQnPbbOzWerL4GzDnyI+Y8h
	/KohKi0aj2Ik/rfIq+c3Fc2p+NwzA3PM62IaKdUyY6b+MLTbooO/ST4/M2ewhf8mJkBLytbDBYQ
	hOG0hAcabXytFqapTJ2sWUfwBBrCY24YyuXaT48y1lYibwdLFpxJ/AzfVBuf494TupX5lYdPI9m
	MyRYF7GUWDq6R88S8bnhaSkN9bkpnUZg/yZ0RaLzR2wAUKSMzzNTwAPAnxoJ+vMBdYyqPSk=
X-Received: by 2002:a05:6a20:d486:b0:201:b65:81ab with SMTP id adf61e73a8af0-2188c28d896mr19833050637.23.1748329048479;
        Mon, 26 May 2025 23:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFexkA4NHo5Y8HvWG8uKoYr+LSlplsErj4F0+4oeGi5eDPlEZ9aK+pCe05GQcMii+vdIgVS7g==
X-Received: by 2002:a05:6a20:d486:b0:201:b65:81ab with SMTP id adf61e73a8af0-2188c28d896mr19833015637.23.1748329048099;
        Mon, 26 May 2025 23:57:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:53 -0700
Subject: [PATCH v5 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-8-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68356259 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3kXhYRWtw9Irv_SeMY3hWBytPJK8Hvl4
X-Proofpoint-GUID: 3kXhYRWtw9Irv_SeMY3hWBytPJK8Hvl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1MyBTYWx0ZWRfXxpRMAS7atZxj
 g5jDYI05YspJLqWHGirDTS1/VU4vj/OmRu1cuxVErfyxD8HWliz1IfV/AJTazja54azxtghys0S
 /jGLR1Xp5enCb6kkGswYyrBgUfsMxHTlKhBH++Y7/6F0yS+wUZrmNSE08j0j1M8ixUOmYABBei3
 K8Eyjl+jE43k3z53AcIIzcF+22MuJ9caCV26C2NSe+nYdNSSOhbkPPQNW5RNjWlbz5p0uqBTSKd
 CMO4KSyjMzZWbNxwFmkzQaQ1Qf3YUeqN15rPjQgVshXxbiPpSY0kkADXWVkwA7/UNrTg5G7iOTa
 scU9myMVklepjarDpX4B+IxdYmSWQUDUyN28USrrnAyCwUE/4Ypq8axXQhy/WUG4gEVPSDRfyDf
 gUaxTrGgSE6cw90o0jVBR21fXyOMXr4abr5lOAImQxNW2Sn8r2YHjVPgYU1qL+ZBx8obeZ3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270053

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 4fe333fd2f07..e9e4f06924ae 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -108,25 +108,61 @@ static int qcom_tzmem_init(void)
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
-	int ret;
 
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+				       size_and_flags, QCOM_SCM_VMID_HLOS,
+				       handle))
+		return -EINVAL;
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
 
@@ -139,10 +175,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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


