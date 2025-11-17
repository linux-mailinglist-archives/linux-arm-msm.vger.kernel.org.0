Return-Path: <linux-arm-msm+bounces-82146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E6C6589A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D9E343A0BA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C4D334697;
	Mon, 17 Nov 2025 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sq+BcuLs";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Xleu2dRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFC301468;
	Mon, 17 Nov 2025 17:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399911; cv=none; b=DBcIN1PTOTYrr1WE8cClmDctbJEDDn3hhTRdm1eM9R9LU4y8hCY+paB4rqA8h6fPwUvBRx4zpO2eLCHDOiNjEFZplLI4BTXCwYL0pGx4Kf1kas9+sX6AWPtsoXBF1Bi0Eo9fai2c+LrJIN75mm1B86ucncxsjuxbYiKSdxupYiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399911; c=relaxed/simple;
	bh=J72O0W4OoBDTduTpAcYN+ssV4ETS0bPe46i6M1O3RIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2NPwueAKng6pJSk1JadzkFBrTHecy6Tvy2u9HePoeRBp7UC389Jfs/ep0DCy1m+XSRCy41zNm23jplMqT0dvz4b1mkgax+wH1NKwP7+VoAtqNyr9QTlx4/5qNAFVrcu6RwInoBAKQig2UnWnphRRakB7VjfN09DFd5ZK4mXHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sq+BcuLs; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Xleu2dRx; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399876; bh=WhUzabx2XCE82BELNFa8lGY
	LmZ/E2/CKw1AHgV+jL7Q=; b=sq+BcuLse244rsHHfcFbOWauQgfB3ycC5cX2PVMZwxTpvpDiwF
	giKDxHNcTUjHL9b8MB43PaV3i5Kith5mtor3+CkXDt6C5wBVRa1U1N4zXQUE7XPlTUh9rOaiM0P
	UTa+6rXvl650vuSue0OBLsN2JcSkQCT+hIddIf/0Lt3xz2G5h7HH9Cas0nXIBcN0uuxEf/uiAU6
	w/uWkHgJSCF+SrXd5jPh4kKDTqGBvUpFOujRHXXxXEKh5Q04cGZ5sEdVxCerhUYuUyh4kKWuU8U
	QTDQFePcHLtZTnaZLzzf+9zszQclmh5wEGMwh11qv7rFbdeJXdDi8JaYZ04NLv7SNNA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399876; bh=WhUzabx2XCE82BELNFa8lGY
	LmZ/E2/CKw1AHgV+jL7Q=; b=Xleu2dRxk///XdHAWf2FJWeitC2Kx5esZVkaocoEh4T7eYlFd8
	Q0AeR6BnOvjOqVXF6y3wcUrs026Qi9+M1bCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 18:17:53 +0100
Subject: [PATCH v2 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-mdss-resets-msm8917-msm8937-v2-2-a7e9bbdaac96@mainlining.org>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763399874; l=787;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=J72O0W4OoBDTduTpAcYN+ssV4ETS0bPe46i6M1O3RIo=;
 b=xSiWqrGhq4jvLOrNAxO54UDjdYt/E0Gkd2rJWHxS02tuD2P3anQRNO9oegDQbQfGePht4lPGN
 YtvNvz+bKDQDR8wqaMWC432zhogW3ErYktOiNFkOYc5fZcFJrSkhoZk
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add missing MDSS reset can be found on MSM8917 and MSM8937.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
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


