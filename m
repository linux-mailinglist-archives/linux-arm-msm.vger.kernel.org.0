Return-Path: <linux-arm-msm+bounces-73043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A81B5272F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050A0580FDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09B3241CB6;
	Thu, 11 Sep 2025 03:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIs45YAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006D235072
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562091; cv=none; b=UKbXrHbWqaQjlKolLnB6aK7b2qFQzFw5X7lmj7BFkYmAdNN75OoGp7P0bcxhVRE5yC9HMG0vW6/65Ca26JXyu6S4zo49b4D2kOtklD16IssC9acPT0q8JtejbWG51u9hcWER3DvtScMZGwfWGXcm0xVlXB843gpOT8v6OUYetxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562091; c=relaxed/simple;
	bh=lgp1LOhLLp/W5q+GFi1cI9hy6O6fqjuRWo/O+rRQgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLxq5vC63qeIVPvLM8qM1RA5RPtB9U48I1blsQ1+CiucLoPKNaIt8FDq1SNHSslUjU2QdpZrdijEZQZFcoC3F4J6z80RonzyQd28VwnJgQ0Lmf3nlC634xsxaRkgTv/s0e2ua9niJT2mmT1Z3fuiV/Z+/TRcDY0jO+uD8+Bf+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIs45YAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Iurg008859
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=; b=EIs45YAro3qEwEC3
	a49S8A5D3EncjdPj4pIvqAWDdUSLOmHG2HDZGjZuHSARbL6L6rSQhLJ91KRJLPg0
	vVLgDbfsziahyewB62mUcRNrkrKWFPciihRSbL10ktDRqQlC1mnzL+gPOwHVtB12
	dAiGsS/ItG3P2pXKFK2oRk1R6Qm2uA2ERieOcO3a0Nr4HvyWnDb9ba5XhHm6oNM3
	bfgpkEOMoOK0nuYdpgPdOUSvSCmq/pdWgRjWz7ZU+FxpFXomJEQZQBjObtHys6AR
	uignD4nLgz5sXiwtNIAnyVDI+7DP3Goxu/MCFYLDCAPt64nDzzU2C7LkOgdIONfO
	zCfOww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aappd9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-248d9301475so4381055ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562086; x=1758166886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=;
        b=KGmfA+PDOIy1j4t0YbS+F137TwA75PDpFdnS+zPUwIJHVraEUKZ6fNPexMScXLYleg
         3ApzlI1LX54j5Ob5BJQ0dC5FFOhMKgW2RBu/DBQRTK0w3PQ6XD+Z5WABThvQFD2rSmtk
         FNozo7J8C81e2GLsHJq04UYvP4YiBcym8JSm980JHIgn3TrQqjE9+JKQLUKWH2Ph2m18
         5eFaPQKS250QKTFUrCYeYANVwuW+lcHSqJzcsUbi9gF81eUyqXYGuJxOP+idbMrtRTMh
         I2tuhWkAVtrodMfGEcFRneq5FCZNQq8kHma0pFzVR1W9oDwVz5r1EIVB7m55x4J+K4KR
         acIw==
X-Forwarded-Encrypted: i=1; AJvYcCVp/TVQ531qZ3YdgoaG9wODr3/Rzc0/IFPcIYT99+WH1Gk7f50OuY787It7ahk21boEs+bVnPZu9D7l1m0D@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhGgSvbw25342t75AH4hmvL8YFs/54lfczrIqgdiZDeduwlbo
	AJsbFyb4Y8v6X7fPdoi3O3Quti04VG4KRhsy3M3XFJL7dFAgukXBZLiC6G/BmYglZXHM/3+7ig7
	omUgRo6esh+p0ChPWtwo4XFhnIU8bS2rJ3345VDKc6VaKhpuCch3AfRC2f49ZN9Gqb90=
X-Gm-Gg: ASbGnctoz6PUlNPfauYZ5lmQVx+AGh8Ddt3GsGUZS8rQvcF5XJ6n97Bmntz7kEN6S8X
	vvb/aGgGVmCKSRyx8FhpSpTJDAPhxe0R1ksl7a2jWB0UiKN0rzdkcqQXNKzpDWNQ6fXlBhFm2qP
	lPiqQ6sR6YG3jE0rL7iDG6TsQSc2GTO4Z2edm+liE9fzjX9w+wo0UTg3sP6a6vmQRr/VO/rIujz
	Z11RUHXZJnhe/AyLZqRy+HlxUfzQooSMnanTAAsE+lp/KRZ5v++KLr1eZp2QYC/aTXKVLhBF767
	H01NDlslv8PbcqrNZSOFxCjaU8TsT8583hj50mCW5rYE++E4DIIPTeHTVSxQYNKi49kOJqaqT/j
	BpfzBIbas3IDAG2BuFOrymX8=
X-Received: by 2002:a17:902:d2d1:b0:250:411d:fa83 with SMTP id d9443c01a7336-2516dfcccbemr289529715ad.15.1757562085889;
        Wed, 10 Sep 2025 20:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNK+dvhXEwjPbidgExO5vSVEoN4mnn7hiDWFYTbts3RbLRlhWqysKV/H87BRXyKuni3VCG8w==
X-Received: by 2002:a17:902:d2d1:b0:250:411d:fa83 with SMTP id d9443c01a7336-2516dfcccbemr289529355ad.15.1757562085362;
        Wed, 10 Sep 2025 20:41:25 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:24 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:14 -0700
Subject: [PATCH v11 01/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-1-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c244e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rNLxCkMOCLuCwzL-bpCvUfpNZ0iq20IA
X-Proofpoint-ORIG-GUID: rNLxCkMOCLuCwzL-bpCvUfpNZ0iq20IA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0G7KQP6S8ud+
 laWFfu4/aXrQ+WKbTXus5XruIxekou8AEYXdKvl/4h3bW5nOIUdOC8I+u51jdgLF/yf49FK5U/o
 0fW8IZKXKoLvFEk/V5Ey7XU7A2a2ZwTRY73B+6YyJjNtqOHY9I5D9aV4yLJGR0rqz+Jgw9FWTo1
 YvMv7mj948HDsyQHz760tmU7RcCBZJtgBVK0cVl/928XTFws2Ql+Ukvr4aTs5pA5c7OKDBgc8kE
 h5KhohgV0Am2/r5Wa4rvOgl9jM/kMmjHmNmKq1iNI6fJYb+QvUo2HdHxBJViRISL2VT+Vb94arg
 45g4zJFV1pAVdnGMA2Er2udkd8YL6RBqENXfwzuqXt3lbQISE0iiw4po6Sr+KxSFqSGm6+R+N1m
 SAQ33HD/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

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


