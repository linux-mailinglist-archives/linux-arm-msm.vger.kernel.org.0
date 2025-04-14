Return-Path: <linux-arm-msm+bounces-54259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E2A888DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 18:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883551899B2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 16:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B6227F758;
	Mon, 14 Apr 2025 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJby2Jg4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EED19A2A3;
	Mon, 14 Apr 2025 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649141; cv=none; b=K0fuPaO5ppgiEA94xXUWN97kG3TdHZq6WDsPdAElDpfiLtCvX44/vGeXCWN5p3BfBJMsIcJic4Gc6B2w6Ndhk3flXT7oWFWCCQursxUtANiPbCqusmmm+54cWlC2nfmHEByFmAMpKyAtxg1i9aOBTV//iirTT25+t3gGenoYfwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649141; c=relaxed/simple;
	bh=UUtRWLWyJUerHzk/XbggQ5MuRdrgseJn9oVb0Fz0NLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Go26YE27Mfbt0W080hdHNGjr8+cGpo88VjOfFPpg/YjFLK6lXxugAZ3PUetTOAKoh31HUYZAZFpbKbmystbCojemnmJJTcgd7W14rTqVMGPnafSYjHdme5JCeRLG/P2mldjdj4ZYSK81IxyjR5WP/nGbIp8lmK3UAGkAyTvEobw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJby2Jg4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC00CC4CEEA;
	Mon, 14 Apr 2025 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744649141;
	bh=UUtRWLWyJUerHzk/XbggQ5MuRdrgseJn9oVb0Fz0NLo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oJby2Jg4zCbeInT1UkA6CKqzysJpj6EqB7nAfrLpXIHCxp4u/o8GrNqBMaG9Iww3c
	 MAzgnURSebWYtp8/UKX6ODMxobpaK0iZm1k829eaiF4LP+s/mO717AJ9grUQQxEFgT
	 QQL0Qmx/nk//klNYb4t3iRrG4K/w5yejlvRed4ApbgfN+xTxM4Zqvxxi5jYnmY6GcH
	 AApoeKuF+Sxp0kFdTtuOBStcKND/vZYjeDuV+CUTlNxQ0ZqAObmlekeCPNX6dkW0xk
	 Zzr8kX1AJuql8/7ZJiPiZYf6cepB8FXe64Zc7SI6D2+lAqvQUolwFrConIvQzlC2sm
	 4tUL6J65x7UvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CD6C369A2;
	Mon, 14 Apr 2025 16:45:40 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Mon, 14 Apr 2025 18:45:12 +0200
Subject: [PATCH RESEND2 v2] clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for
 24 MHz
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-gcc-msm8939-fixes-mclk-v2-resend2-v2-1-5ddcf572a6de@mailoo.org>
X-B4-Tracking: v=1; b=H4sIAJc7/WcC/x3MsQqDMBCA4VeRm3ugZ1JM57o62LF0kHjao02UH
 IggvntDxw9+/gOUk7DCrTgg8SYqS8ygSwH+PcSZUcZsoJJsaSqDs/cYNDSudjjJzorBfz+4ESZ
 WjiOhM7YZjOX6Sg7yZ038D/PmCX37aLs7wes8f4bHAqF8AAAA
X-Change-ID: 20250414-gcc-msm8939-fixes-mclk-v2-resend2-9458a45e3629
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744649140; l=1473;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=rmTNV+QNatPi9Yx+q9e80eZX7u4a7NReIZUsYB1JC3A=;
 b=bL5pEw4ycYvfASyvE3TY6wTsYbglQYSn1nspsXLgmUqe+Ru3JenjqUx2i03WIVWSr2jBXJT+h
 +PCGG8dDluLCnrdBxuZQodXyYLh+YQwcLjxihpKehisRBxvd3wG5DEt
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Fix mclk0 & mclk1 parent map to use correct GPLL6 configuration and
freq_tbl to use GPLL6 instead of GPLL0 so that they tick at 24 MHz.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Suggested-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 7431c9a65044f841f711df6e84008f759e7ab026..45193b3d714babcf56fc0c6877a13a73f3e79104 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -432,7 +432,7 @@ static const struct parent_map gcc_xo_gpll0_gpll1a_gpll6_sleep_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
 	{ P_GPLL1_AUX, 2 },
-	{ P_GPLL6, 2 },
+	{ P_GPLL6, 3 },
 	{ P_SLEEP_CLK, 6 },
 };
 
@@ -1113,7 +1113,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_camss_mclk0_1_clk[] = {
-	F(24000000, P_GPLL0, 1, 1, 45),
+	F(24000000, P_GPLL6, 1, 1, 45),
 	F(66670000, P_GPLL0, 12, 0, 0),
 	{ }
 };

---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250414-gcc-msm8939-fixes-mclk-v2-resend2-9458a45e3629

Best regards,
-- 
Vincent Knecht <vincent.knecht@mailoo.org>



