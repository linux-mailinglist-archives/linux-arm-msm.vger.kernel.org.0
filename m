Return-Path: <linux-arm-msm+bounces-35672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9AD9AE236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 12:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E1E2826A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638651C878A;
	Thu, 24 Oct 2024 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwOAX7Tv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED971C4A23;
	Thu, 24 Oct 2024 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764811; cv=none; b=G0JadNipL9w8aPAuGTmUZHaTknQASJrzsI7WHHQ6sg35tNvyPmoU0MexsCkqRo/YrrcYDQTWzLLFo1tqjZuiwxH6vLIWnHCzfWODjGf9ZVkZdDiWTektdIAguooJoxgfLdXuXj1fqwEGw1IpOS30ByinEatH2VdgcKZhpmNXB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764811; c=relaxed/simple;
	bh=WMVFSYtiNs9+eSt5cs35mFEfRBb6kD9EOxNwlA9H3pM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YSmx0V2B2F6LIOsuL8ZNGLGHIcz3enp/aIARnd5pZXwZ3CY55Tp8ppSaLGWX4ZEV0D1qpE+94rm79C/a4oCv1/NG2YeHHdp4NO4bRS/4cGQvj4N5+be8tQikoI2ycHktgPNTtHnc217ILVku6JKWYLDLuyLr7s3BRrjqQuF9gmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwOAX7Tv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99fa009adcso44264366b.0;
        Thu, 24 Oct 2024 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729764807; x=1730369607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/nu93rXi66eugVXc5QNmzFF8lJpxFp1e23mrrGawYo=;
        b=CwOAX7TvhYXmRc/VqE3lcSuKYX02QdCcJQ9fVEM6kGw6BXpWUgV1F1/lZMKwIUCXMz
         jHarCoco3+gChnlfplR6Q2O9iQ8sdi1aZMUk3h+RbLo7xCdQ01Qw7HvHIzSz07to0fnY
         o75BifvRPZKon5w3mLh2FJvG7A5Iwq1Ay1HZEMldOzu0Fhx+hUVe3nZRf4XQ15L6zKpc
         nAFhDlroVjIINkhHzNsVlZes5z5GZQVcFap22bw3ZAIq1lxPVXZ9JNyxW/mM/4cFsNEC
         rYFb2ymo1kajSf7Mp4qMZF79WYKHtnkz751Zkxzm9eGs/sRslCEtQVLj63EdWVIwwXg/
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764807; x=1730369607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/nu93rXi66eugVXc5QNmzFF8lJpxFp1e23mrrGawYo=;
        b=HgorNQrIaxOZKCU02hk0gVLhHJ4NpRWxdJyrXrofbVueUWnTN7KOgdL2G1JKsqy9P+
         P3xbFdlSvoFcUo+IotlYRShukRy+6mxCDwTnSbsiVEEYiPrLCVm1tz9KTdrKZvqsNEU+
         N6G5D6EQR7xHTMLzPkven132HKPeAJ9PMDI99yIP73+zeHURUlHtd0f+CuocH2JQmDe7
         uRJORgjzooPk0sb5Gu5sjmWjlJkrDBX/KW96xDfdxFOKAzVxVQJJEreYbPKZoCnCpWKw
         CbIrxEfN8HDJIO0lpDgabSfk5C4mmcbt5sbZumMC7WeQqHuRSF0AGkyQpwU68A+jkqhy
         18eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcraDZJGLEctviEPxG2NrlIOo7EyhbYwOXlOvP4EI2MclDsHl0DEXNUGyMV6/jhbgJSQV9VGTLdpI=@vger.kernel.org, AJvYcCXlGwMdhBbcyvDu/7F7wrJI7RVOc3wzpMvbA8nhDpKR378u2wOPlq9rANgVWj5DfYzXtPSfWJGamc0g+rL2@vger.kernel.org
X-Gm-Message-State: AOJu0YwfwmAIRmCatRl34tjJ7S0zRqTlNptqKpFSnX5ZlyfopgNarkpA
	SfraMuUoxGBl0reGky2fuY2LCX9Pie215Kd0NOLlvRL0b6Wvynt3wtbsBA==
X-Google-Smtp-Source: AGHT+IF9E71yWN6SD1MVjWD6Quj1700l4BelhysLBUkFUgCzRuQTwkEk9k2JlZHnw03Nn7lyF07YDg==
X-Received: by 2002:a05:6402:27d0:b0:5cb:6b7c:3f88 with SMTP id 4fb4d7f45d1cf-5cb8b098013mr5505187a12.8.1729764805238;
        Thu, 24 Oct 2024 03:13:25 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.244.166])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a6efsm5519757a12.53.2024.10.24.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:13:25 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 24 Oct 2024 13:13:10 +0300
Subject: [PATCH v7 2/3] clk: qcom: clk-rcg2: split __clk_rcg2_configure
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-starqltechn_integration_upstream-v7-2-78eaf21ecee9@gmail.com>
References: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
In-Reply-To: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729764800; l=2751;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=WMVFSYtiNs9+eSt5cs35mFEfRBb6kD9EOxNwlA9H3pM=;
 b=1EaeS44p5ujtmo/vQmqT54lGa8HFrm2QoUqsIuyIbRdIwqzT33N52IsCl8Ux0JyLzPyWp2fcN
 ZhW5e916U85CzE4PD9PCpYkFOVr59llWXOXii23qwbIehDeK4O8JJFk
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
index 0fc23a87b432..a56c7caad33a 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -400,16 +400,26 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
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
@@ -438,9 +448,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
+	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
-	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	if (rcg->hw_clk_ctrl)
@@ -452,6 +461,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
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


