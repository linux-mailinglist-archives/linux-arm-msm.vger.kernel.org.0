Return-Path: <linux-arm-msm+bounces-42310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF79F2BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C38D11885C79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA90201028;
	Mon, 16 Dec 2024 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQC6EQ7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2248F201016
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337661; cv=none; b=MgeAWrCTONcFCl+FUUpJznn7t6/SU1y+5ltOIaKPd6TZIUUqO55eXO+/8X0z2M4/M3Aya/SnCYSzijb/kPOIOA8vETBTowNln5VpfrezKDChCdOBDdWeeijNWlAHeiawFGW7nwPjrWDw9xHcTdc4baYqr3bElg6Wv1wLPfv20Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337661; c=relaxed/simple;
	bh=1HhOvQdDTQpfgdgbG47ZEhiTKbhwKeluJd76grZHFQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+/KKYl4leKP9piokHtXfTUbo/dE2LQbCLsDeU68Gdrl5N/8yh+mE0HlSuIB0LFPuqIbejmFEBCpKr6noTHmHdlyFniWZVlZ9T98W7AOis+RCoUe63Pz2sE709OyG5jl/xs27HOEi2V1Wb/XEFZUC6n96EOSwXYUVLTclNpUKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQC6EQ7W; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso48001561fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337658; x=1734942458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbJUsGouyvpdIwJ5KdGKXUaM1AeXWb7FKeLRpP8lHmo=;
        b=lQC6EQ7WTmDv4pp3LoMCu+ofO0TKhWmSwN/RzPYV0X5LNBtOt59JrgQ4RHDWcy8R+8
         vZaJ8le42E4lwJZyjO5HQeh/Q7Tl/vU6aAzyMo8ZBpIWTeqgUP26J3WI1BR+y9kX/Hkp
         FGIOzuMXbfvA5ha/ASWPoX4/EWXwYbjZYt1VhJCM/Rjnb9inAhX7MZ8/bhmKZE7HIr+S
         qohJX4OYl5cLcjFSk8/X7xYJh42m4CReMZ0ZWNa824RbRKGEL0tize9BAI5cABj1/c9M
         WLe3FvoOh8xFY1yN7TVQ4mxiikLUuBvzVUpKSe9v1HE1iB5lZhpbNX6/9D4v14BFxu8B
         IQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337658; x=1734942458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbJUsGouyvpdIwJ5KdGKXUaM1AeXWb7FKeLRpP8lHmo=;
        b=xGO5Hw46vSdYswYW+mZQj/jgPxFV9ZCQ7JCrmd3Huduh8HFOr97JgqYpPjemdcg0av
         D1YEMHhPUknFk57q2MOaCivpJpHCXbHARzkUe37hJTIRkPYU1JFPVitUvRSUqK5ihKIX
         aJEQLnUqm9eFcIcMN6S49fGruVaRX0Ic07Or0CcejgC0rkHKPA6XtYDCmSapnp1Ag0jS
         Ea4F0FaLHDMNqvBcYaclyrtIn3hctZllm7QkZh2LAkCmRsWLgyU38zlz9qhFTBMoF0tF
         RjaxbOfwN97Qp6VQdHSQd69Urjy4/YCkPZ3zE2xVjlKwQKlJjrjHjxnOlddZ97oPqI/u
         5HcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzqR9e6M6hlOVw9IwRKE9DBwBp5qPu0KE2SrKS4Yx4SGPpNOXccrLC0izy/s9s+V5NIP9Wi7Jz/pyEVQl+@vger.kernel.org
X-Gm-Message-State: AOJu0YyglCCFQ7YUb9rfQ1wshPsLBqg2q2kCNt77SBVfoL0y86rtEQEy
	PihWi1Z1x8bAQ1Zhcz+WZICMHa1IkMgspP8pA4e0g+M71O/toXKQuNEjhIY3dxU=
X-Gm-Gg: ASbGncvCSGB13dPwkwy8fIlEjR2ebjmIR819oeJFyZUwOzEps8VH0WX3IHZrnSvyEb+
	vB9rpRx2Zd/5ELJvqKmBiwIq1jSOizLj+jWMlWwEztF4Hqmx11BXo1U6grQff11bDZHtxOTQEwg
	Rw7e579Zi9lFi0K50+bjeSt8qUs1zL+WZeFHs3aJrYSyjf48/HMzSdsEvwTLC9DsR43IUNXwdOj
	6QSgMFdSAkCaxOHqkGkxu6tZJer7WDSCNE9Hn8Exf0+uU0Al2Q8x4HFhJ3NCPe/
X-Google-Smtp-Source: AGHT+IE09YmVD4DRB6LYkgBX9GgTyicLTyLwxzWmsrV39R4MSiGMzGiG8tc7FZFrp00POVfsz/KMrQ==
X-Received: by 2002:a2e:bc1a:0:b0:302:3610:a50f with SMTP id 38308e7fff4ca-302544ae74emr31223591fa.30.1734337658383;
        Mon, 16 Dec 2024 00:27:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:26 +0200
Subject: [PATCH 5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-5-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1HhOvQdDTQpfgdgbG47ZEhiTKbhwKeluJd76grZHFQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+Rs2FhUYx9q2yNDoYbhnSjaGb+un7b3T7HUG
 VoAKEcGX0iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1eZRB/4rtFczYnTmybdWYQxDY4DO9biNQKJsf8ktMkqNBxfoBOm6geGnYjdFg4JaRtD03g5YKl3
 6UFn4R5as6rx8Zak+ZhimIcttpvhOUzURUykldcuGbs7WqYhaGp2qs2DlvqgiVQb2Z0KkNDMDeY
 QsdD+kpGHf+FnoV8HiCFJgrNJ95+Y3vKe0HgoHPA7NRy1eu3MUZ3DTpFwswhjuzoz/WIrviOUaB
 OT9Qb4erHsNqFFizJ7TgR+cPeXPik04uohYxBeKtt9K/hRMA9258n2yU7rZUYUPuICEzVyoZ7i5
 JM67FnF5p5GaeujazKkpq2Vww/uULSfevN1y3671rWbyPXp2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..a1dbbf5c652ff9f21c02af2e2520f019702f29c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


