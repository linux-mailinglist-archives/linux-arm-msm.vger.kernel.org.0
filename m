Return-Path: <linux-arm-msm+bounces-3541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38451806F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9416280E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7E235896;
	Wed,  6 Dec 2023 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYzdGNcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9E718D
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:02:11 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c09b021daso42056195e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701864130; x=1702468930; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9luEiqd3rNZRXjehlbFdnQ2e1wzzmxPWamwzOSoC4I=;
        b=jYzdGNcdyUC1zTZyUjENMm1D9CEv1oooXRegryqyxYLT6v2+rFO/HoiYPaQF8kWBUc
         9nSCZN2cqkI17HsYsCJUGiVKvZ46sbXo+9oNhgXsJ5y8LVUiUcPqVXnOHlDSdvB+o/SY
         SP2gWuNLiQ0ZEslR9b+0bOYT38N9bVD9lBakC0Cu2UZzxUwMzuL5h3EUd+p4ujpRASOv
         e8s1ZKIIlpNOEhyIONU9dHG4GkAWoJbwRve4zawfOsm/N95U7BxCuEzMpFzZjNErwm4W
         eo1EgMxKGfC5kqdXAUfSxSWlG//0Pl9gGC/+9Suksi0W6vNWVykGGo7kwiH1gFlM55e5
         0z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701864130; x=1702468930;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9luEiqd3rNZRXjehlbFdnQ2e1wzzmxPWamwzOSoC4I=;
        b=wjr7OjgkpB8Zjhal5OhCvcj49ilePXH4ICrrf/hr04zHaDg/W3zp2j56mKhYevsmyn
         dlOsyLczh4olhtvnGlmmZtkkQAbSjt8I7Fhsn/h8bYQMYkJyx6fBunjPSaGd7GGQD0SF
         9kGqsefx+rVqRRe1UpNz117+uOAUOEAFS2tdkyyLcu9WMKD2cGfGjGwp13li7Bmj+JHB
         hQj134KK79+WlKU4kJRtkz2F94frUt5D0mVCjyFuDVID5N5B779d6E57SPpFw6eyjhHb
         BBYkPKslHLguydiTXKtKVGKlPQKMzQA8ZtfVfDlQgx3+jISsKbTyxRlBzVh90tZ4Rfuv
         hZDw==
X-Gm-Message-State: AOJu0Yx2TdDKggQ+RH+SaimCgPmg1aqPpmliPUkXOIBSeRXOy2smUP/j
	tl8Tp1/js9B7WOcFRSRxp20pWA==
X-Google-Smtp-Source: AGHT+IFJokEpInd+DiAKxLDKJAGHst4aJ50KC/hLVyMjr37BE7LjVcnWh8PkujsMGpwy/wk3eMm1WA==
X-Received: by 2002:a7b:cd0d:0:b0:40b:5e4a:4072 with SMTP id f13-20020a7bcd0d000000b0040b5e4a4072mr523452wmj.146.1701864129773;
        Wed, 06 Dec 2023 04:02:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b0040b45356b72sm25543935wmo.33.2023.12.06.04.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:02:09 -0800 (PST)
Date: Wed, 6 Dec 2023 15:02:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Message-ID: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The platform_get_irq() function returns negative error codes.  It never
returns zero.  Fix the check accordingly.

Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 61b7103498a7..d80cb3d14c6b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1166,9 +1166,9 @@ static int dp_display_request_irq(struct dp_display_private *dp)
 	struct platform_device *pdev = dp->dp_display.pdev;
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (!dp->irq) {
+	if (dp->irq < 0) {
 		DRM_ERROR("failed to get irq\n");
-		return -EINVAL;
+		return dp->irq;
 	}
 
 	rc = devm_request_irq(&pdev->dev, dp->irq, dp_display_irq_handler,
-- 
2.42.0


