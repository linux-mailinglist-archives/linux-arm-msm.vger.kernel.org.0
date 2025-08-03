Return-Path: <linux-arm-msm+bounces-67538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5814B19258
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50FD1727B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E092853EA;
	Sun,  3 Aug 2025 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8rolDlK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31128505A;
	Sun,  3 Aug 2025 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193549; cv=none; b=kNwwi8zP5osWCQu+6GV/WgXdTCxZGFAWeQM9TTmxosP0DMjlmNszI2TQWTFs6u1kShT7gzdJtMS3PhEPNk+ms7ItU8062wxBmWnuwwHXp3xa+c6ICG+39nvHbD1XVy3SN8VQW/HsT+W75bg/0UfkYSCMSi3h65VpAvOc3poeTNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193549; c=relaxed/simple;
	bh=UARPWlrU2aN9MPdomRDtK8jRaN4i8p4AaHr1kdIFDkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfILpPvjJKy12pUvka1wX/CHqJLPmU2GA/31bRfe/ya6yjqv6pecWsTQYJzfNxU/iHJXYEgMkT+FgZ8LN+aeY0l1AY6aGTCfRDw3Z0r/WpY1+WmYGGC7nfYMSOQErEmiY1T8MiKsuPWNcjQ5PF24bz8dKyYmV+Nx6g2XHWaTaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8rolDlK; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-88109d54abdso81454139f.1;
        Sat, 02 Aug 2025 20:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193546; x=1754798346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=;
        b=N8rolDlKu3q6M8EZtoAQrDkQvZqC1eCyrcnFFrQBgJ/H9zVCwyH/zjMrqIQjJttBfY
         JYKrRh1M9GEaZK/FgC02DgnkC8gh/D1jfult5d/7dBgkICbFagEyE9ImfmEiGtPM6sVk
         Q02qCQw9x4sDWxbrWTjbcALiq64fJQjmcs+wdYCm/P0rUhveEQhvcu9vKaxjoBz/2xZC
         KEwC3Zk/k7vniM7xzJvFFxSs0KsNeD5jmJ9bg3fs9E69Sd9T2Nn9d4v/+gDDOYr2hcyi
         S3HFrs01fp7niLi9ijLXoWYcatuFijd/Wb9gI/c0PLF326K3q5osiK3JIMOV0NUHLA+u
         20iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193546; x=1754798346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=;
        b=ov5RmKQH5wfa3i+7vGSDA3/JoASdJ6HEM9ntnhgy5/sR0P0KMI+zq3z1EqoDnwqK3D
         bt7TtsC+E2l8ZAiA41aWu9I4XKWoU3KlolvXVi44F5aa/g75bDrAWJ33iyx1S7yvjnXQ
         J+fzWi3WtHHNKvfQkZPlPIL0zDEwvFb/AFyJ74ryUQ51cy3QIkWMcJLFr8EeLOiP0dDy
         cQo6qL791PPjUq8SJw5jsJnWcq8cyKS9Ptu0s8lWT4SeiGIvL85Jak67EkNWYSi3tcCH
         1AWJeDuc6j5X9KuV8VkKObaoXRfaPX9kn51BLQm91qJ07DtxKlE2D6TNlXz4ykxgIfYC
         V1/w==
X-Forwarded-Encrypted: i=1; AJvYcCVuRamuE1okZhqr/VRWpUua+ehAYjgd9LNEEGOc3LZNlFFohPr9enfz62lDVva8YFbes8GygnjDDeqA+0Q2@vger.kernel.org
X-Gm-Message-State: AOJu0YwLQS/4h2lLJAcgtMxUNVeYHLG1sAfzs53y6dlUaQWDTECaAOjw
	iEBgP4M4f2q1hzp5D/zZU740V6BtoNg/03nWsd1uvp97uaF37H45zG4UbfAMMSzHRsY=
X-Gm-Gg: ASbGncv4QfdwtknTtrGHFo5VZ3QkiM1304cFofmj1HIiBQ9oFFWxHMuDbPn3T3sUUEq
	+V1XZdasoWCIIDJXM7iNW5M2IxuweS8Qaq6PsJc4vJ7CUW2/vFd4za3HFt5tmslAfmQRE/+REnl
	tYpeiubT+2TcqonOJ4XVfV42uwenZBjgHhw9HQ78lo7mL+kD1tYHmah3SFtzV94pqh1yZzzdUkL
	pquW08YMDoB5ytsdOt0ahHJrquj3HBPiyT+fvCGewm7NbAwUkIaPO0WBluBmHOKwI5oeWPV+gpe
	OUT90ITyLrDFt28+AToOEiuiICNkMOCqfQrsET94s3JflS+Tocc275FV0AsbwZFzC0FV///pw1X
	YVz8haa/Apw9EOvd0jCiUCJDS5fGgFu505iitA9qHDCBsoqCVxR0zaN1031hySBBKdKI24A1UWo
	ZUOQ==
X-Google-Smtp-Source: AGHT+IFoAVWLiheF2E67Np6scTtkKmbEoqDI0XN5GZeGYOfVbOkwBUJIixlaV+eykRMBCUEIeZ8d9A==
X-Received: by 2002:a05:6602:487:b0:87c:5a38:45e9 with SMTP id ca18e2360f4ac-8816832a528mr807300339f.3.1754193546523;
        Sat, 02 Aug 2025 20:59:06 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 22/58] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Sat,  2 Aug 2025 21:57:40 -0600
Message-ID: <20250803035816.603405-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

NB: the count is clamped to 10000, chosen to be notice able, but not
annoying, and not enough to accidentally flood the logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index e83b34b6d6b95..8713537363713 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,30 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+#define PRINT_CLAMP 10000
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	if (ct > PRINT_CLAMP) {
+		ct = PRINT_CLAMP;
+		pr_info("clamping print-count to %d\n", ct);
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +203,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.50.1


