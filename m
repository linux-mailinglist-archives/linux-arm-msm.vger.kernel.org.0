Return-Path: <linux-arm-msm+bounces-85575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B8CC8E1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA05309E8D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1141F253950;
	Wed, 17 Dec 2025 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3dAjfRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsDtlY/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A123624C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989324; cv=none; b=OzNDdtrDf5PQu2nN1F43e06Skjov7Z6OdFe+E2VdclrNmzRkuyHHlUsUo6wyD3xfbr51FXpeuPuzliA6/ZIPsViKYrypjEtkZ2gxiF34FZW6TnozntAVc189cVNkX0o+g3oHn73hr/jbiWYRW/MCFP3INIr//eMN+e9xNjaPMAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989324; c=relaxed/simple;
	bh=MTke/QM0PFjN8QJGwMVznBklB/oOZJSHHEy6N6Uhs2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAakKMsL+NLgdcdAtFivy6DpBod1xB6dfHsD0X/dUrijDByiv+m9vrIdYTXchHKpAc3dU5p7a7fWTUe1+mASbpNBSvj8sq4bysshVnZ2DLpbJiIS231891WdJwbBMj/VlaVojtm7YzAVD3iqaXVN4Cb7S074OvCxkaW4F27mNj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3dAjfRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsDtlY/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKxTR2042763
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAAYF+70CB9eB3ACXAKpYiBOB9FD0mSsanrWwDwQLqE=; b=Y3dAjfRadBO7r21m
	c6UXwUoqGL4OpqGvN3b/bF0Iimc7Gf0BdTmSqE2nwG5PSw8bEgwU4QM8YFbgStUS
	WKlsh8+sDln1EbIapbcLOslXZt7WeTgCajavTLBbwMqQq36yb7770nFwybqGpiG7
	DCPBYhYBH6+6mVznuyPybLxmEqbQpDuzG+6dJB3r1yTGIaikBcUnNe3ftsnubuER
	+IG6iVFF7iyyTEW0htiWSDgabaSBjLt5kHQ5EWO7ktHrFAHV5ZkdE8a0qaP0iFVH
	ANrb1wiWZsdsIDJXG8tj2n2sTVYYs9H1n7wdTDyKcG46wUiXSE3eIP2RojZQJ/FE
	pIuNwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1u826-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so63707005ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989320; x=1766594120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAAYF+70CB9eB3ACXAKpYiBOB9FD0mSsanrWwDwQLqE=;
        b=AsDtlY/NgutsUy/9gogioMyQ/yHx/Vi4fR/748SKzJbSRLMNLpZze+UfB/Js8vX++M
         yM7nUIay6LDAsc9rAS0K/aoWe6YR65fARTpRC+MGjxxkttmlzn56i08wevJjDnfxExD/
         UjpDS5WHx+nvhLsfORxryyBA0q6YlOj0myNgRLwWGASqFu4lGlsqtRdiiDWVEklHeeX0
         qTSBGFrcYLVttLAqeKxR4Luj7cVGAJnv2BQDETsT7BXNJDe940rzM1h3qM+buJrSb5Ni
         UeR72ej+7/ktyUC7QWmv8r4SpbY/+QIZBWp8jRK+nYe0dEWXZfDbPVzzEwdoqmoj8wgn
         cf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989320; x=1766594120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAAYF+70CB9eB3ACXAKpYiBOB9FD0mSsanrWwDwQLqE=;
        b=rh7pqxqk8s1f0nV9ORbIhQTL4/3pvJitAyjqzi1tAR9oXMP9TunOfEa3fGbKwF5+Em
         FgwrK1gmc992JEDXmqlLUffquPBaIBU9TOfNFyiJqe0dA4RRI71xslz4Ia5MskfPHz50
         PmK/Lq22+f+Zmwyag01tJgrVT2hVpgFhwrQ2MzYmAvMtjFJrFs7dXOyGU35ndoc+fVk4
         UuVDtmTJd15EFV+QSnU9k45+FxyVSHfEPTuTszNQLnxdadL+gM6Osdec9kd6KLGBps30
         hGO8woQ/rniHj8T1XI/HtoyAYxI/eFWtlR2/j/oLBKejjFVearopNfEl6yUgZk+U2no+
         mJfA==
X-Gm-Message-State: AOJu0Ywkr8//t5oWjEqe1kQ9HYy3iWfHEnxJFJ32nUjs1Uv0TsNC9Xgj
	CpeOR14MOObEq2cSMdIqJrbhGRM1fMx9jBNZQptkohmAvEBJADvU6OLOyODw0CL0EPUTYakZQeT
	ilefkMmtsvWPSHBVi2B6zh5LHuRDEGfKjLVp1r73VN3e5xWHLO7XDsXiROFiVUOi1upFG
