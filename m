Return-Path: <linux-arm-msm+bounces-82005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4BC61E36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E35A14E2580
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B6C2EB5CD;
	Sun, 16 Nov 2025 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Y0LGShFR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LRBJdKzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FA199D8;
	Sun, 16 Nov 2025 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331030; cv=none; b=baNqBY6vHK22/HMt2LIqgfoF2dZBeKW/Wfifhe7RWhKo0mK80XHobLKmk4BIlO5O6OiGWHIeYsO/npWtLUePKmdpGK0LrzAJbyOGWtdN5FSUSoA7SoQnCJMk4sHEKh5WITO7Z4I+uXvA+gt5hzyZ3MnL1XwV4fVnIadAdvuRqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331030; c=relaxed/simple;
	bh=D7z5Udwfu4136nZlfPnDUmn8M2fJtmkbkx9l5JibMYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJk780FBQ65nzOtgL2hC2lNSpws4HPIU1guLwXpl1uZuKVuLx0O8XdK+6fAbo3fvX45Hy+mAHXGDxb1YQt6v+S28N6X0y1g5UlMMpeR+mll88kn+dIQDhNJgGfk6m7vQoDgg0peg9Iu+jBJSxUGAO0GzVcnPvRc4fbX7uaV40NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Y0LGShFR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LRBJdKzE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331020; bh=+WTR/z9NFqavXi5Z8ap6tyA
	RSorRTG9M+VjrHTTLVzU=; b=Y0LGShFRb1nQ2bDykoQn1QwJQxmsYV7y2/5vf9Seuq6hFzd4mQ
	SSn2+3eGc1k9znJc65aM9nRuAX44ZB4tP3lwTJHmDnmxSe2euC1QtuvXOdSwcd686RBU0uQSZLs
	vc76+7W7wtXp9lzyCVDs1vnV+isJAbQShrovnr+P+xOPmWQzQxlhTSlGy3kCPUgW8d1uorx5UwZ
	Brw9JCcxMTfCUgdDDJ4uOGajKXSeph2xaBqc4FpaubCGGgmTwBl1nDMiM5uQ2iVeU8t9w3xXtQQ
	lU4yQvl8jr7qWpVJdOAUZr40taaKe8d+wUQKTK82XmB9UUDvI2jq9NE+I6h0uBrwq4w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331020; bh=+WTR/z9NFqavXi5Z8ap6tyA
	RSorRTG9M+VjrHTTLVzU=; b=LRBJdKzELMNPdiEnjRw1VE2/He15/2CEh0OzCysj+dfRjH25T/
	epoEf1+UrdxD/NxHG2ObbPjz7SEJ8oVyJ/CQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 23:10:18 +0100
Subject: [PATCH 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763331018; l=732;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=MpwjxuoIwxEeyFqiYs6VXZMB7MJmNH+TBHDSDL3O1Eg=;
 b=AgjUhp3Ne8m4fmblKV3v9n8VHAoEfelre93XDKiQEMNU7qWJCu2vpOAtfIKMtj4HBZVpWyyYF
 L+3JZBUqxXGCBP+ziS/s/dL1PV1yEQiJvSzoetacOPSyOtR83yFq2pD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Barnabás Czémán <trabarni@gmail.com>

Add missing MDSS reset can be found on MSM8917 and MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/gcc-msm8917.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
index 0a1aa623cd49..248fa0fd86f5 100644
--- a/drivers/clk/qcom/gcc-msm8917.c
+++ b/drivers/clk/qcom/gcc-msm8917.c
@@ -3770,6 +3770,7 @@ static const struct qcom_reset_map gcc_msm8917_resets[] = {
 	[GCC_QUSB2_PHY_BCR]		= { 0x4103c },
 	[GCC_USB_HS_BCR]		= { 0x41000 },
 	[GCC_USB2_HS_PHY_ONLY_BCR]	= { 0x41034 },
+	[GCC_MDSS_BCR]			= { 0x4d074 },
 };
 
 static const struct regmap_config gcc_msm8917_regmap_config = {

-- 
2.51.2


