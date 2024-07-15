Return-Path: <linux-arm-msm+bounces-26198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A01931741
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B879B227A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C504C62;
	Mon, 15 Jul 2024 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nF3Yowwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0E18F2C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721055587; cv=none; b=HV5yMIBW+aLeWAdbp6ucATQh/PpmUChSOdvELAM2BsGQXOaV4nep+n25RF9c7iNUMIpekqlcTGWO6TtMu5xA15NcnGFZTBYEjnabNbjACL5RF6n0u5Q4u7PtldojFO+kQ+N9L7Io9zQ5d4ZtOTbUeEsxWKQCj5fEEeflQNubwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721055587; c=relaxed/simple;
	bh=rzHANoUqXG82QQNq7zWwsJk3/CBVzuayepJXbnfYmTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X4jvnUj92FCVzETol54WtE2YmR3XlyHLd7io7I3wrj21SrlADLZ7xWsKPLtk9NsQXIKxJyB90pGUUUHpxNqifT91FvHIG21tOxvh71GVqg9ZztC7dM+0JZJ5etwgLG+cRza0QTaYFJQjh/7XVTwCfHN+G2dMgMRqqpW7obHPX0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nF3Yowwb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4279ca8af51so25853355e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721055584; x=1721660384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C12lGQoC4O6dCA83BitIObz0vvscmP1VuajGEBqvvq0=;
        b=nF3YowwbFlQoo78IH2LtbW0vYNg/QcsJ1ZdwEFchlq9+Xt/0TScrbRIdT/b3vnoH3V
         toj10IQK0xVWqtalCLq6lBCTKSPp93Jn0KR0RyAY2BXCOzGjEjAmteUjEIyWXHUUCP9t
         lg3GqYBCf7mtwQEL5nfaIC3jL+4+BTb8vu5fEZUboHOeJNrnxjMAp5sAc/R6shxwQiGr
         DdecaQyxE3SjG4hdb1cgeTiSthePvvDsXec22nQ48IwQr4IcR/leQRmoCMZsCK8r2vnl
         it6rWDLYVtdbGtQ+Y3B9IK6TbjPviIK8v2n+sJYH6DliAUdrA8sW7xm2J3tiOAU9MuAR
         Irsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721055584; x=1721660384;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C12lGQoC4O6dCA83BitIObz0vvscmP1VuajGEBqvvq0=;
        b=ZmJsUhWK00B0idXELEsLMU6TMaxEfw0AFjL1ARxRO7Poc9AL2Hgo6gK/X1RK2WIAkn
         MXo88btEltX4oebnjiBCiA/wWH0+HR4zp3g4EpJqea3Ct9aDYy1jxeYhGdTwJy4Jr3tV
         dgcVs+dSBY7qFw4fb89MkZyIBzKTl+MNR+YyTb9dlIizptUoYAMBz4///V9rDvxdyS3R
         bqPdRYLYIoGhrk+ZvIW81YxoucPGvMMdsdnshac2xsuSSCuP01uUgmq+YOBAUB5KYJtf
         XDMUxVdv5s6aDZY4n7xyi9QR/IxEq71B+PLGpR9WGPTO9glrWxKqachGEhDXjv7PZCqt
         R9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfErfhVR6e/x66ZoFHSkAiXOaCXfy7D6WNaW3ISPC7MOtNMwNoSHsZDsb7Z9LrcSMR7FUdrMAK14T3MX7NvQ+kCNzrPdjGjJLg1mgMpA==
X-Gm-Message-State: AOJu0YxVm40nzOm+/tmjRuaTj5kp8PCHlvrCfON5GHvJV5FfGvdWks25
	CW61nHDmaYLNYJiLtdCkZ6f94NaK6wJ9HIS71YGBmiJKk2HrOhjeDWSNFomXr/4=
X-Google-Smtp-Source: AGHT+IE5W5I4LS+aadPJhSFJp7ycTKcKABcEYy6T4uVw5x69VrvDLqCqxJv/YubQ0h6t6A8Gr3Gw8A==
X-Received: by 2002:adf:ae59:0:b0:366:f994:33c with SMTP id ffacd0b85a97d-367ceacb515mr14464668f8f.56.1721055584197;
        Mon, 15 Jul 2024 07:59:44 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368155f7891sm4373260f8f.52.2024.07.15.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:59:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 15 Jul 2024 15:59:55 +0100
Subject: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGo5lWYC/x3M0QrCMAxA0V8ZeTbQZNVOf2X40MVMA1pHq1IY+
 /cVHw8X7gpFs2mBS7dC1p8Ve6cGOnQgj5juinZrBnbsXaAjPi19KyatH2SPLiD1WGTgwdUFJb5
 EcLaqBTn4mWjqz6co0HZL1n9ot/G6bTsVVZQKegAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, quic_skakitap@quicinc.com, 
 stable@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-13183

We have both shared_ops for the Titan Top GDSC and a hard-coded always on
whack the register and forget about it in probe().

@static struct clk_branch camcc_gdsc_clk = {}

Only one representation of the Top GDSC is required. Use the CCF
representation not the hard-coded register write.

Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Lenovo X13s
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 479964f91608..f99cd968459c 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -3031,19 +3031,14 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
 	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
-		goto err_disable;
+		goto err_put_rpm;
 
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
 
-err_disable:
-	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
 err_put_rpm:
 	pm_runtime_put_sync(&pdev->dev);
 

---
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-274f11b396ac

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


