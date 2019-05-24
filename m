Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A1B29D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 19:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731771AbfEXRcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 13:32:39 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:40075 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfEXRcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 13:32:39 -0400
Received: by mail-yb1-f193.google.com with SMTP id g62so3905475ybg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2019 10:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nxi1zwuqndJEn18AdpEkkdQlNqPXeDyt3jpcO1TOWSU=;
        b=Nw0MCBee/TWTmAxdRVs1IXvAqt1Jv/rkylswgDtTDj9WT/2AwQV8ROQPZCwQUSsPQH
         CU65nugMd4ePhX+UmTx3odq2/HhWQIRrsb4QxiotNxJUz3SdaaGhSTK6WN9ycUPqXkjS
         v+az9kyt50Ha2zamem4lMcJ10IBLtQz3JaTZtTBBDWVXUoaprnws4vWngGzhnu7aROzi
         ew9xCt8+1yQQbkKeBiGlyxlzoq7nQeUYIzOokXTz2PrRcNUR5pB2TkAS1ceWLj8mrECe
         tKOyj/kiYyAgoxQTIPDZNclFfGYzjxziEJtphtj9JZmg1FQroqEIZkGEUCWvj1fHGZsD
         FRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nxi1zwuqndJEn18AdpEkkdQlNqPXeDyt3jpcO1TOWSU=;
        b=nESEOBjnJKCciYf24fkS41J4Ms1tKswQlkN+3XqluYY0lZ+yk9KCEosYQvhFj8avAm
         krVGIk17xCF6/umnnHZIuIQnBrdc6d1bIfocWggGJU0f62vNQGuB9Jj0wPozPeKNX7nD
         vaDMFZwCPt2E6G3GytoiRfl3NJ0EL2iWBYk9pEAMNg+kOEbblvr4OkmMCdOqj9Fyx1ui
         vu1ZeUliSZypZXAhu7RJXeqOvGAFW+FnxrO4ZsG35SW4gtTr3jmy//KLf5hFabfJBygE
         z3XP8zFNLiHaB+8Zw29tCsla3+BzWQzIbqtrV7fdpczfr0RWp+Q/sBDMRxVaaK3+CzoT
         8nYg==
X-Gm-Message-State: APjAAAUnGvKWgPWGfxYDbymQGw3SZyt0baspWlhvMgyFZkgkehlzn8RM
        AcoKDCsgt7lEtY+cmLDgncSWnH6uD1c=
X-Google-Smtp-Source: APXvYqxA8fEtKhzhjbVv+cpIIdWmhzSrXOz4QZdMwEHQFhbwHwzQbYDAGyZce/2VKLRwxnxf+fNpNQ==
X-Received: by 2002:a25:2a86:: with SMTP id q128mr28108060ybq.108.1558719158775;
        Fri, 24 May 2019 10:32:38 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id s17sm774437ywg.70.2019.05.24.10.32.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 10:32:38 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] drm/msm/dpu: Remove _dpu_debugfs_init
Date:   Fri, 24 May 2019 13:32:19 -0400
Message-Id: <20190524173231.5040-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fold it into dpu_debugfs_init.

Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d77071965431..0a8c334c3a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -231,8 +231,9 @@ void *dpu_debugfs_create_regset32(const char *name, umode_t mode,
 			regset, &dpu_fops_regset32);
 }
 
-static int _dpu_debugfs_init(struct dpu_kms *dpu_kms, struct drm_minor *minor)
+static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	void *p = dpu_hw_util_get_log_mask_ptr();
 	struct dentry *entry;
 
@@ -578,13 +579,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return ret;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
-{
-	return _dpu_debugfs_init(to_dpu_kms(kms), minor);
-}
-#endif
-
 static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
 		struct drm_encoder *encoder)
 {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

