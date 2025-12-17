Return-Path: <linux-arm-msm+bounces-85579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B336CC8E9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA199310BC5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9B33587A1;
	Wed, 17 Dec 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exmRTUtY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoLSh34o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4D3559C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989339; cv=none; b=IPuRtQhYxqTkDX4xRb/eOyEdBpHFJVMg2YIyMAfPfa8XniZNhvZFPn1dLhBogdWyuVcwdhfjDzDVmWOqxgrHuDJhjgFuWuvzG++5Jsxm1ZChJrOSzr1j9u2TDd2/FrME8sP8gFggqWKx1pH40KGKEIua2A/aj5i9seIrJiFfNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989339; c=relaxed/simple;
	bh=MURXPkpEC/xOXXV+7Hny+kxua83YDbtkof0k87rP6lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRW+KDre+4+dBi2tgOYSv306+wIZcWYNEpwjVN6BZVUuAyy2mF++0ooL+n4c6iV10NgHlAY2SwGbbVWWLpw6E47+sZDp9Ci3JAF5qybJEAJTeP/X5HV2EcLuu1Y3IwbyHP8sluONS+AdWIeWS0oHInFPTxBb8ZetlLclyw/DnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exmRTUtY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoLSh34o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKwcb2684178
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qT5BFepzd7rbt0hfArrMBQl3VS+HZqO+X5pcltw8Y8Q=; b=exmRTUtYrmKPDdAH
	yCVirK3m0XynGCRwdqQA7/34RKWTNm+8VRwEvVxka0bf+8GSwrYdP0CnK3acAEwY
	K/QY6ns24EsEjRRqZgD4RBQd+fVTpOZcj58Phs/j/NOOfGq6zhKg0x+ZtS2otGeS
	lyY2nKLu4ioJJvChH2U93z7Pu/fMMiDafnk/1XcF5XR3oWOtYfvX3sNvGoxMpB2N
	FssvBlJvy2F3mCjjFzCBlaALiBkVBbt5oCgmT616rDo47ycBKyH93m4mCcJiBaLU
	BiMVsi3eJlaE/oYg1ORP7PC2RG9D60fmHNevRC+9KKO7PsSLb8e+0Nj5YKPkLKdL
	PxPQhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kketm4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so63709535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989336; x=1766594136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qT5BFepzd7rbt0hfArrMBQl3VS+HZqO+X5pcltw8Y8Q=;
        b=QoLSh34oiItFRIEMU/wz34gLdrsowuFD7ATAKLT3kU5EytZ4vqFF85LNCSpb8ESgPY
         LA+s9iuReXBQWOQ0sGQgpXB72RmvKtlm38M/qf4oELi5BbH1KrmNsNLPzpaul8pUYF9f
         2DtSNVOQXKbap7Twr0MW5qknIR+xN3pZrOF3Nz1N8va/TozlAckluBnuHBj1dTHNWDIn
         hMgybqwEJte0uyMpDoSdnQ+pAKtSvIuajyNV2X3fTw5sMqIK4WB5E/4SdSV887juQSY7
         m9vXcrzU27as2t7TDedZ6Wx5wHkDdDwNnl3I0HAh1I/tnMGLKTyxkMgHlFuDkaGbMbSN
         GHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989336; x=1766594136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qT5BFepzd7rbt0hfArrMBQl3VS+HZqO+X5pcltw8Y8Q=;
        b=QVV38KgYb7j3Ym45h4ctu4h4COuGS1YEgLStCAykjbaV/P6iSyQnx+r/FKLQ99+LZo
         hjYBxkrv8gi4aq+lOOIoL2iV3B/krbmIT8odfQN/yOUH4Dknzmw/4+U9HCdzuRAIH3Mz
         PRXpzX6vL+uJCWbXQbcB9s6SbLac7nu5OfpDuNTlITEyhyyrGcXCln2NvhWPxsVpJo6+
         oZW+zFws64gneY6euZ222thHSFUYOTmAb3GrRFS836aAUEuqpaiD7YtzaYlkWx71gJnA
         YHVcZ/E5JCdKhpW7jKWZ7xStLngYNGIoj1e4HMiQdKqZt+gJf+68PjmSY1qcULgfpVEa
         bTPg==
X-Gm-Message-State: AOJu0YzUmzHnv94QyQ0DsJkt/dORIaD9bytxE5eZ9EZOoNbgka/gXd3B
	uBaZlsD/KQC5rt8j9f3pNn8OMahy5yjRE83+bXsxQIV0xuOlWHFaMZnCOwiHBYKRXx7hxdejZ/l
	F+mnmFBoogCnllinNNyAVteGklrDODvzB6iqFVaWIH0K/CPNdF7D4UTSBou2dAh5J3gUBR9tG3D
	+r
