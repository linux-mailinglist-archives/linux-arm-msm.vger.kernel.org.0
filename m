Return-Path: <linux-arm-msm+bounces-61830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C85AE0963
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 467CB7B0607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429E2949E0;
	Thu, 19 Jun 2025 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlHJ+7f5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3B246760
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344937; cv=none; b=gHJivRnMN4kK+RYbZ9vZ//ptXMS2eYdR12tCWUWqVLYZf4Npf/sA8lj+dp7lG6hQEnizXVc0G0CiO92bqOL9f17kzZwoE+WC5zOqlES4Uc5fd+AJVBOXF4JT0cAZJxeHzn8gEvAoUNVWMnRo9IrELMMGXeaRDv4WW4qaMEohdEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344937; c=relaxed/simple;
	bh=YP0zt4hpy/+QohBC/5B6cnpj8boqADRBumXOjSIf4CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP9f4+stM4EYu5Qi0ObYHavvPp3z6pqMfncdfsEFXe+VXhyJzlVBCU2+QmAAUNsNTI862lLaQWx6vhB9JSM5zcp7el8CsGbhT3tR1CZkEZS0zYFlZCPCPJKyzboVbGXLIyVzpEClxt2CK5i7SOTVuHUm8XUYfzsPjfraBl1lccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlHJ+7f5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so13256665e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344932; x=1750949732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBJGB2IFTRq6tKiBkTAUGMtzlXPxtbC3+kWone/1CwQ=;
        b=rlHJ+7f5KSTeauWalJ2t90BaHdHKQAgq/lrvN1OtMXUkzgzfXBj0twZqp1ydbVPvXK
         6jt7L93h9gr5Py+g1wh+n6BUzSgbwL0xWxLEthvSb/J05W77sN0/I6sTWlGKm1GIIayS
         jjCvfW+0N4k2ejoAPCKmyLwgyUJ40SFf2DPvBapzubjeExQPSSZN6Z49ceM470QryrAj
         FoD6as8ZoCLX5KOxEE4TtXE7gk+tg0O6TfvIbR7cG/SrkwyqdEnV3EBFOEipZU3InFzB
         2cEcEydeBfTY2gm4tnc/QE3U140ZikfTrRkp4pPgI8F1SMHRLpjj6D/WQOJAvA9+WNw6
         n32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344932; x=1750949732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBJGB2IFTRq6tKiBkTAUGMtzlXPxtbC3+kWone/1CwQ=;
        b=gAsgE/oT+LcMwM4JDXIec3x+2P9M7mgYtDmUnOEejqQqSY01mFwicoNI1W3EDScsdG
         zy/GQ7usD8gO7VCQfLhFO9XTCwwxPLDfqc3kqe4ELH8PFNUVLlPfG9u0cxlJUaU2/6CZ
         7Udiwuv5f9K1jsNo6YL0Ri3oQINoTH620Z5Ez/gHdmFj6s9xqOHkJ5xpw1rXmsZKS6Pm
         p1zI9nYMmatW7nY0wDAlz60LDyZg1jV84dilF+kH5lRKV9O3m8AKKPsR2IzA9CsJihn+
         FfSuAjK3kkcA1khsMQGOdf1sw0PVHFTWcmGaQgk2jTE2UC5FwYRGCrP4DRSIt2mLLHgb
         9ldA==
X-Gm-Message-State: AOJu0YxYPIE6sRpe6byFGaVfc9MxK1iK4VHT44WB8dPcc/XmUci774+/
	uADYhvHLm60DEuxIur8nNCAv5VQcnLxY746/7qJbGEZllM3M6QqPqmGu9X1EBVlKZqU=
X-Gm-Gg: ASbGncuBpsTUObf5xuqxUUSdrHM3YGk23iAmg/iziNUi87pmv5L/evOs2lwQF5qJtab
	Yg+wFXfZJUbOaz81kshago8BMFIokHS2HqHvCu4+HXeNrcGMhU2YqwvKZH2BTAO3AyMC7NS+r0s
	vYPWza9mSfE+xrkCnmqv0efkvMqKc8U1WbjXnqpiETH4rGtjt+bBsk0nNL3Sex6jcen0jz2CC77
	bJo4+b65ffNfCjF6nGyahWqnAsmp7z4r2xPDjn8EMPTnnrM7FD5JUiPrvEgt7mwzkl5rSJaFWqE
	YUR4NnVhf7xNg8fQi2iebGptHbfy+/d50kQv7Hi0aSCK8COT0z1QiYbqqFgJJByF7BxQRA6hqAD
	kTD6wICs5c/0=
