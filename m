Return-Path: <linux-arm-msm+bounces-73360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B1B552D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA021D6220B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7147A320CB4;
	Fri, 12 Sep 2025 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWZ0DllT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97E320A2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689834; cv=none; b=TrPAM9G2eWOcfCAFmM9CKhr1itn4AsfmLMnBRRyLpq6jbnyJ6kbUey9TKnMkQvsn0TENu8ZbTAGFdVg6X38ShpSXid7t5BzH/c8iLZmarqKLerQ7kU6D/+46rWeBYmwLbUOwl+bB7FVJ5Wc5Um510Cji17Atrd8W05i8/LHjCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689834; c=relaxed/simple;
	bh=k5/I3UYTWdnJjKzBx+/VZfwmc+jXcyZQNgYc3CqZv50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAZ6IwvPsokDncRSRa61qsMNVkgVRDjCriq7d8baqnRrdmVQ2n+f91MisDxn7iw+kelHD97f/duaEaJYZGMBCQBFjKa3GsMN1p9AlU6rbnHE5GgurSCYWsRbCu+uPjvR2E9eIdPqZtXKrxwITMaEnX/0nTRnom7a6HUWZWIBktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWZ0DllT; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e96c48e7101so1629358276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689831; x=1758294631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=;
        b=sWZ0DllT4BQ0jI3qqkg+XD6RTzjidkX4MxjJia4EeeNc5bXrnz+bG3bw8URL9PUYWO
         +sSP1xwl9ipPyC9kHfPp5/11hMMugNY55NggwsdyDYgt6OONEMiodLwMFjkAoJmyT597
         r0Bt6FE7vP6ZcYipiv0ddHKggikm9iHpIF/bzZ8NovLIeq2DwR+P5xIanNGeqGDi+4O4
         alHKWBpiQPCvlncXdI79f/JA2hpchOfrcTetMi43L20OmVTbzd+FbOHnF0DfZ5q8do0I
         b1JSnkdNq8Zgy7f07l+0Q1C5Y3hrXb4Nmyv4A2gKyIqWT0Ru/niXKF1+6AwFQYsekmsP
         4eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689831; x=1758294631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=;
        b=sNebs/LW/K0/RL3qAXS9ksbCweBAqPXI6O+FcsonsFEZZwIfqx6QSPygawRyCCiMa/
         L9JIzID38kpWGkfmJgUv4cD9PB6rDdgxWF69TRjIQ0fxxgYfRDNYwZIbWgpvSsn2d7bD
         5Ti0EFrEa5Q3lmMEke0LfVx7IWJArflefzfL2XuK2w4Qw3aKN2d7XGPyx1ESJqgt9tu2
         Z+WZCcJgCJq2pw/amW11jKms+9YZh2O8sYllikhRNBV23mGwbm0fzkdd0WxFQWhzrb8C
         xtna0qg9FUc40mkUobczI/tVkrgRyktumt5JTza647AXju4Pm2W1KtqFF/xY70gmV75i
         x2sw==
X-Gm-Message-State: AOJu0YwtVsFb/OSVLW0LkJ1r915s8Gr79GwszkIQv89LPUtL0hy0LiUA
	Lk+5Zwc9MITzRUZwriVODBpvYffT6jCzYnB3TTGYM79afYDVkviGw7x/tvB3UjHLi/7V/Cmt8bs
	STMSHQ4iyWg==
X-Gm-Gg: ASbGnctCLHL6E+RNKRnHNADrvORfi1zCTADbXHfkpsBfGT37/h2SU5gvTT1qbNRBT5L
	C2J5z04/BezkmZtJ6dS7pyjRgfpIgSBjORLcxV/B0FSAcTcQDGNNaFWambcJNKI4G2c0+cox8Ta
	P0unyXNK/GYQmn6t0PesYKJVZmCFAn+0ZFWSA9xcdl1kkipuTgs5FyMic+dSRcCV9rzynwYdKY/
	jkaZ1h2j94/QMdcrMQZnpRVC5RwswPpq3bWKR5TD21ha6bIiBl762KFJwpbqdKPmZk7QrE3WlUx
	ZHrVcevI7I3HdQ8ZM/WwhL1RAHmB6aDUNtX/wS9iP5XmpgD76lbojEiz6x+N9Q78hEUBO8omNB7
	Zcmwt4EtDaD9KO6v0qkwYnHYJI3JG4+hw0dmNKnc6x8wX
X-Google-Smtp-Source: AGHT+IGQPX6y0JKi888sfyXxAah3q3fQIwu7cpMyf9JJWf5Y6/yYrim06D3kAGSOfpN7Gh01tRPdkA==
X-Received: by 2002:a05:690c:c08:b0:72a:2d15:a2a2 with SMTP id 00721157ae682-730627c9015mr33553397b3.11.1757689831515;
        Fri, 12 Sep 2025 08:10:31 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 08/16] init/version: Add banner_len to save banner length
Date: Fri, 12 Sep 2025 18:08:47 +0300
Message-ID: <20250912150855.2901211-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add banner_len to store banner length.
This is useful to save the banner into dumping mechanisms.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/printk.h   | 1 +
 init/version-timestamp.c | 1 +
 init/version.c           | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 45c663124c9b..5bc617222948 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -12,6 +12,7 @@
 struct console;
 
 extern const char linux_banner[];
+extern const int banner_len;
 extern const char linux_proc_banner[];
 
 extern int oops_in_progress;	/* If set, an oops, panic(), BUG() or die() is in progress */
diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index 043cbf80a766..1fdd795be747 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -28,3 +28,4 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+const int banner_len = sizeof(linux_banner);
diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..68d16748b081 100644
--- a/init/version.c
+++ b/init/version.c
@@ -48,6 +48,7 @@ BUILD_LTO_INFO;
 
 struct uts_namespace init_uts_ns __weak;
 const char linux_banner[] __weak;
+const int banner_len __weak;
 
 #include "version-timestamp.c"
 
-- 
2.43.0


