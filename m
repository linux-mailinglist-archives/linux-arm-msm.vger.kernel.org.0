Return-Path: <linux-arm-msm+bounces-35824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2B9AFD1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A171C21612
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FF61D417B;
	Fri, 25 Oct 2024 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMpf72f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE311D4159
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846181; cv=none; b=a7VGjzlzIWvZKc7RAfwMBqHFeL8uXk3Y5O9HirXD/WcB9+TAronPflbT3/kxgI846ngCQxVYoHR8YjoJtikvJh600AlSmNexTKBidQCQ1h2IhhaGyPqED956vHSFdg936wgzrKfd39mTa7vmFBs8rv4Pu1StEzqZ/DzbFThd/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846181; c=relaxed/simple;
	bh=aau9tHQdt9wZfJyHUEPe1kivtOWbrfV8zNWTFTcZKWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1izBjCtVHKjfKd5l1iZeq6I2pms97WclzqVcs6MrpriPO5lXLHBzMaeF8orzvg8uQIBy6aUDqej8NGEHbiyoZE8L81g8iIUaT43MNe9bH6aNJasbBMMpSzNktyqgL89iYdhA1K0aEQbbjl7P1Fbo1YQzWsRZicBz4qV0K5u7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMpf72f9; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so248143066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729846178; x=1730450978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRSl2o55vfrb48RETkbbqxxh5qcFIzkT/BgKsAMc+pQ=;
        b=RMpf72f9JutizRtLwkpsxhqx77JEdt/egoolKNSKwI4xtvLvQzIWMuQWQqX01ZScUk
         pG7QPwsQJmq5FYxW2e99tW1o3kRcSwMEoLklcuWfPAfXHlhHhSoUJPoXMqpA2HRWwwhv
         S38C8NX5wXdwODMWB3/VHiYEHC99AvHNpWFfviUY0ldU08i+AyxuKe+IihFxTLGtW9Hk
         ojpb3hUkPF8cX/JK4mn6BHQ/zSis+HOg0aFzFJWL+bTrvY6KWmAH5WHRYAsIItSyXgcP
         0MswGKM+tS/o7MW3oT7buDvIgv5OVaobzOSour530t43j0JnNF2Box0m3ZmydBarDrmQ
         q5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729846178; x=1730450978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRSl2o55vfrb48RETkbbqxxh5qcFIzkT/BgKsAMc+pQ=;
        b=oRe9gKBAiq/T4mqrBCC7lwL3LxbHT7Hi92m3OEmRcH9Qu27MIkJnHWkUSeyOgo9Fe2
         h0ppkozJCKARhBEoDDSNT+cZnAo18NVNer/iQPvQrutuAWtHgs89/L685yBaa1Le0e21
         L2KtEGjyVapvuz4PKa7fmWLGUJ9YEG8yItihW1pd5Vl8NkRclVrlumcBkUcWm7Wk2nX5
         UL6oytvK4J0vR6k0OiFOhlXUoEfWyVkaQeNWrevaq3ggx/yb+a02gk3w1//bm3qpCiNP
         Y05aAnFGr7zkgJ4HL36GHk7YMVV9G/ys9hkzubXsTgqtocT/gencfQ7nDzN/FR2Wa7JO
         wzLA==
X-Gm-Message-State: AOJu0YzMwtHFfyr1rJjBJJ8lw0426pYG6Phz+iuvWQV3Ud3YnUUIicxJ
	KI5n2sO6P5G3YooB4o5mUsogRCiSvuAeb9IflbMcFZT4JnGo8CtyWUhfKsuCzV/QCby9yh7laF3
	4ZV8=
X-Google-Smtp-Source: AGHT+IH9ZdtLJ5fZe1Y5a4P61GN5i+jcRaNICf0HquXA+YJ3XftacRglhmQflo/dufsfVPRQdzlZRQ==
X-Received: by 2002:a17:907:7f15:b0:a9a:7f84:940b with SMTP id a640c23a62f3a-a9abf8458f3mr868712066b.10.1729846177765;
        Fri, 25 Oct 2024 01:49:37 -0700 (PDT)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b343d2652sm44066666b.181.2024.10.25.01.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:49:37 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
Date: Fri, 25 Oct 2024 11:48:23 +0300
Message-ID: <20241025084823.475199-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reworked BCM_TCS_CMD macro in order to fix warnings from sparse:

drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer

While at it, used u32_encode_bits which made the code easier to
follow and removed unnecessary shift definitions.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/soc/qcom/tcs.h | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
index 3acca067c72b..130ed2582f37 100644
--- a/include/soc/qcom/tcs.h
+++ b/include/soc/qcom/tcs.h
@@ -60,22 +60,19 @@ struct tcs_request {
 	struct tcs_cmd *cmds;
 };
 
-#define BCM_TCS_CMD_COMMIT_SHFT		30
 #define BCM_TCS_CMD_COMMIT_MASK		0x40000000
-#define BCM_TCS_CMD_VALID_SHFT		29
 #define BCM_TCS_CMD_VALID_MASK		0x20000000
-#define BCM_TCS_CMD_VOTE_X_SHFT		14
 #define BCM_TCS_CMD_VOTE_MASK		0x3fff
-#define BCM_TCS_CMD_VOTE_Y_SHFT		0
-#define BCM_TCS_CMD_VOTE_Y_MASK		0xfffc000
+#define BCM_TCS_CMD_VOTE_Y_MASK		0x3fff
+#define BCM_TCS_CMD_VOTE_X_MASK		0xfffc000
 
 /* Construct a Bus Clock Manager (BCM) specific TCS command */
 #define BCM_TCS_CMD(commit, valid, vote_x, vote_y)		\
-	(((commit) << BCM_TCS_CMD_COMMIT_SHFT) |		\
-	((valid) << BCM_TCS_CMD_VALID_SHFT) |			\
-	((cpu_to_le32(vote_x) &					\
-	BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_X_SHFT) |	\
-	((cpu_to_le32(vote_y) &					\
-	BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_Y_SHFT))
+	(u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |	\
+	u32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |	\
+	u32_encode_bits((__force u32)cpu_to_le32(vote_x),	\
+			BCM_TCS_CMD_VOTE_X_MASK) |		\
+	u32_encode_bits((__force u32)cpu_to_le32(vote_y),	\
+			BCM_TCS_CMD_VOTE_Y_MASK))
 
 #endif /* __SOC_QCOM_TCS_H__ */
-- 
2.43.0


