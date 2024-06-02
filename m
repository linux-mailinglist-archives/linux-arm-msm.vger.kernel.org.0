Return-Path: <linux-arm-msm+bounces-21424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A88D7852
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5146B1F2130D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369FA29401;
	Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLvdn8XZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5627653E2B
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364398; cv=none; b=ebiQg2SbLfmkgnD+vMAAeWcfzKRohiUG6/DsyNcMx3WyG0vOXoCSVG79CIp6IlPQgJzey8QpD+yOzFin5FZcsnI/u6J5MYAhvjroPpQ2j31SXH0d1pmRvZTLbzRhcQyxzjC1LEYVVvtGXq51dWA3vm3X4hd3EQXMM4xsiGYYOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364398; c=relaxed/simple;
	bh=snF0WgX3Uzkz2+5I0055uCAP2cYsbGgSQ2GyOQRAHdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FboBQqsxrqyfTvB/MDc6FpAoZCjwEcymdCzBYaG7Rms5U1iNFgwvYhSQ+VPiM2Fjh66sYXKd0a/QjJfwk+0BF7LffYnFIE+9pl+kxKQ0CaQKTYSTEpAWG1kNSKYdlvnvmtqzVlKLD/jBvhRs7uWDHM3eKFsYQ0dTQh5OqawjgyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLvdn8XZ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e719bab882so40297851fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364394; x=1717969194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
        b=eLvdn8XZ8bi8p5596aLiDlZJSZLJ1Ys+QYYTpIjAHuSHgyDgYTXbxVLJxePCCWLc4x
         2TEG5hL76tGGJFdoPAWCyxlglj9c712vywPuWFspLMAi9cANYU5DlGQmVlRmaQqKn85f
         PWcyLpX4jOWA5ajWAsLZWdFKtaP9GvkSoAx2TFN90NT7YZN3GOpkeTKbEW6UwQSmYaQ6
         liJNKJjKOsbFMq5J2VQFjgjdgsXIUK5XiiD27VTEzfkprpseiGVV+oLtY0sFIY9w23iP
         a4PikIDdA7Jwbd4Cv7BuL89NZir7NToWhWaygYXeos0p8L2hipNU7ljJnB5qBjsN71ct
         DcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364394; x=1717969194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uEsmC6Fs93CtWuR8khej7lWUC750pqp8djwlJQOosQ=;
        b=oaNz7MkrX+Y/KU9fOoTYKW30La7/8Jmx2WkEf3U9PpL3eU+SAylPrVoQV3ITwFFKn/
         lNmUKtt6UEWPofTl21ZpyGPVqQ4L0TV+/dtQyrTDMAQzVjeH5nE1qmrREYKLHg6fl/K2
         CZkUMgeZAaPbBOfmnlxWW/ZitwRPDK8k93iCPwjOxZfL6IZLWed33GvDXBTY/RaityVk
         A0XhonVnV3lpIEOSvKgI5ZPsYkHVFFscZf/2wIxr6rbQlT3AtBC1io+JvOxSafDiTbPJ
         D7x296fxvLHqoIiHq/tI5pNwu/0m5SeE26rZzV0FF+GKY4JFNGfIxpAFJtayrt3i/9yX
         j2/g==
X-Forwarded-Encrypted: i=1; AJvYcCWdyCcrzHQrtp2zEAN4K8BL7HnkYoiv5iLEM14GpNZn6wanwaxDh0mvD0wvRs8jBiuXbi3oKk+Ca3/deJsxlwHeJGWXsEtwVM7BS9MyJg==
X-Gm-Message-State: AOJu0YxyLwjZPgxPqZf8aWTCEMQa/VU1rOCdtiDlhmdesMXmVINUDowv
	lvdtfaXsk3VNjw0ZLaCLMvKD4BhY289LtG2Xm2enGcR/zy59ODaDls/LFnzbRtlVx/lNFKLoTFp
	L
X-Google-Smtp-Source: AGHT+IGraiOrh//2iVqXW+yWmUJCNiUOLMZnjgqJjUSn/Gflfmxt4LJkXTjjAJ3McUyifF6aR9SLBQ==
X-Received: by 2002:a05:6512:74c:b0:52b:2f78:9c92 with SMTP id 2adb3069b0e04-52b895694a3mr4169462e87.5.1717364394346;
        Sun, 02 Jun 2024 14:39:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:50 +0300
Subject: [PATCH v2 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-4-16af520575a6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=snF0WgX3Uzkz2+5I0055uCAP2cYsbGgSQ2GyOQRAHdc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalEj7K/et5w8ArfSrqPzQvVoUCrqytS9Ekt
 R7LzyoaZOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1a6NCACE40Mt5owlIaVRYYPMHs2kfEaF7aKJAnhZ8wPuMRSpTxBrdJ6o4yZBMZ84cvtBu0YELEn
 ev21zL8SG3E2ASOo08wsa/7ZJWJxURdPwL6f1oVnGoHbs8uvaEioXCE5JBnA6rp4HERXUSRDP2T
 ia4tF5vzPaTuCuMNKVaOPcrb9nNAz5jGvjuc06deWox6GE48zuC7tnVblwbR7ait4W+eRm6OMZ7
 aVhYn2ncV7QHf1ORB/LeE/OYX2Zrl0RxQLe0yuuifr0peggvhhTlQeyxxMS5E0oZbE1cc/62TIq
 OPBikQ47OT7+DmDRFc1wyRTTOUzIwp7m0oisnwmefGGVGvWh
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
index a57853ac70b1..927fde2f1391 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,12 +674,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
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
@@ -865,6 +859,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2


