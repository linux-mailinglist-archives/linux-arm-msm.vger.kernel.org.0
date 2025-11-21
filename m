Return-Path: <linux-arm-msm+bounces-82814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B063C78A70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D32214EB7A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B1B34BA3A;
	Fri, 21 Nov 2025 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmM115u6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atsvRWIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB734B66F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722920; cv=none; b=eJNBWEL1IG72WGTj5lMOZ2zuPcCrQLJDde2ngM+73PFaQtdzsXzzfOLRO70D/iLVntq6yZ4E5vYaiOnyWYhGHoD42W10fQj+sknBQz7J1zLGLcNh7uFOzUho3c9OYt6ypKhwy+TVJJZbII3EdtZfBDszJr/WbE6doJg/P6DYl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722920; c=relaxed/simple;
	bh=UqFfKH9OQZ2/b4o5VCHbeXo4Mslpo8i6J1vh9DY1woc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgEvOxIZWqspVEXH8ldysUtrijctvHEyiaETU1Wby1fvcBgb/0Q8Yw5qQk7eUjeEiYv6VdqtLrhZTou2nxr+Ub0+kED5YmG9jpkydn5GiGX75LUSwPN0ID04hM1QUk6gzLnUGVwdzerfcVW8M1ctJqnXTns6PfkO/SzXE5F6GW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmM115u6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atsvRWIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8Z3PC3139883
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxCwmKSgjjNw13n9fGKA0+T8D45i0tXimnQWF4HRz2g=; b=MmM115u6Ax2YZ09J
	ImgNd+vp2INJTy5BY/6aFzyQxcU7j9zApMVFBwqLTE3Tx4/D2Nfsp+xeRO8+iDS2
	VEWVf7UntSY2XjI/gGiV7pWZI6zt+K5udT+BkBwvQbYwLPqKgj7gbvQi7Iu/Vfci
	NQIpOCqNqZ035Cd5oEL6jY/o0YAdj4uajBAr6CniLmrJWtIXS0WohNfA79HV/FtF
	0M3ajDz/CsijM9xXYvX/AslhJ/XperAn9ZpIUVzuzUhOk2Vi4Pbz72JHcDvi64yE
	sDuWtH3JiZmlLU7qBCuT4JDyHJzS+KP5boX9P56wX1DQIU8HjsjpEDNKKrmzU86W
	zQU7kQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgm31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso2430108a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722917; x=1764327717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxCwmKSgjjNw13n9fGKA0+T8D45i0tXimnQWF4HRz2g=;
        b=atsvRWILxXmY/XpVvWtj12ovGkxdv/ggPm9vsM3WJHLVTwUoU1zzciqR3muTeTnrPP
         cGcx2hLek5NogwE5R0PrC/UadlEjCIrcOPiNDxuP7UoqYpy7XSu+6TzE455ol7fODhLh
         S+riqQG/U1IKsCltk9I3AdXlQbDZ7kND0pxDqF+Va9o33nkxbbMJmJk3N8STLOiJ0QyA
         hnMBLIOtmKpk0XrQV4XLcoYFioM2dW8w8dJyCgoA1Psvo5g08PKB8GkG2BNbJ2BoQm9l
         AQS+H1meJQiwOjqtqAytzHMe+EauWz0d5rAe9V1h8tmNWa6rkMbUKoOtN1ZcXY+57Vih
         U+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722917; x=1764327717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxCwmKSgjjNw13n9fGKA0+T8D45i0tXimnQWF4HRz2g=;
        b=TynF+qww82Poc6edy9gK3M3MYg/Mv3NR34nMgC6k+7bAzT/8+Ds0IVE+MHfO0UKXu0
         vnjRZsqCmKBBFA1yUNV0lnsJjVfgZSrbYTBmJ6F/+o5cMwOIOJ8xyT4iiktGUa/kuBuN
         TFvXkNIx+0+lJV3lMflqHY+d0mbmz37yniKHnjGRAyW6dKU5Z7XkTggM+I4oxsBln3T+
         6XG7eEigjQdhdoiE32yuMS4hBZqTBO54GmAAyNQI7rVYwF14AFvaCVmhLav448zeub5Z
         BWCbgH28Ob+B0ZA4s8ZAQf7cTHX68XEzxEwKu9faU+lugzhfgGNLPSYrNU0kKg625/kx
         8OAg==
