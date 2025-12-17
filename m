Return-Path: <linux-arm-msm+bounces-85581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D003CCC8D8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E39330387D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412DF34DB4A;
	Wed, 17 Dec 2025 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX1ZrzeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDRs3cdh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5434D4F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989348; cv=none; b=MXIT/Cp+Y891qdMXR2D6qiHjml9uVPbV8GtoxxWN8eX7pHZGd6rr2uEpiwhy0WIFdIsTU0NuJjPPGPxwetvQ0w/r2+byUT1UvP/ztq6tyQwZ6TljnPTUk35+CzQmgNXNUUn3vlgOObkmgx9hmAkiM/EvaKImKlWXvY3/yc9vlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989348; c=relaxed/simple;
	bh=ZJpp3JWRDZ2GnhkciNneFccjAnU3FfTec7KHfaDs7Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T50IWUWN72aTOFjEPQDmB0jFkW0nIVDjhOk4rhukqjnwwXwXXS1VIvgvc4Yd9hC72IjdkE20lLHw7F2v6dLHod/FcUP1fK0Hz8SrUgr8+E4eWbWrn5B5TieqlgPZ3kgsMcwXp93ndAbgSuMOSGA5kiDn1XeA4kmklGPfFB1LxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX1ZrzeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDRs3cdh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL8mE2043020
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+OM//gLCwtklbAUofXvGKyOMQPiApxnK1IIT6gaceE=; b=mX1ZrzeAwTjRfsKB
	7IjMf9+Ynvme+QAGQwlV8Q9OwEDWIW/9qOzZJxQOuInTSui6++aw5QLvNwyCnMtu
	t+PJJggc6bgsxOjYzRXeRSLIzpgQzo5CYNSnHirchv7ZEiv9HAjZ/JQ0lxJtj+7k
	8LcoZm8PaR8lvKnCnQkJyRjDqxefqsdc73SJSCGwbjcP/JlHMUNwiY6jOcdHnmrI
	JJkuZ0Hwgq2iZiipX6HktKH5kChs055bulIk69S8fkTLszUf6SuHeMeYlpHCYP4I
	6wH70fKar8/C5NEluN/ZMnMPQgBvqOGcrsZ3aPOGuhXqwE7/faf3Fnlo++DU08HZ
	pqLXpQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1u854-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso54925175ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989344; x=1766594144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+OM//gLCwtklbAUofXvGKyOMQPiApxnK1IIT6gaceE=;
        b=IDRs3cdh/r+4Q6W+Vt1S+jNbRSKZl2uFPKKVv4Alo/a6GJkmjW8K9JdSjg5aGJHBN7
         4X5VoYFTB8NG6SiNLwNvOXzwlUl2g4iJgKQfKjHO05c37V60B6Hag7c0DjbdXrndKoPi
         vMi/HgPf7reDCAUwxCHr5d233svYTKyro8ytnkPRBOaabVf6UFaLDvKz4HdV6qHHTAK/
         Gb6OlSLNB26OtyUxohrHF+OqCvuYyoPd9TQLvfw5/dxbu1DyD0+p6CsVLQ2LIb4DBpaj
         OH4F1EnuHZ/1RjZdhcb/suVNPZjPE2AtSDlTdKR2L6EJaqp4r4GYDoshhiIpEMeV4yVP
         3YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989344; x=1766594144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+OM//gLCwtklbAUofXvGKyOMQPiApxnK1IIT6gaceE=;
        b=oWZYe6GYaqDz287HDLwcaga8gibvCi2BPQKFxTMavWyDcvpeD4sHUnR1kGaV3jjwTp
         9Z0McWxSrRNb16CIcW2fspC3cxKjYj5r/cRUP6x9oUXXWrGO+0/Jny69Pu3+6j6GkcLh
         W6t5kVgf63WObZfoSxBtV1g3S4Kcf0gdH79+lxfCApFbTAfqHwIfCbcVI456nlEZVjSu
         /epd3W1Oq1ZQHYJxYva6fRFZBMw3zVMFcJyAwXrjoD02NSh/WvGA1NDrYzy5C78hl4qU
         fH/YrtHxyC58qViONbgNmHdyYky3iyc/yvFX3GTt81cOfcfGeGhhdA97jEDns27PVv8x
         O6FA==
X-Gm-Message-State: AOJu0YzSGfHLY+a+/Z8j8OArkHIxjCqcYASp7NQ1vdmBCVY1DXEnbw6D
	NYG2rpjHvND5LEzxzi5DXFhLLq0+C1CAsQEbI1WxWsZik40vKFcDh5/ba0c+KlVc5hHnhZDrZ//
	2mGinBqTLSJeTJ/FshlBnIQrbk9c/iWpbYS09yWqbLpw0XSRJ/zqLzfl5dPSIM7VxIF/C
