Return-Path: <linux-arm-msm+bounces-29968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79685964195
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250C41F22004
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8DF192B66;
	Thu, 29 Aug 2024 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="riHUavVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE8192B62
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926801; cv=none; b=LE3fkhtZ+9vKJJDXm2I0mZQ0YcVjBW6oJVJKf4+Y5qkclfrlEop/8EURXWHZ6bvKzXJnC7donFXOAbXMY5cGAbOgJ9uBaFzSq9tcwGRgYQfRK/2jKvsrWzWXN/Npua55N4U5ej520+maRHgFh7KbBW4tte2Z21uxncqnR3o46yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926801; c=relaxed/simple;
	bh=TnuEj9uiNYDGvT/WDFYFtTXjthsNUxS/xNImWJVj/gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k1BPvBVAEwhfYSb2hiNdl+eHVsiiB2c75iG513xoWAp8visbjwTGcqnPqXjj8NNdOvlTcrthPRuTaJtMn/lFZkT/wLoqSHedO30iCAPuRB1ebY5nZxSdf6g4/4TCBNamYhISXKmqyikl1lFDon2ri6vYNXG+lScSbd55isHnAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=riHUavVg; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7094468d392so277491a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926799; x=1725531599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXpohNGjcJfCJqCaQiZhnFBlaCnLWhBefQR/nOCDEO4=;
        b=riHUavVgmTyNGvS9l20gZCYXFNedBQTUbdvKqOoalRcQ5WbZNyKqEaUk9s6ChwAKyP
         XoJsEVkQgKv2JhW0q4UwrUoaKVqgGMMTA81Ko+yL/Q+IC5rFRevsitBFqJNhYBGLSvwb
         w5vpKFVLA4Wbw+bHn4Nu6UR8UXhklNQPEob/Au8HKomdieRqMlI3OC9zVFFoQH3+kDBM
         vYqOYXv/QH75KSZyT6vGyxaSGBydRIQTASEzgM+WtyUcOWXYbJkUT31sztu/SK4nMs3+
         QBmLB4Vkf11X1P4BfsMtZCW+lT0eWval7g/B2z0vm8AA+kW6RviCo6+maNwUizsQH5nW
         +now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926799; x=1725531599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXpohNGjcJfCJqCaQiZhnFBlaCnLWhBefQR/nOCDEO4=;
        b=KQjM9u+LuRHLaRiMs3JRtJpnpkZSZ0BqSpaq3s0F6TBHivh/eBRB9lGlLKJkj4rmpt
         FfDBK/qjf3de6VoQv7QNShDTQE1Pw/kuiH0DU69NrtO2oRNIUDglYZHPZ3KxQcgYuqPa
         /tY688jB52xhbAoCLCH8jay9bi1Fs7uwc7cjuY6Pe71YMDMnAXD5iTVzPW/IcsdzqTmd
         QfAiDjDD5FzdiZWXC3qTdndmWjc2WKe/OIJmSjKxPo9LWR/5943ljR+Oq5eDW3sNvZli
         ShsG92ItC/gzI8F+HXIyIzisyJ4ICh8nRgAMHGQedwxNsJssMiuXynt+ZWAWLG5ms1iH
         QN0g==
X-Gm-Message-State: AOJu0YxzdOnHO1eayc8l5N5pdsGVY5G8IApfhvu9TPdFTCH6Eu4Z8PXZ
	NoN3TrnsjU4axN8lcK56jq/tg/1/0xYhW2rRJTIod+6n2fg8kldVqs2tw/HaDIc=
X-Google-Smtp-Source: AGHT+IHzQlKpb6SgNns8yfk1JCTnZQzAo8OKX9t5/fVEsIUjLhdRx9zqCLt3/Def18N+Yyhol8/MTA==
X-Received: by 2002:a05:6358:50ca:b0:1b5:fa6e:4606 with SMTP id e5c5f4694b2df-1b603c4379dmr284289755d.14.1724926798698;
        Thu, 29 Aug 2024 03:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:19:58 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:35 +0800
Subject: [PATCH 06/21] drm/msm/dpu: Add utility to get mixer number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1489;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=TnuEj9uiNYDGvT/WDFYFtTXjthsNUxS/xNImWJVj/gE=;
 b=kEP+gbv7fJSxwa/V+9sP9FWlxxstGmW3wW7eOAaWmARUmmADQOGPOjYM4yKgyDVB+l2Iz/5gh
 E2wiNvBOm2qBTcMUCpak2jw7GncDdbg5jKrl9dB07Jjuj11u55tN9M3
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add utility to get mixer number via CRTC handler

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7d0fff9472441..a27e39c525d1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1306,6 +1306,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b26d5fe40c721..701c35803633d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -301,5 +301,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 }
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
+/**
+ * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
+ * @crtc: Pointer to drm crtc object
+ */
+unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
 
 #endif /* _DPU_CRTC_H_ */

-- 
2.34.1