X-Gm-Message-State: AOJu0YzB5Wv9TGd0ekk/BrVWjzHn/sMzN6A/yMXYplsRfQuJfg6dkAeR
	Vog4Hjdk4A0HDu2kLQ5YJzmDF+jEefObkRx5XPBj7BmDiXVzejuek93gYhMu0cyqaYbrig6cBzd
	UpPwQvm/rhhNOhlf8WzdAjgwjPJjefk6/59ZFfmrErQaU/tcnbv06uF4+uNYncbYVM3qT
X-Gm-Gg: ASbGncuUXYUti+TwLbPvBTrA0KXosCl5LKhiy3FUv1dJcl3yxwABZL/qJM2Rw+8MQPU
	v5pqQzzPzKY+TKCmDiW88K5b3HomzQws18o1/bkdIBe07xTfFnkmO1z7Y01gYaD4YXbwwCwpARy
	zqL73nud6P4SyM6acKz6YbAJobtKn78PwpwfN52CJ8WBUBlwg1bUJsKeNQcRTt5U6qV8eoAjBJa
	l4ZxVPEXm5nzUL6UuRS1G7NvhcG1rS248eDR341CNa7sRlFarhq2dD74Mf4QHqywa8z0wWtOyPE
	7Kl1JydsmgTWwgQsb0tWcfULjR55738v76BtYUzcvuOurGJq0HCy6LRvkDWmaCP1bMJc2rw3yJ4
	ZGhnP/GdftHcWdeCxEnqDjaEcNEbJy7fvzQOV
X-Received: by 2002:a17:90b:1d8e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34733e6ca89mr2344630a91.9.1763722915434;
        Fri, 21 Nov 2025 03:01:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAU6fbd4UxdagtjFdeI2dmaV9rageThqIRRP4Uav4AtmbuVsJdn1nDo65ZeIRX/2x0AU6DnA==
X-Received: by 2002:a17:90b:1d8e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34733e6ca89mr2344579a91.9.1763722914733;
        Fri, 21 Nov 2025 03:01:54 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:54 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:10 +0530
Subject: [PATCH v8 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-8-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=4464;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=UqFfKH9OQZ2/b4o5VCHbeXo4Mslpo8i6J1vh9DY1woc=;
 b=/o8Qqz1ez1O2tJ0tSsDVKo5DEBeDJX5QdQsu0WqNFMhFto83aKEJFMHfxcLiefKgjNnPcw0Bf
 si6feT076I0DmwytTosjLJW8EKRZIMvpdMBz2ofYVUZRzLAbVONy2OZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: Zjog7b7zqohg3TovfdSnI6Z18E2NCYhC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXwLuKCirpGMTG
 YUUKZNBakooDAS+C7i60Ca8Rt8Vkz7KJIHRQ2M4H7okcvszGbMKaVJinF1tof6vVoNNkC9mU730
 e47onXQdmbzc7KUnxlD94WbHpvTALz2h5227DzMme7GyrNW59zbamywpl3y/+5+B1MaQI2ZdMcw
 Eq/ZvYqz4Bj1nVcHZOf8ARHP0+2BgeXtWwrIVEBEKvPLrvY1MB06jZGRfAKBSYToXU56akGEQMT
 01+vTEPbeAY/j/b3KKVsEn18ACrQlC2rlmf4UTI9xhrSPyJM550Zd7n3J8ZCP2lnmg6efFlN0es
 rAKZaOwRV+NcyGXI7vUaK3Cb8xOXcJhn5myutCDv6BH9aa+vbXKhc1JYMNHYwQsBWCD9KR02s3P
 ZlArISYtEHnZteEceQAOBaLRYfxHLg==
X-Proofpoint-GUID: Zjog7b7zqohg3TovfdSnI6Z18E2NCYhC
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=692046a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XGel9bHSJmg9pP0w-tEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210084

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
 drivers/firmware/qcom/qcom_scm.c       | 48 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5fa974683ee0..fdb736d839db 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -765,6 +765,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
+	if (!ctx->has_iommu)
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
+	 * auth_and_reset call and create an shmbridge on the remote subsystem
+	 * memory region and then invokes a call to TrustZone to authenticate.
+	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
+	 * subsequently call TrustZone for authenticate and reset.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret) {
+		dev_err(__scm->dev, "Failed to create shmbridge for PAS ID (%u): %d\n",
+			ctx->pas_id, ret);
+		return ret;
+	}
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
index b10b1aeb32c6..ccb8b2e42237 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -74,6 +74,7 @@ struct qcom_scm_pas_context {
 	void *ptr;
 	dma_addr_t phys;
 	ssize_t size;
+	bool has_iommu;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
@@ -87,6 +88,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


