Return-Path: <linux-arm-msm+bounces-6152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F582093D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B63B283C03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8162A50;
	Sun, 31 Dec 2023 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgjmsqHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EC639
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so4946725e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983438; x=1704588238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
        b=rgjmsqHyFScCcfcITNKJtAODr4ElX6NpOmAdhuM5G8tvsBe1y8DKOaVKr1kmmsFdG6
         1uhOm3P4VYduntdkEyGBNMszcTfGXgTbaJbf7s6heVFCAA+27Oya+TgD2I4qVQVQ/Edf
         XztjZ0ke1Zw3R2cUOVkmaPKNrvzO2zD3PB/JLJ8qA2gS+oIstqQsULijAzxhLSdjv0DT
         fYQtG7FDeqaTOXupP4BBZAnmZma9zhFtxW4Ps8iieulUVlx85TNuSNj3SZ98dBhEh6+A
         gn367dv4kHVi0MExiR/kDAwIKOL4G0dbVOtjp14MJImoqaH+xqYw7jMlpTFnEmIBwkTo
         OM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983438; x=1704588238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
        b=HJMiRIlYcXmVmJzLM4BHz47EdfXScPre+ySqo8f6cJb26fR1Cn8mq7FePtsRM9Km7h
         n1YpHlnkmYoKuoHbILhWy0LxnYBuGhQWZOnCnKcFGVApmmYTWRpLcOnOjDT4gWFATQas
         xVB4AHh9g6i2Zh61paXy32H3o+XjrF+1NntuPD3zwx4u1acNO3toyzsuyT4f6UuAAN1G
         WJg/C0zGJxLeUsQz94OxU39+iDDUWc8saizySxjGEC80m1J2Pvu0i0C15wopwr92jRfp
         kbTwHkR7NVYn9AQSgO/ifsqsT2RJXzX6fj6fuM+s3mR80Wx9/0AYLQ4TaGyDHTX3RX1r
         niWw==
X-Gm-Message-State: AOJu0YzdjQ4Q/p2TPcHFAQQLtmpKP566N7IN4Aw2ZjkhGf95ESIOcFJq
	kz5c9/hhoXk3ZIZub+00oezwesxgEzlqog==
X-Google-Smtp-Source: AGHT+IFuKsyNeRIsb9xygH5jZjhnVEd6acR8l9kvPpcafsGNAEuVd0LqVjSdqOhwjSmp/ANF2Hm3Gg==
X-Received: by 2002:a05:6512:60c:b0:50b:f7bb:4545 with SMTP id b12-20020a056512060c00b0050bf7bb4545mr5260316lfe.68.1703983438024;
        Sat, 30 Dec 2023 16:43:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:43:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:49 +0200
Subject: [PATCH v2 02/15] drm/msm/dp: drop unused fields from
 dp_power_private
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-2-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mPuJ0sdVtb49CzPgC03wOi5IYVOAPxO/LgrDoWoA7+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJ9pxCr+cfMbT52vEps1uINtOzZDFA5Bp0S
 JE02LmKf9GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1YJUB/9HzfmJqtMbNuXniEQKlE2aau8EdIcJfrVD8jFUc21yySAuaqy5QLLHxYT/qktPDubQ/t2
 K0e852gS8v0R1ich+98jsWgae9PwbL2w8snsZIWP+G6sNVgGUF2n8AXyjR46zvvB+mKv7dsTTtt
 BYasWqlRqT6Oqn3TG60BzA80543KWt8nH9dJkfJ7VRIImfqPpsdQxDNaHIwHkJ/iAZl184uc8rM
 1VCLBSqF7xAVYgfDJcYX+m5bVKdh/4lKiIi4b1YF2+eNoT0AsCAtqYaxQ9p+f2ONIaetLQG0sQK
 qmKjg4QMfBkcENhDGoZPebtasnsAGMSI8EfaQTgOZexEkzz8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop unused and obsolete fields from struct dp_power_private.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };

-- 
2.39.2


