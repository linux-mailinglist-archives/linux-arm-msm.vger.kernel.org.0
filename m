Return-Path: <linux-arm-msm+bounces-88144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACBAD06462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 22:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 585DE30A4BF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 21:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5447333AD82;
	Thu,  8 Jan 2026 21:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1F2jZpb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5Y3LLcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA4C3382EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 21:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907107; cv=none; b=iFyvG23I9s9BWptAibjCfUuGaEwNQzmGjb1WuWFnRb490DM47ndwu0E/RNkIXNnTwEJT3Omgbgp7E8PAyiX4S7NhuypyHZXzrRW2pxBhkWl5r7r4AGXI+rdfeVehIDVpFMiHVn3e6IXNgbt3ph7iZc9L0x+ugxziL7vdoX5K/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907107; c=relaxed/simple;
	bh=BryXrBazGKNoFl01TDX32keP0bZwmkKqb3aOoVN6Cjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ9F5K/vhO3spPf1BIJZZGoDYd/ApLuAU+iOc6XVDcPlz5yC33F7XaHLLJWZR4oy1cD7/xWxow5Ec9kgAJAWBxiX/9vaExzjUpdZTyIxH2y18qamEid0n1w/r9zY12CQiMRFbV51ZJTkNrhHdDw7ZDgMo3gb9zOl3woycd5+6sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1F2jZpb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5Y3LLcE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/qg4+psJobyRC37Ow7jCN1m26LSNdI85IDj7JMoxUw=;
	b=K1F2jZpbWPGsrk3nAq+VCOneORmlLI4CUvro/Ir59vJ4pmILaEvYsmfGg8pMnAXH8MjvRx
	IIKQ70mGHT3VSrgivgn/kPBJqCPhwCvjknhDZ+euqMd4wRmBf7czJboHs0dBfzwri1m8PX
	/YocQBxxsYEd6ukiSr+DHYLiM40yY98=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-9ORWU3L-McycIWmSqv6Agg-1; Thu, 08 Jan 2026 16:18:20 -0500
X-MC-Unique: 9ORWU3L-McycIWmSqv6Agg-1
X-Mimecast-MFC-AGG-ID: 9ORWU3L-McycIWmSqv6Agg_1767907100
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9426773a207so9592607241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907100; x=1768511900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/qg4+psJobyRC37Ow7jCN1m26LSNdI85IDj7JMoxUw=;
        b=A5Y3LLcEKBo8/88MiR/X64CHJc0Nq3ezz3ktt0AP9HDP1akNQg7Le1Y26k+J0sQIke
         +cYUzucKGrDca3n1+V84+K0LkBaIkvLQpXgbyfJCLnJTL1hJ34nPwugr1E9MnzQIQ2Sf
         PEKvftSzSPvxQHOcMbvCsUKGDSax/btsUPDQ6MKhPgu/F/FAPQqsCbP1hRtyQCadap2V
         oumZBuqNHPfotmUHbdINpCDYuT24S8WhEhHdNqnDFNe+4AA9xlgIJS535dqQ/kda5shg
         E7kYMCgbwXcb+3eJ105dweZ3Bu41HB6JH5sZrs24rr6EdqGI8Jj172gnOPfHRAx2mZiQ
         3Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907100; x=1768511900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/qg4+psJobyRC37Ow7jCN1m26LSNdI85IDj7JMoxUw=;
        b=AskMsqffdBTEsRQzfNxxz89RTgT/LvtO98xIr32yCHPb5pg3zCBHddod/5tcWOc5G8
         CpQ+qXr16AR9xJwvdIqOUpa0bAayblRQHZS7reei1a62/1oUidwbUQrUAps9jptsreq1
         3nxH6x6J6FuxHA/xUAP//FE4oz228UPdHeGeSxyEHTn7F30JsUeEIUlQwlf850XW0bpT
         uAHuuMZGGb4ZM2aH7V/qyiG4YR0YH4xVlQWcB+4UA0kvbL6RZzWRnrPgd1TtQ7w3aVA4
         kYMhO30fCjyS+2LSJAxj8XcRwiDG7rXi2up0QH1gOnXU7J1LQdmqCqJ3TDE6TcJLfdL4
         iN5A==
