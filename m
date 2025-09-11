Return-Path: <linux-arm-msm+bounces-73035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D8B52598
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375F63B7CE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CD8200BA1;
	Thu, 11 Sep 2025 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6/CrHSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF4215055
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553150; cv=none; b=erADijBoJ+86uvCcV4bCQaIMLiMm07dOB7/5r3LP7bD6srF6dvM27gnVK4BiCEvtqaCZbrBJBSSVDPDA5ix3auTW1FA9XulYdWQZrieW2OvI0+Du562OtKPoMKVfPhs2p+UDISTvhOfQjwbSzd1zRvZoDffURJyTPa2Xy66g6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553150; c=relaxed/simple;
	bh=WaM7Qe96KoELIWvCqmebu2CCs763wS4uqian8XW9vH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eByn7GsUTn8WwG2TwCKVXnunlQC1+w5mVy02wcx30GMRa6vuDA8njoiv/AI6vq7ibK0bbGh6ksd/WinTmERbH+xJAgvOth4+MKu1YEYaRpox1WBLW5am9/o00lGqNrqPmBLGSrikwC/4TsFxrORQuYIrNZk9QjgXuSIM+J8o/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6/CrHSs; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5632630dd04so22003e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553147; x=1758157947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNnMo1aU3dafzNGulegf7Am/JFjmJmvZb/6EjXhaCFU=;
        b=n6/CrHSsWuL/LxV/KMtfifxxWfy6kaDU0GaE5KbB88ekQMkOO8j+Dwb4V0bDlbLgip
         tmOcaNxh0bOJZUE6jWvXZ9LVnRJ8uQAiOc9hyQ1PhWNXAGCX/Kvl8Kzc1byF2PJOiuL3
         nvj8GY6jP9sPjqvhYx+p7KG9Tsb6xCbmmkeoTZmQZWHW1cN9WhVwkhyULFqr92e9uorv
         O2uWdvwx2JEAQaPBhDgtSBUvq1hbMHibOpNcHilWpq7RLxCSKxtZC/xrlNf1uLibjjxH
         XPFXWQmjIPhyNaQcEA2ni92Lz1DksKskbipt8RN2ZZE4S4kR6Oy+xX2bEZKjMGu+6E/z
         6fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553147; x=1758157947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNnMo1aU3dafzNGulegf7Am/JFjmJmvZb/6EjXhaCFU=;
        b=DmnLbsESBcR+xXyjfsf+OmNd7nGkgYO5rOii8YFry6jsiNNtXGO6jnBabnHjCWlBL8
         ZeHpDFC1826NTkchTCqZ2DtcVZAq6aSj2KrvbSIse59hNOxzpJVfDom0YBBM8IvI98GW
         mFw36Ea8YompPB5gMoEakNK9wtFS3IM5iA+tKZUZMpuKwshsNjSDSpGryIHJpgkzHSRc
         Ie0qLRYL6s0ktF9NF8mZvZbauY++B66IIASSCpMeKaFOZSEwFEXifbOHhEOZR6sIllyd
         d1Q0lDPKemN6v8xPG7uFTYglkBSXseSzjcWKiVBw/QGx4Q4BDmu70SUcaT0fe0qVZgFt
         ZtZw==
X-Forwarded-Encrypted: i=1; AJvYcCWMi4BMK3EzqG66X6iQ6DUdQw+CWSu42arwWxJ1f7uAFQANZfULJzORD3LPQ6JjQYGGiLvxR7LSAtzmET3O@vger.kernel.org
X-Gm-Message-State: AOJu0YzfiHxom3a2ln6jY5aEqp+UveBkzx8ImoWYgicNxghceCm9pvXR
	w0TkfWVltHULcrmJUPuFgauUw+rJ8F7CfCwBcjDBywdp5ENwJQpodCjazKsy6IGGhAE=
X-Gm-Gg: ASbGncsDzM54wPq1Rjkpp5tdDlWiJsKVlqnou76jRpocrtG48T5IfVYvqdVFqwl22kK
	+75jwxqk1bgKUa6Yv0GR0v8qP1dEa78j+l88ANriaLdfwohcvxQyDoAPhTLYNqsoT0WbCIvvfU2
	2S9ExomEzcsIAelEkwl7fQ2mGAQkUgmlwdJ3sbB2OQtcg/kKjiRgtAo8ePkpGz7653J3/W7tUJd
	8T9Am/eW6YDGvHM7TRGWOLqejrwKzcW3JTutz9xOCARs7HfaBawbPDqUMwFL85+fSRt4vvuR6T3
	vI3txcAgm2yOEglJps9DYmf57xIfhxjtVXfi7+Wf+UlP2CmjazJ70DnsE4S+pkIUr1bcYfn3KRG
	F+EBQ9NXxP6MkTMIgh/KEFVTZoL73UmJODRU8PFfyMYEkfs8MXnAIl1ynWjt7gnxJsgNSB5s=
X-Google-Smtp-Source: AGHT+IGxlvcCfx3mo8PG6Q+sA5UnKT9jfjZQgiPSL1Zhl7rlVZlNXV2Eodf/CJ69IE5YYs0q8OT/mQ==
X-Received: by 2002:a05:6512:3d03:b0:55f:4bf6:efe8 with SMTP id 2adb3069b0e04-5626102eab9mr2548418e87.4.1757553147302;
        Wed, 10 Sep 2025 18:12:27 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:26 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
Date: Thu, 11 Sep 2025 04:12:16 +0300
Message-ID: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SM7150 camera clock controller, and it should include
IPE0/1 and BPS ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm7150.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 4a3baf5d8e85..0e072ae39ec0 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -1846,6 +1846,7 @@ static struct gdsc camcc_bps_gdsc = {
 		.name = "camcc_bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &camcc_titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1875,6 +1876,7 @@ static struct gdsc camcc_ipe_0_gdsc = {
 		.name = "camcc_ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &camcc_titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1884,6 +1886,7 @@ static struct gdsc camcc_ipe_1_gdsc = {
 		.name = "camcc_ipe_1_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &camcc_titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0


