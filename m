Return-Path: <linux-arm-msm+bounces-71203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28081B3AFD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 02:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 533C07A2A27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35770219E8D;
	Fri, 29 Aug 2025 00:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkbcjOeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E79211499
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427933; cv=none; b=cTnnF9UjJgsGh3tJEiDVz9E/7uu3fXlBIPrwSPqU/xIRfoBpijJQzpLsjKg6lfurEomnVpdRu8oEF/6/xavQFbLIyhkEbPfObC0Ko8EQQsUHgEkfnAe9fCyi2IYJJh9nU/Sbbo4pjgg/5Pr86zjKMGzKewYzFukEH9U4RdujSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427933; c=relaxed/simple;
	bh=77mT8lxlHfMf8DpsPLJTC4LdP2OKAfcaRTXAq7sQvCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6w9G+tzAvjtzi3jVw/9z5pMKlwhnnytFQ6sRdSFWUAxeuPiIAdRN2gQb8ZAMq9Xc0iKV/8ppJdLSVSm8rVO8wkTpB0YTDbvB6xYxIftqzbNXdO5pnPnksfaDOJ2AfX07jrMTH5QKpr1u8I6lbw+aiqUOFLdUuuRcRS2VH1I5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DkbcjOeq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWlxamEZBABa/bI8LuC0OjVu3fNQXV2BqGZu8lwg93s=;
	b=DkbcjOeqjgZU++Z3ySWEYMzDFMJCfCDihKROjX4Cq8YyVfglUopFydOleXbIKVlGrX9lL+
	fz53e5M+n3tMYDe4LKhlmSR3zT2WErwExHTMDQaR1/t5Azf9iDscAUizpQhw84cpOQi++a
	iXdVaVIB4Qg9PILYjQFc0VIYgCTrMN8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-pfgGMJ_8OuelPe_0SeMb5w-1; Thu, 28 Aug 2025 20:38:49 -0400
X-MC-Unique: pfgGMJ_8OuelPe_0SeMb5w-1
X-Mimecast-MFC-AGG-ID: pfgGMJ_8OuelPe_0SeMb5w_1756427928
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70dff062d38so11690066d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427928; x=1757032728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWlxamEZBABa/bI8LuC0OjVu3fNQXV2BqGZu8lwg93s=;
        b=oSK0O9Pq0bIT78vhS83L7xGbSLBNkaKv03uz3NlsLWZQIfOPOIszkT3Q8O+LINUllU
         oBcQnjC+9MJFlouWQruNBCu5A20rvW0UimdhEpn9jM3L4CarbP+2VER66MdsYSLxmJ4l
         nhWIgTHJaxgimtlsvbuiIO93VnqCzVc0PJJtAEP8AWdhWbJZ9leMDONBWNAPo4DIr51d
         PxpVeEdDziQZyEOBO3Xxn5SLZW0URzfU4aVFN09L4nLM3Enqk1q//naNJ6B1SEspiyjX
         qb5JXZmAmS8C96RkQl/EnR2Zj0cmD51vWfjdOYBJO3LGTvSV0+3VwPkAoFI1YoN9EC+B
         sSnw==
X-Forwarded-Encrypted: i=1; AJvYcCVScTNRWHVrobY09gXAEor627B6v/Sc5DDd871IiBWIx+qd7qUWi/CwdqYr+zuWE8Fn2Xs7DpS9lhz4zSY2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01FiGDAz7tNU7MsKp42rHNdfYkZkErHwL4khHoQJxSevGPnBD
	mzHJNLKnl/D0pW8md2N4jD0KTzlS2+2KYACJc4q6w+v9voCd4K9JM6/Z8N1XP4QzNE6iXAXzepN
	x4H5tngHun5rYYv3zdm3/8+9P0ID1/Ya8bEtYijTPiCHAoIGuchQ9v+/W50EjL6Rya3QI8WjqIs
	GH/CZAYXotceb+ODQ6BuE0IZ87UkmTC6g8FoaEB6LTEmGlPQZKMA==
