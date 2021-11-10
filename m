Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAFC44C6D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 19:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhKJSkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 13:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhKJSj7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 13:39:59 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FEEC061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 10:37:12 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id b4so3007655pgh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EFuTiwIBCHztm/ICNdYp/ffmw2x1iWY8Pj/q3ZqCBZM=;
        b=FGivo6Tqnq19OTCi6J7PEI12kqSlo8QrIRemI1gMcghWbwze0iw0ItylGkl+Uh1skJ
         I6LsWhgj+Wy/kHRi7enl6TZBqBdrK2wJfS4Qf/4Lp5+JsEOaktLaHQZ1pRwid8xal1hL
         Sx8yAX5TsH4M2U+6uVdSe1K2Bozbca4z4eZcjwI4UKCAH3i4XLX1rpmZVT6k7w/ep0yn
         crZ6dgYKPXMy7VXFCmUrFOctM+5CN5gF7K2gXx1hioGlXMOGD0sjq0KKNSdx4RWm2DNi
         IzP6G9Zyw93fwOJrlhDLCs6j4HAy/U45hdsBCEBkZYS/4sEXiK/Q/4ajVYEKhli4RUGy
         8Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EFuTiwIBCHztm/ICNdYp/ffmw2x1iWY8Pj/q3ZqCBZM=;
        b=QWqkXvTMjRDfU5XizZD/xy0WmrkK/gAh3IQQZlPJUlh/lQek1KXy1CJPvdirg+Vauz
         WWqkJcPnfHaSlEkjyvoPDvqemiutlYyqvzwIQiVvOSJOIzkTQX+VAL9X9kMxscNyr/J8
         u8zP9ugZXx5s1HA1smXJAcWbX5RO0ygnGGby3ujaojL5gnx+R1kqQb4wEBgpVOTuLK80
         PCntvLv3eDVpxW865+1lU0qfYtohAd4N9SfkJkZ11QP/fkYiIi0t/pUwUNqfpyH1WxzW
         whlV3yOhRXV3YOHBhVoXjYcaP57ukFICfOrdnzbFKOpZDP1Bs7ppwbiAzym0TJ2nZVh4
         oxgg==
X-Gm-Message-State: AOAM531KXAx+rAWg+F+jH6UJlmW47hJURPwC5pmrso+NseUJpu/rG7x9
        XeESKOlwszRUCoHdjp8L770=
X-Google-Smtp-Source: ABdhPJzYWocd3h/ASelR6znM6p6uLLKKnS/YQA9kicOTKGCUNrQZlpHGfKO4cIpEVS9jULpqsyNLVw==
X-Received: by 2002:a63:8a43:: with SMTP id y64mr594361pgd.113.1636569431546;
        Wed, 10 Nov 2021 10:37:11 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q9sm374389pfj.88.2021.11.10.10.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 10:37:10 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v2 1/3] lib/igt_debugfs: Add helper for writing debugfs files
Date:   Wed, 10 Nov 2021 10:42:11 -0800
Message-Id: <20211110184213.649787-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110184213.649787-1-robdclark@gmail.com>
References: <20211110184213.649787-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Fix headerdoc comments

 lib/igt_debugfs.c | 17 +++++++++++++++++
 lib/igt_debugfs.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..dd6f2995 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -351,6 +351,23 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 	close(dir);
 }
 
+/**
+ * __igt_debugfs_write:
+ * @fd: the drm device file fd
+ * @filename: file name
+ * @buf: buffer to be written to the debugfs file
+ * @size: size of the buffer
+ *
+ * This function opens the debugfs file, writes it, then closes the file.
+ */
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size)
+{
+	int dir = igt_debugfs_dir(fd);
+
+	igt_sysfs_write(dir, filename, buf, size);
+	close(dir);
+}
+
 /**
  * igt_debugfs_search:
  * @filename: file name
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6..b4867681 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
 bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 
@@ -54,6 +55,18 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_read(fd, filename, buf) \
 		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
 
+/**
+ * igt_debugfs_write:
+ * @fd: the drm device file fd
+ * @filename: name of the debugfs file
+ * @buf: buffer to be written to the debugfs file
+ *
+ * This is just a convenience wrapper for __igt_debugfs_write. See its
+ * documentation.
+ */
+#define igt_debugfs_write(fd, filename, buf) \
+		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
+
 /*
  * Pipe CRC
  */
-- 
2.31.1

