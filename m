Return-Path: <linux-arm-msm+bounces-30443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A43109691ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F241C22B29
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6391CDA10;
	Tue,  3 Sep 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGItREw3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C91CDFDF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333782; cv=none; b=Gh0StgsV6vURa9KgQzj68miFocAG+dNbhKfw7avCf3DoohxL18njQr8geVMoaPrHGgwo83Eodxo4jfx7YVFzSyzYUDzXTlfnjvf6JcNhCqDBRp68EB7FpEC5J+edva96UkK7tBQDG8pG/DPr1BaaNTKy2Z0CRcopZb5bIrhnyh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333782; c=relaxed/simple;
	bh=/gi8zyo7FWjCT4xdT9G2skDFV4BfLSyAVjvvmb1/W1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJgN8P0iVfetjU6935Hd2vL3CRWlxoAiiddw9lgPws3k6lc+NlA53fOHMPnigTYtiFDMHzFWzbvRlM6kbMgNGyD8ax3SfOEfmeurq1OEtHB5HMA3nG/Y5/3tJNc71WEULEizb68BFwg0a3nBBWz+3/VBNBCaVfWkQTUjI4j2Ftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGItREw3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so54275291fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333779; x=1725938579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H51nDEtY+afzUBw+OBIFePQrJsO4/hqhDKfTqoHMhGE=;
        b=LGItREw3mXO9haqDPEuUUsJPgZVOmtcGQ4BPF7xtvAx8eO4jByN6P0bNzIy4+7JEOZ
         l+hgi3XxIPi5t8/qpfU0yr8yziPfuRufl5trCqhzwXAA81OjNxQ3T2Ecg6KFFyqR+oJG
         a/HYqYZoY01PczeM+BPk1/ydlvO4A4ZTxKd3bvbUSn2A3UF9wNQjKF6lUv4Yv224zXZn
         BrkER1AhlsjMR0P2LVnG3IcGq4M2zdOKhG4pCx5XJXXNOikQvBptbu8YpsqiTeYQ9nOa
         czgGWrqBryFu7H4tiTfSEm9aEt9fJCWGcs80fGQ/1F2JokXY17Hq9PhWHVs9cWusQ0s8
         82Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333779; x=1725938579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H51nDEtY+afzUBw+OBIFePQrJsO4/hqhDKfTqoHMhGE=;
        b=UdKneVR20b3UC2kDWYJ75WnJlETHIs8KudQKBTdxoCyeLMbx12yGyJR8rwoybiJD6/
         dQfAxZqkPJ9WaoP3zmkKT6XVbSEt/zmklz7xkv2daWXVUDWKWftwdfSNBQ2h4bZrElNT
         OAXpCZ+iQpLOv0ZunST5MuVJk762l/XYLmYTzAx07pHKXXt817Lf7tTTz72hs28unGjA
         en8VUglu4f06x3MzFU4it8M1aTw0V5NIcWL1KIsnb/9jFfyiuNYpRZ1QlEBhH/9ewJYu
         O6F3Of67HOUyw1t9Rafz5Kvk3ID21WU4UYEotmQV2hY5gqud4a5M6tJ+WkpUgg4DhRlF
         qyZg==
X-Forwarded-Encrypted: i=1; AJvYcCUo39fOR0Gbv9lKvCviNTKI73FyHde373KMCdC/o7q5QUWzVLATBFrMHsZnJEIFav21ZDitDirLZAOKieeq@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxb266uDy9lkw7jVKi5H203kQpKHA4/dMWcXQp3XjhvZnJWD+
	spjTPxFY6Mdj+qS8YLv+3ZanZHjPhYg1uJ1sUYC3/+dCaxePir7v2shf9tFCVa8=
X-Google-Smtp-Source: AGHT+IHvR+jurlZsKzIDNM0asSCNRqANs4oGztcoGqbByKt7wGpQYTBtE+sHgm9pv7JUfTEwHa9CJw==
X-Received: by 2002:a05:651c:1a0c:b0:2ef:2ef5:ae98 with SMTP id 38308e7fff4ca-2f636a7fec3mr30331801fa.34.1725333777985;
        Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:49 +0300
Subject: [PATCH v6 06/15] drm/msm/dpu: drop extra aspace checks in
 dpu_formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-6-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/gi8zyo7FWjCT4xdT9G2skDFV4BfLSyAVjvvmb1/W1Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEL5SIIxYpAg9zdiK85yFFvln8osR7Wiviq+
 zJULHAWC86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1SAZB/9JPst8EHWsbRbm4MesqNi8DzrxHHkAE0teXhnyAJlvKBx4hf40U00LS77SDfEsU8r/p+Y
 yIA1YrHYugT91eLtIgj9+6nHNtLXkx1Lvr6WDPHVxhyp2rL0gYCT35XyZ/M+ejZ3eEhBgMUTeNS
 hWwXLja1YfIy2gVMbH7dc6Py/V3e3Erg6Zkko9Upksr2MiZ4UK06ukLXzesFxR1BAiKkNvkV4Yq
 BPyqa6AO/CgwyDPc+KRu/6vkA1K+8gqQ1li9btXT3Thjxcj6kclGdWNM0KM1Depm5xsEabgZNIB
 3MfnPj79OThmx9FlyrsQcJ7eaj7Snw3nPon9oG3/5eKchRMI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The DPU driver isn't expected to be used without an IOMMU. Thus the
aspace will be always present. Not to mention that mdp4/mdp5 drivers
call msm_framebuffer_iova() without such checks, as the whole
msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
configurations.

Drop these useless if (aspace) checks.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..8c2dc5b59bb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -280,8 +280,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EINVAL;
 	}
 
-	if (aspace)
-		base_addr = msm_framebuffer_iova(fb, aspace, 0);
+	base_addr = msm_framebuffer_iova(fb, aspace, 0);
 	if (!base_addr) {
 		DRM_ERROR("failed to retrieve base addr\n");
 		return -EFAULT;
@@ -376,9 +375,7 @@ static int _dpu_format_populate_addrs_linear(
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
-		if (aspace)
-			layout->plane_addr[i] =
-				msm_framebuffer_iova(fb, aspace, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
 		if (!layout->plane_addr[i]) {
 			DRM_ERROR("failed to retrieve base addr\n");
 			return -EFAULT;

-- 
2.39.2


