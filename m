Return-Path: <linux-arm-msm+bounces-39596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E479DE860
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B3628279F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74452BD11;
	Fri, 29 Nov 2024 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dda0CXCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A920B22
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732890298; cv=none; b=dFXIPX2NVIxs5sQwsEYUPsLV+arqbavz7a9W3cnWSuyfx2OL0Gj7F9bISoQpKN3p2s2o4yJTqfQwpNm7yMwpKOLVpJnsKCNGf1aJNhrTFnfm7VQVXTwKsViO0YaCyxed4GRe+nohP1nBEOmUJ55XqKVgUnE0DJMepQvt7tMBL1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732890298; c=relaxed/simple;
	bh=bSfl7Dve9i5C1znJ/YQ1xVmQ29PlBYONWFiyrKw6DiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHdobZizEY4H8khYt1jsUBPpHX02gQRsNsLae7nHy0OU+b64tgl075EfBG1IBnUD0nU3Ws4poma9JE2kGoRvfYzR4Jrb+W8y78MgRRpntOZn57XS4CrtELy2iB0C2QOMFpFlTc8eSu6qGHft+wAG8MOrCmRg1HZgb8xBJIMeNdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dda0CXCj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53dd2fdcebcso2326301e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732890294; x=1733495094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCZSOSvoZDja8J6h/7BpGF/AK434TPL5kxxQSlBImvw=;
        b=dda0CXCjdVZzoPXPK2yfi8OtWeFj4XS+Az7Xq3dhJwk398+UOFT3mDQTXg3wJfTS+J
         TiE+CcFgF6eLhJpeSlvPCR5NfZ5hnbtYn56AFGxzSR6Irf4X1J535AxhUpNKRsVYyEOO
         XxPsk7CV6qJjx/49eexI9cZDMpHNBBR5ZPMun4IwJcxoGU8hrHTlizRt6PuxGcFGmvaR
         GtcHjcq/9oQF/SfLtuMCaeZ0oIWNoWMEoNdBLTadF9xy2aWSV7GIDHAPcjh58M+W7x0U
         UPyvhv9wn72HrnuhaHBq1NlqlXjza/Rn+vDgeCPhTStqVWXZYjhqmAV+dgbta1HuLSfT
         yakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732890294; x=1733495094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCZSOSvoZDja8J6h/7BpGF/AK434TPL5kxxQSlBImvw=;
        b=IYzE5E4qaipJXONl3eNhS5O2JfhcvVRWQhxW+1wy96Dzfpx10dX1GVKOiUakTICqOe
         2WC97xLlmgEzS+l+R22i1riFQcwNy2rwWnhV7vSWQieahO9TMg9icUgHcjTzrIGrlNoe
         5o87GirCV0PzVVwa2GrPMmd8aSDFAvcqqulR6xiupEWvoM0JdRzrO8BTZyum3W3p8Ljq
         GIRAgYBx+E0UC6EX1ARHOqy8ZnP/Bt+uge3vXVuExvrcoPFK5IWV6jZMKtncPhzdzNyh
         5PBxX6VoVUQ/4aLCl/PA7m3f4HJtTeR4MRRrjFW/q1nVwKYeuj/RxtZVgWvevsRbMMpA
         ATXQ==
X-Gm-Message-State: AOJu0Yz5bj9/F4CE7DLzQl/GMezboYEttaWEag1o7PnEE1XovYDS90gL
	pgUBhadv0o/2S+FR0i905HaJjQFg1CWNS5U6q++Bgk4uE5KDCTSlfNj9oM9hGw34wR+Fw8YP/xe
	l+1k=
X-Gm-Gg: ASbGnctOF1sR/6nFoGsydSicUOdieHCwLbm6BrjadhKT60GRC/jVFhPV/vR7jPaTMuq
	MDvDVDAMA2GucUxntlXqojlgkcUCeBmaBNfBVngAAFGxSkwHyLsxayRXaV66/75Uil57aG2KDtb
	IGEKY0BYlpd+i2bJarzIekXBjxQA8PXujwXIMHmX2sF9ILZVAmFgBrb1+QBfo7deuQ8yYAhnXSX
	2YZYsrDIZWQm1PYcAyuIA3ti9fcNJVevoqAm8/nWJhy1PJMXApW5e1E/nA=
X-Google-Smtp-Source: AGHT+IH/gEyxEGAkwMq76NQgb08E1phOa65IpCDKYvd1xADq8bu4IAVMjy4IbH6o6Y5621O+PeSi0A==
X-Received: by 2002:a05:6512:3b90:b0:53d:e077:ded9 with SMTP id 2adb3069b0e04-53df010eaabmr6981535e87.48.1732890294314;
        Fri, 29 Nov 2024 06:24:54 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd7fb40sm4671540f8f.89.2024.11.29.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:24:53 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	evgreen@chromium.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH v4] soc: qcom: Rework BCM_TCS_CMD macro
Date: Fri, 29 Nov 2024 16:24:46 +0200
Message-ID: <20241129142446.407443-1-eugen.hristev@linaro.org>
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

The use of cpu_to_le32 was wrong and thus removed.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
Changes in v4:
- as per Stephen Boyd, removed cpu_to_le32 being wrong.

Changes in v3:
- align the macro lines better

Changes in v2:
- use le32_encode_bits instead of u32_encode_bits with a cpu_to_le32 on
the fields; this however ment we need to force cast the le32 to the
u32 container.

 include/soc/qcom/tcs.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
index 3acca067c72b..cff67ce25488 100644
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
+	(u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |	\
+	u32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |	\
+	u32_encode_bits(vote_x, BCM_TCS_CMD_VOTE_X_MASK) |	\
+	u32_encode_bits(vote_y, BCM_TCS_CMD_VOTE_Y_MASK))
 
 #endif /* __SOC_QCOM_TCS_H__ */
-- 
2.43.0