X-Gm-Gg: ASbGncvIjN1gwW9szkJPQzm7/crQdkFr0/vwF1Kz8I58RxXm6/JyO1BkHxDA5VaJDfi
	C1p8jMfCu/AfU5A1iCXPLCFsggWxR7QGpPAja7FKDfstED4TkZjAaw/bvhZvcfZg48Aiph3BpoW
	eDy3ldM5eeITttj1RqTh27nGa3k6JA00nn0/0Eb57/237tom4NtH2ay+bVLwrCkjmJnbbTNa7Un
	6c0kSxghxxYSuHinlX6wyNvX2JHGZQM4CZ0HQK0rBCeP6qccIgYUd9aWm0edYqrZWcMaATPAWXe
	qraWk/WXOAjd5cbfVlKF6zXoz9/m5AD4sHR5mKaQKZXuBqAXNDjaAm4ch4ymcdyOqy0/cfv2xL4
	Ldm0mpTryziNugX8iDpm70jysrNGbO9OjuA==
X-Received: by 2002:a05:6214:769:b0:70d:fe59:7449 with SMTP id 6a1803df08f44-70dfe597674mr27992416d6.61.1756427927765;
        Thu, 28 Aug 2025 17:38:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdFHJee0qbyUjnxuiLN/Oq1qdZlcxXPT+mkBSQmGVwNZcP/pQI/tabzwXXU/AzIdm5XAEiew==
X-Received: by 2002:a05:6214:769:b0:70d:fe59:7449 with SMTP id 6a1803df08f44-70dfe597674mr27992056d6.61.1756427927178;
        Thu, 28 Aug 2025 17:38:47 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:23 -0400
Subject: [PATCH 4/8] clk: rp1: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=5547;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=77mT8lxlHfMf8DpsPLJTC4LdP2OKAfcaRTXAq7sQvCc=;
 b=3gMx5iuOgrCwNi+DCXX7JQxOvLwFiVApn+7Bvb0HH6OCc8cBz7oI4PL5ZGPz6XlAL7fZhaSTw
 0t/u6mMD55zBBJ4Vh8Qfol7XUf066XGn9A4V2i5zqigVDsEhG7+J6Un
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-rp1.c | 58 +++++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index e8f264d7f34e42f7186dbba31e5ace95d67b9a7d..fd144755b879862612ea5e22e913dbb44a140033 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -532,13 +532,16 @@ static unsigned long rp1_pll_core_recalc_rate(struct clk_hw *hw,
 	return calc_rate;
 }
 
-static long rp1_pll_core_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int rp1_pll_core_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	u32 fbdiv_int, fbdiv_frac;
 
-	return get_pll_core_divider(hw, rate, *parent_rate,
-				    &fbdiv_int, &fbdiv_frac);
+	req->rate = get_pll_core_divider(hw, req->rate, req->best_parent_rate,
+					 &fbdiv_int,
+					 &fbdiv_frac);
+
+	return 0;
 }
 
 static void get_pll_prim_dividers(unsigned long rate, unsigned long parent_rate,
@@ -616,18 +619,20 @@ static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST(parent_rate, prim_div1 * prim_div2);
 }
 
-static long rp1_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int rp1_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct clk_hw *clk_audio_hw = &clk_audio->hw;
 	u32 div1, div2;
 
-	if (hw == clk_audio_hw && clk_audio->cached_rate == rate)
-		*parent_rate = clk_audio_core->cached_rate;
+	if (hw == clk_audio_hw && clk_audio->cached_rate == req->rate)
+		req->best_parent_rate = clk_audio_core->cached_rate;
+
+	get_pll_prim_dividers(req->rate, req->best_parent_rate, &div1, &div2);
 
