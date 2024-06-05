Return-Path: <linux-arm-msm+bounces-21810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB68FD735
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C934283794
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9BC15885E;
	Wed,  5 Jun 2024 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axFGz6p5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE6158853
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 20:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618229; cv=none; b=r0khPMBauapbfIDr5qERxNoGIu2HJfj3e0UcsvtZVeDB47Q2mZHzWt+IauXwJj2CoPi5qZtRlsFQ8iNKOs7t7t5qVb7W67v5RAgeGTh9mG4V95f8WOk9eICiSM3fFOnOWJq55CeDQGC6tsDZrVfbGTUFkWE4k0h/7WdcIuQACO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618229; c=relaxed/simple;
	bh=2eh1mkAA/sn59xOPGlkcYN2/AYQfYvCIp7NENrGuyOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GKCL3/rDv7MGAM2tHVO9+g5EiU7lnksIdGxnFMsSC9Pzd82a87JguLc7egy6IhLis7dSmxYGCVUywhDWI8GUvYKpy14Nh9WSmsc+ZeCUoEj1lJmv72yHejfzwwmL9t813ky6s7XRr+ZxR7z2MgEIqNv3bHPIHE5xDdZ+/y6Gjuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axFGz6p5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so2405061fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717618226; x=1718223026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMT/dov4rCwVnOSBADCi4X7D61kduzPQ+R9fcxd3Uto=;
        b=axFGz6p5TL+u3r4obT9AUwcUEWLFn/p9U+xuBMIu5ADM3vOGesO3x8BHrGblxwcAP1
         UMhvRlNkmUDKPhq8TRVdQBEbi8JQPcgw4QRJDObSajjTU3IH7v7WRgjzptwyFYyZGe44
         qikvZ3uL/mIuBzOZVdGV5v0CpPcs3DxsiZia1uLXmdfrl7icxBIpunbYxFjoQSsoKuYZ
         aJ7uinDLH3iL0Ndk0KI109uOI2i8qaesIm+XoxPhli0mjYfqlK5P7r+w3wnQH/kusR4e
         drl63mrdyrI2sV44UVT/PpgzMLii8IVG0f/Ag9VtaxuE4ECVwm0Z06+5x45jl08CdXBb
         U7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717618226; x=1718223026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMT/dov4rCwVnOSBADCi4X7D61kduzPQ+R9fcxd3Uto=;
        b=FW+Pd29m8Z6+TEdRYvmphR9mqWpYil0fm0+hR/1MEoPM5pf3Jv2J5Jx7WMAqBTnnjH
         AsheeMOvTMrSi9B2rhvGfGT+AkEr9jWFArKfUdElulTilGZTTN0ccaVLt11HwEWgERUn
         j3nV6BC+w3RHsruQ9JmVqIV9PQpvAL+9rxmh1kFzpe3kk2o8P1tYb22gUmyolgqUg+Cu
         kaXZUtDWM319YD/RfFHRKSsuX8vCrXDH5wlxLXC91czHg/P1bvkVkFG+GlEoj9cZeb6a
         AYJKLWflFb91Rr2P0b/evTPNdbOWebF8HNGAE1ViyUW6sl3Gwt1gjuS78DUBD8pYNM2Q
         W07w==
X-Gm-Message-State: AOJu0YwOG5pS3OB+q2r8fdwCT/Nwbt+QVqpqa+AFZG3S5tviRxwR5Pg+
	nZs/lM+q6fWqyfjscPKNtHb424p4Ha+bmSyQI9YitsdK3nikCWw+ovlN40rfE3g=
X-Google-Smtp-Source: AGHT+IEuGR6zo172budNUpiwYhBQNuR5eJEdRRfWLY7Lr+ygWqIyqGnJ89qQjCt+KNbyocrh3WLYOQ==
X-Received: by 2002:a2e:9305:0:b0:2e9:8497:46ce with SMTP id 38308e7fff4ca-2eac7a71477mr20869651fa.46.1717618225806;
        Wed, 05 Jun 2024 13:10:25 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:10:25 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:15 +0200
Subject: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-2-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Recent (SM8550+ ish) Qualcomm SoCs have a new mechanism for precisely
identifying the specific SKU and the precise speed bin (in the general
meaning of this word, anyway): a pair of values called Product Code
and Feature Code.

Based on this information, we can deduce the available frequencies for
things such as Adreno. In the case of Adreno specifically, Pcode is
useless for non-prototype SoCs.

Introduce a getter for the feature code and export it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/smem.c          | 33 +++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h    |  1 +
 include/linux/soc/qcom/socinfo.h | 26 ++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 50039e983eba..e4411771f482 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -821,6 +821,39 @@ int qcom_smem_get_soc_id(u32 *id)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
 
+/**
+ * qcom_smem_get_feature_code() - return the feature code
+ * @code: On success, return the feature code here.
+ *
+ * Look up the feature code identifier from SMEM and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_smem_get_feature_code(u32 *code)
+{
+	struct socinfo *info;
+	u32 raw_code;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	/* This only makes sense for socinfo >= 16 */
+	if (__le32_to_cpu(info->fmt) < SOCINFO_VERSION(0, 16))
+		return -EOPNOTSUPP;
+
+	raw_code = __le32_to_cpu(info->feature_code);
+
+	/* Ensure the value makes sense */
+	if (raw_code > SOCINFO_FC_INT_MAX)
+		raw_code = SOCINFO_FC_UNKNOWN;
+
+	*code = raw_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index 03187bc95851..f946e3beca21 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -13,6 +13,7 @@ int qcom_smem_get_free_space(unsigned host);
 phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
+int qcom_smem_get_feature_code(u32 *code);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 10e0a4c287f4..608950443eee 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -3,6 +3,8 @@
 #ifndef __QCOM_SOCINFO_H__
 #define __QCOM_SOCINFO_H__
 
+#include <linux/types.h>
+
 /*
  * SMEM item id, used to acquire handles to respective
  * SMEM region.
@@ -82,4 +84,28 @@ struct socinfo {
 	__le32 boot_core;
 };
 
+/* Internal feature codes */
+enum qcom_socinfo_feature_code {
+	/* External feature codes */
+	SOCINFO_FC_UNKNOWN = 0x0,
+	SOCINFO_FC_AA,
+	SOCINFO_FC_AB,
+	SOCINFO_FC_AC,
+	SOCINFO_FC_AD,
+	SOCINFO_FC_AE,
+	SOCINFO_FC_AF,
+	SOCINFO_FC_AG,
+	SOCINFO_FC_AH,
+};
+
+/* Internal feature codes */
+/* Valid values: 0 <= n <= 0xf */
+#define SOCINFO_FC_Yn(n)		(0xf1 + (n))
+#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0xf)
+
+/* Product codes */
+#define SOCINFO_PC_UNKNOWN		0
+#define SOCINFO_PCn(n)			((n) + 1)
+#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
+
 #endif

-- 
2.43.0


