Return-Path: <linux-arm-msm+bounces-38134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 423579D053C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 19:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B13C11F21B76
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 18:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F931DB534;
	Sun, 17 Nov 2024 18:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edEoZQt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B461DA602
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731869064; cv=none; b=i8aNeQitqr2XYRMglpJ2T0lTqvCx0aX2yQeK5Q/b3aL0YiPk22w/aJRTeecNVQMMzBMkTberKETnD5gvCmmGZ99iPTRWjRFn4JgYJWf/TZmVHaLrF1FGg1FkkxuISrxojrtFiesoGIkOcreE5+Z9QUPJoT/u1uwg15w6v9WPG5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731869064; c=relaxed/simple;
	bh=BRVnz4//YdXvz1FMKrURytumMDf92OlVDuTwtndmp1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KoCz+M3MXA5hvg5s2AZwWg8FOdS+Qy3dNHZDD3ngwjAP983eY9m+qFHkOctOV+iduYDXc7DZHLxtULKWZ80iJ9y6LvhaQz0mIssaLiscC87t98Raa+vFKRZv77ZdTXI1cryDmdMEFT/OCR6l7HoXQXqr7GiRGTcQJCaGDwFKs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edEoZQt2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3823f1ed492so311689f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731869060; x=1732473860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWkh7WZG7vwBsGnxbhTtR+8ik+TAgauZ51w8oqK1WyQ=;
        b=edEoZQt26f5BxB30gaQq7huHihGGgPtKaRxJ7WI+MmxNh5jyyx06GM9POk9TL0L5aR
         sdUBRqpiiS+gaVr6qKVRc24JME7YWPT9yBd6fD+Z2r530Jzqffv+E1lNQQZtF5Vg+vwI
         dI8apdMJQOyV24U/XpVjpvY2UY3Zmx0Rg4/g26kL1tat+wrVb5LA3gh7ezAC8Bojlh0w
         bZ5OzzrGyJNAeQ13hLM1H8YVwqtPdRVX7jQvDff4jsmA+x/F2K7MSlq91qrqMZ8UBq+3
         XBJfAPtB3cho9WSJ/JMauOdacse4eIzNZNu4pzKXXDjBTzBfGuaJXkN5qoUexKGl11xB
         blKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731869060; x=1732473860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWkh7WZG7vwBsGnxbhTtR+8ik+TAgauZ51w8oqK1WyQ=;
        b=JLcnHKujaPj1ht/AQYwBjnDGltFGY7G7gBjMXAGkmmzlOEo5+xtYOWvyYdcso2lsh7
         7hhExQNwVW7pJ2Fzh8kCcGDfhRzidCcgVZdPL05kCOt9JyPe5nOpCMLruk2KqaEkjMiS
         QHJpJ0m3Qhcu0TzDIz+GzDG5yVL3KseTpOrzvVE54oQCljYrqSIjfH1S9BUjJafDeiF3
         F6XBEtk5Yc8omDsgcymB18hhhvgTHb+55jdkzxXYRtIfAM8Ah3d+9Zbf6F9QBkKzRKk5
         Wll6w2TpRcGRyLRDgcT+7+rb1R6kr2946NYbfNuAN2zxKoHnmrpQJ9a20Tq2qm14kJIP
         bsMA==
X-Gm-Message-State: AOJu0YyKdysunlHSw60PMoYD04G+xJYrUkXp83CH1bCteEceG7awkQVC
	KuEeE3Yh3EeEcdUZekxGniBXtlu8Fnl4OvejP6Av+TZKxLHfc1AoDlJEBhXdLHwkYvpvX6rp9SK
	h
X-Google-Smtp-Source: AGHT+IGkeQweqYBW/8Hnl0hUU1V1jJ5EB7kiHg+dpWYM1ZyWbyKk+uGQSNgMw4bo7IDu+9OSpPIMdA==
X-Received: by 2002:a05:6000:1a8e:b0:382:3c7b:9bd with SMTP id ffacd0b85a97d-3823c7b0b66mr3233529f8f.30.1731869059589;
        Sun, 17 Nov 2024 10:44:19 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38244220183sm1863714f8f.99.2024.11.17.10.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 10:44:19 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	andersson@kernel.org,
	evgreen@chromium.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH v3] soc: qcom: Rework BCM_TCS_CMD macro
