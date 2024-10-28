Return-Path: <linux-arm-msm+bounces-36204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9B9B3990
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC401F22EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D8B1E04A0;
	Mon, 28 Oct 2024 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrUJpRuw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC11DFE32;
	Mon, 28 Oct 2024 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141311; cv=none; b=n791NdtgBZwMMSiB5T5lwWFtb0mH0w9baTC2/QuwZ70/AFKPbEpyRmBc0ZtVlEOUhISYIPCTiPqVt54IZLj/ptBiFsnc8gOLuQEYYNvT+jG9ph6pWX1GwLiXUhAP6wxoopQNx7EhZAKjBGyqdm3a2rTPKCxsLZFfbFxJ+AIzeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141311; c=relaxed/simple;
	bh=tJy7WRxFzYmpR4M+/fV3d8Qijiy2s/1g7HIRtP8Dflk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZVZKjzKa71QGgi+V50fc94mdl1gtkZ6UWSVWLaiL33bVSoylPZ9PbFky1JrnL28K2ABVWSklcjnOgah8+uw4bthxH70JjemclepzM2iEdDIR1V3w7kyHJP3CrnVwRgonE7vJoYWgG1LQ6/i86Tys5I7lNZX+1IMGfTXEFstyEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrUJpRuw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso626901966b.2;
        Mon, 28 Oct 2024 11:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141308; x=1730746108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WawemXe+1+8ApO76dXS2S+ra0pV/e8rA+QZSseLvbvM=;
        b=QrUJpRuwTXfB8S/5tlOOXkdk/qgSkbnc50Xj+Z+HEKEo6Py6vp3z9CiPx5L8LLBcdN
         N5+dPUJV+xtVpTbf03sZpp9c+ikvV3pWKHeqWT9x3A5CK+Hx6Q6orcpehH1F8SQ4WeiB
         51s08oAQMLJ/Ir9ZG9psMQbrijVVem5J0GjcYGSM5HiFIXeyywYqohiuGxe4IxGHDi2v
         Hae0wN/ei9NYUUf7CV/bg+j/d3FB/JsMf/m3pw2ThoXFpjKHRR31nyqNWv9lifM7GB5x
         6NBskEyYf3WQQcFEHURT2Rjg0lWgt4soKkfxV+yUQ+Ry81myqaQXbX9OrTbMOsTx2O20
         0K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141308; x=1730746108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WawemXe+1+8ApO76dXS2S+ra0pV/e8rA+QZSseLvbvM=;
        b=oGxcdJF0BfIRfr65lyEm8TwgMtuUBzl2BR4X0W3ThRZnNaAiNCJqVi65gNQE8sghF3
         j0Uwne4o2Hniit0RY6jHXnWi3KCS7KTCNREPQcSh8wOtz5lK0x972PTyayAxB0K5VKd7
         /bnbhWLSV0TLNSkNKcShqv3im20Xl4Nnm4RNuDFG1rrRpCOfcza82Zed5vC4KYVrVKNu
         igYXkVfgRpk1Rr1euU9A9DFx8z5oe62t0nkaB6gcUQUKigsCyeEL7NNiijOAygdm74kD
         9dBnNo2F81NdRreTSx/J1uTOH+IpSiH3yhu/0P5XCy6gEtyILhGbhJQcrqbF+ASfzmi/
         EC3A==
X-Forwarded-Encrypted: i=1; AJvYcCULsRSKS/KvOWzrDOcCKhqaTWT3EayIEOEqN7L+dE8dVlEuXRqrFJ0lPg4Xmwssw0aDg+FiozTO+zw=@vger.kernel.org, AJvYcCXYwvO50zh2Nq+ds8iqCIgEbyt11t8zrEGR9346OMpqc1JbHCTs2WCF4Ov308bbieR3YtrBa2pELUyFdjp6@vger.kernel.org
X-Gm-Message-State: AOJu0YzYBGjqqdKhJ2CFbrRh5gtNKx1VnJ8yI5kupgMFHD72Mje7zUNl
	KKgc0fkH98T+I2YPDLt2Gl/GxO840a4oyANBlw0Ex2mKcsAvfL6ERy9t0w==
X-Google-Smtp-Source: AGHT+IHeEImOIFlRf6rqC6W0xEOD7To8xmifzI9uf6RD2K8NXlb3pzQMKVBf/U1LU6OEfWBCyyCMtA==
X-Received: by 2002:a17:907:7d87:b0:a9a:f0e:cd4 with SMTP id a640c23a62f3a-a9de619a63bmr955258366b.55.1730141307881;
        Mon, 28 Oct 2024 11:48:27 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f029617sm397585166b.81.2024.10.28.11.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:48:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Oct 2024 19:48:18 +0100
Subject: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: remove alpha values from
 disp_cc_pll0_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-alpha-mode-cleanup-v2-4-9bc6d712bd76@gmail.com>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
In-Reply-To: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since both the 'alpha' and 'alpha_hi' members of the configuration is
initialized (the latter is implicitly) with zero values, the output
rate of the PLL will be the same whether alpha mode is enabled or not.

Remove the initialization of the alpha* members to make it clear that
the alpha mode is not required to get the desired output rate.

Despite that enabling alpha mode is not needed for the initial
configuration, the set_rate() op might require that it is enabled
already. In this particular case however, the clk_alpha_pll_set_rate()
function will get reset the ALPHA_EN bit when the PLL's rate changes,
so dropping 'alpha_en_mask' is safe.

No functional changes intended, compile tested only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
  - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-4-55df8ed73645@gmail.com
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 449ffea2295d3760f40abe8b1195e9022f46a9b0..d7bb1399e1022afc68e45ee335d615d4a5be5add 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -40,8 +40,6 @@ static const struct pll_vco spark_vco[] = {
 /* 768MHz configuration */
 static const struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0x28,
-	.alpha = 0x0,
-	.alpha_en_mask = BIT(24),
 	.vco_val = 0x2 << 20,
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),

-- 
2.47.0


