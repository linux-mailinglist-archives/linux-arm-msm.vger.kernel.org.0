Return-Path: <linux-arm-msm+bounces-74301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBEDB8CF94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CC954E17EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C893F259CBC;
	Sat, 20 Sep 2025 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1n6KilZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBD2472AA
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397338; cv=none; b=D40BIBhvrSf9dk55zyICdEp4y4Xpkm5CHpTTX8dy78h18l25fMhRK8vMO4ViDcdpdCmFr1p/s2S1Qam1aVkM918BvSmKGsvGGJe7vygYXs2wCuDvH48+LGl8hs9NDg1Ruo1pvxg1fuUkVYijs6OKm9F6VL5HNTEsK3EC0xfGlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397338; c=relaxed/simple;
	bh=mBK4xWLjc9TvI3NeWK+E9cswJ+S05RkyGn/yLnOBu0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZSdaASEHMyD/EGSL9GcqpSfeQACaI1j/piHaps36dpoqF6tgKg54GyHxM5xysi7jGhWBAQo2RIcgBFHj+c/ByKzYEk958w9lUXMtbZcR3HDibX8ww3uwCfipLmZEr2hzGKfboB70MVrEy5+T8aqmnYLSqeYoNIWTvAT7I9dQTqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1n6KilZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KIgMqK024558
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krWOjnzkrbH0g6vYLA5+TbCnPOx5zLg6rDU2gNyS5OE=; b=K1n6KilZMmzWEgTT
	NwAoCJ3phSjsYv744K4nTRkvuxf4IaWMRYjEqKibkzmD3GYI61NaPDvppqjU+HEX
	nmOr3dL5QCRfQ773iKQZNwtXisS5qweBSeiDK9T41FOzc2+NIKzPC6/Cu/gVqb4J
	PKupKrGSoeWOxgEdtu7wjPjU8qSUbVAc3HYhGlb3daw/tUMrn31IByxnC0FZsSce
	z9E/3mjyj7+riHpHwwo2EjlJkriq5Hc+In6VuogMJQ636LVtPTLxaRw6bhPM4uEM
	svG4hVpskv1ldw3sAPK9tCN4vzq0AI+e033ZU+gXg4ToIXOxbSNFKp/zh4FJe8yF
	SXNySw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg316c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77c3fca2db2so3099925b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397335; x=1759002135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krWOjnzkrbH0g6vYLA5+TbCnPOx5zLg6rDU2gNyS5OE=;
        b=col0izhMpkN6aTqtGbSqnR7ICD3i8rQqHWYa58FydfaiWQ0XYNPRiQR1vvRdnDL6C+
         a75MNQP1YrxwalIUDg5dB3Q3RF0zaSm3qIfZdPBXLycZgjVQS5PIZ0HIVWzXrGE0nlx0
         8YyxY3yoviauqkxMbczBFdPvKgPBYzej6jcb2Y0lqYCtvmgNS33GE0hOLmvATf3bojea
         hfKukmhe4uvj+MlaDql1P3HE8FWsSUyj/FfLyD1Pz6/vrQhwjI3Z0Q03vYHJvSCfsP7z
         ZPnaeCcKkR1/h9eQsAEnVzqfgS0Sd0czl1s/9I9KpblwzaJzAdUxdwCKUGAFdBRzfPX7
         MNXQ==
X-Gm-Message-State: AOJu0YzjaTCA6KQrMZLU36rNUF7gv2zIZl3aOPmJRWAzK2LNDAlbgwNs
	5cW8sOvd4aLTF55WKDocxmg7KZRQBeqA6jhba/VpTpQX7saVlAqZnEJSmpiL+3ocL3aGK2XT4KI
	dBHt7Ee5I1N1U3+ww3LOGF+eCp6Tg7XRkSMWAzZ+G7bMFS0NEX+dI4txlGNDX1XAo8W39
X-Gm-Gg: ASbGncspbl8nXZuWhYJx8E/Q1XjesCCmbfqHaSE1oWBEIF8t2XQieVrzXAgRWimpJsd
	m37maqqxHYcgx6eOUeufMg2tcLAqrFhfZDtcSUNC/GGl6Sc3AazAKxtxiS32AzfLtAlLmezG/EW
	2IvbbwzQa70y4hEpZaXALhDa90zhVc4WWKKWFxX+4fMAYigY+rp78ty6ruKgF9ClnSMe3oDzlNT
	lQUIK3nduvOYDg0VM48/uBhmuNPoZ2++9lgywLspwczv7xondBtRlVyNF1rEjGlUucYYiYZ0SWz
	z0z4O7GhOSOM0MqhS0RinZ9QIWbn/LNlqtqB4/IeABAbNdHFHJUdedwGkVWuGO8eUFM=
X-Received: by 2002:a05:6a00:1887:b0:77f:1a7e:7bc0 with SMTP id d2e1a72fcca58-77f1a7e85b8mr3754458b3a.31.1758397335126;
        Sat, 20 Sep 2025 12:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV35Jn9czRic6iek7gBq+/mlLZBS+H4J2dQxank8bmcsZ9RqYi8lJrTvOkhjVCMIyNxrsldg==
