Return-Path: <linux-arm-msm+bounces-51538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28703A62F14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 16:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B95189A6A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 15:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC54204681;
	Sat, 15 Mar 2025 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZzJSpGeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F9B1F63E1;
	Sat, 15 Mar 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052384; cv=none; b=afYVntT6HJ5dcjkvwrtHKh1x+aSiXXLzPC8YW6fKn87waOjshpJzF/PTqIDZMY6Rk3zuTDJDaOeTGxsn7JNrmOEsPNOhnKkkAOfyUi7vvedea1wRJD+TQF1oKEmAUWAplT6vapS73hh7U/wWZlEXyjpv1i2Jfl8BoCO/L36ndR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052384; c=relaxed/simple;
	bh=+lG6fRaARBY+IH3B1Uzh2Vdd9mRKlHFu3mGxsIfI4yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPh/nrydcFqQoBYkhaH/rJbAzjBSEw7+5xBe20ldIzye+6o7C0FYZx6COjTZ0odmzX451xt4dKoHbaUeQECJAP7T2/3j9QMwMMflMrMScZci/aj4BsMmpms/DUTNa7jEnhu31KNMhAlmZRsuwBPwgDTeW0JACKCgiCW+CohVoKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZzJSpGeu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C339A.nat.pool.telekom.hu [37.76.51.154])
	by mail.mainlining.org (Postfix) with ESMTPSA id 689CFBBAF0;
	Sat, 15 Mar 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742052381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dotTYATufY76WkE1os667Hn1wurWpAs6DYOLXuaR8gE=;
	b=ZzJSpGeuUlkHXAbT3Pc3zjUmGhM4xzkWRXXFBVJYK61qylUNYKu+lqH2sHUE9jNwqRkGp1
	+dkdfZv5kAyV5XR+IZVcLepIydaLkdzmjZUENn8aed3LYQLDmoD5y2ZzesWVi3KRjuOlYN
	eNozEWWaiMu8GPGSPLRWYMGiBGuwU0azKZTwas5DaNXC7ICL6QJb0YxYcCcbc1vJMSFaP6
	mpT9ktCOrHI7Ty6aag4s9PW31yCrnGnRbRu9GHsi0QlsTFiVoy6k09r5Y0FvavLxithy1C
	lFtC6nVwdE3bokExYg2k6gxtKliZ9wCTz/3Iwk5W9YwIZKJWbDsQZs46uhpNdQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 15 Mar 2025 16:26:17 +0100
Subject: [PATCH 1/2] clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250315-clock-fix-v1-1-2efdc4920dda@mainlining.org>
References: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
In-Reply-To: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Vladimir Lypak <junak.pub@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742052379; l=1039;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+lG6fRaARBY+IH3B1Uzh2Vdd9mRKlHFu3mGxsIfI4yE=;
 b=NkjArYy+0nyR1tQjBFbO87TyECc5OE7qlzyTeK9z2aNUPe3f7E5jlrCpoA8GCGxQdgPfajrGB
 HUVpi9YWwpvB1ZQYAthNQwOmpCF2Ca5oy4hn7qqoPaPTIxVArzu4TMr
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This clock can't be enable with VENUS_CORE0 GDSC turned off. But that
GDSC is under HW control so it can be turned off at any moment.
Instead of checking the dependent clock we can just vote for it to
enable later when GDSC gets turned on.

Fixes: 5db3ae8b33de6 ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/mmcc-sdm660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index e5bdcc75a36ed24a8c72d1fd6ee57083a7f5c499..e69fc65b13da2b519af413137353693473ee258a 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2540,7 +2540,7 @@ static struct clk_branch video_core_clk = {
 
 static struct clk_branch video_subcore0_clk = {
 	.halt_reg = 0x1048,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x1048,
 		.enable_mask = BIT(0),

-- 
2.48.1


