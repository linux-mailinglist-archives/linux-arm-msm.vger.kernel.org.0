Return-Path: <linux-arm-msm+bounces-76967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F6BD2716
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2146B4F08AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15612FF64A;
	Mon, 13 Oct 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEMU56+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10BA2FF641
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349842; cv=none; b=SWjwO7TsKJRGW8hv+s+5wLw+McW6WaDGIoq9gmI8rjiJAZWkGRyBvl0btI7BKUM+Kqa5pk4xLvccs1+Wxr7GpCvzX6Np8x8bPEoAFs/27uVXUBBQH+8cS3dSqLoncdaz9jPLDfoXk/ANnRjTyoFOEfp+Kwg1MeXIHQfvGk2nhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349842; c=relaxed/simple;
	bh=5KoG+dkUELQlDZk6P3BBcb4jRFDD1QWvO/OpVUzmvwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmVxcSkIB1YkJfmOMx/XfptdRmQGcqLH0Yv4Ci44548jX3Tl6dlHq7lW7vyXkkRPrzR7dZSYstdFwucyPoXRNk9aOMxzQ92m+gKNHdtR+DBwVfGcYmMPEWwZOZruZ0I5G0M2oV6p/Y91EhvVUJotnFHpeMnDxD0qWZ/ofbN1x2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEMU56+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nE12028884
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7TcqOGoNmgpd52A0AuGqeG0xr2IjV9chnJIDX3LcS8=; b=oEMU56+oD4G+3LBe
	sp41+eHS7sbRxfJZRwrjyhAwn5rIWKO1B95t9Xp4cuovMkcjTNYN3M6sSeG3ieom
	5MIGPv+mQhBuIKm2iPMg0AYOy9mCdPxJ6+sVmET8AtjY9XGfBrP2dwsgdPc2a9a9
	Mku9ANO1Ry5C5QPk7dWPu4SAMZApNDdj1+BUHWi54VYL8HPSQeCHtWow0NteIcJP
	/ZUIG+p+Ds2OHQo/hpHl6VvmCvwVn+mrLtErGl+0ZJiqQgC7Onbu4e/sw2CJ86mM
	ryjGqqXy4v+Jc+haawBLEcOZR7Yz5DTCNKgJ4DGYC9Dlly5fPnEY40KV0xPOOlnB
	AM/Qrg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0m56t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e7808cf4bso5360701b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349839; x=1760954639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7TcqOGoNmgpd52A0AuGqeG0xr2IjV9chnJIDX3LcS8=;
        b=S1ABJTziABIuL7c4LQLXotIueo5CviW/6b2pezOoU0GKXRDHj8erdxlCyS+GO61iNk
         AUJ7v4Sy2ec8PlRZE/yfWtx5tiBc8U9O+gyQ96DsTUJppwupLLkABbw4WQPzgn7fWdou
         6erGiQu06Z/UoSEhycG0plbkyF7Dfo5E/CHA2bkTkscYLsGOzbGZIixJMgFgH8Q66Uo8
         7NAjulDa9NznOYYTFj2BKfj8F0Cv7QyueCVj1uFuAMjMmlnbGi46sokCD1KSaWhGXOUZ
         KdS+K7oeu2T/RyxQlOdNM6j9vF80bsMqppW3DICW9zSy4N7ozCgqcLDQV/kc+93S8JV6
         5SWg==
X-Gm-Message-State: AOJu0YzSdNrPA6sEKJxluPXAbhgjHhGw/M02fQIEdvpTJT1gu28P3puN
	yv9ZGSCP4/kppuUGTpHaHLf02TjjYkoipaHPy4j6vKQD2MALbzQSmj0fp3M98D/OLKFzVVvPgAr
	DDlhCL15zNhHPvux/GlGJzvA5oyMqD8r8mAe8JL6O4VunlH1ksSXwj44aT9YA06CTHKba
X-Gm-Gg: ASbGncuq+w/LDhChasBomXm4DvsrfPu+LDYCYsknKLX0SusU46kBwAGwg/CjHd5mBP1
	tw1fB9gLZwaAV/Lf2exFyfbwMHFlIh/gcEkpqeI4eYE6wXvEoHE22lsUthMhTIM4h11R6NBcP81
	HOLZ8bFuyIkac7fDCRMmMIRFZYjMtIy+eGDvoHsIWYfop2FKy6BceLf79pEeTwBYTsoQIwNGBFo
	PD8TnjxDUrrxlZk9wRf0qbT2LrfiYcUJiqOtayHzUXWfksfHMcDElz1Aw0YmYVqX78cCYUgPnMo
	CbCj3t6uCQqpAcBhcAq32CDpqPWLKha6PF3ZzYFk9CekWTYgDf5fLf3k/n4RWGWIITc=
