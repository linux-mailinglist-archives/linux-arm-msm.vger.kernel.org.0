Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF9DC490C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFQUEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:04:23 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34642 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfFQUEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:04:23 -0400
Received: by mail-qt1-f196.google.com with SMTP id m29so12398232qtu.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MoDrWcvfQIcbjX6EFfofy9wV3QW/5fjWQ7KMcAwGXck=;
        b=MumptO/KQTle/dU4X+lru1AwzqTHc7POxytAWgmfzMtGqNJsIhXYNDV5qaXc6Xn1TX
         1mLrzP1fnFoiY3kSI0+6YLdEnNNK1Org6t3K4fsAMyuWCsgGqoE0HHPhujrlGl7Padl2
         mvvM6Ovf231kvYoTs5CnBnorccuHuVDn5U7McUK8qGTErjFGJcqcIyf6n8kJGMUJ/P6K
         JWBPxicTjDG3AiisHnACEAnnO5XdwNIv4ZSXRJMS02tZMjSTHNygu+vKow6tKv9SwLgn
         aD5BkRWNphH5fsTEfwndhMA7NOQACUXiE8EQ+b7bqZfamXHVsYbzSIUXhZiS0DjG008+
         Iylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MoDrWcvfQIcbjX6EFfofy9wV3QW/5fjWQ7KMcAwGXck=;
        b=Q3XhZ75jMKH6hdJoCmY6+cr7KKw2WCo7gdhXa7bQmHo8EHyukhDMAT58SAHyPnWX3a
         /ufmvsJ9leHaACMXBpMAXUbgU5eiXjXI/iBcHjiyyFgPsY2A4NH2Md5HPTw6BYXTgFdv
         jyJu5azKWrT4CPJmJU2S0VJpbDJaKPW9i/haX7SyIMpatTwgI87yh/bnG8hpjRwORZx0
         zJacJRqpDl/Rmpzp3N/RCKjBy3bDXI602t9XwDAIzmHiq5f9FEtIOebuf01JjFUYnPiv
         lOQdbYq8vbPUD2MXUJ3CPon7n9//4WLiXa11zeQXlp4oBhIie6DGTC7QdMH9H6XIQuuM
         +siw==
X-Gm-Message-State: APjAAAXf1Ablahna3jmcn+wgFyMgpzvD7CmDlF4jITORWfAtTHh1YwLS
        j7hEqYSx2CC5rm3qG1emWZazKQ==
X-Google-Smtp-Source: APXvYqzKCGN0GuBRRJjvS3GtjbuIGUvGbilM0CRluPyrXr7aW8sG4a6kPDpW5N9YYxuzSOeFFQxsxg==
X-Received: by 2002:ac8:1796:: with SMTP id o22mr89481668qtj.98.1560801862295;
        Mon, 17 Jun 2019 13:04:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id j26sm8584794qtj.70.2019.06.17.13.04.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:04:21 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [RESEND PATCH 01/13] drm/msm/dpu: Remove call to drm_mode_set_crtcinfo
Date:   Mon, 17 Jun 2019 16:03:45 -0400
Message-Id: <20190617200405.131843-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Now that mode_fixup has been removed, we can just rely on the call
from drm_helper_probe_single_connector_modes(),

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 82bf16d61a45..94ba4a577ee1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -622,9 +622,6 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	if (!ret)
-		drm_mode_set_crtcinfo(adj_mode, 0);
-
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags,
 			adj_mode->private_flags);
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

