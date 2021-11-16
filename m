Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355274528BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhKPDxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbhKPDxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:53:33 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA03C06BAB1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:35 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id g28so16004767pgg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+sRJ9ALAP5C7pUpxb3+UCtAmTWjxkCbV1oAe8YjCiHk=;
        b=KuRvWGGSuFtB49APCMTskj07KMN+iFLL7rThF/hdavdRcik3SLBVN++i37+ngwkWm5
         vxzbRMMTnG6pCoii8B7wcOKn5sTkIbX8/zxDJcrGn4Ravy/XHlo9hwowoQn2IF8W2YnR
         sAI7Hy24KR5o9bQ6C+Fl8lgsZEFNB9x3bsO1W6LL54sFBPx6XJeTTcliETFtkmUzkWnz
         6C3ZJatCBPpmwFKJ1uNsuLYpDSMhvGwRSf3S2ZQfb0O7mzx00UXKEN39k/Rh8Hta0MAR
         mUqdRZ3+tl/fje0OAtL3u2Hz+a53QLY2lpoI9UxvHdxV3p2dx6xaQdg1CCYjqMlGLElp
         HDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+sRJ9ALAP5C7pUpxb3+UCtAmTWjxkCbV1oAe8YjCiHk=;
        b=YAU0GOYk61Gbsyt113waG4AvSHb9fOuFZ4e5atUd4yKWS+ikwjL4m+KoR1D1axCOvA
         5ZCM9Qz3Z/DfhMyxrbZUi37feCZyyTgdBQ0px9Ufgu/2Eh0hQo0RzhLfBwghIKNI4AdB
         z76Nz0L7lGCzsjDJSSceoQVHrrGsvfTZyAXHBheX1cccKCFQx5T4Njjxu89HGEgip3XD
         7BhguY+WiRsp4gXhYe8Mw47q73YGdvWX4XjfGU7VcbUW6PP+jy1ILPvBMVFpzsO0VVvf
         rhwQFzSVBCYRCKErKV35ZI7MVnh6QSOX9qA2VjelUaX4FPAXlil/vmmTqFy2jO/zqcjB
         IPtA==
X-Gm-Message-State: AOAM5330xcuCV8aBF53c8spkhp8joqfbW90b+EL9ZWCb+SKKnoWyZ2HA
        pGUKsD7n9n2BDiKIkBQ54FWVo8VRmGc=
X-Google-Smtp-Source: ABdhPJzjrMsB4rqoNX3znJ0C+OggqLIr5W+kZjxqZHQyj5OmsB96Ru96QVTuCLcxCtg4MorX9L8S0A==
X-Received: by 2002:a63:f702:: with SMTP id x2mr2114368pgh.162.1637022335321;
        Mon, 15 Nov 2021 16:25:35 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id ot18sm439677pjb.14.2021.11.15.16.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 16:25:34 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 2/4] lib/igt_debugfs: Add helper for detecting debugfs files
Date:   Mon, 15 Nov 2021 16:30:40 -0800
Message-Id: <20211116003042.439107-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add a helper that can be used with, for ex, igt_require() so that tests
can be skipped if the kernel is too old.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_debugfs.c | 21 +++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index dd6f2995..7211c410 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -307,6 +307,27 @@ int igt_debugfs_open(int device, const char *filename, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_exists:
+ * @device: the drm device file fd
+ * @filename: file name
+ * @mode: mode bits as used by open()
+ *
+ * Test that the specified debugfs file exists and can be opened with the
+ * requested mode.
+ */
+bool igt_debugfs_exists(int device, const char *filename, int mode)
+{
+	int fd = igt_debugfs_open(device, filename, mode);
+
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * igt_debugfs_simple_read:
  * @filename: file name
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index b4867681..37e85067 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -39,6 +39,7 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
 int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
+bool igt_debugfs_exists(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
 void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
-- 
2.33.1

