Return-Path: <linux-arm-msm+bounces-87437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E3CF3D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C4BF30164EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F7633C19C;
	Mon,  5 Jan 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4DRTprG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hyz1t8Fv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC733BBD3
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619418; cv=none; b=pqUws0R7u3gYE7VSuyJDsVwrcKTtINQ7WBrdaNlbE60L/66BSAXLiivVfYIUzF/3qyZFDBS5Fij9i07v6eHvh/CVoXFaEvq7Pddlpup8/oiVMIPnu46oYI+cuD3Abq3PL4uorI8RURsYEcLYQ7JhNO4l4oLcYWsZTMKasffsdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619418; c=relaxed/simple;
	bh=1R/LmskGceWBGNRaC8G9uMDiBlpL1Wbo7UUQ7OYccTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UExSfBHpPNJLwnGRbZmEANNBxkks613dKOKe6DAbwe/X0PRE15P4uhphVdJZki1oiLXl2jvTFqZUMqMuPEKYGM4VC404PCUjquaMi19OMDroggfwYu37gpeuEYeM/KZzImuVZgfJ5nz/vXES0OzyuamSPirYCCqu5e8RuRmpW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4DRTprG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hyz1t8Fv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058IalP3627123
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIRLZB2KHqoq49aFdDDnjzDKbj1SGql6ahTYS5V6XgI=; b=M4DRTprGjoid5FbG
	FAFMg9MiT1iKc5iQKHw+2Klb1Rdy6rQ1zSrE+J8Gcb2/ZCPqQa5UzNMwQ963IZNs
	HP2kPBnnMpez4pLp/bfF6RcJFWbA6eOma+W86w393mUFNxWgkBq/TD3bhISpcoeC
	Ka7Xuv/aErgOMJcqK8BOkFEVg1RxdJBaI2DA6wMaPq9odboL9Y9XPyDRTgL2DygC
	rT4webF6DyNioy7QH7lUaKakUFCfS/1jG3jHYcLgYAgKNYo/5tohHeBMI0y6QASf
	9+Zyk56Riq2rLFitkwKMTD3hFYH6lCsvOjoXNf1LPo0YYMKd7sWX80VqnUvM2Z/E
	k8FXpg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4jcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so26983813b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619416; x=1768224216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIRLZB2KHqoq49aFdDDnjzDKbj1SGql6ahTYS5V6XgI=;
        b=Hyz1t8Fvf3k52Iv+UmZvk1tsqeqvcUcr/euButBHDJFR9jJ4mNDUzDHW2qSKDwL0od
         VGBb5NPOTVxwpUayfDS19RwmyNAtQaZeaa/WfGIJUWv0HWzgDXdfzcEI4F7Fu50ufH/3
         eXJ/yr/ttzyhtc/Tvfjlng6No/XMmI/TD5Wx/vy9Me8WptJ3ri6Z+eTTvSRebCdORdPn
         eEkZOHfu/ErfxQNfrD8nEnp0pi5wVZFJpgy7pRTdGbaOu8ijw+oNYgpTle0heGlaqDkY
         6VPxOf9C59t4kJP0K2tRE2/G8zkgCAQ/IHZvjyoPzLY6Br0NCBFxF6th25xazG+tKz+d
         /r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619416; x=1768224216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIRLZB2KHqoq49aFdDDnjzDKbj1SGql6ahTYS5V6XgI=;
        b=EOSig1d6YIF17W8a3udKl3y1c3AUOCZOoQCPDOigwYAg1Z3giQykVSqDLYQWfDCNp0
         /j0wRQaoy4xq3S/G7ncWHwyeWbgkV2+8bU3xw/TFuZkkprTc0BwU+4IrivbKKF077x+X
         YHEwJa7AO1gcpf/3xkKvttkNLyMbbBmCZYE28XBWbK8eu0vyIaYhXUCb9s2j3SmktSmh
         dQH6VxloWp26NyuJar9ROTNtRckuLkwvnMC/sCKvw3fOyGnbLZ5UPYo213XqMFUiUnkr
         0LBTwF1XutnEo/FzBnfNDQYuwcyK517PbrVzRo+63MTTEvsosi5XmXGEu0R0AAx6QS6r
         Du6g==
