Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E03F26E90F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 00:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgIQWo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 18:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgIQWo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 18:44:27 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B49C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id j7so1892506plk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emK8TCQ/AOCbQCaTZuyx4EX1GGlS5xLteCwUhZhZWKs=;
        b=asVwRODTCKzTMhPdETpQLiZroP91Get/mIBjAac5bezdK+pOzFI4MJpd0T9o9DUYWW
         Jrgc59dc5QywWAx0/rRfNXXzIp+8G6594T6t/N1pVZVe2h3Q97pV/5VPO3dLx5rXGWbS
         OUXTBUjCBjdKZPF75UxabZQM0laVCy2zi9SYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emK8TCQ/AOCbQCaTZuyx4EX1GGlS5xLteCwUhZhZWKs=;
        b=t+TEjDiBh0zY7ZU3y0Nrw5fH+Ui6GYS2QiVrVl+JA0K5UM1FPetMcJuHXV1uVH73rm
         7oXuXOoo9AMtvDPwXF2ISYvUdZgVa/DZHKvu2xrkvnxvoT2cZfNNTowENCqpUChllPD8
         QWQaWMHxg+ZWxP4H8IChT0bTPrXbpFlqO2XEpJrmNBOWHqzzqhExGrv5zgZiogL20LS1
         EAlSnAmtAc/lqy3RK6Dq4YdI8/5B7F+bwO/G4qXAeBzyRCKVsBNGW90Gid0PTF9wQ9H4
         XpPdWL3PjXn13UfV6SVqbl1hkZbsTElfr5pwGB6T0uDIi1V/3UUHUpv3iedKmsagfvij
         WlvQ==
X-Gm-Message-State: AOAM533PdtR1mUaguO3CKz7Mb+Q+UQxhHJvInpIn0pyBLymLFj4XjLbr
        5TVLbbdhaPmC9eC/oa8PxQButA==
X-Google-Smtp-Source: ABdhPJywypDGBU0fygZ+vRZ0Ah7m+uJXUNioxfPKAcCRYPGZUExxbYZ5CmLJLP3uPld3wN0+0sGN1Q==
X-Received: by 2002:a17:902:8509:b029:d0:cbe1:e746 with SMTP id bj9-20020a1709028509b02900d0cbe1e746mr29812096plb.33.1600382667062;
        Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l123sm674509pgl.24.2020.09.17.15.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 15:44:26 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] drm/msm/dp: Sleep properly in dp_hpd_handler kthread
Date:   Thu, 17 Sep 2020 15:44:25 -0700
Message-Id: <20200917224425.2331583-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We shouldn't be waiting for an event here with a timeout of 100ms when
we're not in the 'timeout' arm of the if condition. Instead we should be
sleeping in the interruptible state (S) until something happens and we
need to wakeup. Right now this kthread is running almost all the time
because it sleeps for 100ms, wakes up, sees there's nothing to do, and
then starts the process all over again. Looking at top it shows up in
the D state (uninterruptible) because it uses wait_event_timeout(). FIx
this up.

Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Based on msm-next-dp of https://gitlab.freedesktop.org/drm/msm.git

 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05a97e097edf..e175aa3fd3a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -970,9 +970,8 @@ static int hpd_event_thread(void *data)
 				(dp_priv->event_pndx == dp_priv->event_gndx),
 						EVENT_TIMEOUT);
 		} else {
-			wait_event_timeout(dp_priv->event_q,
-				(dp_priv->event_pndx != dp_priv->event_gndx),
-						EVENT_TIMEOUT);
+			wait_event_interruptible(dp_priv->event_q,
+				(dp_priv->event_pndx != dp_priv->event_gndx));
 		}
 		spin_lock_irqsave(&dp_priv->event_lock, flag);
 		todo = &dp_priv->event_list[dp_priv->event_gndx];

base-commit: 937f941ca06f2f3ab64baebf31be2c16d57ae7b8
-- 
Sent by a computer, using git, on the internet

