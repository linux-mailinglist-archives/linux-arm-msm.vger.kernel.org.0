Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445DB307CFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 18:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhA1Rt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 12:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhA1RKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 12:10:12 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A8EC0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:09:31 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b8so3670578plh.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Caeg7nYwaddfpIiPW5mxXkI5Uu5RyM5KiedwozcikZE=;
        b=kGtze5/3GwcFT/3AZJdHcIB/QLvFpXnGQDkmArbs1mPGaWFZbQVBP94u4R1R2EOsMP
         TUdOJgh9WWTeeo+RaM/ooYtexVP4OhHdYheiJxnY3IK3NLZODE3Kgl+/eFaGEqgA9FLH
         VqPClTFEwbTiPnCWg3pSt1Y4wX/fU/ApCQ/DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Caeg7nYwaddfpIiPW5mxXkI5Uu5RyM5KiedwozcikZE=;
        b=U9+cCvp6t10yCC4OO16jlTvBNxtX2iecXgdb0/A9qFeGXvrfXgYKpUVXTie66E2PL6
         Uf8I8qyLkvSk70nThcVLrgSUu0jhDZ6IC1nYyJlM/5bpHzX4GBRj1W6RPlnn0zSM3xzD
         vk7r7zWr0ss6E9JMSOi2HXoDtahsy1W2sZBP28vps1lCntIz2VUWVAnYvGR2IhMMdvcE
         KE700F6dQEVIxoHpPTTv1yo3Zq7VyhEQWUaq1fR+IYKRQusmv51u0RHfZV1tD3oZqjJ4
         UDPBtgrB4/Zq2/eCV/N95Q0g2QXgXBvEfx/WyGo1ObvJgKmGG8nqBR9Nxi8D7+KlYxsw
         XWQQ==
X-Gm-Message-State: AOAM5336/RL2O50iLntSKvzYeqLzvXTKnJkNP4Cy1fa/eyjBy6XeMGnz
        hxv109Om+MxscK0+lt8n2xKs7g==
X-Google-Smtp-Source: ABdhPJx8LgNkd+vhvNVmZP/hGk1wrPuOEDEr0UPTwSrG07Y/l+KC0OifbYbxPLWeRwD4h8M6vZSoYA==
X-Received: by 2002:a17:902:a412:b029:db:cf5a:8427 with SMTP id p18-20020a170902a412b02900dbcf5a8427mr503854plq.48.1611853771413;
        Thu, 28 Jan 2021 09:09:31 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:304c:5453:303a:8268])
        by smtp.gmail.com with ESMTPSA id g22sm6206654pfu.200.2021.01.28.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:09:30 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Krishna Manikandan <mkrishn@codeaurora.org>
Subject: [PATCHv2] drm/msm/kms: Make a lock_class_key for each crtc mutex
Date:   Thu, 28 Jan 2021 09:09:29 -0800
Message-Id: <20210128170929.3339941-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lockdep complains about an AA deadlock when rebooting the device.

============================================
WARNING: possible recursive locking detected
5.4.91 #1 Not tainted
--------------------------------------------
reboot/5213 is trying to acquire lock:
ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4

but task is already holding lock:
ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4

other info that might help us debug this:
Possible unsafe locking scenario:

CPU0
----
lock(&kms->commit_lock[i]);
lock(&kms->commit_lock[i]);

*** DEADLOCK ***

May be due to missing lock nesting notation

6 locks held by reboot/5213:
__arm64_sys_reboot+0x148/0x2a0
device_shutdown+0x10c/0x2c4
drm_atomic_helper_shutdown+0x48/0xfc
modeset_lock+0x120/0x24c
lock_crtcs+0x60/0xa4

stack backtrace:
CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
Hardware name: Google Pompom (rev1) with LTE (DT)
Call trace:
dump_backtrace+0x0/0x1dc
show_stack+0x24/0x30
dump_stack+0xfc/0x1a8
__lock_acquire+0xcd0/0x22b8
lock_acquire+0x1ec/0x240
__mutex_lock_common+0xe0/0xc84
mutex_lock_nested+0x48/0x58
lock_crtcs+0x60/0xa4
msm_atomic_commit_tail+0x348/0x570
commit_tail+0xdc/0x178
drm_atomic_helper_commit+0x160/0x168
drm_atomic_commit+0x68/0x80

This is because lockdep thinks all the locks taken in lock_crtcs() are
the same lock, when they actually aren't. That's because we call
mutex_init() in msm_kms_init() and that assigns one static key for every
lock initialized in this loop. Let's allocate a dynamic number of
lock_class_keys and assign them to each lock so that lockdep can figure
out an AA deadlock isn't possible here.

Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:
 * Fixed typo in commit text

 drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index d8151a89e163..4735251a394d 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -157,6 +157,7 @@ struct msm_kms {
 	 * from the crtc's pending_timer close to end of the frame:
 	 */
 	struct mutex commit_lock[MAX_CRTCS];
+	struct lock_class_key commit_lock_keys[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 };
@@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
 {
 	unsigned i, ret;
 
-	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
-		mutex_init(&kms->commit_lock[i]);
+	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
+		lockdep_register_key(&kms->commit_lock_keys[i]);
+		__mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
+			     &kms->commit_lock_keys[i]);
+	}
 
 	kms->funcs = funcs;
 

base-commit: 19c329f6808995b142b3966301f217c831e7cf31
-- 
https://chromeos.dev

