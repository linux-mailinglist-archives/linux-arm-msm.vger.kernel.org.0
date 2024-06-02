Return-Path: <linux-arm-msm+bounces-21426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674488D7856
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990AB1C20A83
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2447B3C1;
	Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2ig4J+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F577A1E
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364398; cv=none; b=dv5ZsZ9q084EIqBbCsVCsXTOn3kZTk6IE7WaHzx98YPUp2I1fOyTgFk/MYoLzfXhyUk0LTi5TTJbCTV0pDgahawECYq4EjHU1aP10kKeyEjWwOVl0QCy6sZPNJKpLEzLtw3vuXYp/7MIEZv4vZ/D+hKsTdsQiD9vIGHuFsGdRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364398; c=relaxed/simple;
	bh=4803hWNpcHudkouDSAWKTu5smpjA3R/H+DmuPg5Dn0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K99W0oNilDR+2mpsVSnvm1LZ1dDIoiwOjB9XU5f36wV8HgziA1AA+hk3TwzC2AEPICd1N3aBJAXEZXtZjRSMT0tyK2Zf8nZZ2QWeYiZ8w74tpGnVjbuqriFc0waXc7yVC9uZknUkcF7QDRyA0HhNFhseRAoIdIKRF62Qf9b6xh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2ig4J+R; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b8b7b8698so2737194e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364395; x=1717969195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
        b=B2ig4J+RhNrLxXkgv0YVDjrEkwn05UIza5rV0bQyUiJX92RzJUliBdAoOdfwENstbb
         YaZRj4N1/gW6bxxJOxylft5m1wBnutbIs36CKCV3dXaXIouEwApE0WGiNrDK1lIzlqfX
         uhpe+9UWdbhKY2B36KYJ352dRXCpW65ohEIsTLN6vUsOZsTZzDZV23k/B94VXHyZs/iG
         emqjwN5jgK7wULjSWrGdqkmIVLhNzAiImxFwYegEWoHo/JnM8pn6nJJUxY3ygjC7QgXy
         2j/nZ9ufodtANw1o9y8+LgJjPrFwwmU0aWO1XoHOpB4/tx7vUsa4VYnCBfZnGqpFfabs
         e8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364395; x=1717969195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
        b=fz6g6fZupMWPY97L3NLBrOoxg26yVo36hvdIZZZ7tGdA/Whjao99ClNHZNko0vBJ+u
         /FjoiGKIh9Lmz2HJ9eoWtFjCHtK4kf+mZa4Mxjo+v3sMZnWbCO/Cv+jRQXtgDnyWQuPr
         MXAAHQlqvCQz+0YSO3tVNpgdX2MgGDALe0tyHXX4vCES5v/l5BkIXR6RtBm/o+HVtynQ
         1DISYLlm7yX2aOWa8tph36wIYy2fgBh3ihFQp4NFzrluzbAHnP1SoWE91h335SwCrWgg
         Bop6cq8s1oXeChp62dJWQhqV0TxN1Z5npGrhwimrwvCzx7QPgNlZpByiAj1xiAi/+aI/
         0BNA==
X-Forwarded-Encrypted: i=1; AJvYcCWJxOcCKh83ttv+Uby3a2BZ6WpF3+u0/3d5zUoY+tw8omikgHOY0ZRB4+pOEnf7N++NwHPdHlbfrVCEOfC29pAXVjqedR/AhyJgw0RlMQ==
X-Gm-Message-State: AOJu0YwtpnZAKu6VICQntpoXO8RL8S9u1bhEK4DPyUCC9h6MVQAABNOQ
	wDKPxvu1yb8KXtwNZpoQh54DsgJmA9L+Plkj0NvvZfx+m+kAiq6tl4ua3Cyu8bEDzh4/BXMqbMJ
	E
X-Google-Smtp-Source: AGHT+IFodRA7wtJWYqOP42HP+r2Eadd15Zax69RlOlDxQZO9sG316AaJi09FuIzx3GCZSw504C4ZBw==
X-Received: by 2002:a19:8c1e:0:b0:52b:8280:8c10 with SMTP id 2adb3069b0e04-52b8956b5b3mr4664626e87.18.1717364395030;
        Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:51 +0300
Subject: [PATCH v2 5/9] drm/msm/dpu: check for the plane pitch overflow
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-5-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4803hWNpcHudkouDSAWKTu5smpjA3R/H+DmuPg5Dn0I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOal57sL8VMNXDeoG/fMtixB373FIQWN8gw/p
 Jsq7M8PeNyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1SS8B/9IvoUaga2Nmr6zLxDaPC0Pc/bQ9umyzktyaqzhu5FrXAUTstXPTkXN/Vvvm4IgHL7Oifm
 WcQeu9aesYxb/ZJPQ9o8vy36CGWa35+aCrBfj8HB9h/IHRsCXNKIZGdKg9TzZi4bnYOuSAnGiae
 roe0B46ZN0KiaM5s0ZS916amsyfzrXGBUTq5YkK6vWozKe4spG4H/JLLyrGee8y91BOfhjj5UtR
 dpDVLc3WUp65moHflX0M1QkiW6L/w9O/SKw8QQZ/Im24w8SS84aULi/YwCxDO1SP3DdHux9xecx
 98Aj0bzISAffMSqrXlRQ6NhYl61qevbjcTGXb7aPmBYGevrW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
index 927fde2f1391..b5848fae14ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -791,7 +791,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -865,6 +865,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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


