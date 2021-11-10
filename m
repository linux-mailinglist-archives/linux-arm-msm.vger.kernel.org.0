Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA6444C0BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 13:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhKJMIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 07:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbhKJMIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 07:08:07 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B461C061764;
        Wed, 10 Nov 2021 04:05:20 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id gb13-20020a17090b060d00b001a674e2c4a8so1492613pjb.4;
        Wed, 10 Nov 2021 04:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SmZpl8+j/iKc0sB5URMOhtFVFzKAZretNZR5phX8V54=;
        b=AaiaX03JzpUeQ855h1+dV9l4+ukSmXVfDTYDUIvRLiaosXsME3ilMxt6JVmhe3eg0D
         hEI8vZ/w0nFcav9KXmHFLiYPNUYV9Iq790h1ZUCk3NxUlH46TZhg9ttbXmTf9XQmlYya
         BKo3z3+De7+ajAo6ETVtdZjNKkdFyOauMMbR/stun+H8uoTsNuTF9JdnQG/2XrQ0wblS
         nvpjiL0Pbcbpw5iuPJFkMcBYjSRXGXqj/gV7LZO+Xe31ATHqy8NYxRjGo14yRul/841d
         dPgJWb1g9WtsHZyDJff21j+hMeiOrF77u40X6gZQpYjiZ4BKiva4FqCa4QEwFIfdmzw6
         80jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SmZpl8+j/iKc0sB5URMOhtFVFzKAZretNZR5phX8V54=;
        b=7wSfUem2mrlu9eWcKxRktODMEkxCEQn6rgMQWGUoWfY35j5Ag3Y4mAGzlluRANicBh
         D1z8Dadwar0ZsPNX4LQz6YWBtvRfnbd2cvCLBuERD9KDURQgrL5V/BX3mFv1ad7zhOfb
         H2R3965KyQrGYV2N0+KUS9TRSZzweZiVRntSnXrD9dS4tknCEptngHckz75ROp3oSPU1
         PIYYreYKcGI4mu5jTloKYANNYs2DHn6R7O07CRm5WU378HQGl79bzZhSgojiequB7GF4
         PgkZ6dOvGssmOiwClQ9DjqJdTmon7WcsGfKJj2I2o6CAKBGGYazl0YscrM/mdmxziqdk
         OZRQ==
X-Gm-Message-State: AOAM532MPJmbkCSnmosaH5V3BhgXCrYf/1DRk6AV835HBq9UGfXlEJ7J
        E3NX18zXq+1I+feeU/NH0Sc=
X-Google-Smtp-Source: ABdhPJxp1tSXAzZDWhWtzwlC+WpFHm5YVQ6u/yn2MK4ACIYuoQeY9VzDPTcS+qoyy0lkfOpDtimAVA==
X-Received: by 2002:a17:902:e294:b0:143:86a8:c56d with SMTP id o20-20020a170902e29400b0014386a8c56dmr2079842plc.22.1636545919705;
        Wed, 10 Nov 2021 04:05:19 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id on6sm7070697pjb.47.2021.11.10.04.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 04:05:19 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        swboyd@chromium.org, abhinavk@codeaurora.org,
        deng.changcheng@zte.com.cn, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/msm/dp: remove unneeded variable
Date:   Wed, 10 Nov 2021 12:05:12 +0000
Message-Id: <20211110120512.150940-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck review:
./drivers/gpu/drm/msm/dp/dp_debug.c: Unneeded variable

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..c5c75273d1e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -365,7 +365,6 @@ static const struct file_operations test_active_fops = {
 
 static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
-	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
 
@@ -386,7 +385,7 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 
 	debug->root = minor->debugfs_root;
 
-	return rc;
+	return 0;
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-- 
2.25.1

