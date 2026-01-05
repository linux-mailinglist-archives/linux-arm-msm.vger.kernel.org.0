Return-Path: <linux-arm-msm+bounces-87442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703CCF3C86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77338306E5BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B9733DEEC;
	Mon,  5 Jan 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caMLtLHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIu2Wi/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF933DED3
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619439; cv=none; b=oRn3NRQa/ptFjK+0Ed3T72J4TSoYqEiPlms8R0kcTeI8V0lMCWCT8MEIx1oVhYoxOwHWXx+MMV/DZYf3IdDYG2Q7x19hp90prk4VLD95lPB/7CELV7bJ/9AjcDc1KT/I7KspzbBONJ0t3Tgu7F835Clz+TOQIGNojlAbB6iRYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619439; c=relaxed/simple;
	bh=JHAyLsFhkDEAcfYluzFEJIJb2NWskgIjsHullCrZs8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzN4okAg46vMitKAqaM9mK28vP14coFtmHcqUV63Y2Q6bPypASlPO01G97lIzNReb9hmyzzcVneWXNW/LSlsTTE9/2lL5coHR8z4vpwZH2DnBMyfP/ELuB0D4F60aJtkRMzVBNFYh1+m5pNzJm695/unu5w83wglsnGp6R/oz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caMLtLHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIu2Wi/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605A9ZKH091437
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRXEzbpmZoLWVEC17zlGvTcHTCfFUbZ+n7JXj3Kr3u8=; b=caMLtLHOTNpKuUfJ
	D9cwyhYWq9VFd3HNwBqVa8jAHof3kTK+/zGYWzvHl63pRqVBTHmAWtjdBV7fsssQ
	slCoUQ1IlKYJaKr7ZFuYlRHiK4Q9yCZ8ivSN9jtSjalc6SkD8e06WRo4FIy+Iw7n
	Vjb5cAmvjikp/Lq7sr1UDSxYXuadcEytuOvlm5dQdQnaV9HHRfCVkKnfIeAZh0zi
	JkeZOEcvkkWWwIKcRTn3og1OCp+KudfF8/Mby/w5HLOJKdI+kZxRXHsGbElyiOQQ
	vnTE5sfTLkkIQhnDL+Xbt0+gib9mtqXvRLCN88nLm56oqBoY9gGmWDckSexXNggZ
	JKgZyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v61m5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so2343631b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619436; x=1768224236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRXEzbpmZoLWVEC17zlGvTcHTCfFUbZ+n7JXj3Kr3u8=;
        b=EIu2Wi/5M/zCKcVkVTXYGtaA2dwBSAmH0KOPqNAY46uKNZLqOq4I6JMQixGbHcrxR1
         QDXT0hQVEmqhSeW7FUeZIF7bluZPCUxrB5XTbA2VdbnE5oQ+68DamvxDxg/glljy4xed
         vD2iYbo1r0hc3mwVZ+JtNLzn2Tf35eO4Nmyl++lYhLK888enwl9orjcAeLOch9kaH1pH
         8nAG5ON9DF22/w8F1qcJnqza1YyuvDrH5QPDrLBM93O3qDkndr8rm7b1dwKeXCDh4v/I
         abJYw0R+3lHTjJmonau67nixnOyOhlacZqeZwCUAPPOZporfItVqt/TOi9p3a+nIw/tj
         B6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619436; x=1768224236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XRXEzbpmZoLWVEC17zlGvTcHTCfFUbZ+n7JXj3Kr3u8=;
        b=wbKEbFP8w/VLqT21tBDi8RmioB76BZpbw4kWNcgQ55WiuDhhHy/3sz5DJaNB8gBlZK
         v320EM4yB17jJPM4qsRZqrcAhroMxEcl0ztMZEsSuU9eiJav55w7e9myOaqcAJ0BCi8A
         Qc9W2Ive+txXtv7q7zDYxUg514onHeky7CUbJe5Xfue434i2kvMe6VxR6rAU+zysAtfI
         DUL6PkGgfVXQBjvX0+hlS9rrl6sAXUjh/AM7lE4RVs5vgogFKbIHDlirqphSJtnRGbW4
         vWCU1vyy0oA2nsYZ4VvFPcbSPx3LoXbyhm4Rv1RSu6CefzkScBr9UQzZtAtHO5QPxY6d
         KYTA==
