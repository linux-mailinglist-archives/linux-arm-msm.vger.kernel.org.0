Return-Path: <linux-arm-msm+bounces-36486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B159B6C67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 091B8B21835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABED11D0BAD;
	Wed, 30 Oct 2024 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTT0l8Gy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC041D0146;
	Wed, 30 Oct 2024 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314673; cv=none; b=V3pcVIwsdHiyHddS08yDNuAFOQLsz0ZzXLYYlsgicnwgkn0nHtsdxjSDpVULtNA5PnSCQv5f7cXJNloHD6WU98qQNNjjF0LVyWgN9ADZZesx4Ttf44efnjowvH8dXP576BMcjWmOocSQE6YlNaoYIfm4sPBLfbOO4cHAir9BYo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314673; c=relaxed/simple;
	bh=QVwTe5vkCgC6ZyHfvLeoIbyNzROGNaBzi2ICIXq0Aks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJJzmhHmxmf5vli1LQjX+evsN627mm3/6BiP/jVKy3KM402r5CH6HKPgUzmfysmyTJSCdtAl7XK4BhYd3sWYF8UWPI9ClXcwTwcah3BdjDcXUoL+WzzwXvgjSDvmGqo/CsVPUbP6bPVdwYKJdvMmgXhwxdA6U92vMkyuYR6RztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTT0l8Gy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fc968b3545so1024301fa.2;
        Wed, 30 Oct 2024 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730314669; x=1730919469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXcDhqCotDtoxjw1woICtBN+aeyeaVd81N8OWUoUUeY=;
        b=NTT0l8GyGxIpENBMCV19+iaOzHOw4wDa1q0n/Xg2fZVSspp+ETEpCmbcv/LfXNOrNS
         sa+dkD11X040kzQcWPjPUubqF7y0Pjy6c0/pTC9fkx+63AYqdB9oqkNzPA44l/w3xvuJ
         Ut1QgDg3SLFst9VsIP7p1xeCsCCkY2xadfGfKgHtRymqknCjD9b6HQs3yNntuOntQDRT
         G+ZO9VOq5mk4Xg/DD+EQOR4uyHkknGe/IHsXwfsoJD22gAJ1kvPAvxZuFl3LAE0sC8a1
         gn3bfnHuIZr3kAgZUJHgX47V90uydHvlPjnnRm7QQQWB03Z886Ln3sQ8MpnGnmwEHfyO
         feiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730314669; x=1730919469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXcDhqCotDtoxjw1woICtBN+aeyeaVd81N8OWUoUUeY=;
        b=GI1guVm2I7oeqEJnAa5IC7fWjusa3Ua6OlzxYdx27gcX0XWEPdmemHPBN0MeKNn8qu
         75uZhS5yfAKt49zTREtavTGEO9sKwKBsNojwZNVqgOI+pO3AEePZTbuLbCLbTFcAHrOx
         AO1yZkiPuSSl2oG6gc5vVZwXoUTI6xSKb/dXUFulze1gkZMeGOg+k3/VuWvaY0nGQs7X
         IBtlLBmiKMBWC1J4tlAKyjuwVNTJnUcDKcKCsvROyrmX+fYVjPEsLXJLonckzHgINAXi
         JX19FF6zFiUE77oifquLIomTY/DXY95p9j+jgZvVJdFBRVjy3hgViuSN5J38y3E1YG7z
         2KoA==
X-Forwarded-Encrypted: i=1; AJvYcCVs8FeA+AUGTi8EHELSNtbCxrkYQ1vXZSPW0iCT+P7DPTwKmsgbNctiqVfnh10hRLWLs3oBrq/Xl9A=@vger.kernel.org, AJvYcCWX4FryDHwdBYu5qWWM+iFS1eNduNKYQyvcGdLJvCsvlZhRiDjpqC+CbIECfqcjfkyAlcIo6fIymGp+czYl@vger.kernel.org
X-Gm-Message-State: AOJu0YytXsLpyxPVR6HOTw+UTa9agwe0wJl+bSkMbSK5BuVB8N8Eeu1l
	YBIT9BAIi6zkg59cTJDdGZyT52ZCMd1vAcA1wWg3NEmQnziJvCMXxkGfxg==
X-Google-Smtp-Source: AGHT+IFS4HqbvAEyQBccb3B/DQpRzIdhA6YrRE9mqVC1Q0vtfOvmwlN7MPRas/rNh5uVXA+lL/S5/A==
X-Received: by 2002:a2e:4619:0:b0:2fb:b59:8167 with SMTP id 38308e7fff4ca-2fdecc2a016mr2710331fa.39.1730314668798;
        Wed, 30 Oct 2024 11:57:48 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c20dasm4970447a12.46.2024.10.30.11.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:57:47 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 30 Oct 2024 21:57:38 +0300
Subject: [PATCH v8 2/3] clk: qcom: clk-rcg2: split __clk_rcg2_configure
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-starqltechn_integration_upstream-v8-2-40f8d5e47062@gmail.com>
References: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
In-Reply-To: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730314661; l=2751;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=QVwTe5vkCgC6ZyHfvLeoIbyNzROGNaBzi2ICIXq0Aks=;
 b=3jw5m2WKGbv5GxIj0Es3IcK7dcummTxD9aCszeX1Y8Vw5GUfX/+tYNIGvILQVIFDY+VsuVo+0
 6wsRagdd9ejAXWCkotTootxrnGI6RwtrmnTQrI03cbkjunRsvsKpFqx
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

__clk_rcg2_configure function does 2 things -
configures parent and mnd values. In order to
be able to add new clock options, we should split.

Move __clk_rcg2_configure logic on 2 functions:
- __clk_rcg2_configure_parent which configures clock parent
- __clk_rcg2_configure_mnd which configures mnd values

__clk_rcg2_configure delegates to mentioned functions.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index b403e4d6dcdd..714ab79e11d6 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -402,16 +402,26 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
-static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
-				u32 *_cfg)
+static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, u8 src, u32 *_cfg)
 {
-	u32 cfg, mask, d_val, not2d_val, n_minus_m;
 	struct clk_hw *hw = &rcg->clkr.hw;
-	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);
+	int index = qcom_find_src_index(hw, rcg->parent_map, src);
 
 	if (index < 0)
 		return index;
 
+	*_cfg &= ~CFG_SRC_SEL_MASK;
+	*_cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_mnd(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	u32 cfg, mask, d_val, not2d_val, n_minus_m;
+	int ret;
+
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
@@ -440,9 +450,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
+	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
-	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	if (rcg->hw_clk_ctrl)
@@ -454,6 +463,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	return 0;
 }
 
+static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	int ret;
+
+	ret = __clk_rcg2_configure_parent(rcg, f->src, _cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, _cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 {
 	u32 cfg;

-- 
2.39.2