Date: Sun, 17 Nov 2024 20:43:52 +0200
Message-ID: <20241117184352.187184-1-eugen.hristev@linaro.org>
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

While at it, used le32_encode_bits which made the code easier to
follow and removed unnecessary shift definitions.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
Changes in v3:
- align the macro lines better

Changes in v2:
- use le32_encode_bits instead of u32_encode_bits with a cpu_to_le32 on
the fields; this however ment we need to force cast the le32 to the
u32 container.

 drivers/clk/qcom/clk-rpmh.c           |  2 +-
 drivers/interconnect/qcom/bcm-voter.c |  2 +-
 include/soc/qcom/tcs.h                | 26 ++++++++++++--------------
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 4acde937114a..4929893b09c2 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -267,7 +267,7 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 
 	if (c->last_sent_aggr_state != cmd_state) {
 		cmd.addr = c->res_addr;
-		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
+		cmd.data = (__force u32)BCM_TCS_CMD(1, enable, 0, cmd_state);
 
 		/*
 		 * Send only an active only state request. RPMh continues to
diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index a2d437a05a11..ce9091cf122b 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -144,7 +144,7 @@ static inline void tcs_cmd_gen(struct tcs_cmd *cmd, u64 vote_x, u64 vote_y,
 		vote_y = BCM_TCS_CMD_VOTE_MASK;
 
 	cmd->addr = addr;
-	cmd->data = BCM_TCS_CMD(commit, valid, vote_x, vote_y);
+	cmd->data = (__force u32)BCM_TCS_CMD(commit, valid, vote_x, vote_y);
 
 	/*
 	 * Set the wait for completion flag on command that need to be completed
diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
index 3acca067c72b..d0dfcaa07337 100644
--- a/include/soc/qcom/tcs.h
+++ b/include/soc/qcom/tcs.h
@@ -6,6 +6,9 @@
 #ifndef __SOC_QCOM_TCS_H__
 #define __SOC_QCOM_TCS_H__
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 #define MAX_RPMH_PAYLOAD	16
 
 /**
@@ -60,22 +63,17 @@ struct tcs_request {
 	struct tcs_cmd *cmds;
 };
 
-#define BCM_TCS_CMD_COMMIT_SHFT		30
-#define BCM_TCS_CMD_COMMIT_MASK		0x40000000
-#define BCM_TCS_CMD_VALID_SHFT		29
-#define BCM_TCS_CMD_VALID_MASK		0x20000000
-#define BCM_TCS_CMD_VOTE_X_SHFT		14
-#define BCM_TCS_CMD_VOTE_MASK		0x3fff
-#define BCM_TCS_CMD_VOTE_Y_SHFT		0
-#define BCM_TCS_CMD_VOTE_Y_MASK		0xfffc000
+#define BCM_TCS_CMD_COMMIT_MASK		BIT(30)
+#define BCM_TCS_CMD_VALID_MASK		BIT(29)
+#define BCM_TCS_CMD_VOTE_MASK		GENMASK(13, 0)
+#define BCM_TCS_CMD_VOTE_Y_MASK		GENMASK(13, 0)
+#define BCM_TCS_CMD_VOTE_X_MASK		GENMASK(27, 14)
 
 /* Construct a Bus Clock Manager (BCM) specific TCS command */
 #define BCM_TCS_CMD(commit, valid, vote_x, vote_y)		\
-	(((commit) << BCM_TCS_CMD_COMMIT_SHFT) |		\
-	((valid) << BCM_TCS_CMD_VALID_SHFT) |			\
-	((cpu_to_le32(vote_x) &					\
-	BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_X_SHFT) |	\
-	((cpu_to_le32(vote_y) &					\
-	BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_Y_SHFT))
+	(le32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |	\
+	le32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |	\
+	le32_encode_bits(vote_x, BCM_TCS_CMD_VOTE_X_MASK) |	\
+	le32_encode_bits(vote_y, BCM_TCS_CMD_VOTE_Y_MASK))
 
 #endif /* __SOC_QCOM_TCS_H__ */
-- 
2.43.0


