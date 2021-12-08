Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BF746DBEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 20:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhLHTUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 14:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbhLHTUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 14:20:37 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA30C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 11:17:05 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id np3so2617501pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 11:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+RG9S6/ICn1PCmGw7RnPNcWmtBZVO4WkOPxURMyVV7M=;
        b=iLL0HFpq7MddvcvlwiqEcSxkJMW2TrpYtbOSZCri8LWNVWRmGqZYtM1mRvN8xJ0XBa
         vAENRUb07ROQ9RuoKX4dPj3foZN0Hb1RU60kaH3oYUOtm8HuH0NAbWaMKd59+EZJNxwX
         7EwUqL0F8RJcarTyZG3nmIna3boZvZFC8uWCgYQVYlYB5wgWl3s1C8WYci/hYHLUizia
         0sQiHjo5XENQ18bfzwWpdnDnk5CpBrEkRpqvWxpTEcWUh7EjqFzVcZuVTpG9YfOVSUP3
         ci6WjOqrTIhP7B7zDPBzsZ4fxUQASndvkXMbyCcMOa2O9FjQzvEueUT7q7G7hpgWgaph
         8JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+RG9S6/ICn1PCmGw7RnPNcWmtBZVO4WkOPxURMyVV7M=;
        b=b6OT5c+w3qfbRoUbaC+12IsNQ95vS/VMVceEAaj6rbaLqzphyEKIJPF/DDZWOmneby
         Ks70USQVJRkhT/3WswiSl/NZRWNfpe08iHlvenOyCT7w5R2IDf1FWRAB+x0uq9dpKpB2
         VUpYEyX7VRuTusQ64tkxiQQgafy+0Mukmm2mnyJ/R/im482jRM6M4r1kPZcvMVtoLqiD
         gMd9MbbaIm5jKnQ45KwbqbyY7JfqJYDH+NN/SjwKIXPi7QpcdZplrSyjQWmIgHW1+Y6C
         M5HWL8fAlnUV54i/hoV9CztPosb3WR2mKfnuO/arxQqmTeS46io0f63T9uSYBCiq26uV
         O/hA==
X-Gm-Message-State: AOAM5310OHJF8LEmOIwnlkbct67dg2Pkg8SbUSsj8BMyip/VFv8ztB6r
        mSLqEtSCKrY+9oJS/hsLo9BoKuVNHxo=
X-Google-Smtp-Source: ABdhPJwxUavzGzPMT2+KJKfaRUkC+T6cZwrMjMcJ2m41RA6bPNXghVBGgJBegBhMrwB4jTeV0GsEXQ==
X-Received: by 2002:a17:902:a605:b0:143:d289:f3fb with SMTP id u5-20020a170902a60500b00143d289f3fbmr61795883plq.41.1638991024770;
        Wed, 08 Dec 2021 11:17:04 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id a12sm3201785pgg.28.2021.12.08.11.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:17:03 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 2/2] tools/msm_dp_compliance: Add arg to specify connector name
Date:   Wed,  8 Dec 2021 11:22:16 -0800
Message-Id: <20211208192216.743364-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208192216.743364-1-robdclark@gmail.com>
References: <20211208192216.743364-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

To support multiple DP connectors, the debugfs files will be moving into
a per-connector subdirectory in debugfs.  So add an arg to specify the
appropriate connector name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tools/msm_dp_compliance.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index a15a8dd9..bc79a061 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -205,10 +205,15 @@ static FILE *fopenat(int dir, const char *name, const char *mode)
 	return fdopen(fd, mode);
 }
 
-static void setup_debugfs_files(void)
+static void setup_debugfs_files(const char *connector_name)
 {
 	int dir = igt_debugfs_dir(drm_fd);
 
+	if (connector_name) {
+		dir = openat(dir, connector_name, O_RDONLY);
+		igt_require(dir >= 0);
+	}
+
 	test_type_fp = fopenat(dir, MSM_DP_TEST_TYPE_FILE, "r");
 	igt_require(test_type_fp);
 
@@ -624,11 +629,12 @@ int update_display(int mode, bool is_compliance_test)
 	return ret;
 }
 
-static const char optstr[] = "hi";
+static const char optstr[] = "c:hi";
 
 static void __attribute__((noreturn)) usage(char *name, char opt)
 {
-	igt_info("usage: %s [-hi]\n", name);
+	igt_info("usage: %s [-hi] [-c NAME]\n", name);
+	igt_info("\t-c, --connector=NAME - specify connector name");
 	igt_info("\t-h, --help           - print this usage message");
 	igt_info("\t--help-description   - print test description");
 	igt_info("\t-i, --info           - dump info\n");
@@ -708,7 +714,9 @@ int main(int argc, char **argv)
 	GIOChannel *stdinchannel, *testactive_channel;
 	GMainLoop *mainloop;
 	bool opt_dump_info = false;
+	char *opt_connector_name = NULL;
 	struct option long_opts[] = {
+		{"connector", 1, 0, 'c'},
 		{"help-description", 0, 0, HELP_DESCRIPTION},
 		{"help", 0, 0, 'h'},
 		{"info", 0, 0, 'i'},
@@ -718,6 +726,9 @@ int main(int argc, char **argv)
 
 	while ((c = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
 		switch (c) {
+		case 'c':
+			opt_connector_name = optarg;
+			break;
 		case 'i':
 			opt_dump_info = true;
 			break;
@@ -739,7 +750,7 @@ int main(int argc, char **argv)
 	drm_fd = drm_open_driver(DRIVER_ANY);
 
 	kmstest_set_vt_graphics_mode();
-	setup_debugfs_files();
+	setup_debugfs_files(opt_connector_name);
 	cleanup_test();
 	if (opt_dump_info) {
 		dump_info();
-- 
2.33.1

