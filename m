Return-Path: <linux-arm-msm+bounces-26289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D6932270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0BBB282B34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDF0198837;
	Tue, 16 Jul 2024 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yBiAhxsI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB015196D98
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721120735; cv=none; b=FDvbr5ypuP7ZBrS5dj6NbquGx0Gkxln28f4M5M38gaG68BKEvFZXck2QJkvCNtB9sopMbYdAWjiuhRy7foQ+98U11FJJXkmjTaMBhbLloc98x/Lwhle4FJutwWo60dj3RXtXs2ulBECndKiXdTsRbddPSrHm2OAK9HOt9sbcX3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721120735; c=relaxed/simple;
	bh=MZMZPoolHX3qMdGwUMz1yB9aEjsIJY7Yl7a/GHyQBoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFbtSr+1R4iW8jhG7urPUihxWkD4Q9qzV19MYX0if1LhdxPPMHkzjuKB5gwGlF1dkGlJ3d+x6v0Mc9Nr/jYqHusfT1DYDSzZ1wJKaBZblVnsDbOVZHQon5uiHd4ptjxwaoK6Zlcru57Io3XuO9WgATUrMFbWglTYiS60Ha3ABEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yBiAhxsI; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eec7e43229so62028941fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721120732; x=1721725532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Us3Hv664jfEqjZ3ciHUK1driKOnsZFNkqmoGNoj/7B0=;
        b=yBiAhxsINP9aXEJ/C+4zd6bfet8bPoUQb0NSxsfJDJ27t3EDFoV6Xz8a7xTtelqCJr
         97tUu4LDdKWn5tuBSMjvAB7wqIP1J+aqofx3sY3uvSrfNVFo0ys5wvSeM3YIIjmlcAH0
         /tlCFPxSdmUA3VHCatztv0VD7iLsY6qpYNFHbeSUo7Ad2UhbzWWczdEMWF1yuWJVBXDb
         0vcvFSpAkrGiG7QDEHLRDCg0Eul83eQb/1Tup4h1/Jr0FaNZRNW+Kx0avNMOI+IQXJdX
         wljai69B+nWeG/JSyx8fLsDgl8xVNZ2SVZcg+ar1/DxjD//GbqDTBxIbQa3S8ctsLRS5
         0zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721120732; x=1721725532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Us3Hv664jfEqjZ3ciHUK1driKOnsZFNkqmoGNoj/7B0=;
        b=fUQ2QbJ9n/r3P8coBNSX/cMf0VknCjrKjpN5Fv7+PHc8YP0Pl3c5zUNpUOKmUXs5cq
         RHvuEV2BRtqPDLcs/lL7t9d5OaHfrBjhnJxzD5EQRUayjtXSJQNFjhO4w3BzNZW3aeyL
         ExqWKJ+sK9s0Yfu4me1dcbs9aBQXyC/GX5KjZ0fCiRISwUZZersF5I+vw2tBALcXwYje
         T5mk4mr05csD1enrOIVXmLgL114wf7IXsI6IrWD2w38YfwU3BajxBQ6l7A/poLsej5IS
         KCCivMb5ejkF/4dVur6QHgQUgkVrcQGTnNrTRgckvpdizgWeSP9kd/VQMD0LOddb+FC9
         1Zhw==
X-Gm-Message-State: AOJu0Yz8w6GOSIo3Sxk+yCNQJsy/5tnnUzzcMUb2p/V+iG9ZZJw06Wja
	i4DoMgM5UgQbDMqJBcWcNdHLk4AouqbGRI9QlGCBuhfbAGEQUroIZL73bTxSlAc=
X-Google-Smtp-Source: AGHT+IGEPnIV2C4Xr3faXysx0L8tpOiMUBCIIbqgWwZSCkQ98IJiCgcs0GH9suvRSaEHxRG/LIYk+g==
X-Received: by 2002:a2e:a365:0:b0:2ee:7bcd:a52 with SMTP id 38308e7fff4ca-2eef41ea33fmr10001781fa.46.1721120731269;
        Tue, 16 Jul 2024 02:05:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25a962sm148687875e9.12.2024.07.16.02.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:05:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 16 Jul 2024 11:05:23 +0200
Subject: [PATCH v3 3/3] clk: qcom: dispcc-sm8650: Update the GDSC flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-topic-sm8650-upstream-fix-dispcc-v3-3-5bfd56c899da@linaro.org>
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
In-Reply-To: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MZMZPoolHX3qMdGwUMz1yB9aEjsIJY7Yl7a/GHyQBoE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmljfXaHYyFKQV+fSSyqGNqBRsHNmgNpSIXSNX35On
 5OzrfYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZpY31wAKCRB33NvayMhJ0WmMD/
 4wsWFo4a6vme47ZbsTis/pj3iRJEsYHc/sZZYffEZfC124nALG4AiQDoMbQgkwWEKHWsgYH17BkUbS
 t4ukQ2uxKDDcYN9sjMzSduAik6nCX++Bz3TuMpz9NI8nlc/3OEz7WEnuWCyb8R9k1ApevLT0I7Nam1
 3WEao2gCMCRlfW7Svnjl1/mRuYPZ8RfleHCtsx8QeyiCR36TDKsYqOnA5yIpw6MwNySrFz3SS/BchQ
 mF8dzQCA+E5S1eGk4XiM8O0i+eFASdKXg3CVoL8hfh0DX+K5IsEGFcPuSOL3s1MYBYF4h59OMnOpAB
 Evu0u5IzS00BCXiap4qoF73hPssJ7Z1fKF3oHuVa41VtvAqa9KHGdyqlwqQYYZrH+Vb9Jv6/BH08V3
 G7n52hXf4/sJ9pnyIwzPO72z4iMICh6APc8hTaKfiSbibjoG0KCpQPz59vIJmejqDNgu4fY3/Ci3Zr
 nRQs/sMPc+25q6aT/0BBl1SgwZRiiIA0zFNhDQDeTt832sdcfmT1OXUT7sI7JS13/hRwvsh5Ya5TWR
 qTZbj9XE/Ov+J0oeQ0KfbYcnAOeDR4jFmLDw2MXGaBjbVPZK/TSQpyvBpvAk4QxNQxNvwXH+eyK4Pv
 EW1k/I3tW9yWagP4tD1x9kIawfIV2y+PU7L1vhEg/qnHN8l3TDkUxEVVaK6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Update the GDSC flags by adding missing POLL_CFG_GDSCR flag.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index f38f5f43acb2..bb99c1325717 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -1610,7 +1610,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc mdss_int2_gdsc = {
@@ -1619,7 +1619,7 @@ static struct gdsc mdss_int2_gdsc = {
 		.name = "mdss_int2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *disp_cc_sm8650_clocks[] = {

-- 
2.34.1


