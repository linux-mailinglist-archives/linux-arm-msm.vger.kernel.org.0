Return-Path: <linux-arm-msm+bounces-49866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF471A49CB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 16:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2671884E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3132777F8;
	Fri, 28 Feb 2025 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KD/umyWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6343D276046
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754799; cv=none; b=XVpwaoH6SClR+4fKpnmn2cVTwJunup79iaQhf+OCUEW+Jh8lF6hQzbkTFWLQvjohgAFvJQJjKye+Aga/k+LUPfQ9hSnrinaXSqfxGa+jUXH7fi6SUhvXWt7zRWWh71QQLyprSsBth5smFAIvA4ncNjk101xrSgprKXsvbUUgHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754799; c=relaxed/simple;
	bh=XosrFjAV0tZp82j6F8+YmYuWr+x4RWuB27RmcFFX1Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gA2maNvNSfdBvjc9rTZbPdCquB6NLuWW6VDSGtogcT05E7zI870NXeh3NUJ8oFvLZXdw80wsGMg7S+9VPptGTv2qh87UXnxG2TR3NbVLsS/f/oHz8Apw4BOH84lXJzguuaxo1WClcJUQKz9mcOXt6kNlf5M08RS/OoQzmf+ygjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KD/umyWS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e2404ee6so220027f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 06:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740754796; x=1741359596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0qM+AwWO5Bb1UoD73SYDecx7IEnVrvFutMktVOPE/k=;
        b=KD/umyWSffz63aHut9SRiu7Dh0Td6RePgGj9/FTaGK3Lfli44LgOfPw4hU1S6l1XEH
         kO6aCc3NmD2B7IuBN2FN0u9yyS8OloY9W5rk9JWghXxeYzed0SegKZTXLj42e5A9JxTc
         A1A2PibpdXBi4v3t9DlMVDOhRWq0oB6pvV5a9TpPCniQ08EVY89eDoQ1AFEYEiqOAJ7A
         LTXpaTW9CBlBP2M4zXWlVq3aM31wyMMmCkTd7ZRlwmBNp+MUZ945KQdH87WuY/tURmvL
         fWB9MuzG9mSmULFlmuYl31dl8rDZFP1dKDJkiRpF19sGxBBVEWuP7H6KmXrEl5Ab7MoW
         /0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754796; x=1741359596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0qM+AwWO5Bb1UoD73SYDecx7IEnVrvFutMktVOPE/k=;
        b=aPanjSsCV1KKJUJmmFAvDV72EGaoaWRA9wOlFSpHx0QPVRsecfaFy01+Wqq9WTaE5/
         8u45Kh2Nq9CVEX2PYQ5MgrbHcftzBY4U2d77WjoF6zVKXPhszCvqLnr4X6c5kPEMuR3P
         qURnx0drDsfC+kJfbxfS2DjLYxq2hXks7imozHB0jcu6xEYr+S4gFYNx5AM/w/WTrzHd
         bkQidGiEM8mWHMmCx0VsaBwq2AWD+sLOw66V0LxFTcUjrTjAMn2+O/PpiE7JcvWV5buM
         XFNZ7h3SNMkp620sDmrdAol72g6+3BPwpvAnt3KvjUyVEJSjCxief5iqNGm3RAeQtL5g
         dNaw==
X-Gm-Message-State: AOJu0Yznn1Zy+Ckxvm28LBVuDjaH+E3Es5AGGDl4ZDDU6bZXTUfpN+ce
	YYDzc8wgQub/mpahKbo53Q8tyeZm/sVsZJk+gQVZDcFTQu5FU7WlHBnucMlIuFp3H/85cyDdgX+
	k1aU=
X-Gm-Gg: ASbGnctgwuLXemEOOV7t66+46Ld5U6MKnRMIunwhgAw3tHWwWTAV2nkJXhjWY25P0yu
	Ons5fXVnhvbFqxI3gs/cfa3Y4uVzefcqN7ZFO7BoVCJ7iFGo2UkdPGXsAsMRkraLSsASccn7FNw
	h4ansN/EuaIlELoKFnBAICtWh0Orc6BIhny3TpbCtLPtLC2HC7UYDBU75nZmUKsyMwnY9Dxmeo2
	YTwdN5QYrGvregJ9qy79InVo29kkeY42OxTLKpy5TM/bEpGyL80s+wt4cVGyjPBMSNgG8XiO8z1
	+Vvui4rwuFXArbpSQgMhmsz7VhiYoZeDHKp/eUikqA==
