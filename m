Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11CB129CFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 19:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbfEXRcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 13:32:35 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:36853 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfEXRcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 13:32:35 -0400
Received: by mail-yb1-f195.google.com with SMTP id y2so1124443ybo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2019 10:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rz26KSKqatgFQwQEso0yLpeStqm8dFhYBz7Ve/DZ0/o=;
        b=KdJ3DcoDcjyiPNJv6g/csr1ng1mJ8ryqzVACkIgEeWcFAZu11Imsi0+q5nj9Jfg3N0
         L+Ki9KHNKTI3ZIfkOWPzteqyqR+vtP9pLAHQ7wabfoZ8SBAXYVjYDY/vDlWgqonhEYUg
         XPLp79rjWFNaZQTsL/8tJPEQr1Ps1+YGiu2jpHgdol7z/RKPvpexMtEobrGlCUDLzst+
         Kx7hS8+zLA4clylEUtMoMejh3TNZYflL4+EnV+B++QdSCcI5GW7fPDyInIiWwKGECVNl
         8ODdJRYouaFIh69pTSCkF6i5JF5QFyEWH4utfOsz82C429dt5w1Thd7vA1YdZZdISmjg
         SONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rz26KSKqatgFQwQEso0yLpeStqm8dFhYBz7Ve/DZ0/o=;
        b=ecOHnsgi+yrCmCl+bYnqEqw+/jffMOU4PFnNhLEDt0gv6naXsr5yuKiTAPg3xx+cM/
         2nQskM1p3OpHX8alx2LNthUKu4/rmPIyisBWmUOqcQHyugFzZilaQRTX9kKN41Ih2rzY
         LnH1ZohEoDmHyWA0gciUgFoi8OCMfvkVgk7fUupTkGhyHfNYp8AWF6t0aABSDSNCN25r
         Q7W87Y6bQGfM+yMiTYF4i81ZAcfFdF0UUzPOr1stcUe5f6in+jAXOayfIz/dCM0osvJI
         YUSsC0dSCWf/2VH32RXK2AL0rnC0blAZOsxN50F20CRmz6Y2ITet2Mrwgz46hELMp4vz
         7h7A==
X-Gm-Message-State: APjAAAXK5ksXiVw7au4jd0+SOEGcWWLGWoEgatHlSwfUEdJU5XlH99Mi
        ZtjNzexDNeNKPLFpOxYl+oOX+iTK1Qk=
X-Google-Smtp-Source: APXvYqyAfITfeQW2P8raMp1Vi5Tp3aAtUGPeTrwt5ETgg6rjflQFAIsoMyZ6kRYVZUXtoycQ38M6AQ==
X-Received: by 2002:a25:2183:: with SMTP id h125mr9593613ybh.414.1558719154005;
        Fri, 24 May 2019 10:32:34 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id s17sm774437ywg.70.2019.05.24.10.32.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 10:32:33 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize debugfs
Date:   Fri, 24 May 2019 13:32:18 -0400
Message-Id: <20190524173231.5040-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Instead of reaching into dev->primary for debugfs_root, use the minor
passed into debugfs_init.

This avoids creating the debug directory under /sys/kernel/debug/ and
instead creates the directory under the correct node in
/sys/kernel/debug/dri/<node>/

Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 885bf88afa3e..d77071965431 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -231,7 +231,7 @@ void *dpu_debugfs_create_regset32(const char *name, umode_t mode,
 			regset, &dpu_fops_regset32);
 }
 
-static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
+static int _dpu_debugfs_init(struct dpu_kms *dpu_kms, struct drm_minor *minor)
 {
 	void *p = dpu_hw_util_get_log_mask_ptr();
 	struct dentry *entry;
@@ -239,7 +239,7 @@ static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
 	if (!p)
 		return -EINVAL;
 
-	entry = debugfs_create_dir("debug", dpu_kms->dev->primary->debugfs_root);
+	entry = debugfs_create_dir("debug", minor->debugfs_root);
 	if (IS_ERR_OR_NULL(entry))
 		return -ENODEV;
 
@@ -581,7 +581,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 #ifdef CONFIG_DEBUG_FS
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
-	return _dpu_debugfs_init(to_dpu_kms(kms));
+	return _dpu_debugfs_init(to_dpu_kms(kms), minor);
 }
 #endif
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