X-Received: by 2002:a05:6a00:1887:b0:77f:1a7e:7bc0 with SMTP id d2e1a72fcca58-77f1a7e85b8mr3754440b3a.31.1758397334649;
        Sat, 20 Sep 2025 12:42:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:06 +0530
Subject: [PATCH v3 08/12] firmware: qcom_scm: Add shmbridge support to
 pas_init/release function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-8-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=4327;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=mBK4xWLjc9TvI3NeWK+E9cswJ+S05RkyGn/yLnOBu0k=;
 b=z06YF6QW6ueOYS8siinVNpmEvicINaR6G79VHDCfpn2owna8zBLYNRBMIE21hyFult04e4oit
 p+BH6vHPaBiAjNIgbzwS5c8rBWh5+cfg4BVR/e26XZQu1rhsS+DaaLj
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX8Kr5nujMWRI7
 dpSdRz1Rb3cos+1nvfm+WhDcjom9RmGS60zP4iyTkMR8Xf4+t770XE7BTqpxlVwvY8VuU6OGMMV
 j7gDPL+Osgw3N93HVFR7RiY+oDpoyS/XofZxq/ScGWRWFgTPlQSfE6CQN/24+dVkzmLXJHtHuF7
 duY+MKbEvwAaDHpWEMVWxV022ClxcmwHH8W2+hVT17ZCphs8uaE9NpShC0gYqTerf9mODVKFD5u
 viOmnEA7Yt696SbR6x/joGGSzvwpPaBFdnYIlgfJ/XEnDO1gaD027y2RTa1HhvhG8LQh0ky7rQl
 d7H8YCyjRL+HpJzxmJO41wcCJ6wsUc68sz/n19KVHofVZnDAX29p/2e8AYU7D+zLjNdwCHcjQGj
 EEeuCjm0
X-Proofpoint-GUID: BXOeqWvzzLahBtcESjKN4_Z255xlyuf9
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68cf0398 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PUsy4RtU_kHwXTlAi2MA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: BXOeqWvzzLahBtcESjKN4_Z255xlyuf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

For memory passed to Qualcomm TrustZone, it must either be part of a
pool registered with TZ or be directly registered via SHMbridge SMC
calls. When QHEE is present, PAS SMC calls from Linux running at EL1 are
trapped by QHEE (running at EL2), which then creates or retrieves memory
from the SHM bridge for both metadata and remoteproc carveout memory
before passing them to TZ. However, when the SoC runs with a
non-QHEE-based hypervisor, Linux must create the SHM bridge for both
metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
for remoteproc memory (before the call is made to TZ in
qcom_scm_pas_auth_and_reset()).

When QHEE is present, it takes care of programming firmware stream
and mapping resources for a remote processor which Linux need to take
care on its absence. Remote processor driver should appropriately set
ctx->has_iommu to let PAS SMC function to know and creating shmbridge
for the call to work

Lets put this awareness into qcom_scm_pas_init_image() and
qcom_scm_pas_metadata_release().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 46 +++++++++++++++++++++++++++++++---
 include/linux/firmware/qcom/qcom_scm.h |  5 +++-
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 022529778f84..6376a58a059c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -642,6 +642,35 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *me
 	return ret;
 }
 
+static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_ctx *ctx,
+					    const void *metadata, size_t size)
+{
+	struct qcom_scm_pas_metadata *mdt_ctx;
+	struct qcom_scm_res res;
+	phys_addr_t mdata_phys;
+	void *mdata_buf;
+	int ret;
+
+	mdt_ctx = ctx->metadata;
+	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	if (!mdata_buf)
+		return -ENOMEM;
+
+	memcpy(mdata_buf, metadata, size);
+	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
+
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, mdata_buf, size, &res);
+	if (ret < 0 || !mdt_ctx) {
+		qcom_tzmem_free(mdata_buf);
+	} else if (mdt_ctx) {
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->addr.phys_addr = mdata_phys;
+		mdt_ctx->size = size;
+	}
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -668,6 +697,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	void *mdata_buf;
 	int ret;
 
+	if (ctx && ctx->has_iommu) {
+		ret = qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+		return ret;
+	}
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -693,7 +727,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	} else if (ctx && ctx->metadata) {
 		mdt_ctx = ctx->metadata;
 		mdt_ctx->ptr = mdata_buf;
-		mdt_ctx->phys = mdata_phys;
+		mdt_ctx->addr.dma_addr = mdata_phys;
 		mdt_ctx->size = size;
 	}
 
@@ -713,9 +747,15 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx)
 	if (!mdt_ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
+	if (ctx->has_iommu) {
+		qcom_tzmem_free(mdt_ctx->ptr);
+		mdt_ctx->addr.phys_addr = 0;
+	} else {
+		dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr,
+				  mdt_ctx->addr.dma_addr);
+		mdt_ctx->addr.dma_addr = 0;
+	}
 	mdt_ctx->ptr = NULL;
-	mdt_ctx->phys = 0;
 	mdt_ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 1774584ff5e3..2fd42493d07c 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -68,7 +68,10 @@ int qcom_scm_set_remote_state(u32 state, u32 id);
 
 struct qcom_scm_pas_metadata {
 	void *ptr;
-	dma_addr_t phys;
+	union {
+		dma_addr_t dma_addr;
+		phys_addr_t phys_addr;
+	} addr;
 	ssize_t size;
 };
 

-- 
2.50.1


