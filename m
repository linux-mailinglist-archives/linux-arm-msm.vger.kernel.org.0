Return-Path: <linux-arm-msm+bounces-6626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB6826E84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 435A71C21F49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFAE5578A;
	Mon,  8 Jan 2024 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHs6JNJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A1E55771
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a29a4f610b1so178408166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717179; x=1705321979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKgbs50b7sIEW9nFRau4m3gBJckeCz0KQ2ZMPeQV9lQ=;
        b=yHs6JNJqreTfwQFXcptzh+zSgV/ejuNvgeG8QiVOX2gLPS7UjEHn6YtLQnDdoY0X8z
         Amk1wBV6KpyehJzDjoFbJngH6+zjonTIBM+mwdvUfgjeo4XCiS0dSdOjeT1ix2+xhWWg
         bRCc/vs+w/ZZXt7rW2CQgIK3MN1iK2fgtHEmfTFRSq4ZMIiPSzS9a1e3krhqfgjcPjj2
         D8xohC81qulaEWgipt7Z2FTFgRX/HHl8I9rEuzYMpkySEUiPAYMbPnJpe3j+69VPVvKa
         t4briUognm5+qcfeGrezO6IIH+w+Ho7kBP62L8QSVpkFcEA9sFMutSC9FgDAe1So3MqF
         BBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717179; x=1705321979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKgbs50b7sIEW9nFRau4m3gBJckeCz0KQ2ZMPeQV9lQ=;
        b=uw82d+LJbKDc5hiyeNKkQEBpBDnIZKypGG7UpGoKmwuQa9j0IoJMPBcrQkwj9a+3Si
         cMM66hGYhySwnBPokhDFGiwXmcpLAQZOxQZwCVzYT8f4pLtbqGYKEtKx+Vghoo6hdFhT
         xa/EZ13Mh45qU1qfyJuPXFKtnd/+uaFgSrhInPglqOckcBqHQMyyWRx9Vjk2+56RCWg9
         7STuLwtdcQlEHBp8DwU27a4nUYN6IoCUDaI7oYU55W/btxczJf8iPuEQutm/YdbtgQ3Y
         gE/UsS/V9cJvRW0AsC9QXniBw5RTDb7+daXTZOLoZkI8bL0E6DDDqcU++tV3nFRiLUG1
         BD8g==
X-Gm-Message-State: AOJu0Yy78ZWU/FBuYd80em7U4ObRsvcf2KCmcskcyY7gwcZKV0iTVoYL
	UlC/sshlm6T1YE+f7BF6CvdeM+azpZhgDw==
X-Google-Smtp-Source: AGHT+IEvvyXouj1Y3EnF7GkhC4MTfDDPa0w1E2/SZ2gqDjjhApJvimBCHlyu+xXvxhMPfyzaPRWNAw==
X-Received: by 2002:a17:906:a254:b0:a28:fd6b:7acf with SMTP id bi20-20020a170906a25400b00a28fd6b7acfmr1674828ejb.36.1704717179191;
        Mon, 08 Jan 2024 04:32:59 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:58 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:33 +0100
Subject: [PATCH 16/18] clk: qcom: videocc-sm8350: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-16-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=1051;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AdVr2Vo+gKTKy1lOaf9tWddLXbATgKX8KeFGJ/zSkw0=;
 b=wIi+5K4T1WvVGh/iD46R12XlclSx3BIGbgYBU44VJXW0beQIKu4GsbVtmqKDbAhCc12MiGkwJ
 tByulC6Qr8fBWo03C+KT6ixJj+rF1wnViPqH+f7CUr+dGrPvwcpcw0/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 7246f3c99492..8db2bb995558 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -488,10 +488,10 @@ static struct clk_regmap *video_cc_sm8350_clocks[] = {
 static const struct qcom_reset_map video_cc_sm8350_resets[] = {
 	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
 	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { .reg = 0xc34, .bit = 2, .udelay = 400 },
 	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
 	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0xcd4, .bit = 2, .udelay = 400 },
 	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
 };
 

-- 
2.43.0


