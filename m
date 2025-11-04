Return-Path: <linux-arm-msm+bounces-80242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1AC2FAA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79F3A4F7055
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAD430CDA3;
	Tue,  4 Nov 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4f81BcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6W2gjaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979FA30CD85
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241792; cv=none; b=jn7WC1e3gN7nbqRRnvc5Ny7DxAeJeS/2TFx2hs/x0Ka43Q0sOiNdM7Y67PqCgf0PuKe00g5l08EoF8NNsl7k8kPsJSh5PhDoG5Wj6beajVUmbFIk+Cc5jjZq20/RiN0IOswm3TzXzgp4wQ/Jmdr+Zaqm+PTm4D465itMsidmXwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241792; c=relaxed/simple;
	bh=NeKDjYIbjo1Oal+5KuqFVZoba+/aaNW17DV8LMoQ9+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=be0P0yZAZSLrRRYzambFPoFk0ej/YsXWjSIWf+c8xxWm3roNz1Wa25D6NaHkgkFzD/n4zq3zm9sreYI7Zbbgxi21C3WQVYbHSeFQOYyyGbeKftVfqeEVU3cvqfu5ts552XFH8Bo66UetG9d394lFRcHEYCG90l8LYJ19qD2g4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4f81BcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6W2gjaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A439mN93595188
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 07:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d97WbPBAAj8jm5QgVA8aRnvCTYiuAwbB9XK9NKYdkW8=; b=L4f81BcEjbAX8RC0
	WkYq7vEtdLF6xGT9GQYQ/dHMSTAGBCaR4Fiuuw9Acjy8J7bz3cLwTZ7e4tFsNSIE
	4g7mS+YNoHjPXm4Hy/RiBR4G/ejubv9pa+R6HfBJjd1g4Aly+OVSKk8nSNHmOSlG
	18h2BEZnCKy0Ur4Cz21BZmJ1b57K8rS3RJit4IunpnD2qtE2b0cc5mQpNdv44SE4
	infq/0Qls+CV4f6a2uZXAcQyLVIqB6NzDiXpefQo4XMIpMXev+wjxeKCRzMwQcTB
	uy7Pj9bBe5sYf6+C4YSIvq1pN2StU4Z/nwazSM2ljd4v7hLYCn+qwgs2pvO1OZ1j
	CiuMWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exj34d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:36:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340410b11b8so5050710a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 23:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241789; x=1762846589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d97WbPBAAj8jm5QgVA8aRnvCTYiuAwbB9XK9NKYdkW8=;
        b=e6W2gjaZnpzCbMoLLHn8oCdy96YFhqWd0Rj2Zhnf588wljuKutX6IV9oglgZE740HI
         ZcykT2+SKKTw4Fxmk2hTO/1x2xuPKVwrJHMCjNe6IUGCxeLwkPcONcwI63iMD0zq9BGg
         Jv8g/6pMvAhAofNUzmXfE9pwpfNyqZ+56KKZcvwdQS4SV+Ow6+bvbB2/UHKk1jMpzSPR
         IneGcqtoaDNkwBAWF87ysKi7h3NiU0lVJK52mOmDxM4bEuuN8Vf8ABNMNFszF5SBcG4I
         pvb4sWxDrZVaoDjvxJ7+JT7B2oFKTXrxCpoLbkteMsJJ2iA6MqAp6iU8obZub9cdgwly
         h7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241789; x=1762846589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d97WbPBAAj8jm5QgVA8aRnvCTYiuAwbB9XK9NKYdkW8=;
        b=pN1KwTSj/tGHj04SJhKrQwndeLosTmgYPsD0HR3DtZnOaycY0eb4jJa1I9AboM0SjH
         +Mh87bWut15e6Pz5Nv9BtViggGge0kUrkC6kwPoqUCWRyGzJmb3eWedTyX8SQCRVBL7b
         ZV2KF54ziBUu47t/+tHWC1/6nvZmZEUQbQv3k6JxGJ3CVO1hYQ/jWb9RDYwQENXs4r/8
         lR7ZMy6w2iM2JJiukl4R41lbHV7VrA6pGHigrDOVBfujXzKwhXd813mxrryi8f4AiCED
         HVJLJOGxTl5PsJ7PO0FRuKyKBzFb3ZBjv7D32T1mTSA1a/bHxKRo4kfCCcc0QcmjzTkI
         FxDw==
X-Gm-Message-State: AOJu0YxnJM8xMpwCv3nyP5Q7a4VlIR/VkV4hIh3Q0GhpabARn/2DL6he
	7M22p12D3NUBYITPRT39KtQAUTOn/ELT8h0M+0p21Rf+fFsmXGLgDhiydKAHpC6Mk1zakk//9m/
	VZnLdgTM6B7nQiTTSUJaJt+qwuulfZnrCTMbnwtgcRVI6MOPDmyXET6XO2gyQSETNcOFR