-	get_pll_prim_dividers(rate, *parent_rate, &div1, &div2);
+	req->rate = DIV_ROUND_CLOSEST(req->best_parent_rate, div1 * div2);
 
-	return DIV_ROUND_CLOSEST(*parent_rate, div1 * div2);
+	return 0;
 }
 
 static int rp1_pll_ph_is_on(struct clk_hw *hw)
@@ -677,13 +682,15 @@ static unsigned long rp1_pll_ph_recalc_rate(struct clk_hw *hw,
 	return parent_rate / data->fixed_divider;
 }
 
-static long rp1_pll_ph_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int rp1_pll_ph_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
 	const struct rp1_pll_ph_data *data = pll_ph->data;
 
-	return *parent_rate / data->fixed_divider;
+	req->rate = req->best_parent_rate / data->fixed_divider;
+
+	return 0;
 }
 
 static int rp1_pll_divider_is_on(struct clk_hw *hw)
@@ -760,11 +767,12 @@ static unsigned long rp1_pll_divider_recalc_rate(struct clk_hw *hw,
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long rp1_pll_divider_round_rate(struct clk_hw *hw,
-				       unsigned long rate,
-				       unsigned long *parent_rate)
+static int rp1_pll_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clk_divider_ops.round_rate(hw, rate, parent_rate);
+	req->rate = clk_divider_ops.determine_rate(hw, req);
+
+	return 0;
 }
 
 static int rp1_clock_is_on(struct clk_hw *hw)
@@ -1166,10 +1174,10 @@ static unsigned long rp1_varsrc_recalc_rate(struct clk_hw *hw,
 	return clock->cached_rate;
 }
 
-static long rp1_varsrc_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int rp1_varsrc_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops rp1_pll_core_ops = {
@@ -1178,13 +1186,13 @@ static const struct clk_ops rp1_pll_core_ops = {
 	.unprepare = rp1_pll_core_off,
 	.set_rate = rp1_pll_core_set_rate,
 	.recalc_rate = rp1_pll_core_recalc_rate,
-	.round_rate = rp1_pll_core_round_rate,
+	.determine_rate = rp1_pll_core_determine_rate,
 };
 
 static const struct clk_ops rp1_pll_ops = {
 	.set_rate = rp1_pll_set_rate,
 	.recalc_rate = rp1_pll_recalc_rate,
-	.round_rate = rp1_pll_round_rate,
+	.determine_rate = rp1_pll_determine_rate,
 };
 
 static const struct clk_ops rp1_pll_ph_ops = {
@@ -1192,7 +1200,7 @@ static const struct clk_ops rp1_pll_ph_ops = {
 	.prepare = rp1_pll_ph_on,
 	.unprepare = rp1_pll_ph_off,
 	.recalc_rate = rp1_pll_ph_recalc_rate,
-	.round_rate = rp1_pll_ph_round_rate,
+	.determine_rate = rp1_pll_ph_determine_rate,
 };
 
 static const struct clk_ops rp1_pll_divider_ops = {
@@ -1201,7 +1209,7 @@ static const struct clk_ops rp1_pll_divider_ops = {
 	.unprepare = rp1_pll_divider_off,
 	.set_rate = rp1_pll_divider_set_rate,
 	.recalc_rate = rp1_pll_divider_recalc_rate,
-	.round_rate = rp1_pll_divider_round_rate,
+	.determine_rate = rp1_pll_divider_determine_rate,
 };
 
 static const struct clk_ops rp1_clk_ops = {
@@ -1219,7 +1227,7 @@ static const struct clk_ops rp1_clk_ops = {
 static const struct clk_ops rp1_varsrc_ops = {
 	.set_rate = rp1_varsrc_set_rate,
 	.recalc_rate = rp1_varsrc_recalc_rate,
-	.round_rate = rp1_varsrc_round_rate,
+	.determine_rate = rp1_varsrc_determine_rate,
 };
 
 static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,

-- 
2.50.1


