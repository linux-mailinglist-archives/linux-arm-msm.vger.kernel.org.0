Return-Path: <linux-arm-msm+bounces-81587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB83C56F10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668C13BEF46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C8735CBAF;
	Thu, 13 Nov 2025 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojTVvO+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Paywa9Mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80966334C12
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030202; cv=none; b=UhBCC1f8NzUQOAD95ZEonKs6d82ReK1IbbGV5UvXTA9wIDHZYt+Ut7x1oQTCLoO0qMz3rUA++0j4LGnczRtT+gSIGAmAxTPQBAbOdJ7guo3yZ/XsjuGt+96EJH8OtJGUER3fi35GYJHnQkaVYcBMz/CtbXaJqqlWIBqUk6sYPeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030202; c=relaxed/simple;
	bh=fTjoksev6NSdPOE7J+AhEJwpfMDv/+Zt/Wrlk/KJAC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ui8XSxD6Km7Oa5/0x1pnDG0Ub2Mm6FGz1tUXHecgX4duR7PHlBMRfIoUOMBw2YyMkB3ty2O2U///yRuxOP/nLH4TpiOHhCidd34BUyJ8gHDJUm4ikbXlqo+3Hvkxv+sEzaCn+VjPAi6JXwZpgC0R+UZ6W+iSvj/+Wag4nAvO7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojTVvO+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Paywa9Mn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5qVEV3768305
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	57ueJYK719oVT/uBqCyzf3ryZv6JEk0H+rqU0vfXro0=; b=ojTVvO+qeTUZRnWi
	h74oJZG+YjG9dUAGXdH3+tDkeE2hKF3Te1yhfeyv2gTfPKPxg/CBGize0PVQYhyZ
	pZwIDnSo0+Bkcu1ohLxSoZ6MUGNzkjTwrbRYCa6+PTgwpNo1Xnm4EYb395vT5uzZ
	yLVi+7+lXt9sJa0Go/wC0QOjgP6QBosTAslIYfaK5UoNmF2IqEYTjdk/8ReHgQpL
	MUo9bla0diq3PgWOe9Qu+Bizs0D7/hYzX3Rn27NPhiLZXPXOeCK3HCyO60rxTpou
	BK36h/Xak0ZkqONOn3gLtr6g+6zNkZByUKofMGK4VxyMqpWwUiwFW4ncjm2pK4RJ
	yzklqw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn0v4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9208e1976so645562b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030199; x=1763634999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57ueJYK719oVT/uBqCyzf3ryZv6JEk0H+rqU0vfXro0=;
        b=Paywa9Mnb3nUfmcH2OEgRwu5mTihAWsHWoHzuvNvZCgdfjgomY/LhvoeEI6oMNQ9GK
         ESSwv3X0u/WWsJvYNjNO/i1iTy1ROCxcSdezrNmz3UhKWoX18kwNMnOEPrdIpja9dzO/
         DGiydE9frQlMDwnN7RRN1fvbxcf4MEI2ZY9rSleAkhezQ6SxmyYNk6MjqCqMv8NqyLCs
         4UZf1jejI44psd/p2aDQF3KK0si28reao/AkOQ/9AC770sLOrdLyM5pdMBNwgF5ZuXUC
         DQM204fEP+7ihSzphkatasLybe9tDp36+z9y0n6Tz8snx3z5Ybf//Hl8JS3IyApQXfiI
         sAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030199; x=1763634999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57ueJYK719oVT/uBqCyzf3ryZv6JEk0H+rqU0vfXro0=;
        b=Qn8leXaftWSJlttgsrUkwUoOoZ7645H6FuyVYvWnENOc8LqiRfJPiwgZpw0qNwNqrk
         dB/Z011N8FD81CsZJe6vx3aOX91Ev7sIAoe4zwsEiVjphsEc73VLMZDFSvrnU8srqerG
         DB29TXuNeKx5uQS2pfPVrcDazY5Qd/JJ5lf3OKbFKHGGQ1olC+x1IU8UIKHcF86FJ9uE
         Lx3kARpq+5E3blQ3hT+tiL259QeulFlaM0Q3UxsV4ppPjSQZoysWGyWeEOgqAoFPg9FW
         ed+DZGUrpH5MMP2nhGJ70VSthwqICWG8iPJMz9+wucRzJcHwEmVRV+JdVeDb/ZFTiBi1
         hZ5w==
