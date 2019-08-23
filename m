Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB2D9A672
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 06:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfHWECX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 00:02:23 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46719 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfHWECX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 00:02:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id c2so4764862plz.13;
        Thu, 22 Aug 2019 21:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yel0x+m2Aj0fHDjusl5I4z7R0Ifl+JFYgseDOVUIkZk=;
        b=Tj8kd3iWedgRnZYmXtQ1Inof1niR5jWQlUDlprQYn/jRwEPa7qH+LKWVYSuIPG6N+M
         azuHxFgl4BlOeRK4npX7cx0FqYVcstAgUBJUVcQoUxA2VH/ANXhjzTjaWIJAgZx0J3lX
         OoJotT8tSe5hYCXHY1hcnAeDOHAQraxCkwhLrZLgCvYAslNwSLpfNkTVPwJHdIOKkBf/
         Eye2vO7BhxvYuMXDme6aci3NBpzZITPWJsUWxSKI6ICMPB6UYoUJTuXIwSCt9kXK1uBN
         p0V0qbXgHB0ggKxPLHP+SaHCsrZe7ThaaioaCsQNajhyv/v6o7BYPW7Z30IoCAB165zB
         lqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yel0x+m2Aj0fHDjusl5I4z7R0Ifl+JFYgseDOVUIkZk=;
        b=H7HVwQbceYBDzuN5nYa2Bz+UcvRWPrsvrspg8/orXJHVUm8p7UYK+rhQ72OqftQPOo
         MltBCpmrQlKagy4P/NbLEf3HPMrcN9zhkIuYLRoNLUfswK4m/l53IVLNR/WMQv44Agb8
         HkmOKcM9rxpSIYGBHv4mOVG5FC2h7QfIfRjmG1IGpdThwDVo+rNxkOa0Gw2HN2uO6eU5
         mBnvkCAfeBBc1byQ6xs6ywmisrkhg/FxvAVG6BeDy8n+G4YRLevdbiJ2vjM5Z4Q+5qLc
         TeBPJj6bDyyxJ94yi7zS1zHwideILShMJyJFpErSCfV6xtl3HL35vLM/tvPmjtHd+k0C
         XMZA==
X-Gm-Message-State: APjAAAXWeIjeTmgYEr5Zj2wxQjH5JXpZdg8ItifkzSAkkhnj1OUSHqpV
        anWMQ4evqZ1Bk3pnDnEceLY=
X-Google-Smtp-Source: APXvYqx6OiWPOmb6UnDM7G4EeXtWVfl24KDBgNHT+5SzRGe+1+0Z1DiIj9dXuUxlW6ZND39sOQs42g==
X-Received: by 2002:a17:902:3363:: with SMTP id a90mr2403398plc.270.1566532942559;
        Thu, 22 Aug 2019 21:02:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:e554::6bd7])
        by smtp.gmail.com with ESMTPSA id e189sm699430pgc.15.2019.08.22.21.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 21:02:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/msm/dpu: remove unused arg
Date:   Thu, 22 Aug 2019 21:00:11 -0700
Message-Id: <20190823040103.22289-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823040103.22289-1-robdclark@gmail.com>
References: <20190823040103.22289-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4e54550c4a80..a52439e029c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -634,7 +634,7 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc, bool async)
 	 */
 	drm_for_each_encoder_mask(encoder, crtc->dev,
 				  crtc->state->encoder_mask)
-		dpu_encoder_prepare_for_kickoff(encoder, async);
+		dpu_encoder_prepare_for_kickoff(encoder);
 
 	if (!async) {
 		/* wait for previous frame_event_done completion */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ed677cf2e1af..627c57594221 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1780,7 +1780,7 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
 }
 
-void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc, bool async)
+void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index a8bf1147fc56..997d131c2440 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -68,9 +68,8 @@ void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
  *	Immediately: if no previous commit is outstanding.
  *	Delayed: Block until next trigger can be issued.
  * @encoder:	encoder pointer
- * @async:	true if this is an asynchronous commit
  */
-void dpu_encoder_prepare_for_kickoff(struct drm_encoder *encoder,  bool async);
+void dpu_encoder_prepare_for_kickoff(struct drm_encoder *encoder);
 
 /**
  * dpu_encoder_trigger_kickoff_pending - Clear the flush bits from previous
-- 
2.21.0

