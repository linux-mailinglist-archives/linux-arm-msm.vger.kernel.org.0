Return-Path: <linux-arm-msm+bounces-16490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09E899834
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 10:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66CC8B21A34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 08:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD12C15FCED;
	Fri,  5 Apr 2024 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhC0TEd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249F15FA74
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712306499; cv=none; b=KSbFEDw+eWUhGZtm1B8eYygQ36kBdTC4oXM1Hup+AB7oMXK2ihD8kKqc81upF6V07zqTFG8YUEPqWDXD4sQ2QwTyYwasuaTdtWRftQWlGIJuGPfg2Sk9kDNqS9qonqpc4wWx612fwMZIyCZ0LvX1NE9ll9lvEjCu6EMJYtw6c38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712306499; c=relaxed/simple;
	bh=LuuIzVsI75M9BD4RB9Xpg8kuNSHIGgEeoiwcYByrbOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5LgTRY6AboPUmSMBSrYkXxv84kbo/rB5oy2T2FLOZryXjoXuV3OM25CcCKIMJCTP1EQQhaaMJU8eW5OV+2M5uPJeZp36WNqbNeLm65Zc4inRAi1A7CR1u7N/IXGS6K0WXzRXgXF0qwGbE/Iw+DcS+uhCAzjnkwVffnuqe/dvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhC0TEd4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d094bc2244so19634261fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712306496; x=1712911296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrz6dTaTK0KlWdsP16Esc0J5gm77xoC0tsefEzseqJI=;
        b=ZhC0TEd4+e81u48ovoHh4FgJ4xUAgfsR+mRFhgv6xQtLynN65KWbfiH/HjD5P4nva5
         vMyo/ZAX9cfliBEQQmSy6DRLqJefUuLrIZySV8zyQGXopJ6R9FlRmBxqUoyslQEc6mg8
         38Jyv2lJRDG/T/mIgy7Blw0+LYXcNlrRe3KfyGiUUmfHKr79288B7jiP75BOZcOqdLO2
         w6xgrG8OiMj+EYrTFwAhLv6IEikQip4K7AdZeZWUBzSmtpq8FU2ag1NLotxvIZADXwl0
         5LhhGDg8Kg3y9P0l8buLlqO1kqQjMCGqL1X3EKpF34QWin+yqTo6WbkayGPqYmlsYU8B
         VCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306496; x=1712911296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrz6dTaTK0KlWdsP16Esc0J5gm77xoC0tsefEzseqJI=;
        b=O+nAZwOkH5BUHVmBcxzGghUVbPqpQDviqu3JEmtGrH6rbM/DKoBLiKTLA+LCquutZF
         6YYjl82DNiPMHIbLNJlXPz1kbGLJHYm0yYUQzIVSoX55IjkB94+Vney9OocOUkWVWUo+
         pd3wGu8uZPJXqxtwKIKq4SzWUXrqomBvQs/PpgRdJXyw8sHhRtFkSsyrbz+oT0T6M557
         aLcBQs61nqKKSXT+z+36SaZ6d18LuQt0A2JgtNHOUcDFqeeS/uSplSVp2t3PiW8tu2Qe
         6EwGLAf+xn7lb0qZVJ8WxvbKTtrRCtFtllkd3bvsHSiHmR+czs1IvStWPvALCG8y4J4t
         1qQg==
X-Gm-Message-State: AOJu0YxeXlgWWdbXje8repfOOVas6lHn4g+CIu8wZSq0JOs6DlzypLzb
	jIuvGt8Ykmkpmcq1RrO7tX9DLV4BX/Li0Gn8a4k0EZDOibZDfyCK1kLhtkb/PCU=
X-Google-Smtp-Source: AGHT+IHl3jTu+OEG685vV8yMxLBRYabQaLyZqwz5PST4j9X2muXdZOgk98CH4aGQdnIUsU0cCkQKzA==
X-Received: by 2002:a2e:9658:0:b0:2d8:68ad:1e87 with SMTP id z24-20020a2e9658000000b002d868ad1e87mr671436ljh.18.1712306496187;
        Fri, 05 Apr 2024 01:41:36 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl. [87.246.222.101])
        by smtp.gmail.com with ESMTPSA id y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:41:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:30 +0200
Subject: [PATCH 2/6] soc: qcom: smem: Add pcode/fcode getters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-2-ce2b864251b1@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
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
X-Mailer: b4 0.13-dev-0438c

Introduce getters for SoC product and feature codes and export them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/smem.c       | 66 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  2 ++
 2 files changed, 68 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 7191fa0c087f..e89b4d26877a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -795,6 +795,72 @@ int qcom_smem_get_soc_id(u32 *id)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
 
+/**
+ * qcom_smem_get_feature_code() - return the feature code
+ * @id:	On success, we return the feature code here.
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
+		return -EINVAL;
+
+	raw_code = __le32_to_cpu(info->feature_code);
+
+	/* Ensure the value makes sense */
+	if (raw_code >= SOCINFO_FC_INT_RESERVE)
+		raw_code = SOCINFO_FC_UNKNOWN;
+
+	*code = raw_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
+
+/**
+ * qcom_smem_get_product_code() - return the product code
+ * @id:	On success, we return the product code here.
+ *
+ * Look up feature code identifier from SMEM and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_smem_get_product_code(u32 *code)
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
+		return -EINVAL;
+
+	raw_code = __le32_to_cpu(info->pcode);
+
+	/* Ensure the value makes sense */
+	if (raw_code >= SOCINFO_FC_INT_RESERVE)
+		raw_code = SOCINFO_FC_UNKNOWN;
+
+	*code = raw_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_product_code);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index a36a3b9d4929..aef8c9fc6c08 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -13,5 +13,7 @@ int qcom_smem_get_free_space(unsigned host);
 phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
+int qcom_smem_get_feature_code(u32 *code);
+int qcom_smem_get_product_code(u32 *code);
 
 #endif

-- 
2.40.1