X-Forwarded-Encrypted: i=1; AJvYcCU8nRaSXGN/5LR8OoUd5UYJjzcuWBIlSAl3GCmc9dfy7jdPGWtx5Mdvr9aar4UHdKBsZMCTD7v/btxBoyRf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zJLNqdrMk3kXA7kCPhC1ThBipcGWbEIe+cMQHF9dMoPo7eN0
	XLeW6W4zVKNhu328JI5wIZwKECk1KTsgS73PzBYi42cNRS0roIfE/h84z6BTlIeqEm2WuNcelsJ
	hi97jrK2dbltU8yOHke9NAtR2UfQATzqCBfv4C24C3Gr1DY9lUSWfGG4WYal70904D6I=
X-Gm-Gg: AY/fxX6DvYodv0fzNEGTt+glicnGPVsuzlnz9SZLbTdshbhmW5MhpFA33HsYjevTrDD
	BHnM5mIL+eBA3Vv/az013gaPuDebhsqO25QtvJWwVjoJEdec4wCK1FCiWOPCj0QZux4dMNMOZQB
	VnTXbKEjILYfGNQ5AzXrj/kDRXkEC6BvfJNXJxISBpvvC3DSbeYt60oyV8L28NB8iwsgEjb5V0K
	U1zK31pQApod1nL96+csbv9zfGvSs6gB773UWSSQwshwek+vQj2doYDP2ipla/vbXkqT4Ykh8Bi
	1J09S+j1hxSf1If+aqaE0OjkryBw1K7NT2eoZCnIzj6rRLARCm0fVbMix+0FGlpBwiqNQCIl0BG
	p7AShHPUSeF6le1Q=
X-Received: by 2002:a05:6102:2d07:b0:5db:e0fe:985c with SMTP id ada2fe7eead31-5ecb6853a90mr2981780137.10.1767907099673;
        Thu, 08 Jan 2026 13:18:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeIK3vJESvdFK2LZdGsxL/Aj0lfkI8WxHqP14EuDMLA2/se9dutUiwsxhVFozUz0NuzGHQXA==
X-Received: by 2002:a05:6102:2d07:b0:5db:e0fe:985c with SMTP id ada2fe7eead31-5ecb6853a90mr2981772137.10.1767907099246;
        Thu, 08 Jan 2026 13:18:19 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:18 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:32 -0500
Subject: [PATCH 14/27] clk: qcom: alpha-pll: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2529; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=BryXrBazGKNoFl01TDX32keP0bZwmkKqb3aOoVN6Cjw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZknJGs+KEXnBLBtvTUvuaOoJspXgLnrhuuOMSbU
 3hlx5ubHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEyIaR4fWv0MsCIgdZTz2e
 EObx/iWTfuKfmKvH9E/s8dWW5DzgsJ/hN9u2j9tqnD6ny3s0ca+om3PS1Vx4stGxtSIhTcenxBm
 e4QAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 0e56e3369b60 ("clk: qcom: alpha-pll: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/clk/qcom/clk-alpha-pll.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..a84e8bee6534629bf578af6d2592ea998f6c9090 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1257,11 +1257,8 @@ static int clk_alpha_pll_postdiv_determine_rate(struct clk_hw *hw,
 	else
 		table = clk_alpha_div_table;
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       table, pll->width,
-				       CLK_DIVIDER_POWER_OF_TWO);
-
-	return 0;
+	return divider_determine_rate(hw, req, table, pll->width,
+				      CLK_DIVIDER_POWER_OF_TWO);
 }
 
 static int clk_alpha_pll_postdiv_ro_determine_rate(struct clk_hw *hw,
@@ -1617,11 +1614,8 @@ static int clk_trion_pll_postdiv_determine_rate(struct clk_hw *hw,
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       pll->post_div_table,
-				       pll->width, CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, pll->post_div_table, pll->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 };
 
 static int
@@ -1657,11 +1651,8 @@ static int clk_alpha_pll_postdiv_fabia_determine_rate(struct clk_hw *hw,
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       pll->post_div_table,
-				       pll->width, CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, pll->post_div_table, pll->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 }
 
 static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,

-- 
2.52.0


