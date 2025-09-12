Return-Path: <linux-arm-msm+bounces-73204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B1B54162
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21AD15645E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5AF25A640;
	Fri, 12 Sep 2025 04:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpRy7/pW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328072147F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650070; cv=none; b=Q2MDLatAS79kyQESgRCAWRO+1MyxT4MnLQIbB3+W+HV+jonK9PWyivhWfIsKPaRq7L6lwIfxrCe0h6hskzW+HzMKf24STfdc12O6FBJCM1HZJFl+17B33GkUN1sPL6hsvNUcaFvAE3y0EB+gy1CzLZ+hkpeTmspCvODyouxgPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650070; c=relaxed/simple;
	bh=lgp1LOhLLp/W5q+GFi1cI9hy6O6fqjuRWo/O+rRQgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3LI1EeiQr8o2/hrSRTxtEVZQ1hpPdqrM5IInBJXqU1wOCwaSfbg/SSHNq9n0NfkJxyM7a26I6l34rDP3TJ5L2YKdjyKBDcfACOGwO0g5FnPmhnztv13fHpE39/h/oJoinkLHooPkyaR6s60Qvo2cv0uKvBNOQ9lHh4c+dRr6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpRy7/pW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJvtnQ015734
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=; b=fpRy7/pWGVZTP1Dz
	e1t34cDlD/ZTGfskyE/LL6vIYand7oenVD9yQVWch8rrYP+a3kdIqLPeBh6CQCw8
	wxTElaiRDoGt/Wogw+ZsQ09EWh8GVRb4p+b+PCp80AUzZxABlMhvc6poTwPfzHJ7
	ufkpi1TfRSxduaJmlqk6hvjvfvvNfa3KZMbz7J0wCXbd/WzT+4Jh7GySmAFqdX5F
	HcxJ7K58TVZsZKpjfs3uA6NbWFNrK9nICcp6PnKMf9g6/51FG26/kTpcOFR9WCTG
	FjjksPAbOki4XZZxkXvwxFoahWUkjzH19Hylj7H1QWWqCIAbW2P1TDKPtF+vQbHB
	r86uaA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4ma0e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7725b4273acso2534663b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650067; x=1758254867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=;
        b=HlBfpqCgwoi7mkN08y6GkTIl64dcYIj9PY9UWL4+V4Ws/2g1lXSFFDLfK54+K3d6gA
         U/Bk341vRbuLWYdF9JRcFXmPGHVtEsaOfqiSbpEbc+q0XhrQtuutA0mInY7g5LAVvD3q
         DMjVGfWyblU4Z4baD8wI87YxSd6wFl91418m5PuQq3f3t3leZtXI6vIM2qV4+KUC/W2+
         higEYimJhSbbpYgl5qKEnXcA7E9EoJOyyeeDIa+mvzRuf3W7I4Pw7ulBigCY3JR4znZD
         T9kNEFcVJqHd8OYDjhcK/gPKEFBs+KrqMxacjEaXIOA0dGW7MkIP9jOsv5PuP68TEbMZ
         EK5A==
X-Forwarded-Encrypted: i=1; AJvYcCV7/cz0E1nLnxpmC0xBP3w3vnp5kGYearxRiMuS7IViJ/wPyhyTkvWO0Z81Wi3bLmZICNxLnPQvg2M5GRmF@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+4694gRZxAzedtnSKcciNpBmxkVIMf4Eky3ox7W3kllyl06W
	KolaNTem4qPMKsmlYQ943lPTA+OHzZQQR3NXqRZ5CWP8HVXE+r0xBj5ZLDDFfCgHy+UY9XIQNRI
	fVngPgZKpueOEMZPFlQLLnLHSXJyZ/zirsbNV2TtYnmynPCahw9hnjoIKvdf3qIPaT8w=
X-Gm-Gg: ASbGncvZhcN2LaHPHT1bzfAZ9yru2qeYqhN2bh1Ea+KcborzBekRVZ2P+rW9bar3fAO
	we6bHnd9TmGjiJeiYPFGTzij+6g5d2igHyC34tuKKUXTr0d6TDDrmmCEmPor86nKGW6Ke3k2qlJ
	IpfD+83wG/k+Im5RnVSnlzApSP0lfm9a0eeNWiLm/ZVVeHr/t+/J4hTGEMUivQoalfrUWJvQkrx
	6uTWvXKvKxx76gF4RrTqMQ1rPbbsQ5AdmmT/rK2Vob7fXQ6B5GcUswhF+3wwQOp5AAW1rmCK6id
	1lLRxnbtzQTROq5lbbun+oK4/lfpHuvQT8wuMM0Uo5o4VuhxbOSX+1eWma+Q/IgU2mZMBeKq0uJ
	VQQnsjGfznM9qxeb3X1wsTfQ=
X-Received: by 2002:a05:6a20:939d:b0:243:78a:82b3 with SMTP id adf61e73a8af0-2602c71d516mr1871836637.59.1757650067487;
        Thu, 11 Sep 2025 21:07:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHevztzKn6DXhvylSu0O6F+lXoEaD+zI7oVZzqteG9Gk7d9QFgPnS+w+PLRXJqMaYWSBzS4UA==
X-Received: by 2002:a05:6a20:939d:b0:243:78a:82b3 with SMTP id adf61e73a8af0-2602c71d516mr1871794637.59.1757650067008;
        Thu, 11 Sep 2025 21:07:47 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:46 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:40 -0700
Subject: [PATCH v12 01/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-1-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXyslFHW5CeWuC
 qTjiLI01Dw40I8xEST8nFvSWMwpoTYnTBX6WPWblU0cAQOTmjZLxDW8N9W/mcc/DSOwUhwISIrW
 e6uYZVA5BeN32bL/hBuaTXWebZ/OR0FpFMSCoaVQ1bSMTmzYchwtx6h7d4iVVbDOGvAGLw5HDbG
 EJ2aUtRQllYH0xR2mGeFfZU9N+TxsDN6J9g1fCnBPygR6Ry/P0XjbzO89qm3frLXdE9YpilYhcA
 3BF10lVkA8NWYZ/IbxQSCibCaDKwUP0ds47KvSbVQF9r7QT213zmLeBUnX7omxiBQk5PoD220eD
 38nbqUFSnijUoh08gMke5n3XLwlQfiiCxXYqhKSs9pD3kc18uo+9m3tTCiB004rPBfXwl19VvGA
 E5EdiN08
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c39c94 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fbtLcjr9JW7UiMd1MnwWtfSL1-MZX0K6
X-Proofpoint-ORIG-GUID: fbtLcjr9JW7UiMd1MnwWtfSL1-MZX0K6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

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
index ea0a35355657..186511ced924 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -109,7 +109,19 @@ static int qcom_tzmem_init(void)
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
@@ -117,17 +129,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
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
 
@@ -140,10 +184,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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


