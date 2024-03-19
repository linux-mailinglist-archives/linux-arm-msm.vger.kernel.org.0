Return-Path: <linux-arm-msm+bounces-14514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F187FEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCF4A1C22BFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF638060A;
	Tue, 19 Mar 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ucftndQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA58002F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854528; cv=none; b=r2Z1WdfxA4maGedrf66GMIV7NsI+L6FGuEbbJotkBwCbiozIzaL+fsoCHJGiYkrTCMmrloQiNrCLVki0wLotx+zMnudVC4BH2wa77enXoGnwnynSktribh4M4S+/URFykD5YNE7DjuSElu9BywLN4kRrVWaxP+36VxljbDLSHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854528; c=relaxed/simple;
	bh=Cm466EMiV3rqjsRkz5DkhNg6Qor98v8Q4JQTPUTq088=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klViMF9FxpichBxLEknb7IfjZBeIJYqVSZzcPDHrtDXt6Z5wuQ0AzyjuvPNSuxR6LRjslMGHIB4Feu5/eEhJvqug5Mg6I6zDWoG8LXqadWbsWJlClBa6ffj/u5iaJid7S+2BNzIT5tKt87Afml5JcLzm0Wf2DQkyCBMs3wN0c7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ucftndQ+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d49ca33dcaso46272981fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854525; x=1711459325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKI2zwb8IPiI5g9nKyo02YnrtBE6ItshoGtglMZgPxM=;
        b=ucftndQ+lVFqhYX5FEhjwtQhBLCKbxGuHbLSskQRflXsjhP42CdCpiZ3Ec503jcR3C
         7Yk/KHp8+x5jz8LlgqKDphwxZpW6wi0lv/rsE5wmIjPvpVFq3gys4Qh/Dz6ilyGGYbkC
         g4oBhYJTaDhP3PNK1xwWV4AlBJ9Q41wwrB+4yqjjC+wSPoVTT9i4HQv7TSkbwWkf3IGu
         q+BDRpf46wqiY9SKVwuLIkMk7eo2KdWJTtVXyteLXth6yd8iD0ftAjv8qRMGzFsIIyLn
         ee+nrwrl0iZ2hscQY1UsBaaZoPgT+99TX//EAB+efBDr24tu0ygePVjwpeQ5d3wC4Byc
         X0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854525; x=1711459325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKI2zwb8IPiI5g9nKyo02YnrtBE6ItshoGtglMZgPxM=;
        b=GEQrk7GOT/01XSZAGPcC9iVtu4srLcIV8fOPKyMVe8w9CN1UdPN6ZznuURV/rcyX3j
         G78fT1AX6/jD8/LQxs1aPVDM7jGsUFHKnejXZovpi2keL9AJ1erVEzuUgU+KkAe7yQ95
         A0RMN4bCPOieDhoh5EGM7JQJewlaSYvnFtddN1cLG4cwz0TzpdnB+B5AfDANsSCTFNoJ
         CscQjIODp6k+hb2KBiORqUfRPU/n31CBw0/Cf/RVbf15BoNrLgo/SpDjJitzI+y+HFmY
         hhyc8esj+ePwCUZwkBXxnx8UMqS7P23+ox5stVYq7pH/HDYNA8urmLbPf3leCHP1247n
         aM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFC212dWlJjoiSdSTVh634Ko3g0Zl90wOlAIwcJfVKHXGZuENB31BsbOYCAwl0nGhYp4J1poKlWbuAwiz8fW/pblACRtUbchXjEevYGg==
X-Gm-Message-State: AOJu0YwwRzKBR7UE/GJaq3DJ/m48fm5oiDlvRdAUMilTQygWi49+laPZ
	AFJMCKx1YRn5uIEQi2s85hHpG3GAeTTz9CG78+GmZRRnlEyvWRHKavrSChZIUko=
X-Google-Smtp-Source: AGHT+IHq9v3W03NLwpVVlxf9F4CRm6prQJ8JHdzaZQb95xya9Fb+3Vd1JowzCYBfImR7epuE66nlZg==
X-Received: by 2002:a2e:2c05:0:b0:2d2:dfd6:8335 with SMTP id s5-20020a2e2c05000000b002d2dfd68335mr1888479ljs.22.1710854525405;
        Tue, 19 Mar 2024 06:22:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:02 +0200
Subject: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Cm466EMiV3rqjsRkz5DkhNg6Qor98v8Q4JQTPUTq088=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3yvndp0SUw1KM5VaAh726lqpCUr5AykSQ9
 4tkZJ/ktKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1UOSB/wL/o++N0d5TuuI6v3xEd2k+q/Uo2k0LJS6hV3hZyG1Xpp26i8LYm+608rJXZQ2C9td1CH
 5XmNsV/93X1TKbucnRd/ZzJXQNd1KEwZc4e/SX5yZC+RAWIVOzOjmTt3LaUQoB/5CkV1pvjTGgN
 FpqqCFn7Hifw9KlgaSuntVOFsrXUO2dZ0+oHAkBLWu8bPeKaLBKsg4UBOr7hHWW9REsZYMsQzVH
 Wk4+DEr68cWG3/FrlNZ+gtzgEF4XTUNxxi8xeyr45HrEvpBiOijdsxCxYmifxz3AUYCOkmFaqkb
 2Lz0CV4tJurf/4IUHXbku/FMPJ0oiscRnONIOhEj8wiFqC8S
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move a call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d9631fe90228..a9de1fbd0df3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		return ret;
-	}
-
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_addrs(pstate->aspace,
 					new_state->fb,
@@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2


