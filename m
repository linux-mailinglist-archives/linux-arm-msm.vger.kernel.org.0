Return-Path: <linux-arm-msm+bounces-17626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E931B8A7863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 01:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE22C1C20D95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 23:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719F913B2AD;
	Tue, 16 Apr 2024 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaQfxPDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA68D13AA51
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713309036; cv=none; b=iMbeMToyZFAPzAioTLNZQfCqw4juEcL9qxLXWazAlqeZiw9dvVyn2al3Wx8T+W5XsDPISVxtufraUKKNtip7e1qDQKH5t1b8KlPPPfBWTBonV7rBc/gUs/zKSxVzWHId+qlMNlmswRIU23stwMsRevuUSWUoOhRtpKxRrQncRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713309036; c=relaxed/simple;
	bh=pDIFH5Nui80QB/OsE0XuG8atQ/4Ispy93r0OYG5EBAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u7D1EWup+JRPHOEpCHsYgBem0gZ0wlZBM320igzk502v1DdoRJfhhaB7LTZssLIVy8iWF3hVLRy7Iu2t4t6f+8kBDJPBqCQ08K9bdpUaaNER6rmoY1AQ6sJQ+IkelZs/fJmWn4l2PEUhUa1AQyCyRZDca/qODLNwEtdytaHmIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaQfxPDK; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7d95f2a2dfaso136647639f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713309034; x=1713913834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/czbVFltjLc3JL/OguNyYjQSM1WrT0Zhxvso4G7Tfg=;
        b=AaQfxPDK53QmvXrL/4rh5ulWnvCvOYz5emGJ/ZwcJFWk5HY0RF4nUjtDhzMVP7XXCE
         aNzDLRKmlLV5m3/Oz07QCAANiZxolA8PVfjZ7fYIF7MMVBejY2/uDZzcZA0VqCSljFBF
         pw8n9QbeFUEBPolKYwAKvbxwIExrbUK5LgvfegUm6ZWNNU5kbrWFBWuRnS5T2wZUk1sy
         tuvqPCTbEI6jhB6Lso95XoaRiXMwxCXXbwTDC6r02wjuVT0Gy0wMvY6QsFv+zRnc4I8l
         FoRgd/RhyhKNLUKp87rIs4mWqV3pEBBfRLhx1UvZIudSSioQTOk+645Wgbn6iEKMj4Tp
         HHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713309034; x=1713913834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/czbVFltjLc3JL/OguNyYjQSM1WrT0Zhxvso4G7Tfg=;
        b=cDgqXuQOaMoqHrsGKIjMpsLb62U30T73a5qFS6UmhjfvEZw5QivGYMWRc+r5zhCkYL
         rYtjjgEbLXfmg+9wWzPoxRbJUX16baP2zavnaWWaFlnTrqaT2fJJlZXdxFnxItmbW8uz
         yK7SrwWnEhV+7ZbS0DdEjUYOlczX+C5+YxU6n0Jov9Wz/jAWeybvDWNobuyVDYaFIqH3
         WbLSLXNJy8P02hTlJvfFpOI5zBd5zlvVn35nvUN4rrWlqSnTNYx2qF0ys6fKI7DnGns6
         8ClO2Rfg9qqLwnyjC4FPOlq0y4I7T1zrZUnczJ7ZPWZWey8YE3A2jdBxekW/Rql3vbAI
         y4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Edlekdlb/ixxaBXOU8FQsS0nLyvmwGwdh22UAPKpwtk4NMsI2t7bs6A2+Hp7fpD3UM9nDYqvHJbImn3pT3P+hwJk7wEYcNZG3YVo1A==
X-Gm-Message-State: AOJu0YzFm5noIc/n5bllifhyir8VyxkeMoTX4o8JhYJDxhI9fTfb5Di4
	4bxBiTbymjIrDaN0Bg6JBa3Sicks/2xFedKf6121PEihhhUiGrf5fWDLaJSK9ac=