X-Gm-Message-State: AOJu0Yxu7iZIeSktjmzi0sobvDN0mNrUOM42mVvNM+ctvLZPx5Iwd9LH
	PdnWrR9ZIPurh/LUp892VVI94OvJaeE711QGDyfWPIpIWrA3gkChd4UbnGffVSVLnesLmVEn/+/
	sO/5BvKJwMfAgNo9hA5enhSIJG1r5YE6TmXQhT8bZAojIDHSjvmu3LYDH/vYJsCUcOi/m
X-Gm-Gg: AY/fxX6fYkG+WGuCCg7CzZx2ITF+1iEgEoMv6RqWFc0bDbERtw7LlcnpiKq354AUPCw
	5gUoPtfOPlpXIk+qRwLiPrhMLx2OSefyZgJHg4RBEsbejFIG3iIvka6CP9SymQBhR4Tv3NkGXXk
	mnmoWdUQ926gegFZROKhgnQ6o2Er+7Kmmz8fb5rHza3ImJ+hJMTRriJISo1OxtvD2/GRh9+EGI1
	/asu7V0JHMtgT9GquK3wOcfBey2Iljx5cQyoqcfKff5/w3816Q4FfuYWIleFFsaPyz3gNcsiDLb
	/sYHDFTTaUVAm66hh0ZKv9xf8NVA/X6ojA0PBhtlQ+sx2hQPUM/E6t+NNoEZ/IZGtXncuoSE8ok
	Ka0M3hqXrCrojz47bT6WA/TZxYDmMfhPKDdNV
X-Received: by 2002:a05:6a00:2a0c:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-7ff6607bcfemr39160887b3a.41.1767619435832;
        Mon, 05 Jan 2026 05:23:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9QSNQ45E6pm9WIqKpv7s+2aGOeq3jGRXUnf8Z4LGYwWh16ZrKpdKTPzYTLY4yPkjlXQ2rXQ==
X-Received: by 2002:a05:6a00:2a0c:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-7ff6607bcfemr39160856b3a.41.1767619435221;
        Mon, 05 Jan 2026 05:23:55 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:54 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:58 +0530
Subject: [PATCH v10 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-10-022e96815380@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=2509;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=JHAyLsFhkDEAcfYluzFEJIJb2NWskgIjsHullCrZs8A=;
 b=kWlzfyRrhgtOfbGUFcndw/B5jXC3d47Y3XmyPjHijUUFyBFDx8qnq7TRIeVSXRxf5NkAzWSPt
 F+XObqnslRaA8EqSIrb0Aj/e/EmFnAg+fqbWiuRAl35ttcAuIBoPCUi
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfXwid2bkzH725p
 oK4J0bQFJVL8wz7xzjVFs0ciMnf2jVQlE/sYG81Qr9DXqZcZqRjEO7v5vFQKujiaZWlC5rQ5xIU
 ha1slpY0srawhQagG5TNCuKdtSQwb8I2i5ShfkVYQDsmlM0JbA3FQBw+fAGxwhmJ2+aM5x362AA
 l1x1kVrYFNlbS4fOzvD73L/GB7bE1o/Wuu+csncgiuAJMhHw9/4NfulG3h5Ss5FskoQONKQAN3a
 9DKEtsqtZgMZQbIdMf5dhYMcQWnSl8qUtksxVawqYj7GBOj2mMTBNKla5XH8LXcRAD2MgdR+at0
 zxXwPVTvgwJzl39VXOkLp52omJ9xRfwq4hz8xpnAvrTAd+/eNRyXqy33/KQtBBzhqMUJzwJ/139
 ERJhaYyPeZ0nlzKfHzEJlquJCwUbq/BeKnqamvcFTJ4Wf/qGqXIkyCl90NExzZFosBkp5mo4W5L
 9Pw5kH4ek+rEtR/ES4g==
X-Proofpoint-ORIG-GUID: sKUcETq19GPOGjN1xqRrEWTYEUOmzay5
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695bbb6d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08WIqK_J-xaQODWVIAIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: sKUcETq19GPOGjN1xqRrEWTYEUOmzay5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

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
index 75a57fbea74b..9ee673193301 100644
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


