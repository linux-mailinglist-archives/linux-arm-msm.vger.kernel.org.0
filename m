Return-Path: <linux-arm-msm+bounces-38209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CB9D0E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99758283253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FE11A9B2A;
	Mon, 18 Nov 2024 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSUvAeRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F3199254;
	Mon, 18 Nov 2024 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924934; cv=none; b=nGB/33vM3qWlnN5KuILcH0KJC6AEmX/CGyDKfo8mbrqfpy3K+5klp5XPVYGpcHZzCCXB3HX1DYyqtSAtsCa9QOYeXhb64fPxB1cwJYQKMfuW8T3I2YJUNW2dR+K8SXs54PnvPslPafeoHwdYYeXwmfYNeZbbaELYA7ayFpxediM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924934; c=relaxed/simple;
	bh=QVwTe5vkCgC6ZyHfvLeoIbyNzROGNaBzi2ICIXq0Aks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LeY2TURMsOP2sbop+DcfTOZ7R/J8zlO2OY70Z5hp51g8It/ZPVJEYcbK4H+svUUYiSd56iiKe5956QheUUDduLA6ylPgoXIahlosjZvaSlP7fi6clKE9wurdVQe5hnf9DeM36Sm0c89Zyt3jKXg/G6gk0BAkfG3TcL/Wi81Qj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSUvAeRA; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cfc19065ffso1323640a12.3;
        Mon, 18 Nov 2024 02:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924931; x=1732529731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXcDhqCotDtoxjw1woICtBN+aeyeaVd81N8OWUoUUeY=;
        b=KSUvAeRA6Ys5JEAn1BOACdOiHCDa8IZ37oGMIRRcjT/p7RkCKm6OIDG9ImKwFrP44C
         6mh7mBzayyPhvgoQtv9uDlcfIn9JnBMafCMnRuSB6WZUVbnOsnFKmjqfP5S5TTzexJLt
         RgA4hVwPqq3jnCMnEiYZiV8QlpIDY9g0ThzgiC7E5QHGb4XSfmJOKYkzXLjrkg/GKsYJ
         Q+RUY1o6YdFk/8L/Bs2PXAewXq6/VU6DjF0h/yw6+v5PMUmBMkUvVWsZqNnCyYwp1S7q
         LhSzpqCnrd+TnL+zefOfWhJoAwbFpRefPJrakner4r5FfryBALd5+tz1ArA6sGuPwLTl
         +gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924931; x=1732529731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXcDhqCotDtoxjw1woICtBN+aeyeaVd81N8OWUoUUeY=;
        b=q4xjcOerWLu0dZcpAi8qQEwif00V0f4801jitbN//YthfqtzPF7whCJLSN/jcoASV8
         r9sgWPaKQPd5FoWfIF592SGr6n3egCL/1Xtwl5m3hPYah5WjSd5EWwpEs/UExH2Z8O+o
         7YOrEZ1+/H0uaWKjvEhKhw3SX5vIbQVXQtjeT1ie6k3knxWFJ7JaLYwrxsU7DkvYEN0b
         5hQncYrh2Git+S/bkfX53IzvkMhXe60rTdFLyOedb8JzzAah0bTmGBCgfYyzQ+uOZOk9
         cuwccByjDZ7e72vPPBEcoV55EEEDBGkVcsDYpTF2oZTl7k+HH72I54vpA7eauWAwSSCi
         Hf/A==
X-Forwarded-Encrypted: i=1; AJvYcCV2duAJjNJghLj7bzhfBhh+W3LCnzfnVNTCzCHmrZRMt15evz8xGz9nNLy538FvsQu3xHUK4lX6vBJv6hmW@vger.kernel.org, AJvYcCVO88K0TF+2Nfi7RJL/m+q+9YIV3nHVb8v5Mv+IC2aJTAWE5/tim6Nllzup1qUoulY7SLT009ATeMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRa8fPzZHEicvjSFMTcmwfY/Yo6UPIpyszojylNlYj0jKp4T4
	VBcncziZ13dqnB4Fd+RnrIHvJ02IOfqjojZVmQ/X+Hvl3TbJtF4SXMEtUw==
X-Google-Smtp-Source: AGHT+IFuWXlyaD1wASXRKY3LkU7lXw9eUjtJf/tQ16HUaAjMFVX0e+6xTszgLCNtHKDPC1cNaKBW3A==
X-Received: by 2002:a05:6402:2792:b0:5cf:ca7d:1745 with SMTP id 4fb4d7f45d1cf-5cfca7d191fmr1995632a12.1.1731924929323;
        Mon, 18 Nov 2024 02:15:29 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79bb329bsm4574455a12.38.2024.11.18.02.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:15:28 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 18 Nov 2024 13:15:20 +0300
Subject: [PATCH RESEND v8 2/3] clk: qcom: clk-rcg2: split
 __clk_rcg2_configure function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-starqltechn_integration_upstream-v8-2-ac8e36a3aa65@gmail.com>
References: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
In-Reply-To: <20241118-starqltechn_integration_upstream-v8-0-ac8e36a3aa65@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924925; l=2751;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=QVwTe5vkCgC6ZyHfvLeoIbyNzROGNaBzi2ICIXq0Aks=;
 b=a6kwZGurW4CDHT5/pmK7xVDbhWiQxmRQUH6n3Rr4KB26StWZ02egSeSV1vZnhLHSKbrzPsTGa
 0lQl5rGItrLAzh86eH8qJQJwmQtv8KEWRENtvxd6yIOdFFm2Ir9eCRQ
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


