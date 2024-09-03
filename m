Return-Path: <linux-arm-msm+bounces-30451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D59691F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7A3D2842FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06D61CE6EB;
	Tue,  3 Sep 2024 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWnNDrPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6161CE6FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333787; cv=none; b=QY/w2uYTtCCt3P+mXWEoIuKMaF6FkddPHMVa20uWevqR5sizkKna8dtcjBhNaHgkWkaPFoQdntH3WXxTS4HLn6xYOMUNMdZUOWyRIIKx8hZULKMJeiL97VdzvCSLuoO21JCwgVss3thJ21S909ZCEOnKd1mXDtEwvtfPMjMu95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333787; c=relaxed/simple;
	bh=XPsvsitt1q1/pSPR8E1pmuiZ9IMdCJRZ86FgRWBJlZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suQA0Uo0O+/Uv+wPxbZb1oRwKbwhu727Pxg9G40evPgy/dcZBJHMvB59Rda0VN2b8mSGqC6QsbvGnQbKIUyTaAYqG5UYa1quR5J+0875ZcdCsDCbVJzqtfsBuqx9SqsMBy0ttPRafYuOzCFFO5+Wcq74lIlvk5o0GdDjGd6qFOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWnNDrPz; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f5064816edso54876241fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333784; x=1725938584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNcyVVvZk5loLiufOoESYV0Fl75NGNrg1mqZRy+YG+o=;
        b=QWnNDrPzE/fZD4CeEHzpaL+/PgTflDSCJWtIbEW3ggsJAmXpWDAnP8Mm5mRi/VXdZn
         kUI18sMGOBAKPLuAPX3iqSZXm/1aFMYN0rOP0GVDFFZEw3ReFI+lfm8h6e9ZhFLPyW3B
         sZ7EKXRSUnMEq9FWGXdSrAbm0NEUItnZKF84wD9w0RlFAL2djSF8mqpsfEuYhMu1zx0z
         DNvb1KGKUJIF3ixk7wydFHkN5qUFUuiHcaoB7Ad4Z9E8yjJifaOjTIl2AQIaFaZkxwwP
         3t+8pkWgegbwl9032w1CUjEIqx53Tr3uOhxGxfdwMKKKShM2KGJf1bhKTXBuDi6zdRsX
         bZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333784; x=1725938584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNcyVVvZk5loLiufOoESYV0Fl75NGNrg1mqZRy+YG+o=;
        b=W+DWrM1w2Jhi9Pvqa5dIZRAfe5bLbEB6vYTtsqrE0iNHAG6RytG0WE+eb0mqH2Tq5j
         raSc6mn8LmCfawSHzMSIscfd1ytpi1kEDfS1Hqc07ynr3A1QTLHKEQfmPpN2kkO4B9oX
         WbydFNCAZcsEvsyucqvwl2fJ1kISdDTtSzZVQ/fwJ6ufilb62ylzl8OWxeMxNUAwW6+a
         ZbO+vowXmWnr0U8XJsaNr1E+d4bUZG70i5sxFVvwvyI6p3JmerBXo4o1UcG92kRv2eXt
         GJbHFNqvU18wuuZNqglzQWLgaMJk+3oa6o3WxqKTEocEuXX38w1FgGUWlUjozzrfJ/lA
         RicQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsaL/3nsPSv9z6sh2blQG/Zj76z3ZFa8XQMq7e+yvS4OfASm8kMMgvRrS/pxZxmmkCoFG7sT/dCv1L9FPP@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkmd4YBzAunJ/g1DxkZq4KCLKAVLsWsjY5kEkYpEA8QSEyFQy
	zrGPumhaOCTlFHKnBuRiIGSuEME4ruV/g3DPQ6aXzP74MpY9FjlQ99vb2b1zIiw=
X-Google-Smtp-Source: AGHT+IHOxIlT4SuY36W/z8DrCYweOAxrs+1iXepanIFfvFeHHaelsiCTrgeQYczKg8X0mf/jree25A==
X-Received: by 2002:a2e:4609:0:b0:2ef:3126:390d with SMTP id 38308e7fff4ca-2f61054aaf9mr101064971fa.42.1725333783444;
        Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:56 +0300
Subject: [PATCH v6 13/15] drm/msm/dpu: check for the plane pitch overflow
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-13-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XPsvsitt1q1/pSPR8E1pmuiZ9IMdCJRZ86FgRWBJlZE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEM5yi+wct8hrTlmYoAn+9Ei59ElyUyoj8WD
 4JcHT2FZiSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1aLgB/9+zx1fLDKaiXhu0s2o9e1/WxNm3q+pEqD9GEUvWsZ2ruuv3/us/a2E3sWA1xfeD6j+x6P
 PLQNgXQUiVsHtPkyyBV/bKHE8vZ8ZsexfiVTqJV1N4VW1lYY3a+Exk1Obtj2kydjkK0q+k6s2LO
 2l3WBM7vowl7zwQnqf0sREz/bDPBVaYX5g5gwfmAhiQj8gR+T1HG0eaj4sERZuhiMobz8iS8AFo
 bNSuD6yLzMdbRjXg4QjmcE1i+mMVlCerTG4J+jkD7QLuioNf6LAgcj4dDdDabBfXx09ez4mCUg6
 5m35FR4+pASI75ScJ+7gOFAmUXCU6OX58qU+QfPckcYhmwcD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3045bda8a7b7..f686588bf896 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -782,7 +782,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -856,6 +856,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2