X-Google-Smtp-Source: AGHT+IEpgGoxp+M5mGhGo5r5ZpYgsM8+xMnfypnt8FDho/UvFufoTJ42LhVuCalDv5DlLjJTI36G7A==
X-Received: by 2002:a05:600c:1c0e:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4536039db67mr27292135e9.14.1750344931932;
        Thu, 19 Jun 2025 07:55:31 -0700 (PDT)
Received: from toyger.tail248178.ts.net ([2a0e:c5c1:0:100:b058:b8f5:b561:423c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm31343715e9.40.2025.06.19.07.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:31 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Jun 2025 16:55:19 +0200
Subject: [PATCH 11/11] power: supply: qcom_smbx: program aicl rerun time
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-hardening@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=YP0zt4hpy/+QohBC/5B6cnpj8boqADRBumXOjSIf4CU=;
 b=owEBbQKS/ZANAwAKAQWDMSsZX2S2AcsmYgBoVCTSy356L9shN5c24CVtxUhXn7Isx/OY3glPA
 Njrh6FHrbiJAjMEAAEKAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCaFQk0gAKCRAFgzErGV9k
 ths1D/416VKScj4SMjUY0dv9PE8DXWzElEj6lwhr74bkfBMEyXyWErzFcn7p+c26A0xyw4LPSli
 cCXOvIZdoQrrxI8PDRNaZ73fzrRNgtDuzLxwCrfXcQRiCH9SO0ieiIRI+5fPXHdEaoEI5Ann9Dx
 CLlkOlVjDNm66reyGz6UwnEC/tcjTxQotB8YSymDjsECxum0T7XNMlUFVz1vfyrC/nDNhqbhOGj
 X8fZPAw5aYA3X6f3CmXSvRPNU/7x6RDVwnGTEpJxwn7mPxFq8cb2nTOje1WHK1m7fQN9E5xrAOn
 LkpPn2Eipam0XOjMbZi2nBaFevKkBndswNwCzPAl+WvGwN410CGlFlMkKFDU/SYnfnzeeeOTImP
 SOr96Q7my98Y7z0I2muRuO8uRZXiELIXPDSLowsQpo+sbZJecbb2Enn3MJjcxDetCJqW/+kZs64
 djtXTLk8GI5HiMUeg68zIT47TZqBTOxvcnvvkKiRfDGuRaXPLrAdqLuX+/1MG3BE/xunB9bQBfo
 j7qcLS7tknMx7AKLUS1PxopW3jBf7no8aur/cdd12ZDXXoGkdEETI7oNC5v+lRE9KCGXi4xlWpU
 Altxv4gCDNJCGnPAZUvq6yRsaE9lb2NXIWSrS4MsBjFA6P8Bxvk6awFpy24FFDhGe+Dyai0qcBD
 e0wbf419TZNGD7A==
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

We don't know what the bootloader programmed here, but we want to have a
consistent value. Program the automatic input current limit detection to
re-run every 3 seconds. This seems to be necessary at least for smb5.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/power/supply/qcom_smbx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index d902f3f43548191d3d0310ce90e699918ed0f16f..b723dba5b86daefb238ee6aae19b1b7e5236fce3 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -1091,8 +1091,14 @@ static int smb_probe(struct platform_device *pdev)
 	if (rc < 0)
 		return dev_err_probe(chip->dev, rc,
 				     "Couldn't write fast charge current cfg");
 
+	rc = regmap_write_bits(chip->regmap, chip->base + AICL_RERUN_TIME_CFG,
+			       AICL_RERUN_TIME_MASK, AIC_RERUN_TIME_3_SECS);
+	if (rc < 0)
+		return dev_err_probe(chip->dev, rc,
+				     "Couldn't write fast AICL rerun time");
+
 	/* Initialise charger state */
 	schedule_delayed_work(&chip->status_change_work, 0);
 
 	return 0;

-- 
2.49.0