X-Gm-Gg: ASbGncujTvZPqdlGWbIA2M1+pNpCqHfM3ze5KlKnv/9hKU7a37rNNVHerxf9gcdpwAx
	P1gCf0imO/W4f3UYRAZTqMH3NouL7DCD2309kTX9A2aN3FEVS7cYuJ1KiXrVX9Vw11f+OqyEEhf
	+rTsrDNB5hGPlnzy7bY6r0obcAAuJdkaobcwjt1SgZdq3z7fLg9Cf4ia02x9mOI2mTblY4AEKg4
	rI1TX0az7i8xeERyrtpjfnU7fVptlgL8UTx2udUgLQTFuyU8gWD1wcpaN/xqaof48docHRoGHCa
	RxnIYlgZEzGRWqkR+TMYOSAmvzvXEH5pOKe2IbG89h16J+HxGpEfukQtd7fSKr8uPVIo2dMSPRX
	heLIIuq1ulFCpGc0LG5TWJqlNtA==
X-Received: by 2002:a17:90b:5350:b0:33e:2934:6e11 with SMTP id 98e67ed59e1d1-34082fdb7e5mr21342473a91.11.1762241788795;
        Mon, 03 Nov 2025 23:36:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYTtQHzA7mU6/j4yf1qT/m2z2vP1d6UxqNfAT51CtchxjC/JKis6Fy8PLsBb+Sk3whhBWuhg==
X-Received: by 2002:a17:90b:5350:b0:33e:2934:6e11 with SMTP id 98e67ed59e1d1-34082fdb7e5mr21342415a91.11.1762241788031;
        Mon, 03 Nov 2025 23:36:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:27 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:45 +0530
Subject: [PATCH v6 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=9321;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=NeKDjYIbjo1Oal+5KuqFVZoba+/aaNW17DV8LMoQ9+s=;
 b=yROXrtXiw8OGwOMpERQ8jJN8+h4TK3N+huQe12NTUGl8pO08h9AgmGay93fQR3JhSL2X+HgZv
 BQCtIgMmPhzDeRIhipa18ycmbO+Xng4eHtyPf0HY4xKMQWqrYotVwZs
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=6909acfd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=A6wE2Gzpztn23p2hnU8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aeVhY7uOStqV9jwAFMk7DQ14sxuA4nrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX9qS6ihR8t87I
 ULesvM/nqFylr4CRivUgrFbTjRyqYvbzFkFM8CtBh7nxGF43Wk3NT9NEKZJuX5HXV9KaTZncnKQ
 /FRo1KXo8Jpb5PIbe64c+HlDbbQkCGxXHdzIxicpGAvxBpkdgsOqc9ZUfx/bh0ZsDrrk5jaQvP8
 gq+Pj+V6+UiOTSGtea2pLBf2bYMtOz+NJm4M1lk1+lglIFxhn7r1L/PSvAKUqIMDYO9aRW8M11b
 hap3a8jknWIF8ZguU2mcE1vkfbu85kDgtvxMIUewR8hDiOi2Xy7ViVWKvoKsVGBH+uHLOpgakSm
 fPH6gnhQMwi75YodFvV1Uz6TthZg0NwgEBFiTNqoeXXp9kmGG1BVvaurrHvcS4JRgihyisaa9uc
 fqtHIK35C15yO88wCxirz9hjzCmldA==
X-Proofpoint-ORIG-GUID: aeVhY7uOStqV9jwAFMk7DQ14sxuA4nrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040061

As a superset of the existing metadata context, the PAS context
structure enables both remoteproc and non-remoteproc subsystems to
better support scenarios where the SoC runs with or without the Gunyah
hypervisor. To reflect this, relevant SCM and metadata functions are
updated to incorporate PAS context awareness.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 25 +++++++++++++---------
 drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_scm.h |  4 ++--
 include/linux/soc/qcom/mdt_loader.h    |  6 +++---
 5 files changed, 49 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5a525dbd0a2e..9cdd152da592 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -612,8 +612,9 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
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
@@ -665,9 +666,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
-		ctx->ptr = mdata_buf;
-		ctx->phys = mdata_phys;
-		ctx->size = size;
+		mdt_ctx = ctx->metadata;
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->phys = mdata_phys;
+		mdt_ctx->size = size;
 	}
 
 	return ret ? : res.result[0];
@@ -676,16 +678,19 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 {
-	if (!ctx->ptr)
+	struct qcom_scm_pas_metadata *mdt_ctx;
+
+	mdt_ctx = ctx->metadata;
+	if (!mdt_ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
 
-	ctx->ptr = NULL;
+	mdt_ctx->ptr = NULL;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..729e7b9bc183 100644
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
@@ -779,6 +779,22 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = devm_qcom_scm_pas_context_init(pas->dev, pas->pas_id,
+						      pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx)) {
+		ret = PTR_ERR(pas->pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
+							  pas->dtb_mem_phys,
+							  pas->dtb_mem_size);
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
index f574fdf88eaa..2905587dcd17 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -83,8 +83,8 @@ struct qcom_scm_pas_context {
 void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
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