X-Gm-Message-State: AOJu0Yy9rKLXd3dlgk3pt5qmN/C1QrjLC9yLYlgf7veykadJcxXcNx5e
	tmcBgdlEWWfymMhFR4s+qFGOz4lo86GCWPZQhPQEJpY/SLvvt3K2kzKP0EVRPu1OiGTc6XNelxE
	qDXXXlIhQF/1GZzNqzMfVRO/XJcobQ5gMBQxSafmfeocoXIuuhgCyOVSUz6JfoYfP4JAn
X-Gm-Gg: AY/fxX6GbiVNCM5BIoxOZ/ulp+GWCSOSVli1+UbJ0YdrwxMUcEGSPuokVfKGWxswrHi
	KChigHvEoZ1SQ+LRSIs5BCEveyTUP9j0iusUIwqc4YI3vGWwoyXA37SeyjxWzQIY+P2/JFPKq4h
	8Z2O0vqJO+Nq3GnYC8bxPyt5MnpAbLHzKMcm8IyNkAhjJoK6GzZtzmMtKbF0sQVwEqOPzXYQ1bn
	3UEFYYrCqV4eell4KIT+KDCJyRTPjt8zZu5vHOFiaDR08bhxz0Gpj31nexh5NcHNABDU6gbO2nR
	06geDXbD+sM3BEbuq/MYvcT3p/Bzgz/cR5n4l8GqZYCmyd1AXBKEriVPTLpasQDOI3/4K8PxZnu
	aP0Rf4p4L6266HRwZ8095E9KMLjes79cGqBOx
X-Received: by 2002:a05:6a00:2908:b0:7e8:4471:ae6b with SMTP id d2e1a72fcca58-7ff67a5b877mr39729949b3a.55.1767619415301;
        Mon, 05 Jan 2026 05:23:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHenk6G63NTbxTMnahhRHXci8R1KgjZdnUCh6fXg6tePoKsxk9NPCwgb5jEgAblWoCVwdPEwA==
X-Received: by 2002:a05:6a00:2908:b0:7e8:4471:ae6b with SMTP id d2e1a72fcca58-7ff67a5b877mr39729908b3a.55.1767619414587;
        Mon, 05 Jan 2026 05:23:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:34 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:53 +0530
