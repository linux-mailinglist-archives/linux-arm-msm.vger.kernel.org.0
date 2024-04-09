Return-Path: <linux-arm-msm+bounces-16946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1489DFCA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 179011F237F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7C6137C38;
	Tue,  9 Apr 2024 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="g4WKyRLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24613AD3F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712678191; cv=none; b=e91ijHG9ETCsfe0944dkkdswO6FMK6d1U53L+RzOS568wuY7oTz1LSxoHciih7RcifxBcdL3kbEAxPMVyijer1DMM0zFNEwv2AsXayBR2nw/HE5/rHyVDqtY3yHhTIShbVNak3z817DtT0AFSG2nZbHl6DfktrAmr3PEdE5eU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712678191; c=relaxed/simple;
	bh=0EL7q48SD7Pfo4SF/I+36RQ47z0oPGDnuZvI7MsfOuw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=E4lv8NmyVxPJoDwNSWoYcH+61fMKIFKcdM8awSXiwZY/bJNN0wXpGeHOr3oBJqSRGcuB8qEE5CFaic5LoXhayhxa2OtvlczvmLgVytr6j8n8Wdf6p7x2RxdYnxVRWH4gMnRCgUGXJKL2bEwhMkbkyiL4a6sxSI0HBgJbWeT/hWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=g4WKyRLm; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so53927981fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712678186; x=1713282986; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0L8Mm55Y48K0HRs+yI+LOWXO//blhz34iBiLgs48e8=;
        b=g4WKyRLmOYUZW92kG4mX72Lr6Aqm2slSYsLQcJbwxJJLUOmb6sg9Fvuz4OHPjqPxJP
         I8+W0HR7yq8C5hacS4/tO3ACvt+YgAG9ZvddV8lwqZW803IfUUzDmMlXaCy4xVD6TQfm
         DTajlND5Eu6u5g55Ny43Zo8XEQ4/hWOasXgkZCPX0Kq4yNGZBYOUQHT68VVjjUIE9Lwy
         AtNPQoNDtgWu6OUVWpMEzZzu33eThkWY1WkpN69lSiLWAYANK23X9fYAVS6VnaQnV+us
         geXytHu7B8Sd1iMBCWJa/Jvxp8UB3ecanDYKeEQUMPC5GlluYDcDwDKmouYgkXlu3g2X
         dKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712678186; x=1713282986;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0L8Mm55Y48K0HRs+yI+LOWXO//blhz34iBiLgs48e8=;
        b=ief6ZPvATb49No7sTy7RwjB+QxP3MlIx6QhHBD2/ziU8s8LZZ72fDdjWPL+YcDGHUh
         w7CfVilltIyi1b6KXzkr6QmWn2tHGAYERC1r2C8najIk9Om79t/RFAa1J8mRXEEjblUJ
         ywhDP27/7zemkWdlWojdqlUAXMdibS6Kb80mTOaXDSGnfUm5uIR+gPgDaTyYVhuOV4Ay
         VhjoFTbehivOs5cNVVk9wHzc0sAVcjofq+IKRi8GensyFX8b+hMEAlD/m3BYtc34TWvt
         Gw1dhOxQUBxByBIPAmvieK/7LYYnzEwPKp4BytSOrO0naOxFv7I5ju4oXInE314qv+Zx
         1dzA==
X-Gm-Message-State: AOJu0YwrLzrIDLW4rBcQNC3WVl1j4tVxhXyuEjlffOHYit7sKO6U6ElM
	Lbw5PjgwkfHVG1oPny7gvolSlPI3nC6FnbmEy932oIZkszL7NSM8/EwRPHh+m2Y=
X-Google-Smtp-Source: AGHT+IHv8WEAEFEW94VIUaX6ZXRBqEu0iL+Y5GIpF6W6uJOgCCs1uDXUoyf4bInd/WGDkbVNPs4YDw==
X-Received: by 2002:a2e:9994:0:b0:2d8:a889:172 with SMTP id w20-20020a2e9994000000b002d8a8890172mr157295lji.8.1712678186502;
        Tue, 09 Apr 2024 08:56:26 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z8-20020adfe548000000b0034335e47102sm11735519wrm.113.2024.04.09.08.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:56:26 -0700 (PDT)
Message-ID: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
Date: Tue, 9 Apr 2024 17:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] clk: qcom: mmcc-msm8998: fix vdec low-power mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use same code as mmcc-msm8996 with:
s/venus_gdsc/video_top_gdsc/
s/venus_core0_gdsc/video_subcore0_gdsc/

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h

0x1024 = MMSS_VIDEO GDSCR (undocumented)
0x1028 = MMSS_VIDEO_CORE_CBCR
0x1030 = MMSS_VIDEO_AHB_CBCR
0x1034 = MMSS_VIDEO_AXI_CBCR
0x1038 = MMSS_VIDEO_MAXI_CBCR
0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
0x104c = MMSS_VIDEO_SUBCORE1_CBCR

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/clk/qcom/mmcc-msm8998.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 1180e48c687ac..275fb3b71ede4 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {
 
 static struct gdsc video_top_gdsc = {
 	.gdscr = 0x1024,
+	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
+	.cxc_count = 3,
 	.pd = {
 		.name = "video_top",
 	},
@@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {
 
 static struct gdsc video_subcore0_gdsc = {
 	.gdscr = 0x1040,
+	.cxcs = (unsigned int []){ 0x1048 },
+	.cxc_count = 1,
 	.pd = {
 		.name = "video_subcore0",
 	},
 	.parent = &video_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc video_subcore1_gdsc = {
 	.gdscr = 0x1044,
+	.cxcs = (unsigned int []){ 0x104c },
+	.cxc_count = 1,
 	.pd = {
 		.name = "video_subcore1",
 	},
 	.parent = &video_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc mdss_gdsc = {
-- 
2.34.1