X-Google-Smtp-Source: AGHT+IFXSJ/9AZsIhFKLj06UwIx2tCWr8NjdqezkaAjB9TulX7fLK0pC/miXkM46bt9+p2xOr443mQ==
X-Received: by 2002:a05:6602:4990:b0:7d5:e78b:fd1d with SMTP id eg16-20020a056602499000b007d5e78bfd1dmr18320154iob.6.1713309033993;
        Tue, 16 Apr 2024 16:10:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id le9-20020a056638960900b004846ed9fcb1sm372170jab.101.2024.04.16.16.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:10:33 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/7] net: ipa: include "ipa_interrupt.h" where needed
Date: Tue, 16 Apr 2024 18:10:14 -0500
Message-Id: <20240416231018.389520-4-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416231018.389520-1-elder@linaro.org>
References: <20240416231018.389520-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPA structure contains an ipa_interrupt structure pointer, and
that structure is declared in "ipa.h".  There is no need to include
"ipa_interrupt.h" in that header file.

Instead, include "ipa_interrupt.h" in the three source files (in
addition to "ipa_main.c") that actually use the functions that are
declared there.

Similarly, three files use symbols defined in "ipa_reg.h" but do not
include that file; include it.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa.h          | 1 -
 drivers/net/ipa/ipa_cmd.c      | 1 +
 drivers/net/ipa/ipa_endpoint.c | 2 ++
 drivers/net/ipa/ipa_power.c    | 3 ++-
 drivers/net/ipa/ipa_uc.c       | 4 +++-
 5 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
index 968175019a5e3..cdfd579af5b94 100644
--- a/drivers/net/ipa/ipa.h
+++ b/drivers/net/ipa/ipa.h
@@ -14,7 +14,6 @@
 #include "ipa_mem.h"
 #include "ipa_qmi.h"
 #include "ipa_endpoint.h"
-#include "ipa_interrupt.h"
 
 struct clk;
 struct icc_path;
diff --git a/drivers/net/ipa/ipa_cmd.c b/drivers/net/ipa/ipa_cmd.c
index 2e7762171e480..969b93fe5c495 100644
--- a/drivers/net/ipa/ipa_cmd.c
+++ b/drivers/net/ipa/ipa_cmd.c
@@ -14,6 +14,7 @@
 #include "gsi_trans.h"
 #include "ipa.h"
 #include "ipa_endpoint.h"
+#include "ipa_reg.h"
 #include "ipa_table.h"
 #include "ipa_cmd.h"
 #include "ipa_mem.h"
diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 4e8849c1f32d9..8284b0a1178c3 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -19,9 +19,11 @@
 #include "ipa_cmd.h"
 #include "ipa_mem.h"
 #include "ipa_modem.h"
+#include "ipa_reg.h"
 #include "ipa_table.h"
 #include "ipa_gsi.h"
 #include "ipa_power.h"
+#include "ipa_interrupt.h"
 
 /* Hardware is told about receive buffers once a "batch" has been queued */
 #define IPA_REPLENISH_BATCH	16		/* Must be non-zero */
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 41ca7ef5e20fc..42d728f08c930 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2018-2022 Linaro Ltd.
+ * Copyright (C) 2018-2024 Linaro Ltd.
  */
 
 #include <linux/clk.h>
@@ -15,6 +15,7 @@
 
 #include "ipa.h"
 #include "ipa_power.h"
+#include "ipa_interrupt.h"
 #include "ipa_endpoint.h"
 #include "ipa_modem.h"
 #include "ipa_data.h"
diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
index bfd5dc6dab432..17352f21d5f87 100644
--- a/drivers/net/ipa/ipa_uc.c
+++ b/drivers/net/ipa/ipa_uc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2018-2022 Linaro Ltd.
+ * Copyright (C) 2018-2024 Linaro Ltd.
  */
 
 #include <linux/types.h>
@@ -10,8 +10,10 @@
 #include <linux/pm_runtime.h>
 
 #include "ipa.h"
+#include "ipa_reg.h"
 #include "ipa_uc.h"
 #include "ipa_power.h"
+#include "ipa_interrupt.h"
 
 /**
  * DOC:  The IPA embedded microcontroller
-- 
2.40.1