Subject: [PATCH v10 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-5-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=8850;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=1R/LmskGceWBGNRaC8G9uMDiBlpL1Wbo7UUQ7OYccTo=;
 b=r7QDSuRBAH6k2lrlyz7mlXxA29YrGQRLxkgm57L1Cl6GdgHQUhLgnVoiYmlrLlviSHPsozmRy
 awRj4JWAemTCK9zNt+U1vNv+8xBk9DD46lAfY98cqPD/75oU8JUk3e3
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: kKBJrB8uZVldeTuvpCuNRYu9dj3WDtmr
X-Proofpoint-GUID: kKBJrB8uZVldeTuvpCuNRYu9dj3WDtmr
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbb58 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FPhKjH8jRcijH9SIsZwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX//fIKzjBRRS4
 eyMFu/XEBNI6TVpvPFrHiyr677/EZK2fWMgfDfGof4E7MTiBZjqHBaYBeU8Affi0bphDqV3OcNA
 ORWj4wErbn/wF801gBbjL1vVQmeadNsK0pKTRexdV0FSzZBYP7QJ4zDfxrqBtN33VKSiep5nyPK
 zBVsrNiiRiMRPlHPXMXt3klq6Hh+N+W+t5ZV3SmqKSxANjI9zdnP4NOSYuIdwn/w5Eir6AQM+ad
 KfqTRf3tSeZEP/OxKOcCwAh5/ZF4BGkPSQQgztA1jk+S8PMx/KbujlRTkx0ik/6ajTQ5nrJFmlf
 WSTDhh3SiIibQ9/PdsNJlE6jYTxwpEY5xK6igcnlUI7WDGMkq2OzUYSslHOfPRpj/di90Bj8POT
 sncoTh+MvsEYpP9tjSbA5iBCqCpb1w0eZ3vy3yNADGUxXy4OoIacH/VjKAZp2I76AJcPikBvHnO
 YEkLSwGy59l6WOGltSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

As a superset of the existing metadata context, the PAS context
structure enables both remoteproc and non-remoteproc subsystems to
better support scenarios where the SoC runs with or without the Gunyah
hypervisor. To reflect this, relevant SCM and metadata functions are
updated to incorporate PAS context awareness and remove metadata context
data structure completely.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       |  8 +++----
 drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_scm.h | 10 ++-------
 include/linux/soc/qcom/mdt_loader.h    |  6 +++---
 5 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43a6187f4bd2..fcb7620b83a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -601,7 +601,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -610,7 +610,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
  * qcom_scm_pas_metadata_release() by the caller.
  */
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx)
+			    struct qcom_scm_pas_context *ctx)
 {
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
@@ -674,9 +674,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 {
 	if (!ctx->ptr)
 		return;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 52680ac99589..bfcb65aed008 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -117,8 +117,8 @@ struct qcom_pas {
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
-	struct qcom_scm_pas_metadata pas_metadata;
-	struct qcom_scm_pas_metadata dtb_pas_metadata;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct qcom_scm_pas_context *dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	 * auth_and_reset() was successful, but in other cases clean it up
 	 * here.
 	 */
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	return 0;
 }
@@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
 					pas->dtb_pas_id, pas->dtb_mem_phys,
-					&pas->dtb_pas_metadata);
+					pas->dtb_pas_ctx);
 		if (ret)
 			goto release_dtb_firmware;
 
@@ -255,7 +255,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 release_dtb_firmware:
 	release_firmware(pas->dtb_firmware);
@@ -306,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
-				pas->mem_phys, &pas->pas_metadata);
+				pas->mem_phys, pas->pas_ctx);
 	if (ret)
 		goto disable_px_supply;
 
@@ -332,9 +332,9 @@ static int qcom_pas_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}
 
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -342,9 +342,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	return 0;
 
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -760,6 +760,22 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
+						       pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx)) {
+		ret = PTR_ERR(pas->pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+							   pas->dtb_mem_phys,
+							   pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx)) {
+		ret = PTR_ERR(pas->dtb_pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c239107cb930..b125140100db 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  * @fw_name:	name of the firmware, for construction of segment file names
  * @pas_id:	PAS identifier
  * @mem_phys:	physical address of allocated memory region
- * @ctx:	PAS metadata context, to be released by caller
+ * @ctx:	PAS context, ctx->metadata to be released by caller
  *
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *ctx)
+		      struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5045f8fe876d..ad69b51fe6fc 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -66,12 +66,6 @@ int qcom_scm_set_warm_boot_addr(void *entry);
 void qcom_scm_cpu_power_down(u32 flags);
 int qcom_scm_set_remote_state(u32 state, u32 id);
 
-struct qcom_scm_pas_metadata {
-	void *ptr;
-	dma_addr_t phys;
-	ssize_t size;
-};
-
 struct qcom_scm_pas_context {
 	struct device *dev;
 	u32 pas_id;
@@ -87,8 +81,8 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 							     phys_addr_t mem_phys,
 							     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx);
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
+			    struct qcom_scm_pas_context *ctx);
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
 int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 8ea8230579a2..07c278841816 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,14 +10,14 @@
 
 struct device;
 struct firmware;
-struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
+		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -39,7 +39,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 
 static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
+				    struct qcom_scm_pas_context *pas_ctx)
 {
 	return -ENODEV;
 }

-- 
2.50.1


