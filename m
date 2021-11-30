Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E630B462934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 01:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234140AbhK3Al2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 19:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhK3Al2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 19:41:28 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F1FC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 16:38:10 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id x5so18788178pfr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 16:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ex6ryLecuMDauByS2PdeOAXHhvBq1BOC5LZy2MNA2Ic=;
        b=XPWMIbM3cOCTJ9sTEyL1OokAi2Zweg4jC7iaxnJW92rjwu5rP9A1a3TN8Nb3GPgW/I
         0nufm21K1VMnxkPZNnMdBopNHamNeEKbh42PlHl/pjFWMke8RmDfr/beHr/O4Ea9YiLI
         qZOg3bVNrSeBeqZrqHZM3I9BVDNO4nAhu7hxoQ1eMfaMcaYd2SKu846D0uMtzdu2CnBX
         aY3XGN/8j/gYcelDl/+7vCv8hlUczXI9Z/WYFvlj7f3GaNMzWMiAnRiXoJH+5nlVkUep
         o4oNZTF9/+7LA5jk9TKTaX94FROdPi/tKZbx22FH4qMax9PN7pJc+CEdiOCUy0ZASpL9
         PSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ex6ryLecuMDauByS2PdeOAXHhvBq1BOC5LZy2MNA2Ic=;
        b=FGpfYX82B0iK4tDCkBtJQK4i9ji6BijLtgIMvHGgQIVpfk8LkYFqwk2c+OCBMmhjU8
         hlt4dCLd95hufJPEUvPTfUW3q6TG3rnFDnh0GR8ObPJfZQYL0aKYl7SADIfIs2ku3aXh
         X7K3AVKRe2Yhyo9zsjtYPRjKDMP+RaQM52a8zyWQpOJqhaYTt8vZ4M/NT3Tbuuu/w0FC
         oFlFfRIftwyTc+CaoxqsekqQ0PTxdbVoatjIcL8I1V/wNrBd/TPOtYO/jrKg0m1ZQYRi
         HSwe6N03uFxqZhV4LwG4dDVvHUPbBff9yrlXHiDrZdN0g1pAtNcH06+80esjbOJN0i8S
         Gdsw==
X-Gm-Message-State: AOAM533NheOx27fKu09SxXfZZVcdQeDiUGoZv9vOJCCdWd4sYUtVlN4m
        xyqJfi/EqeLwff4JspVGGfw=
X-Google-Smtp-Source: ABdhPJz0tiefMms9tdhNkJTLfBlJ4ZEUw4ve61k38995XSR4/gvHW8CbeWsYg/UsiNeCPJrVtycMAw==
X-Received: by 2002:a05:6a00:2af:b0:4a2:a6f0:8eec with SMTP id q15-20020a056a0002af00b004a2a6f08eecmr41902452pfs.23.1638232689507;
        Mon, 29 Nov 2021 16:38:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m15sm19244575pfk.186.2021.11.29.16.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 16:38:08 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 2/2] msm: Add test for kernel buffer permissions
Date:   Mon, 29 Nov 2021 16:43:24 -0800
Message-Id: <20211130004324.337399-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130004324.337399-1-robdclark@gmail.com>
References: <20211130004324.337399-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Tests that reads and/or writes to kernel managed buffers which should be
inaccessible to userspace controlled cmdstream, are indeed inaccessible.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.h       |   1 +
 tests/meson.build   |   1 +
 tests/msm_mapping.c | 257 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)
 create mode 100644 tests/msm_mapping.c

diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 421d23ed..6008020b 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -100,6 +100,7 @@ enum adreno_pm4_type3_packets {
 	CP_WAIT_MEM_GTE = 20,
 	CP_WAIT_REG_MEM = 60,
 	CP_MEM_WRITE = 61,
+	CP_MEM_TO_MEM = 115,
 };
 
 static inline unsigned
