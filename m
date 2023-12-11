Return-Path: <linux-arm-msm+bounces-4262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B799E80D52B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 19:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712192818D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5CC51010;
	Mon, 11 Dec 2023 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL+kuOVJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88630C3;
	Mon, 11 Dec 2023 10:20:05 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d075392ff6so37034605ad.1;
        Mon, 11 Dec 2023 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702318805; x=1702923605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lepig9sX0iMaeuKxaJLhhBtg/75ZzLxsYSPeqzHl//Q=;
        b=XL+kuOVJ8haLvcrRLLi6XqlEXNKmMkqJ5XGul9/6C1FBtCZAP7lmJEZaxzsfYurR/i
         I16SORhOjurHZBzY5Hq4W83X38tE4olLTlZVoG43VIYCUlXNDIqGjaqxWp7UGGnf/LL+
         VPy6yoz3F+vakRh4VxcfYcGzex8ODuO6T315dzbpp+hBC9hrz3vHznIMsW6RM0y+qhUe
         hrWF1sT8hxewkHlVvyI9CZ7SblSm6adOoU+ROuiIxl3zjhZNW1z7eUG3RaTns7Lt3uCW
         szzpyqMjVT3FaQuXfI7ZV88EFIgQK0VuCnsQXgTNrwHVPnGIFgK6pr1AqR4n5pLjuYJW
         tfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702318805; x=1702923605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lepig9sX0iMaeuKxaJLhhBtg/75ZzLxsYSPeqzHl//Q=;
        b=ZIUHngmFiR7HtMzf/FfBpEP1zpjHXURjNW1gKI9RIojux6nlHngk3lDibGQtaX3jQq
         R2inNr5HJ+NscpBhuI42AZTW34ub4GwkSRRCYlNGJ/7j71FP4Rxmuop2zM7jUDTBKNQV
         TSRh+G0ueBeFBKOZzRMUHz5oJqZ5wJWQlx/IIH92RnawORPKuIrkA1Qw4DvuGr3rpfC/
         4Ah4wVIspgIxA4qjgCFjdLH8d5x9W7QmeuhoZvLaZvkbhVNVA4qK9q7vdzOd4UlXD3eY
         nuN7RFQbrIkUTBJy7WRVI/hLEGI266g6LbOSRSXKxjNVj6/FcGX8cbOwzHDG87AttALT
         u5Rw==
X-Gm-Message-State: AOJu0YxADPpqt/gbIb+a4SaoytgM9irkp614H0ueruaBmQYhqBU2uJ99
	uQ9youii2GDYB8udK5E24uxYbVDhgmQ=
X-Google-Smtp-Source: AGHT+IF5zPAEXKHleyZmB6qML88UwNzFZsg/96ztg13BrpxCP7mmLhF2gWVQ2If/JPYQnsqV+mEg6A==
X-Received: by 2002:a17:903:1205:b0:1d0:68a:4a12 with SMTP id l5-20020a170903120500b001d0068a4a12mr7091998plh.15.1702318804872;
        Mon, 11 Dec 2023 10:20:04 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id x20-20020a170902821400b001d075e847d5sm6964594pln.44.2023.12.11.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 10:20:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
Date: Mon, 11 Dec 2023 10:19:55 -0800
Message-ID: <20231211182000.218088-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

When we start getting these, we get a *lot*.  So ratelimit it to not
flood dmesg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---

dpu should probably stop rolling it's own trace macros, but that would
be a larger cleanup.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 82538844614b..7c22235d0eba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -39,6 +39,9 @@
 #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
 
+#define DPU_ERROR_ENC_RATELIMITED(e, fmt, ...) DPU_ERROR_RATELIMITED("enc%d " fmt,\
+		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
+
 /*
  * Two to anticipate panels that can do cmd/vid dynamic switching
  * plan is to create all possible physical encoder types, and switch between
@@ -2339,7 +2342,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 		return;
 	}
 
-	DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
+	DPU_ERROR_ENC_RATELIMITED(dpu_enc, "frame done timeout\n");
 
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..f5473d4dea92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -51,6 +51,7 @@
 	} while (0)
 
 #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
+#define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)
 
 /**
  * ktime_compare_safe - compare two ktime structures
-- 
2.43.0


