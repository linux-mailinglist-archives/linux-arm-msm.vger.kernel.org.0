Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258C94528BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhKPDxg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhKPDxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:53:33 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B12C06BAB0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:33 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso703354pji.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0cWfKAdFJ4mdWHeu2WC++67okKwtJARd96rOv9nvD7w=;
        b=E701PV7xGxk61nRt5kwxw3AsTdUhK9SxGWkr7TyIlnEgODBOHJiuPZp1Bz38b//frS
         1axNFGEXXdgfr7Ou8SCzqENXtFjqTzc+WFNmQMMXX1/ZpOX7HXQUVXAVoA5y81csOG54
         2vkeKBMjTFxWNZjXuyF3awX77wAt5NbGdCXfFJakKqI7RxYB3bf0JctcXCslpyiEEyzk
         9ZoWTeotZyL7aUnbx4BmCjDaaJxNQlsKE/1GdjQMacd5floZCntHvaeBNzIWtWr523sD
         qk52krRWsbCeXtbmkrhVi1vo+nRBPwnJg74WTVE95VFJgTtF1+OlMpCfCZum/WMXFqGU
         64VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0cWfKAdFJ4mdWHeu2WC++67okKwtJARd96rOv9nvD7w=;
        b=4U/nF0f7AzVRvelTrmawB3U12HyRoEDxQWNPfVkkCGJFDNMXcoe/nPQpCuCLJpfIqm
         5WdFwuiSyRktlh3dZDgF/SOGtEceW72/0VElVM5gwQ30/GHHYYDyUEibl4e0SpEanrZB
         6pxxz9dq5fMncJQrO45O+td94Cd/gyc2cH1t+4tIAewqXdcIigXC2QYjde+oIWfDQ0h4
         ymmdvTR2+ofo0nxV/jWXPvMkiL4YmCQdgOw5xruLpQ6diAgJUJFyfJKSkT4+zORhzeQ3
         a7SaJ6YsCTScrguLdWy97Z8lD5oBoAWIH50INxc0rwvi1W6MDzDvzjuDlepxtjlAjAt3
         HzYw==
X-Gm-Message-State: AOAM5328ORofpL9k1EUxkf++0YtxQVIaxxLlc1GmHW4OWU1JXVR0NzLm
        rGyI5lubB9qcuG0E/5PDCCy6JvBQrOU=
X-Google-Smtp-Source: ABdhPJwgoaSEHpETkim2RcaPsr9RBZ98eZRJNpnskLL/lGTxEQXcRKgLPFjQRxJGqZ8KH9nrt1Q9HQ==
X-Received: by 2002:a17:90a:ca81:: with SMTP id y1mr68773894pjt.231.1637022333273;
        Mon, 15 Nov 2021 16:25:33 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j9sm11888906pgt.54.2021.11.15.16.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 16:25:32 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 1/4] lib/igt_debugfs: Add helper for writing debugfs files
Date:   Mon, 15 Nov 2021 16:30:39 -0800
Message-Id: <20211116003042.439107-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
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
2.33.1