X-Received: by 2002:a05:6a00:2e13:b0:774:1be4:dced with SMTP id d2e1a72fcca58-793858fb776mr22200921b3a.9.1760349838948;
        Mon, 13 Oct 2025 03:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqhO0z+/H9ATjzdQFVJY6Jrb5f2E9gB74dg3m1b7ZMPRBS1YHHfuT36FgYAg1okySxBYpqWg==
X-Received: by 2002:a05:6a00:2e13:b0:774:1be4:dced with SMTP id d2e1a72fcca58-793858fb776mr22200881b3a.9.1760349838288;
        Mon, 13 Oct 2025 03:03:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:03:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:08 +0530
Subject: [PATCH v5 04/13] remoteproc: pas: Replace metadata context with
 PAS context structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-4-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=9419;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5KoG+dkUELQlDZk6P3BBcb4jRFDD1QWvO/OpVUzmvwM=;
 b=VtxTUiphMR/gybvzLwKZNOiVX49pNdQqEdP7/+ssZw6SMKJ9R46cidR7PUxnSc8BAfx/3pmWr
 a6Ee36IxdtxB0Wpl+zSuOTBCzVA2jdTuXXiVdTt6gNaALBLwBGDBG5Y
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8PJ7DLaeCK2N
 eYFg/hN4o9DfadAtEw/BAUTp7kUt5tIZEz1oWO6V0kef0dH+CQLCPDUUbVq9sio7Y5oczvWD5gB
 LuIQM+aZ55dBXpC+OdlJGz8a3fd/QTcBtMAYHKpzx2BSl8DFKJPDr0Izptg4+G1HaqEan6dWreA
 Yy8vPeP9ubhJwXvL4PPidp4Fd8YYs2XolEmJVObD7ELD/XSm+iYSKw4r7K+wwJD1Oq4KFmC00y4
 vYOA5DR1ksyYQBP3w91kyCy9fNlAoM++s1uYng0Yj1LBqERwXTQFpzQBg2lTDXPAhm4vTLB8T5L
 dFilLSVsLaQyDz3vEgTdEBTrFLu5X+HSF9NgGSGRRxiOqWktqhROSKM+wp31qkTo2d/JemGbJcP
 sCB4YenKYcdna9BwuJgOYH/OeVqdIA==
X-Proofpoint-GUID: gOnq1vG8U8AhDSZGLpleOWgLHvcymih_
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ecce90 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=XYYdV5bl36wkJkLlMoYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: gOnq1vG8U8AhDSZGLpleOWgLHvcymih_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

As a superset of the existing metadata context, the PAS context
structure enables both remoteproc and non-remoteproc subsystems to
better support scenarios where the SoC runs with or without the Gunyah
hypervisor. To reflect this, relevant SCM and metadata functions are
updated to incorporate PAS context awareness.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++-------------
 drivers/remoteproc/qcom_q6v5_pas.c     | 37 ++++++++++++++++++++++++----------
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_scm.h |  4 ++--
 include/linux/soc/qcom/mdt_loader.h    |  6 +++---
 5 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6d22b2ac7880..b11a21797d46 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -600,7 +600,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -609,8 +609,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
  * qcom_scm_pas_metadata_release() by the caller.
  */
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx)
+			    struct qcom_scm_pas_context *ctx)
 {
+	struct qcom_scm_pas_metadata *mdt_ctx;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
@@ -661,10 +662,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 out:
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
-		ctx->ptr = mdata_buf;
-		ctx->phys = mdata_phys;
-		ctx->size = size;
+	} else if (ctx && ctx->metadata) {
+		mdt_ctx = ctx->metadata;
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->phys = mdata_phys;
+		mdt_ctx->size = size;
 	}
 
 	return ret ? : res.result[0];
@@ -673,18 +675,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 {
-	if (!ctx->ptr)
-		return;
+	struct qcom_scm_pas_metadata *mdt_ctx;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	mdt_ctx = ctx->metadata;
+	if (!mdt_ctx->ptr)
+		return;
 
-	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
+	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
+	mdt_ctx->ptr = NULL;
+	mdt_ctx->phys = 0;
+	mdt_ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..e9dcab94ea0c 100644
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
@@ -779,6 +779,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->pas_id, pas->mem_phys,
+						 pas->mem_size);
+	if (IS_ERR(pas->pas_ctx)) {
+		ret = PTR_ERR(pas->pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
+	pas->dtb_pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
+						     pas->dtb_mem_phys, pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx)) {
+		ret = PTR_ERR(pas->dtb_pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..fe35038c5342 100644
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
index 75dec515c5d2..7c58d26ede24 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -83,8 +83,8 @@ struct qcom_scm_pas_context {
 void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
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