X-Gm-Gg: AY/fxX5pEKMaYrviyPUG7nes/jfdWAVtW1HRqnkbbh0tSVN4/cjlIvnwvBmathz5JLI
	Rj30n1D+cfm70PsDtmnM07kWh6d5woYdduPp7IDiIbPFmHXGijVNutc4MyhaUP+ZIxqOQEI3bWh
	tJzZpxJRAX5ycZVVg3BYeMFvOlnWWpbskQ4/XeLAZENg9sd3rBi1lV/K830gJD8PKCJdlHBJuHN
	TA3FKKVr1Qf7v8rEouOWerbTL/t9Mjhsqu4yMduZTlVETT56z6bxVJ4xCZSq1jFZNJFnQKZr/Pj
	NUf5XNlylmOtkBO7SR/i6s7xn1Pm6zl6bg86lKtmTMUP6yX2HXpp+wt9RyqShvBKZPSDt9ZUudF
	TjE/xR9ZBgLK0TFlnYcQS+g3SnXCmn+5UQwvt
X-Received: by 2002:a17:902:da8c:b0:2a0:bd93:4dbf with SMTP id d9443c01a7336-2a0bda2946cmr136309915ad.13.1765989344201;
        Wed, 17 Dec 2025 08:35:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxk8EC2iuBNKVxQi6FD2QZfoSwG++mxObmlHXqMkY+kzfmt2HFyK6oOK+NSSC19kzQ4oZPmA==
X-Received: by 2002:a17:902:da8c:b0:2a0:bd93:4dbf with SMTP id d9443c01a7336-2a0bda2946cmr136309675ad.13.1765989343577;
        Wed, 17 Dec 2025 08:35:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:43 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:46 +0530
Subject: [PATCH v9 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-10-ab7ac03e0ff1@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=2509;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZJpp3JWRDZ2GnhkciNneFccjAnU3FfTec7KHfaDs7Ss=;
 b=UHye5xh8LIVlYeAJ0tlM5lFW90FxijLZBwYiUBeuwTCEld1f9pnWwQGlVafxE2HEPF0caPqZC
 aZbBWgM6h0XA/W1Y1C5xwPwQcAU/wytk8AG+ahm9HcYvAIOpFSJtOB/
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX5dRnjc7bZsfv
 Kx8XIjad4aGnGcgGSCeErpk6n8HrlKu98x8UWxP5zDbGcBCT691+S+v7b5LLysS7y2qZ+EsH1hn
 0yPxP0/pKLTW3IisTo+iYxiMibqzmmzhoFMeIeB7kD8iEA5W2RmN16Sqx4sYbXEpMSmbxq9id38
 /OpqZGC1bzJbe4YvvfwcxGfNofL6VCSF/ZrGUCDrV4QvnXNjk8SEaEHTIJXLgGnV5Lv3S8zQjV1
 fDBS/syjrS+GcBKSFwikDV4keq7GiNhZ3CoonmT+65XSC6iP20BiBKvWgRRo/8EqcJEZzwnQB4N
 fuaL6FBZSnZh78DaLCLcl0ih6zDpSpAPl4LXUZYiBj7ZESETnJ817LPaICdH0DsRcKHN1aWDkVb
 0o7Djt6l0zInrN/ZBui3LwptS0Pv8A==
X-Proofpoint-ORIG-GUID: U9qRCXEPebcho1eGzyr2GKRWvZ3iiWcD
X-Proofpoint-GUID: U9qRCXEPebcho1eGzyr2GKRWvZ3iiWcD
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942dbe1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08WIqK_J-xaQODWVIAIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge both for metadata (before
calling qcom_scm_pas_init_image()) and for remoteproc memory (before
calling qcom_scm_pas_auth_and_reset()). We have taken care the things
required for qcom_scm_pas_auth_and_reset(). Lets put these awareness
of above conditions into qcom_scm_pas_init_image() and
qcom_scm_pas_metadata_release().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bc3b8dc7d3e4..4ce892d8fb25 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -623,6 +623,30 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 	return ret;
 }
 
+static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
+					    const void *metadata, size_t size)
+{
+	struct qcom_scm_res res;
+	phys_addr_t mdata_phys;
+	void *mdata_buf;
+	int ret;
+
+	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	if (!mdata_buf)
+		return -ENOMEM;
+
+	memcpy(mdata_buf, metadata, size);
+	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
+
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	if (ret < 0)
+		qcom_tzmem_free(mdata_buf);
+	else
+		ctx->ptr = mdata_buf;
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -648,6 +672,9 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	void *mdata_buf;
 	int ret;
 
+	if (ctx && ctx->use_tzmem)
+		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -689,7 +716,10 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 	if (!ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	if (ctx->use_tzmem)
+		qcom_tzmem_free(ctx->ptr);
+	else
+		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
 }

-- 
2.50.1


