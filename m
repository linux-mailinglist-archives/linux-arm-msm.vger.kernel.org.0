Return-Path: <linux-arm-msm+bounces-24041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D683591589F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4347EB238FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E701A08D3;
	Mon, 24 Jun 2024 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xR5K3ooF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CD1A0AEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263640; cv=none; b=HIQuHlAaxMWoP+8NvV9UlnSxZaRZbLnmjv4MmORXOyqOkB3me8xf/xkuai1W8ba4i2fV+V5z/xmAtJ/Ig2FsxXbAVI8A/GbPJdI5wRnmpkqivfHyiZSyP4Jl1Nya1oKdzLSm78qrOVBICLz3BekE3GpvmLMNFTT8C9aqz1V84Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263640; c=relaxed/simple;
	bh=+RF/P7K64SGg/tQu4deWbHOf+YbNZCIL5VEgg9w8tfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgHo4P0NEMOiocT6Qu3wvaK+hmitaHhmiJbBGkfEmamkz/ToG9KJ2GxYdhvmArSTUupV4rqlYznIbNmq1FLehooTHuRS4knh6olmARnufIXdDv4YBKxdjXGZeHLTsdIaeKaUVGXTEm5lBnN6woQmlgVGvjTZuSAYdIJ3hmRFBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xR5K3ooF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdb9526e2so2648558e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263637; x=1719868437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
        b=xR5K3ooFT4Ug1KnhKU2i8asKh6EUtqafTUSbYcSCGJTi1/NMZ+rOwa+Sb2lIQElzV/
         zROvHAC9el6OwMHgw5hyp+oBNvRQiHkUZgmZoVWxUcS5GolEYM1j0lbacWfaQZXq0y8m
         h/O9zaRic6JEcPgZkL2zi4JjmyHW6sAYSytnY4AmpDdI6PmJzMT5vekINO9CvziRQjww
         BKVM9tAlEVl0VXfcdRGfNot99fqec1oLEj+JbnZnXM7Iuh/m3wRwYLoowgX4aAbz8S2m
         ce6fYGWCAuvRS4O+AMWxADKhAxm7kKXyq7IADpl14fcDdCs+pLQQj25A3qNkoJgGaCZ4
         /LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263637; x=1719868437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
        b=fds2EM4OGCTxVd6DJ2i+4Y1O6t35/6HjNtdP2V3L3OESQYHHaW6VqLRpIVuZsoXAXR
         etIhLgqLLY3priNS7uZ8S/kOTfbubtLDTa0jKYy/ruG5JeQvlNoj6c7cOHuebnhExJBz
         Pqyni+hXrEtpTQpK6ne7y4Zoz23LMM/+yLY9rH5+cSEqiOG2+x8LP7YzSp+HepAiniLS
         S/M56KS0HhsmjUmmY9jNMKKOeS6dw0MN3AVZDaEHz+tPnYYQg82ZRldu7SXfyqcb1kOt
         fuTSf1QMVjinhqZ131yrmoaefUzn8ELLMrn4IuJiWJq8SOGkRPNkLhwVVu4CHylkhM07
         2Tsw==
X-Forwarded-Encrypted: i=1; AJvYcCUpxod99cMcz6ipyvKga1TB4rg//ky/4RB54Rwa9cFek91iL5JjBJmPDHaJQ1CEZdgt83c9sMFnIiqAMibZ3X+0yWH/V0NdE5eHjQeS4w==
X-Gm-Message-State: AOJu0Yyw8olOe/6/I3Wr2dp5o+X9WsYNGlJRaWwrhND64e3ep9hoBLEL
	g0eUs4aTWl2il67KLsgAgEuaXwK8oEs+bCW4uFoEf985ymhlaiFCyV8ZDUDvOQ0=
X-Google-Smtp-Source: AGHT+IFn/jsZJwn9C0ZfSVQu5ro2YDWqj62VOTDL/RnBepxagmDc8HYifcBlPbf2LuVVX5p7BmhWzw==
X-Received: by 2002:ac2:46d5:0:b0:52b:c14e:3b5a with SMTP id 2adb3069b0e04-52cdf25d968mr1915087e87.31.1719263636737;
        Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:54 +0300
Subject: [PATCH v5 14/16] drm/msm/dpu: check for the plane pitch overflow
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-14-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+RF/P7K64SGg/tQu4deWbHOf+YbNZCIL5VEgg9w8tfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJpghx/E1Zz6KI64+fN6lonXR6KaAjCZwF9
 OquGYfR9oaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1YHKB/0by3KyQlGCiAbP7nZWTbNgO7bwSoVt1iVQ2SiTb+0iPX5obGQJ7CnJvGMv594tF39vR+a
 78Qoxi6kGNVtNJToC5I8Vn1U/bGEJ6Nr9d/BKzSkjMisCecY1nv1kEPndpPeQos/SRy/RMjA2pm
 Si9uSiNMxqBQid7rLKr3ztxTI9TCbu2fK7IjqbHIQfuKRpQY4x1Ib2sWL4bSbUuONl1T4wfk+mv
 m5zgfO+Kv7/6uC1vdhswVcEeQsSX8H1vS4M6aFPBCYGvkwAjz+Ov3EF3iFtJzWwHXJyeB/8hfXB
 YbPgNgR0OJ6+nxaY7wJQkAWixKFlyJu5xEVnWLY9k+QWp9Pb
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
index a309b06b0992..a629eb3a6436 100644
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


