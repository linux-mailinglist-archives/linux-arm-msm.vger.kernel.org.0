Return-Path: <linux-arm-msm+bounces-8376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44283D09D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1D8EB24955
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29A412E75;
	Thu, 25 Jan 2024 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ3wH4Gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA76134B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224985; cv=none; b=RGusOg1N8wMD8YuyPSGNO3tEZfvu6mT/gGku3pYGKyBMUpuP+YP9NrM0N6TVeb3+Y0t4bfv4cGiwkluz4HB1NoFW5r4zMukX372RGYZ0VAfN2+qc1298iAG9KBEKNoBqRkKFRwolD4VZQRkt5a20LHH0zfxbmz1kKEJkSJ5eFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224985; c=relaxed/simple;
	bh=FRVvslUljyOQBLlaNGTAULZaLPWz/2M8wuWvzbq5CX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/rAzm3BioegwPqkUdiutpPV3T26bVScHn8CCnK1icJ7S/bGQOG7Ui/v+qpiAe1mHbuWUY8sErX71zp7735w4zvpPn9TFPZiSxuIq75EcvPym6T3xNAxIKqr32IKQsVC8pFkILKhDxjxdgk/swHlGovKZQ2HWJJFBNj7+02hW+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ3wH4Gg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51021b25396so890294e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224981; x=1706829781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wdc2xHZt2Xz4uzpCvpYR0URs1PZWGBE8ZjwolkRZWZ8=;
        b=ZQ3wH4GgCBpHNS9NW0YQ8R+aNMGpZ/hOZRvv/n4fhJc5SX18zBdEWijRp3ETpEc7SY
         LHoqqrqmZIbQMq36FKK4P9qMwEwNJX/cWE2V+VA/USSjK9JWS4EV0i4Hx79GaJc4Lgmu
         DAyebM8KrNp5yLj78zUbb4VsRYHLcCxUXzLpSbkNVQrP/NM2j08pFTQUjQ2b7R0uxPWn
         vqlkE3psdQd5f0puG6mPnEfvVkhtq+6cIEupim+t7LMjVf6WG6L9MdRVkTKvMAh18Af3
         C3RWRy34epzEzK0TaIAIt4WYJuNO7qSjuX7hyjmKYXpudcDbFF0nWiRft/gmo5PazbLd
         4v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224981; x=1706829781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wdc2xHZt2Xz4uzpCvpYR0URs1PZWGBE8ZjwolkRZWZ8=;
        b=vicc+PecZFs2OFVGzICpM2Y71ejE1FzxtF+jdI6BT17OM4zrNmtngpMWrsrxV9yj3u
         tq2tfKHMhroOSK+8+etdtx6W0a/Yz5kTNuQX4747b9DyuPZKDsZ5oSfI5DCp/Fxrq9QH
         qmSuEtrw5wKqNetMLa63IPpVeNnt+Ly4858sI9TMiKckUz6H3AMdtBcU1dzZR7KnXA2N
         OTyRFGsYXTY+58PW4SOMkMep5UfBvk+FUsGbRty1GuuGYC62E5QQA8H52rfG57L4Ie95
         x6MnO52dnxHa2MFLlqTfzw9UESaqSGcxCpmIZRzEagfTroNnz6/OSX+NPVxmZntf45h3
         4LYg==
X-Gm-Message-State: AOJu0YxyhcwIklO4nzl9nCNPMxNpoiatY+b0zvTeKyEIr5Oiu9dR54rb
	G47/JN6wE5m6pISaDAksiQbbsAd5VKkPkPdeHPfSuEX7BdzjyzdKgJ4JKVUS3N7iJuL84IM1GvJ
	P
X-Google-Smtp-Source: AGHT+IHkbQVKPwVIcgIr43lbGB27+XfyECmMTgLwkgL5C53cu2kpPUUTpHTWaCCSzJKTYfn3iRAmnQ==
X-Received: by 2002:a05:6512:2207:b0:510:544:78f with SMTP id h7-20020a056512220700b005100544078fmr214125lfu.14.1706224981632;
        Thu, 25 Jan 2024 15:23:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:23:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:40 +0200
Subject: [PATCH v2 6/8] phy: qcom: qmp-usbc: drop has_pwrdn_delay handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-6-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FRVvslUljyOQBLlaNGTAULZaLPWz/2M8wuWvzbq5CX0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1QRqPS+qA22zL86pzpN1d0spnPOswdMPEIP
 R0a2xRUyT6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtUAAKCRCLPIo+Aiko
 1YTkB/42sz6uBhO6BPVJ/6X4X2gXBdyN2xzgtruBGC9V7X6ZrpLK6jcdUkVcYT1eAG4iKohlrUn
 FU4RMVP+Hkf/gcWJ09hVb94xno/F834I2Co1oaap9PCXEx+OM9MVeS1EQDOGY9H6dPRqTlZsKew
 lmPwIV8PY+w4jpc/KjFOThBvn1AmmDFBWwsbqQCVupKonCHyS1Tcfpf/w8eD8XxRCxtqd4n9i0B
 bB/OgBWWR0CUKC6OM4okf38GBQM/I2/qIROrsY+83yNF52KOTMnibI4JdwMs8T7SmzJe2H4he7q
 YNbBZT/5Nrvk6+MAOyOpgbQMyl1q6E4+tBnsNY/bKwy6kxyF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

None of the PHYs supported by the USBC driver need power down delay.
Drop corresponding flag and code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index d316a541f628..5cbc5fd529eb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -315,9 +315,6 @@ struct qmp_phy_cfg {
 
 	/* array of registers with different offsets */
 	const unsigned int *regs;
-
-	/* true, if PHY needs delay after POWER_DOWN */
-	bool has_pwrdn_delay;
 };
 
 struct qmp_usbc {
@@ -546,9 +543,6 @@ static int qmp_usbc_power_on(struct phy *phy)
 
 	qmp_configure(qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
-	if (cfg->has_pwrdn_delay)
-		usleep_range(10, 20);
-
 	/* Pull PHY out of reset state */
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 

-- 
2.39.2