X-Gm-Gg: AY/fxX50Jvlf1srT/H7PlabxcVFbN0GpklcH3zSutyR1CO539FRvG7N24ea01PIPboQ
	y8egbmDfivalgBV/DdJ2M7M8o2H3F4844HcFzK6QW5egDyG4gC0s2o3EwaGGBbPFUXV7bN2SdyB
	S66LTGCOUuh/56UAaX2Hg8fY3QiPKID5ARH6tWAZ2ycWrHn+/EY0P+r2jbc8ovvN1WTU3NUjt/L
	/qQp/aWHNdyrhPGuMNSF3BRk4rVUAAP2Nu7TDGmrXgeRYLfk/sJTDi7mLXQ9HOsI66/eJ+A04Mh
	LYR8m7aeHnKvy8Y0LkAnIlhU7rhub9/CrIwQkFnZke+74SMxu+rt3fn/pgvCFcIp9+yhGonU8JD
	6zUmCGL3h1/Dm9tvgOg8WNAnq38aPraVzGZoe
X-Received: by 2002:a17:902:f608:b0:295:99f0:6c66 with SMTP id d9443c01a7336-29f240492c0mr166298655ad.36.1765989335839;
        Wed, 17 Dec 2025 08:35:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzCuL08VsU30g18T5c0uG2WctXHpSQj/0LFKTcJ+aiLepK+rXLcud8l7XHVxe2Y9+DofgMbA==
X-Received: by 2002:a17:902:f608:b0:295:99f0:6c66 with SMTP id d9443c01a7336-29f240492c0mr166298455ad.36.1765989335293;
        Wed, 17 Dec 2025 08:35:35 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:35 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:44 +0530
Subject: [PATCH v9 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-8-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=4371;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=MURXPkpEC/xOXXV+7Hny+kxua83YDbtkof0k87rP6lo=;
 b=ObETDsUYWpEwoGAOUYSBHqeMjTtOcABj8MqcUdIQxxkBXMXUfc7FhVEVrwnHzaiRtERGFYm1q
 +WQlp4QAVR3BH95FInqUTnvSpVRYkjQNLEVKAfroPdXyfNwQmse4xVA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX+B49K2YGPYQb
 ME+V9sGR8CMBkOfIgn5N2oQSqtJ8N4jcYWDcEeBCxYVdX6/FpuWWdEzfOIbwpj2Ost0LgTcBgpc
 o+FX2QxsO1N0ANkm7Pe3osaxIIz373GJMjcYcWM/xxGgeMUlSvanDznwd/A0MvDkRbskllCjSwh
 MaT2IAQUjt8fb4L9OBBO0+/tlcMHs4NPqf01XpH3fr5yqPbAKQFIs8pReD+/4IpKbWcBcVKm6v2
 5URtNhlBdDvi2lfwwtedURz1opc5NhrnyZi5NF/Qe7X11liuIWjd39XXXAfHRfyHGtPLoPZ2HSQ
 49Yyri7DjC5vbY6V49xHtx6/sD8tyqD/BN5vVQKcMV9rH9sSH6+bk7X7SoYO+F4HdAjdo4lefau
 TDcJV8B2oqIxzHNh/3eWyV6YxjBzZw==
X-Proofpoint-GUID: dkLR2dqASJ7ZlJM7BEPrEIdjVQsZanV9
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=6942dbd9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kRiLafTeVKqDyNwm7Q0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dkLR2dqASJ7ZlJM7BEPrEIdjVQsZanV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

For memory passed to TrustZone (TZ), it must either be part of a pool
registered with TZ or explicitly registered via SHMbridge SMC calls.
When Gunyah hypervisor is present, PAS SMC calls from Linux running at
EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
creation for both metadata and remoteproc carveout memory before
invoking the calls to TZ.

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge before invoking PAS SMC
calls. For the auth_and_reset() call, the remoteproc carveout memory
must first be registered with TZ via a SHMbridge SMC call and once
authentication and reset are complete, the SHMbridge memory can be
deregistered.

Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
bridge over the remoteproc carveout memory when Linux operates at EL2.
This behavior is indicated by a new field added to the PAS context data
structure. The function then invokes the auth_and_reset SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 47 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 4edd475ef848..d3783166fea1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -765,6 +765,53 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
+/**
+ * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
+ *					   remote processor
+ *
+ * @ctx:	Context saved during call to qcom_scm_pas_context_init()
+ *
+ * This function performs the necessary steps to prepare a PAS subsystem,
+ * authenticate it using the provided metadata, and initiate a reset sequence.
+ *
+ * It should be used when Linux is in control setting up the IOMMU hardware
+ * for remote subsystem during secure firmware loading processes. The preparation
+ * step sets up a shmbridge over the firmware memory before TrustZone accesses the
+ * firmware memory region for authentication. The authentication step verifies
+ * the integrity and authenticity of the firmware or configuration using secure
+ * metadata. Finally, the reset step ensures the subsystem starts in a clean and
+ * sane state.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
+{
+	u64 handle;
+	int ret;
+
+	/*
+	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
+	 * auth_and_reset call and create an shmbridge on the remote subsystem
+	 * memory region and then invokes a call to TrustZone to authenticate.
+	 */
+	if (!ctx->use_tzmem)
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
+	 * subsequently call TrustZone for authenticate and reset.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
+	qcom_tzmem_shm_bridge_delete(handle);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
+
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @pas_id:	peripheral authentication service id
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index ad69b51fe6fc..d6d83888bb75 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -74,6 +74,7 @@ struct qcom_scm_pas_context {
 	void *ptr;
 	dma_addr_t phys;
 	ssize_t size;
+	bool use_tzmem;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
@@ -87,6 +88,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