diff --git a/tests/meson.build b/tests/meson.build
index 7b7d6bf8..c14acf99 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -60,6 +60,7 @@ test_progs = [
 	'kms_vrr',
 	'kms_writeback',
 	'meta_test',
+	'msm_mapping',
 	'msm_recovery',
 	'msm_submit',
 	'panfrost_get_param',
diff --git a/tests/msm_mapping.c b/tests/msm_mapping.c
new file mode 100644
index 00000000..e1474f9f
--- /dev/null
+++ b/tests/msm_mapping.c
@@ -0,0 +1,257 @@
+/*
+ * Copyright © 2021 Google, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <ctype.h>
+#include <fcntl.h>
+#include <glob.h>
+#include <string.h>
+#include <sys/poll.h>
+#include <sys/stat.h>
+
+#include "igt.h"
+#include "igt_msm.h"
+#include "igt_io.h"
+
+/*
+ * Tests to ensure various kernel controlled buffers are mapped with the
+ * appropriate permissions (either read-only or not-accessible to userspace
+ * controlled cmdstream)
+ */
+
+/*
+ * Helper to get and clear devcore dumps
+ */
+
+static char *
+get_and_clear_devcore(void)
+{
+	glob_t glob_buf = {0};
+	char *buf = NULL;
+	int ret, fd;
+
+	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
+	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+		return NULL;
+
+	fd = open(glob_buf.gl_pathv[0], O_RDWR);
+
+	if (fd >= 0) {
+		/* We don't need to read the entire devcore, the first bit is
+		 * sufficient for our purposes:
+		 */
+		buf = calloc(1, 0x1000);
+		igt_readn(fd, buf, 0x1000);
+
+		/* Clear the devcore: */
+		igt_writen(fd, "1", 1);
+	}
+
+	globfree(&glob_buf);
+
+	return buf;
+}
+
+/*
+ * Helper to find named buffer address
+ */
+
+static const char *
+get_line(char **buf)
+{
+	char *ret, *eol;
+
+	ret = *buf;
+	eol = strstr(*buf, "\n");
+
+	if (!eol) {
+		/* could be last line in file: */
+		*buf = NULL;
+		return ret;
+	}
+
+	*eol = '\0';
+	*buf += 1 + strlen(ret);
+
+	return ret;
+}
+
+static bool
+endswith(const char *str, const char *end)
+{
+	char *p = strstr(str, end);
+
+	/* Trim trailing whitespace: */
+	if (p) {
+		char *c = p;
+		while (c) {
+			if (isspace(*c)) {
+				*c = '\0';
+				break;
+			}
+			c++;
+		}
+	}
+
+	return p && (strlen(p) == strlen(end));
+}
+
+static uint64_t
+get_bo_addr(int drm_fd, const char *name)
+{
+	char buf[0x4000];
+	char *p = buf;
+
+	igt_debugfs_read(drm_fd, "gem", buf);
+
+	/* NOTE: the contents of the debugfs file look like:
+	 *
+	 *    flags       id ref  offset   kaddr            size     madv      name
+	 *    00040000: I  0 ( 1) 00000000 ffffffc0104b9000 00004096           memptrs
+	 *       vmas: [gpu: aspace=ffffff808bf03e00, 1000000000000,mapped,inuse=1]
+	 *    00020002: I  0 ( 1) 00000000 ffffffc012001000 00032768           ring0
+	 *       vmas: [gpu: aspace=ffffff808bf03e00, 1000000001000,mapped,inuse=1]
+	 *
+	 * There can be potentially multiple vma's per bo, listed on the lines
+	 * following the line for the buffer (which ends in the buffer name),
+	 * but this should not be the case for any kernel controlled buffers.
+	 */
+
+	while (*p) {
+		const char *line = get_line(&p);
+
+		if (endswith(line, name)) {
+			uint64_t addr, dummy;
+			int ret;
+
+			line = get_line(&p);
+
+			igt_fail_on(!line);
+
+			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
+					&dummy, &addr);
+			igt_fail_on(ret != 2);
+
+			return addr;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Helper for testing access to the named buffer
+ */
+static void
+do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
+{
+	struct msm_bo *scratch_bo = NULL;
+	struct msm_cmd *cmd;
+	char *devcore, *s;
+	uint64_t addr, fault_addr;
+	int fence_fd, ret;
+
+	/* Clear any existing devcore's: */
+	while ((devcore = get_and_clear_devcore())) {
+		free(devcore);
+	}
+
+	addr = get_bo_addr(pipe->dev->fd, buffername);
+	igt_skip_on(addr == 0);
+
+	cmd = igt_msm_cmd_new(pipe, 0x1000);
+
+	if (write) {
+		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+		msm_cmd_emit(cmd, lower_32_bits(addr));  /* ADDR_LO */
+		msm_cmd_emit(cmd, upper_32_bits(addr));  /* ADDR_HI */
+		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	} else {
+		scratch_bo = igt_msm_bo_new(pipe->dev, 0x1000, MSM_BO_WC);
+		msm_cmd_pkt7(cmd, CP_MEM_TO_MEM, 5);
+		msm_cmd_emit(cmd, 0);
+		msm_cmd_bo  (cmd, scratch_bo, 0);        /* DEST_ADDR_LO/HI */
+		msm_cmd_emit(cmd, lower_32_bits(addr));  /* SRC_A_ADDR_LO */
+		msm_cmd_emit(cmd, upper_32_bits(addr));  /* SRC_A_ADDR_HI */
+	}
+
+	fence_fd = igt_msm_cmd_submit(cmd);
+
+	/* Wait for submit to complete: */
+	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
+	close(fence_fd);
+
+	igt_msm_bo_free(scratch_bo);
+
+	/* And now we should have gotten a devcore from the iova fault
+	 * triggered by the read or write:
+	 */
+	devcore = get_and_clear_devcore();
+	igt_fail_on(!devcore);
+
+	/* Make sure the devcore is from iova fault: */
+	igt_fail_on(!strstr(devcore, "fault-info"));
+
+	s = strstr(devcore, "  - far: ");
+	igt_fail_on(!s);
+
+	ret = sscanf(s, "  - far: %"PRIx64, &fault_addr);
+	igt_fail_on(ret != 1);
+	igt_fail_on(addr != fault_addr);
+}
+
+/*
+ * Tests for drm/msm hangcheck, recovery, and fault handling
+ */
+
+igt_main
+{
+	struct msm_device *dev = NULL;
+	struct msm_pipe *pipe = NULL;
+
+	igt_fixture {
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
+	}
+
+	igt_describe("Test ringbuffer mapping, should be read-only");
+	igt_subtest("ring") {
+		do_mapping_test(pipe, "ring0", true);
+	}
+
+	igt_describe("Test sqefw mapping, should be read-only");
+	igt_subtest("sqefw") {
+		igt_require(dev->gen >= 6);
+		do_mapping_test(pipe, "sqefw", true);
+	}
+
+	igt_describe("Test shadow mapping, should be inaccessible");
+	igt_subtest("shadow") {
+		do_mapping_test(pipe, "shadow", true);
+		do_mapping_test(pipe, "shadow", false);
+	}
+
+	igt_fixture {
+		igt_msm_pipe_close(pipe);
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.33.1

