Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4228444B244
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241327AbhKISGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbhKISGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:06:53 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3B9C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 10:04:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id n8so22377010plf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 10:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2yfGn4euuZbvVlMW4CFGpNQ/1833WN9N2PISTc4kVBg=;
        b=LIHXxy79mC9TAiF6m2bslLmAT1WXOOnMxtuyaaB4v4hIREj3Gjm8iyHZ2GYW4OQB1C
         +R/RnLcILoefwifklKEaMRnBWehHyM8Uww90NXHOFmO2JO5csT+JAODBXTTl4kXC38SH
         IUjGPJ/id2WijrVD8IyMQkE/EHee5+3P8l2/GelC8NDxn+CA9sUXMJZ6Jq9/MS5JOEei
         Yr0RBWxVJQy6X+ssmV169UOjco5OhWL2SEkkqJUVL7XSmoQG2BFz/fdMDj/IaVbj21U0
         y+QBern7NlzUcQvZeearvcHB4q2ab5rTtg90mRJf2gUMFMwosHyKBstY7SdtY6g7A8eq
         6dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2yfGn4euuZbvVlMW4CFGpNQ/1833WN9N2PISTc4kVBg=;
        b=XJoN4+ywEob7uIv6VqeeTD/DKiGBMb1yzn6waXzjaSvfid2yo3ViLnBs/TCnemU/8t
         jZ+4tESAv4omhlLEq1WNaVoNQczUSJ7tpS+Ro/eetRqypXELdbNB5D85/xYBXXP0l84o
         aan7S4wAVCmA3TkIUCejw1QPNiX/cDqq1RNP5VrjYlizChEnSLg9HVUdboTmLoFaE1Th
         3B/XgoDHCF8mxgaqD7gng1lVTj4IM4c52rSBZ2DEbyjNIUOnN1uNBN70Iom4envLM44c
         9Y4WGj0z3tit/0G76EW67s2zo0qiqHi0iuiH1kg7r/xZVdGbrx/srlJjqaGXBuyCX0CV
         MaZA==
X-Gm-Message-State: AOAM530g/qBWV7UDLlJD9lXxTCLhWqancpOOiNGWdB9ri2G/CueP3bSF
        vnkW+9c71aH3fmSwCgxXikg=
X-Google-Smtp-Source: ABdhPJwsOjzaxJLDXVf7I6RSxjMKczcTTsPl3AhUfd8uRVeS9D5qLZB5q369CCw/0cJZlaOgka3bPw==
X-Received: by 2002:a17:90b:4a0f:: with SMTP id kk15mr9053184pjb.223.1636481047119;
        Tue, 09 Nov 2021 10:04:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id o1sm6001425pfe.7.2021.11.09.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:04:06 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 1/3] lib/igt_debugfs: Add helper for writing debugfs files
Date:   Tue,  9 Nov 2021 10:09:03 -0800
Message-Id: <20211109180905.590773-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109180905.590773-1-robdclark@gmail.com>
References: <20211109180905.590773-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_debugfs.c | 16 ++++++++++++++++
 lib/igt_debugfs.h | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..39431068 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -351,6 +351,22 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 	close(dir);
 }
 
+/**
+ * __igt_debugfs_write:
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
index d43ba6c6..249eb56a 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
 bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 
@@ -54,6 +55,17 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_read(fd, filename, buf) \
 		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
 
+/**
+ * igt_debugfs_write:
+ * @filename: name of the debugfs file
+ * @buf: buffer to be written to the debugfs file
+ *
+ * This is just a convenience wrapper for __igt_debugfs_read. See its
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