X-Gm-Message-State: AOJu0Yzg2JlLQ4sGpp24b+oWFuS0g7rg66CNjuuDaYJutVCQKoDk+Sx5
	jvk+jYDP5xgbRDbQAVKSgk6e54x8ZYGMoJbp9F8wvFmd2cn/0NMzHpwlvmdFUdm78Hb4UfdPUFh
	AQW7aoQffpnDohShA9Qc0OWxJYLwSjYS5Mjadmxun44rvbjNi2AudhBtUe1Uu/DCEYUS3
X-Gm-Gg: ASbGncso4mMCMJREYsXJwff2Q+FvZ8xdZBGN7qta64M9Aw6MGYPfqS51Xr8hLcF1IGi
	IZK+HWJ6qzU4ne+elR3GgfCxHxig4XcYI/A6SN3S0I3nwzozGIFl2SzOlHkrN33FynAxcOCuIi4
	gdguxyyJh2aK2HR4RIZUVJRqesZ62i5fCyZtqDXFZfP8Ek6JzzXy3O7O+YHveyU60cz3ANwXyLC
	CZ9UMPpmHnBYReCnpTRotf3nSUh+c2z5Wym5BxdRuXd/AbO/rwitpizH5lphcy6iup7x5lP5kgp
	WgIMpBeGsFk6ntRy5pmqJJjGtlB9UI76Kwv23w9uAILc34A0Ah2DhuehslXbB3mOrrF+Ri9T21N
	25upxdgNba2/gnfTbuBHH4Tqo/A==
X-Received: by 2002:aa7:9f4a:0:b0:7b8:383d:8706 with SMTP id d2e1a72fcca58-7b8383d9ceemr5110954b3a.18.1763030198764;
        Thu, 13 Nov 2025 02:36:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY1XfjujpWXtu3a8hAbzT70O9BoYL8drTuLVZXmHo0Uv7PJ8TP7RToqZbKFTrDLuGpWscZ+A==
X-Received: by 2002:aa7:9f4a:0:b0:7b8:383d:8706 with SMTP id d2e1a72fcca58-7b8383d9ceemr5110915b3a.18.1763030198037;
        Thu, 13 Nov 2025 02:36:38 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:37 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:58 +0530
Subject: [PATCH v7 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-8-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=4475;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=fTjoksev6NSdPOE7J+AhEJwpfMDv/+Zt/Wrlk/KJAC8=;
 b=DqGnoxhJ4Pq4/3B9CxegA3jPcBh0483Tyj81cM0Ey8W3aLtmUu8mJppZhHHZL6TTap1k1Je7N
 JvbdhWcTbKzDydbqsBYqwi8MFERKkOMqcHY+OjL4n5kZxqN0RAhnWKs
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915b4b7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XGel9bHSJmg9pP0w-tEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: KPJFHpfwZdl67OVENoefXv4wS03Nayd4
X-Proofpoint-GUID: KPJFHpfwZdl67OVENoefXv4wS03Nayd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX/LXJZzw8AX1k
 arJIR5+eKNW2Z1gSxpQcp/iLJ2HgjVpPWGIapppp+727j9O4BBOJk8/h1uI+LstavTyHqx1guzp
 ApZiJIFK4D1gSIbVxTwpEiBah9JdIOrahX2pjViUC4WDgZ8rYF8IkfxmFDMpXoc8TDN42U+AV14
 AqgNtcvR+G4fa8ITbrF0v6GpssmiyGqdr/UV4uBrWSTy/4aqeUm5hF8vVxfhQNxxY1cNrW9x1ol
 WNxEtghk2u81wJdtkM3XfFTMwvtOJOkGmaJXQ05XXIm5kDPou+yRnZfrM2ICKjmVkxwYTwYe6cT
 QAx5acXniZXTM7/SsGYEvuoFihpmZYjm+/VlVY/QJ4IP0dkPliBxDqL7vmI5Bc9QDlv91K3bAKV
 T+rziSb31OAiqwN/iLYDkuZqEEjJUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130078

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
index ba28b5d6254e..550707f2b46d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -763,6 +763,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
index 94daf3aa89fc..42621770edd2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -74,6 +74,7 @@ struct qcom_scm_pas_context {
 	void *ptr;
 	dma_addr_t phys;
 	ssize_t size;
+	bool has_iommu;
 };
 
 void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
@@ -85,6 +86,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


