Return-Path: <linux-arm-msm+bounces-9988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A922984BD37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCBEC1C20DCE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E60B1BF3D;
	Tue,  6 Feb 2024 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGFSScWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC841B969
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245040; cv=none; b=qXYTSTqhCsDSMX4f0Q6jUw5DeuwgFzB6YgziHamRpoO4MZ1VBbTUM4hXTXQ2Ku7etB83fVPiEzUjYOTWK1Utzh+xEo4K8PmGP5GBcsJqiBV8tuJvhxU0DBb1jFP6Cs36TNipoZyzKh7uEZhtG0tXqA7KXWW6nC8/H3ChwPeAPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245040; c=relaxed/simple;
	bh=Wzt1u2nUXpu17TbhBAtUYSKbvWX7vxBCCMtjsfpido0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccYfBbqf0YY0v/zscy+/P3lEEvLgwBzipXCTJ+JMAKImAdMNFuzFw5Hc084vP+kAWvhQYmPSKXlJ+bv6wUl6W4fCcqksafWwmS4R7P9PvBkgEgJcZUho8n73GL5qU+mBs/aalqp9EZT+Kb8CmnmRMlz5+9B17+qy4b4OUVumYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGFSScWQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a354fc17f24so690892466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245037; x=1707849837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeqI4K6XpkMUVEuF0Qf5K9m4XIcii/fSlxfZsb36s+Q=;
        b=pGFSScWQsTUKJdYa+KHIZKth++r9izSrK876oy6C1iZkDjXkIW/DUL8ISm2F01Uz+7
         hCQ7EX9+JSHMf0GRBEbX7Z7pfxoEqu9r3lxvwoWnG3jRmqMzu20pReQ9eWlnCDbZnqmg
         wY9zjWQ7D5bcnWZPKdPW1WN/a9GzQeOLGR6LBgS3WwqqtBILH6Ot5SbG8EM5dBMHSPzp
         xmPYZYc8h+baJgW0Peh8Pp62ccLEb0btRLjG0hcobNyq2wQhHochNzK46Q4Pl24WwQ/6
         vzxyKtnRbfSY0/aZyl8dFp54BQH4DYIKBMHQpyjqx5PYZMI1nAzE+abewHcViV2tbqB8
         t16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245037; x=1707849837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeqI4K6XpkMUVEuF0Qf5K9m4XIcii/fSlxfZsb36s+Q=;
        b=j0TvnH2SUbmEa4SBFH3hnd7mYbHwBZSXwj/vQRNxzblctPsXwh4khKnyhhg/ucSmeB
         o6HGBPr4ruF47rsAsjRQO5ZZ33t0avaGEXWuerARmx2m24lHKn7/fWciSAgaE4c0bEKJ
         sWwJ8ZNifATmHvjTRWVux/KGyC4dLOsEQTwM0soembX9GlPSPqMQJCBW6NgI4xwDgSsl
         6+liyHbSesyKAzygXKsgr/W09P1ArTvXUka21PWRYyvoF7lCg/f2hj5v2+1UQ9K2zl5u
         957fgYFFA0qEiqlkYT0/X9gpnk4IJYE+sTANnYn0iVKFQncuULUJT7mnl8fnfvmIWGyR
         s3/Q==
X-Gm-Message-State: AOJu0YzH/ebEe4A9EkfyNAX0riFQ3GAmRJuXkhiWMwm3Dp6VdWozxgFJ
	4m5mpHjEd8mglhB8UaCMvJhblu150fyNG4LAfEacDKUO+rgdYLlHArWEJ+Vr7V0=
X-Google-Smtp-Source: AGHT+IE0Bcbl4ouGIaXw6lKWZbbmLrV6tznq5JI5cVJtPSd87CRzvk4Xxe/3TXXMAHSmP4E5058j9g==
X-Received: by 2002:a17:906:e2da:b0:a37:3922:8838 with SMTP id gr26-20020a170906e2da00b00a3739228838mr2607142ejb.70.1707245036907;
        Tue, 06 Feb 2024 10:43:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWC3CrpRdnOTKl6LZR3TO+z2rNAi33UNYzq1ERwr1E+mbAMT6IehWKF4IEyvQIMeAiAh4WYKdgnIvJbdotgTZYi8iWdksvaoCHkvvh1c+WWfcgc6/0K7r0Ie9G69G4GRvPcu8IjW60+gPwQNIHvbcoJB5edBjNN7hOlNHmbniw8X/KUgQyM+aKyXxGhJK9EmetSufi5DVWjeCDuoT0UUo13DRq9Bi72ZxVctwMzi0Yivje2k+Iault+gFAVM//eJQLhT//udlWXP7fswIVqPVzb2+zB55nsJ6LxPzaiJE+rfBBYu8RG59PBpU/J0HykFjneT0s9tOYOWJn6BPTSTj7J82mwzwU9/WtUmIWpztlcjAOg6V+dc0royuHqZ1laROdzR9+nszzUBA1zeyYVh0wLeqFwQOUut20SGKUTJihe6wkDQvkkln7kpk/QlX2xKHx/fD44Gf89
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:56 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:45 +0100
Subject: [PATCH v2 12/18] clk: qcom: gcc-sm8550: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-12-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1016;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Wzt1u2nUXpu17TbhBAtUYSKbvWX7vxBCCMtjsfpido0=;
 b=DcjLxfc2Cefhlse0tnRH627Hek7w2VYLS5W5OTY42IWK6t0FXg4QEljQv5cx8usNri2oN4Lv0
 3lWhm18CbCxBHx8445DKFDmvq4sppy1LA9N/b6BLwI4eabVQtfAv8VS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value for SM8550 is known and extracted from the msm-5.15 driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index b883dffe5f7a..4cbc728f5c72 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3276,8 +3276,8 @@ static const struct qcom_reset_map gcc_sm8550_resets[] = {
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x32018, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32024, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
 };
 

-- 
2.43.0


