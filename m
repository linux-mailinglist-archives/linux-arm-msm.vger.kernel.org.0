Return-Path: <linux-arm-msm+bounces-53195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9147A7B836
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46CFA1894FC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 07:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA84C18CC10;
	Fri,  4 Apr 2025 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaXzu39b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4222E62B6;
	Fri,  4 Apr 2025 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751324; cv=none; b=suDmX9eVIY9SThkYYnyusYNXGQvlIvJU/DkrrrBTdhWIoe2s9ZcuzFyFEJA73xeg6VmxflFlMbPUt5Umn55X6dTzxYLKsaOXtjcnaU7ZrS1lfCMWDxczUX+qYVBpUcrkrbuv4DWhQWEEr5Q1bl92rbDqPwASIZfTLgL35j7BdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751324; c=relaxed/simple;
	bh=wyyCNEg2XaAgHt+MpKO9cro/bi3gmE6YO23StBPm5yI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnSR+spO3mbqseaQ6HTc7RU2KwrQTu5P6/C4MW99RklhTpZeELSBPQJLVyRlyDeycHHDhC9FHDxYChOw16qOymfzJsIT27rgK2d0XW0L/DESymyvjv2wrejihuwjNT7gTLA6AO31z8O7k6gYuROXl6W3pM4ranXAQV9J6vVrG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaXzu39b; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736c062b1f5so1448106b3a.0;
        Fri, 04 Apr 2025 00:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743751322; x=1744356122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjbjq84OY+V2VTQE3ONIBsyDtOPoNqTXO3fKwxhNopY=;
        b=RaXzu39bjYAmakLJbuVp1rw33EDKSNVE3Cc9n2TfspWge8UI0leGGf6PfVSdbkPUFT
         MRAh6HJTC2pFHhdflrHsXco5aPp/id0ye3KhCLgIl9PMUfZHh8Xzs3MvRqX/djXMcJnE
         GVb8hnNfFR44QTlOeCCArghNQrYJldLFMpnGKy5+C2iFa5Fx0n72X5eBuoUD61nmIU4x
         F6UJRCKq3qgNBhNy61AM/FBAfjuCkZSBYMBERVxc8B4wQ/cc3ZIk6e0oRtri85BR4z7q
         7+c6aNqebmrZeAShk53/GHYBW5HpHcleomRAVw4RXmdaw8dAR2Y+tcz0PB2WgEk4ARgV
         9lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751322; x=1744356122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjbjq84OY+V2VTQE3ONIBsyDtOPoNqTXO3fKwxhNopY=;
        b=liMexDps1jkfhUVG9CgeuV5bBjoaeJWF+HH3B6aPa9atCFmejM6gWAprj2E0KkvqRJ
         +sobFpLYQJuhXzgsC4UgN5dU8qh9PFtEFjKipZ7G0O0yCaiiu79bbKLRmnoGNiP8B4Lf
         S70nuMAGZCEsAakljaoNGdVkrvjHMPq4IqSxcT4OU/HnE63+7tEUCMQoRtggzpBKvEHn
         JoezEgbNoUgBeRV7iK+kEGSByk5sGTeF9mqUxlb6G3eQRvGYnu+0SKcoyVsX96mSSLAe
         GTUMWCN6g0QGdKL+L2+f8blrWcGsn8STQRigae0GviTvGE5Z9HAJbXz69whRL52wzBaZ
         8KFA==
X-Forwarded-Encrypted: i=1; AJvYcCUKA9ww438SRu++xSeO80vEVGB2EzdDg0Q4Cw3xp3RrhFudYf2lCNn4DmPv4QI7SIClKQGa1KqvwxWM@vger.kernel.org, AJvYcCUzxvp38ycbsO3CNC1tTILssiHdZyoezyULAYdCLNTKKWjRDTUMKZbk1JzVMtLdBpCdDrSEVSz7f4JdpVu3@vger.kernel.org, AJvYcCWD9mbM5oJY/0YeY21tlnA+vmTosYDqihHRU6kh52L7OCpqZARcMpY6nk3YlBFspDvZJhvGvv+QULNCUUJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0ZCoLqFP/jV/y1r+EoUxd2T37kcJdNYmmITD+Lgo3CsSAakU
	pyCO+QZKe3cDmVeKpwg4o04YPi/nDN2/CxKNSx8JMnx3d3UU2ViQWo0UTxgA1oE=
