Return-Path: <linux-arm-msm+bounces-89522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50006D3904E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 19:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 052A53010993
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 18:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166012C028C;
	Sat, 17 Jan 2026 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olfvR3kV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7C1862A;
	Sat, 17 Jan 2026 18:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768673926; cv=none; b=J/DZu17WqXxRxyr2FlxzOrYo0v+m8ZjETnx6++Vqjc9EhAXS2PH2LGvoOrA076NWxeUCZbUuH8hN0j3KYSLHYn2dIaaFIX/W/edmmFzvLtvxE39xfPT4JDrjaSEDqCrwhvdirSSl1gW6LTOemQiEFGEFzuOOtPV286E2y2BW3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768673926; c=relaxed/simple;
	bh=LXu8UxumzYO7IIQmsqvrbERKPlWY+JVjXGDt1uhfYuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I6ekvINPYaU8RZZCkKEDyqBli5r6K9WBUH0aqLlsWxtNL18UOJImc/Y3Leyv16VMgCYLrVIVYjdsGAFlXtIvDj51QgMCkfblwIJtwHxKvxzAowQpwudbLFiiEDjryOI1K+GgPPn+YbZ2WkIrJZRgE2IYKpFMeOecBIJcjmwMxQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olfvR3kV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66E01C16AAE;
	Sat, 17 Jan 2026 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768673925;
	bh=LXu8UxumzYO7IIQmsqvrbERKPlWY+JVjXGDt1uhfYuc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=olfvR3kVrKNUmHnM2A5YQK+ZbR+kDfaNaHvNr8OBbUjr8B1KwAR8CV1jw53fR0OmS
	 HjU1UgoMLeqbiq7hVtx4r2n192k4tO2323Hj5dA8Q5WgZrMBTPUzbNspjF0tF8hUsd
	 BTZoG09cY2ACiIHHdwTUjCZfvPK0LQVoB5fSyzo7kj0v6mlw85FfRQXllB+vNE6mwT
	 8fPlnn8n5JFw7C/E0yy4OmwcW2lXZLfIGW3WT9TXOwVbwxSJVrwNvRNCB5LRVLSSqZ
	 6ficuWt27oXnbfjXpszhq3Uyt1CbAQ5jLRj1JYAwAmJLEnpcy0czH54oschZal8FSo
	 9zxsgMy2Aztxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7F3C9832A;
	Sat, 17 Jan 2026 18:18:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 19:18:28 +0100
Subject: [PATCH] clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-sm7150-dispcc-fix-v1-1-2f39966bcad2@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAHPSa2kC/x2MSQqAMAwAvyI5G0iDVvAr4kHbVHNwoQERxL9bP
 M7AzAMmWcWgrx7IcqnpsRdwdQVhnfZFUGNhYGJPznVoW+dawqh2hoBJb/ScyPMcmaSB0p1Ziv6
 fw/i+H/Ws2eBjAAAA
X-Change-ID: 20260117-sm7150-dispcc-fix-62f062bd20e4
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jens Reidel <adrian@mainlining.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DehSC42DoLuOU48sX00s0uMz8/ZmcNB/sAtQOA+m9mE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa9KEl7PYVfM8z3T/52r1eu/lL5DJxmGQHNlmL
 aqy1wWgkwKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWvShAAKCRBgAj/E00kg
 cjmDD/0QhyDqp28pSI9fXFMiRNW+f587HV1YFHvXnqO1mYu08kw5/7BTvFVW7Lr2ovVM4TQI71/
 Dy/gGMyWVnlNY1CHc4C1xPJQVeRiPfdGh3T/mFx0veBH1hpUZiUvJ4q2vP+Y69NHeeyPqOt4Ekk
 dg2C81t1vC4KzRr45ARtO0AVSDyWVkiPvJhHZQqeIqmgy1a8w5GfRoWXAt5fsU4C8f1FuJead9M
 IoVhAjJlV7uBrDGg0mf7Q1KA3vHWtujuo+YYH2R5C9bOM+i/v3t0EIMU3Rl09edXR5FDJq0Okpf
 aBXl8T3M+gKXev2S/ANr3Y+sGLop3w5OvednjPwXxd7S/cxgt2SYFf5Brw8Bt3lVwoT2FcfIvIk
 ObxW8Itr7IIxgtmjlmnwJcuBBJufgUrz4K5qkwfZKpGT6UrAhT6hjK1T99LQM62em24lSFrz+Xf
 pr87jv1r7/xLjV4uKYfp+/CfWf1w06evYyTv0gtG/IPYO5wQXpWLKLlKQWkHKnBC6h9JG03M2+Y
 +BbKR5KzMo5hiAIR5g20qhiJv1J4r4yBiq/gM6QfcwYpN7qakU0WvFWctmblQVnaa5AiNtFW5hG
 zbgJPwn/7uwocP53xyxR6kb624vZa45fmj8d+GSpQe54PPSy1Q0cqO0POlcK1DcA/9rFbFX8lu6
 Bsy1qNK3BD1Y0Jw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
when switching to it.

Fixes: e3c13e0caa8c ("clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
I would call it more addition than fix regarding to how the commit is
named, but generally both pclk0 and pclk1 should receive this flag.

Feel free to drop the Fixes tag.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/clk/qcom/dispcc-sm7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index 811d380a8e9f9..ed8e34ffd69b0 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -371,7 +371,7 @@ static struct clk_rcg2 dispcc_mdss_pclk1_clk_src = {
 		.name = "dispcc_mdss_pclk1_clk_src",
 		.parent_data = dispcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };

---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260117-sm7150-dispcc-fix-62f062bd20e4

Best regards,
-- 
David Heidelberg <david@ixit.cz>



