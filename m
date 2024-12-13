Return-Path: <linux-arm-msm+bounces-42134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113529F18AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53222188EBB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469F81EB9E2;
	Fri, 13 Dec 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBd7Rzsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0ED1EE7CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128098; cv=none; b=RJw/lNPacX7uMbDDsVEvGLX5aS7yWYm1BbQoRA3NTuOVSFz6I+FLWRxMIqFjvqTN40OB9HFzKRCA+HTb0HO6c+B+tAzJgcvApuA0eWzaIObIjCceVKpOwuuPr5TfvkqSeHtN8S6978jcVk6YoqdEp/nVj2HJ+2r4O6tjkSS8WA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128098; c=relaxed/simple;
	bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4S0pOuZvxpphEJjBHCicNIRUg4wkZF2mJgH8GMyO/t6zrlRhkhoJPIvKx2iSLAgTTZle56sH4BXs3nvUBSmu5O9hqwyODwX9AkAFHaGRswp44guiczz2p12it37FO3VagOuph4TztAiymY/sUExXHaoHSRbrtzIeWI4lwfN/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBd7Rzsl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3022c6155edso21089721fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128094; x=1734732894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opYI+4K2DJJKwW+ZJQ9gJCluOKx+HHP7NZLtl3Vo64o=;
        b=RBd7RzslCoxNd01SuyTF6zlVrX0U/KOpxwMgEqRUz+d6lykP9Lk3EUoALe2w4NS0qM
         RbCdpL65pQh3YJIXYP9brFxis/vo+ehzgusiiPCZRHJPz6nMaAL3m9F5eknqOT9gwrez
         Kk/wqqzRN37Ae+5gn37AEi6u3J8I6vPq7felRxll7+tDUgWLoLWaIyzO0RA1/iMlCTIF
         wD0zQDUUhBaPpcMvTcizny/lvA98t5U42pV9rvzBU0pUHOwQBXiEpyQtUMH3rTi65x74
         DnLCHaoTkzkJVL6RbscpnOKiCIl3erdckseAryqdv2jdekqqPOlP+iNxb7oSmJtaI2XF
         0aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128094; x=1734732894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opYI+4K2DJJKwW+ZJQ9gJCluOKx+HHP7NZLtl3Vo64o=;
        b=CCoJ27i1RZandV2r3i5P/CsDBP8I3UkFPqsNzJfe608GjrBoqs8uADkLin8qpv9Ctp
         M+RThzOrPsgK5NCVDBiREZZARsxoyHgXt1GAqZAX57I0uIy3KBZJ/fwiXkuoKGWzcWaH
         gl16F9OSREKjyEWK9sQL9OpmrA60uAdjhgaII6qYDqtD3jpU45opndJ7Rkecp/4UNNLM
         Zx+Vgoh50kkfmLzRLwOMUF2qwfZ9q/565z2WeEG+7rHewDWHROVm6v5aHrfUPGSRDchv
         EjBSPxK/eoya1i23tMIuwltL7+QGzLqhnE+B7xKXO4F06yH1ssf3DizOFg3076rBNrho
         nVmw==
X-Gm-Message-State: AOJu0Yx6JzmkUcwMWETndbM72vZhMQTnYlrFVg5uuj974jekx9UwVQuk
	zsl5T564NuMFUMl+y/SaEtdrUaVju0FXGGYcDLlu15BBXlTNPWWe2Z6+JXKDSRc=
X-Gm-Gg: ASbGncslTcy8ZyGDLyRNRjV3jVdPaIAR7Nz+1Eqxv/ZkeImPNa68vp6F/eDqjtL0qTX
	Xdq0t11AKc22FimOXLhWzTN1sN+i/pHtsf9XWfE8Y/VqjJtfRgnY7iyBlLvYqOzMotOzk2HEXEs
	8ZcmSm6RVlLIImWQqFOVuo5D5NXOtNt5ywjO7fpqX1hfq+q10zwC6P1pKNTHhv7oo+x92PRKkom
	DNIiYKg1QVjNrcUvDGE/c+q8wYV6gcfhyB5tJAxJq2fXbWnWmf5OEJOU/X5My0I
X-Google-Smtp-Source: AGHT+IEKYmfLZkuO7EgUY1v4G1Iwhi9AGdgh/bx/sqa3CDhkR/s7AfQq3cx/0emmaMmMhC0mjhOvrg==
X-Received: by 2002:a2e:be23:0:b0:302:40ec:a1b4 with SMTP id 38308e7fff4ca-302544b112cmr14661261fa.30.1734128094482;
        Fri, 13 Dec 2024 14:14:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:24 +0200
Subject: [PATCH 08/35] drm/msm/dpu: inline _setup_mixer_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-8-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFvYSehS5Tz24MK4MtF4NatfCHlTOnx1c2v
 TJMYwsSZs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1eL5B/9xEi4eRYyvweYAaE0ngSBTRPHVKpylfLocewX8Bn1P/5aWDfg4AT3MKwwLfbnt7tCJ24G
 k3pdQLmKQWVf7148LwG9yHljs51Zj6OzpoJf5aKMDfNQaAO0j/vUZRlOTIo7hn77UBXfnHl/drB
 Kk1q59YZ4Gt5k5Iz1o04iKUhu677KtDpt7K2mTtGLtzmypzkFUXfiEP21Rl74PWiRngvNsT1ktr
 Bxo11MKAqbaqvodCncIGSa+KRSTSuLvz6u/VcFY3FNxJ9AFjj5Jigg7249SIXoMM0AQtNDllZHx
 kLft3WQw/Z9i5v2VJe6Pq9SNNQUTE6buGe49Y8Cno/04aOTQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5