X-Gm-Gg: ASbGncsVafu2IFa1ixQlHD2m8+O9EEQcrwoD9tEcBh625K0f10eei2O891E8tHi2NzR
	b8ISg+1P2JUwuDMN3/tlgGoQUjxXhm4gZp0MbMdSHp+Nb9dfqGJAyAGA/UqgPKjcTErSRqvrLFY
	pg21kB2mAsBnlNNzfoWJGNBHd+gbOMOvkNfTn24Ib8ptU5TMdKwds++Ywd/kWEqkRmqLSYJzYFW
	Y1v3NgDS9PjeFVWfo+QuEpt8rVlvYWv8xnGA8S5/BB42IXCm5Bp20TZ8jB02rffUyQicjSKQkmX
	8Ontl5PQMBZnCMEaFaB5e0luU6caBgsJq6Etkx0wm3l19/WKkDN9xQ==
X-Google-Smtp-Source: AGHT+IHz52iM0Ut+nIzEPwr7kHc6kYrM80hwVYpXhsX4Ng9bdBpZGSHbEcuYewXJUL8+qRD62QptZA==
X-Received: by 2002:a05:6a20:3953:b0:1f5:7f45:7f95 with SMTP id adf61e73a8af0-201081897bbmr2516743637.27.1743751322434;
        Fri, 04 Apr 2025 00:22:02 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2674547b3a.160.2025.04.04.00.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 00:22:01 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: rpmh: make clkaN optional
Date: Fri,  4 Apr 2025 15:20:02 +0800
Message-ID: <20250404072003.515796-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On sm8650, clkaN are missing in cmd-db for some specific devices. This
caused a boot failure. Printing log during initramfs phase, I found

[    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1

Adding the optional property to avoid probing failure which causes
countless deferred probe. In the downstream tree,similar workarounds
are introduced for sm7635, sm8550, sm8635, sm8650, sm8750.

Tested-by: Pengyu Luo <mitltlatltl@gmail.com> # Oneplus Pad Pro / Oneplus Pad 2
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index c7675930f..68704c4f0 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -66,6 +66,8 @@ struct clk_rpmh {
 struct clk_rpmh_desc {
 	struct clk_hw **clks;
 	size_t num_clks;
+	/* rpmh clock clkaN are optional for this latform */
+	bool clka_optional;
 };
 
 static DEFINE_MUTEX(rpmh_clk_lock);
@@ -648,6 +650,7 @@ static struct clk_hw *sm8550_rpmh_clocks[] = {
 static const struct clk_rpmh_desc clk_rpmh_sm8550 = {
 	.clks = sm8550_rpmh_clocks,
 	.num_clks = ARRAY_SIZE(sm8550_rpmh_clocks),
+	.clka_optional = true,
 };
 
 static struct clk_hw *sm8650_rpmh_clocks[] = {
@@ -679,6 +682,7 @@ static struct clk_hw *sm8650_rpmh_clocks[] = {
 static const struct clk_rpmh_desc clk_rpmh_sm8650 = {
 	.clks = sm8650_rpmh_clocks,
 	.num_clks = ARRAY_SIZE(sm8650_rpmh_clocks),
+	.clka_optional = true,
 };
 
 static struct clk_hw *sc7280_rpmh_clocks[] = {
@@ -847,6 +851,7 @@ static struct clk_hw *sm8750_rpmh_clocks[] = {
 static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clks = sm8750_rpmh_clocks,
 	.num_clks = ARRAY_SIZE(sm8750_rpmh_clocks),
+	.clka_optional = true,
 };
 
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
@@ -890,6 +895,11 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 		rpmh_clk = to_clk_rpmh(hw_clks[i]);
 		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
 		if (!res_addr) {
+			hw_clks[i] = NULL;
+
+			if (desc->clka_optional && !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))
+				continue;
+
 			dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
 				rpmh_clk->res_name);
 			return -ENODEV;
-- 
2.48.1


