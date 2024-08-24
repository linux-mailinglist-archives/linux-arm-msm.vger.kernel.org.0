Return-Path: <linux-arm-msm+bounces-29435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AFD95DDAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 13:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5471E1F21672
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 11:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174531714A4;
	Sat, 24 Aug 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6a07QXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B89815746B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724500747; cv=none; b=C/1d5IFT5/vF29wZatubWciaJFgJ8qQki+J5dKWjJ3lO6eGI/MSQEY9MoTYSNW/8nqtaeUO+pKZ/FBlZ+vPDDmFsuAnfRvljDO9WeyacEJBjoTrdMBd3+25MJrkr2iSZKAgFDxsdpmoIgW08XcTdHYQ9oaRnEDmEDTr+gAQ6TRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724500747; c=relaxed/simple;
	bh=0DuzVKEoj/UXgJ7mEwk1mI8XAwz74JJWB+QxpB2dey4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtQ7QJqGaoVrIkehqZHjF96gRdLVTsQc6z+b+Ft0O3aB2K4+KXPl4yQ7EvAL2C6haYK6SBWNNyMKpxM9fgRLw5gkDG4UqcFAbyThGWxAW5hseEdRzd/lI4tQq9M7U0QtRgk1SWOwCA+15ItmmMA4hoVGYN4HUBpWjbGc3a/WB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6a07QXB; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8696e9bd24so277871466b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724500744; x=1725105544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFI93y00zMD6bCmpfwEIFGjVAprudVxyzc0oGsV9Nws=;
        b=X6a07QXB62MNUrElErXJ+PQ2QJnh2hMxPNfZ9YfkG+0VYxnANmoJv899mwfqqtlSBU
         URvPL0nXwcA5ytbANWlmXYjOnrDJgC4VG3ZyxYdiw9VdhCk11yiqHNRviVffrMEpYgrV
         nZZooPltoUDOydmo6bMQA6I2CytMjSQiM/MUJapP/GKhUWpf6Bx9rQMHsqDQeShioe4v
         g9fn3M9OvpHawxrASbM2bi2skrZmt8PS7qSs6sXt2vxK9AVpJhvIRUC43cZlA5st1bFJ
         gaw6rHX0O/wUCsTrZaBcuPoHxtxxXavGCV41E/XFBQlu/0+rOOxkKfvhQ+t0knh2c038
         rhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724500744; x=1725105544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFI93y00zMD6bCmpfwEIFGjVAprudVxyzc0oGsV9Nws=;
        b=f9K4OBBj5Q/bF9THs5byHICs6HnuSeaaoKFxF02SjCpcwh8bOod4oRaxDkNarZC4B5
         ssUfbgbAKXFbOcMqTFeSDeRI4swCkY0+k8XB/kznST5YckiR9kIRYojV5v28YC2NzBfQ
         7jlH/9PG6/CE76eboMeWpipkXgKkb734Keo7EXJdk6Ls5OicIQfSJExIv+uID+n6RKFJ
         3b8kxqG7T/b91oduYQ1l68AE6zGLab0lMPfRkwQJJ6nPwjUDxRBb+PFbOT2QMGs6jl6r
         4hw1nFXRYnHpUiBGRrXYlx6kM2MA5U7ZRibuY8ix7AS+B178UJ6fBFnuf3jSYg/8/1db
         LXQw==
X-Forwarded-Encrypted: i=1; AJvYcCXR7RbABTBZ/FAoerJui94oQ8QAABhVgSP0Nozke+PqyPfB3ud6O8v09WaPW11etHeLjgvuzXDKaRCQmBwe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3wH4dgRhevQg+6zRtved6T7a7A2rAxRW2d6ZL3RQLXavY6cR
	bF9wXYg6z9VIDMVmYoRDb1B8PBleAlYDKLUQJgERtZ1MgMOfs7QcnEjXINPhLrE=
X-Google-Smtp-Source: AGHT+IFjioJWqfHoLZSyZtpbC3hGCEXMM/p8fgRmV3Ro8hWJPu+jWJN6wQIPD2x7AwJXhGlaVxPS1g==
X-Received: by 2002:a17:907:e2d8:b0:a86:80b7:471d with SMTP id a640c23a62f3a-a86a52de598mr403785866b.37.1724500743573;
        Sat, 24 Aug 2024 04:59:03 -0700 (PDT)
Received: from sagittarius-a.ht.home ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f4a95sm390881166b.210.2024.08.24.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:59:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: mailingradian@gmail.com,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@linaro.org,
	rfoss@kernel.org
Cc: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] i2c: qcom-cci: Stop complaining about DT set clock rate
Date: Sat, 24 Aug 2024 12:59:00 +0100
Message-ID: <20240824115900.40702-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <Zske2ptZAV12YLyf@radian>
References: <Zske2ptZAV12YLyf@radian>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is common practice in the downstream and upstream CCI dt to set CCI
clock rates to 19.2 MHz. It appears to be fairly common for initial code to
set the CCI clock rate to 37.5 MHz.

Applying the widely used CCI clock rates from downstream ought not to cause
warning messages in the upstream kernel where our general policy is to
usually copy downstream hardware clock rates across the range of Qualcomm
drivers.

Drop the warning it is pervasive across CAMSS users but doesn't add any
information or warrant any changes to the DT to align the DT clock rate to
the bootloader clock rate.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f4..99e4305a33733 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -602,14 +602,6 @@ static int cci_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (cci_clk_rate != cci->data->cci_clk_rate) {
-		/* cci clock set by the bootloader or via assigned clock rate
-		 * in DT.
-		 */
-		dev_warn(dev, "Found %lu cci clk rate while %lu was expected\n",
-			 cci_clk_rate, cci->data->cci_clk_rate);
-	}
-
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
-- 
2.45.2


