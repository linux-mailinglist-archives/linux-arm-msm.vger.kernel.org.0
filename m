Return-Path: <linux-arm-msm+bounces-2160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA7D7FACD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 22:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E9E6B211EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 21:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB5E3EA76;
	Mon, 27 Nov 2023 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCvpR0WO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D53BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 13:54:04 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c8790474d5so60893471fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 13:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701122042; x=1701726842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArlAEnUqFzFF52c5Tk73UD/2KvIsYGODuDfHTLaWfCA=;
        b=hCvpR0WO5I7lkrZU1XU98cgE//iuC6upzvfAeUndRCtuyBUZ+kDPQzsXKMpVA5tPrh
         +Bv34FflSK0SBX/pHJdfmYR1HtvlxR0pWZxnGkTI6M2EIuP6E2SWBFDQztqeix5lJPZy
         Pk/U65iLNzzlkWBXsDCUwrJLv+Jjz8jkhKV4uZLHI9ohS1RJ/Zru9M/KQYK9O/ZXfI5A
         76TDBAc4sCe5Q+blWGm65fZxGjYkqKZ1Ecpzhw60YhODdOtQ3Zbvllmze3Gz1DWYDAk/
         3DDeuO8lvlaJkaxWPtkwaAtgI33lB527fqA4J4sftmFH+eQi69Ml5HDUznhjo3/pXH6j
         V6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701122042; x=1701726842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArlAEnUqFzFF52c5Tk73UD/2KvIsYGODuDfHTLaWfCA=;
        b=dPKE1ITiyKDhy3WOl1s3iE02FiiYmIw3nc0m1mOkJak+dLtuLQbLEuuIuf4eOTsqwN
         rLTOC6DceQnnWCotrI3Yu8SDewE03BfnJjk/I2M2iodAOflmuB1idSHKLOpATdJ+hIGp
         S8oEoe5Hp8ykuYXGnIawuRWgVRdNKXlPVBxplB1anMHUmSoozmi94+5oDG/UNk/aHDRo
         XHUjGNZC1QMz51Xn7JBSH4HXVEsH2y2vGKzGGGwXj6BEMqaBk8pQkg2MmKvvUsnpxs2Y
         7mcjaCgYkJ4P5tSkmJ5O1hFegT21aA3CJ/daeKjOnO1MF5sgTAgrp82GSrAXned8Le86
         tfmQ==
X-Gm-Message-State: AOJu0YwAMUVs3pr2IUQ4bx5X5X3Gbhhp7VV7aQRG5bhiFKm/TsHY5aY0
	rCyU7r8dnsGrMGx9M7jwZiYKWmx1uE5ku3Wjpvs=
X-Google-Smtp-Source: AGHT+IEJ0MrB1oiO9t4k0oOQGCb2i0ZvEyweQLr45Ug10MCxF9Ksc3lEgYPRf/H43l4221vP7BHN5w==
X-Received: by 2002:a05:651c:70e:b0:2c9:a1c3:487f with SMTP id z14-20020a05651c070e00b002c9a1c3487fmr2907888ljb.23.1701122042393;
        Mon, 27 Nov 2023 13:54:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020a2ebc09000000b002c6ec01aa08sm1471830ljf.110.2023.11.27.13.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 13:54:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp4: flush vblank event on disable
Date: Tue, 28 Nov 2023 00:54:01 +0300
Message-Id: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flush queued events when disabling the crtc. This avoids timeouts when
we come back and wait for dependencies (like the previous frame's
flip_done).

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..3100957225a7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
+	unsigned long flags;
 
 	DBG("%s", mdp4_crtc->name);
 
@@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
 	mdp4_disable(mdp4_kms);
 
+	if (crtc->state->event && !crtc->state->active) {
+		WARN_ON(mdp4_crtc->event);
+		spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
+	}
+
 	mdp4_crtc->enabled = false;
 }
 
-- 
2.39.2