X-Gm-Gg: AY/fxX53KENeSfNlySkbctJnNGfvWSAHSeEG+Bz4vEV5s1nAd622JIJb4nsM0yXqkjQ
	bLp68sKeImpx2tW6GzPrpj0CMeHxjbX4luT5SUTbhoU8L1NgmuMrYHA0dsdDmrZR8yo5Ye2/Gos
	skRSpj5nL8D0qwhP2Lj0qbygl4UfuG4giKHVXoLGq7EPUligNegtnUxL5LS4/S7+gEv7L7zHRZE
	rCmv7INATIIgOnmL/tolufgXlceYCQfc5R0NwLMgRsZsTAB+dv+lZkHO/7YvgrnIINvhSMU3yK3
	bmun/ug1L24ZgzrLrn9zrxX04orL73NEZUOqG3J3F3xUyXl/WOs2LPToMxRDUS4nORm/Uwt7LFQ
	RRMy89p5K4L7sh4iA+bQYLfc3JpU1qr+8YAFy
X-Received: by 2002:a17:902:e5cb:b0:296:2b7a:90cd with SMTP id d9443c01a7336-29f2404b710mr169876535ad.32.1765989320115;
        Wed, 17 Dec 2025 08:35:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwOv9nHjP6e4rUF3j6KYca1AcLzLfSlGw7UOAw1YHneczpAa76mOInSGYfud6yFOrzEM7JDw==
X-Received: by 2002:a17:902:e5cb:b0:296:2b7a:90cd with SMTP id d9443c01a7336-29f2404b710mr169876255ad.32.1765989319461;
        Wed, 17 Dec 2025 08:35:19 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:19 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:40 +0530
Subject: [PATCH v9 04/14] firmware: qcom_scm: Introduce PAS context
 allocator helper function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-4-ab7ac03e0ff1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=4036;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=MTke/QM0PFjN8QJGwMVznBklB/oOZJSHHEy6N6Uhs2I=;
 b=8qm9J440ImkkEOrX9lhBxIjnEf8H3iYB7vQriZ/Zw7s7iQ9LpFfqX3Q4Pp2Q0i8Y8D19CPWTj
 frbqu0b1cYSCXMcjCT55EsnHZZeaxy9vRY+TmHbVM8jM0pi0FxcfPRK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX4HgUALbz3ubj
 zE2IYJKouuepDB95rzs6phHhrLlViNoShrCcWmWN/37wEuP1w9clHAaPxxMelC3JzcqJq/267r+
 1RIohaAyQRD3OypKPK56YDN5ESKWIISq6q6MZyWavmgJcvbCAkhj6ccdjWnmRl8SStTzgFVI58v
 jW7gPrbBKjvFvZ/D27H2Rq8aDuwzUfOHEtodoS9AwUfOeIHV4ya9WVkj4du97yKBUiPfwsS+1jv
 +dFjs6wNlHZ+vxqt7uoRxnBmvaHQO3SFYxq8lnTDPh0PUG/NFQ7zK6UQG0eQ/+PPqbyQ2tFK++B
 GQemOHxGIa9FY9qrYuLAII12n4KQRbr0emJIwLsBc8ZMCpZ+txFdMS/HWrYPd89OKjG+/H3epe7
 2c8AylUJ4DopCl0+KLpN7kRV6iBAyg==
X-Proofpoint-ORIG-GUID: fGHUnlCcBoa41c2AWzMFbU5yDN9ns-Yo
X-Proofpoint-GUID: fGHUnlCcBoa41c2AWzMFbU5yDN9ns-Yo
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942dbc9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FtZ2CgB1kwCBZN0VdloA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

When the Peripheral Authentication Service (PAS) method runs on a SoC
where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
reset sequences are handled by TrustZone. In such cases, Linux must
perform additional steps before invoking PAS SMC calls, such as creating
a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
these additional steps when Linux runs at EL2.

To support this, there is a need for a data structure that can be
initialized prior to invoking any SMC or MDT functions. This structure
allows those functions to determine whether they are operating in the
presence or absence of the Gunyah hypervisor and behave accordingly.

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to differences in
metadata context handling. Remoteproc subsystems retain the metadata
context until authentication and reset are completed, while
non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
retain the metadata context and can free it within the
qcom_scm_pas_init() call by passing a NULL context parameter and due to
these differences, it is not possible to extend metadata context
handling to support remoteproc and non remoteproc subsystem use PAS
operations, when Linux operates at EL2.

Add PAS context data structure allocator helper function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1e1057638e98..5162c02f5f88 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,40 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
+ *				       context for a given peripheral
+ *
+ * PAS context is device-resource managed, so the caller does not need
+ * to worry about freeing the context memory.
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Returns: The new PAS context, or ERR_PTR() on failure.
+ */
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
+							     u32 pas_id,
+							     phys_addr_t mem_phys,
+							     size_t mem_size)
+{
+	struct qcom_scm_pas_context *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..5045f8fe876d 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,20 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_context {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	void *ptr;
+	dma_addr_t phys;
+	ssize_t size;
+};
+
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
+							     u32 pas_id,
+							     phys_addr_t mem_phys,
+							     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1