X-Google-Smtp-Source: AGHT+IEPHTe2O/EvCk0xKNjG1snO2AY5re/tk3GdaWdiw0c1htNm0/bHXYFEXiCxMalNpBpioAN3eQ==
X-Received: by 2002:a5d:64cf:0:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-390eca0af97mr1399602f8f.10.1740754795638;
        Fri, 28 Feb 2025 06:59:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5450770f8f.83.2025.02.28.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:59:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Feb 2025 15:59:41 +0100
Subject: [PATCH 4/4] clk: qcom: videocc: Constify 'struct qcom_cc_desc'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-clk-qcom-const-v1-4-611ab80d45e4@linaro.org>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XosrFjAV0tZp82j6F8+YmYuWr+x4RWuB27RmcFFX1Ro=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnwc9iSv6GbNlVWISxkJpg4LZ3nYQ1vYkF5x0yQ
 Rp4K4ktVzGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8HPYgAKCRDBN2bmhouD
 1+oTD/4x4hLJ+caJT0VEKLtR8CV63d6Nj8C08pJrUMqNaiB+zYmefnXHwNvl7FeTajX60QZa9sl
 LQ9oWPnAlhzkVPqcKNu4j5iVGI2KZxVA2zXuyAO2B3XBWiNFoNaB13CiyC9nOnpZxMQ0s6dq/WY
 v33ltNd9WwDZINN90ughVaU+6A7Fzr2dli4tjtUqkg7CkiIeP6bxrXwBdIjUvDzhsrZNlPMcW+a
 uoQ2rpwybfdhaSwsuDM7MQ3eXv4haEY/xtBJr+Q5a3XaOMkYgbZd1wMFZDxRMtD2iJfTcFeBCw4
 2wf7Bxaxe8/+IVqOhOF4+cNEaDN4mapzV5SBKVkKcM886kK105EdNGr2Dlim2KMSZxooUK3sQLo
 gz4TWK6NcRHTHFp9g9l/FzJLGot28SfApvQ3r9lVF1CX23mLBs4aJHtl2dc3u4WYbetw6D9GnGi
 A1IXmvl14o7hV3C/gSLAe3pYcYY/Q4igNijUuAhmnY4O8a36AxhULrxCYv4QSpHV2x68KPB0kSY
 fp0QNEzrFEmAEOsHPEx4BMeoyT/SSENYN2fQzYKrLhErvlw//imA42HTUu0mutXFf2jTRHySbdQ
 GWHDGnn1igWCm3lAgEdU0gAFBgUbgr3UyUvnVhDEhYgUFnI6CsAuhE5F3plYotNrIE5TEsTSFYD
 3tOo10E8dW3Xx3Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/videocc-sa8775p.c | 2 +-
 drivers/clk/qcom/videocc-sm8350.c  | 2 +-
 drivers/clk/qcom/videocc-sm8450.c  | 2 +-
 drivers/clk/qcom/videocc-sm8550.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index db492984fd7d6565f2db9608fc37d29737121b60..2476201dcd20386aaa2b590797657da86fa30bbb 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -512,7 +512,7 @@ static const struct regmap_config video_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc video_cc_sa8775p_desc = {
+static const struct qcom_cc_desc video_cc_sa8775p_desc = {
 	.config = &video_cc_sa8775p_regmap_config,
 	.clks = video_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sa8775p_clocks),
diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 874d4da95ff8db9edec5c84dec43a6290aa5aa38..057a9474894abfd26fb1a8bcf328d38efd74d5b1 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -510,7 +510,7 @@ static const struct regmap_config video_cc_sm8350_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc video_cc_sm8350_desc = {
+static const struct qcom_cc_desc video_cc_sm8350_desc = {
 	.config = &video_cc_sm8350_regmap_config,
 	.clks = video_cc_sm8350_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8350_clocks),
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..2e11dcffb6646d47b298c27ef68635a465dd728e 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -415,7 +415,7 @@ static const struct regmap_config video_cc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc video_cc_sm8450_desc = {
+static const struct qcom_cc_desc video_cc_sm8450_desc = {
 	.config = &video_cc_sm8450_regmap_config,
 	.clks = video_cc_sm8450_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8450_clocks),
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..fcfe0cade6d0a95e749aabbc2af1174e5a70f0db 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -519,7 +519,7 @@ static const struct regmap_config video_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc video_cc_sm8550_desc = {
+static const struct qcom_cc_desc video_cc_sm8550_desc = {
 	.config = &video_cc_sm8550_regmap_config,
 	.clks = video_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8550_clocks),

-- 
2.43.0


