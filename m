Return-Path: <linux-arm-msm+bounces-42816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70419F80DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4C827A07D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A2219D8BE;
	Thu, 19 Dec 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QE/QoBta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1919D08F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627625; cv=none; b=bnc6LK/FVPV2WDHdderZrhYRy01rjiqrG9qOqVbUZwXVx09pFxKQpAn5+AgJ5PvLiLAbyR9mcjlzvFrr1DrFlOTaV2iCYSZIp/bW0N13Byl+7+sJhB5bDwB4ps/odwDnMOVrbvldlJpRlAM1jiBGjYiuhzAjitoNU4jmNthdEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627625; c=relaxed/simple;
	bh=wckcOULVs/VpNyLdFrIVHSAJAEPzlkpkYIhbXxO9Efs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkBOP/k7YtB6GqRiWPAlNQqv94s+qjh2G/3Be4zhM5VfoFLEzoUrQuus2UBqzI89eEhXT+Jgyr+uhEUrFstTro1vJJLQlJbWKeR2eYCo8VZsIQSVrfGv3plfIQeTiGXg+iAxWjY7N1KsJoUa3EwabSlfwFb7GG/ZqOOkzYpNL8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QE/QoBta; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21619108a6bso8869145ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734627623; x=1735232423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CY48cM88V/hoEtiU2jZWM2+6ic5R8sHZknBHQXdoTnM=;
        b=QE/QoBtaVd95p9Pxb/cfG/krrjY42NDUCYg2AMYR/h3qMWXi+0zi+jS9FcD8KzQqOC
         xjayYrR5NTs3ljakmwMhkGw/ddMQG2DkwpMg097wQ+GhJOasbLty+LDk2/mtqMz2U8wC
         c8giu9qnyswGIfGWHEyp4IcerPdSQZZF8tW6RekacpSl8hBszsrsgWPXuyl6Sfy7rMEf
         iYJkIA826jcF9BuVKBBHZ1SNjN5QrgFEmnCX2dFwpmhV5WWclwgYRxMiKs2h8U/AZNXX
         wmWQ5VLFuVhM7pAxy0iY8XOHBLKRUGB4i7EjfQexzAuxYiKymQ86ET6mJczoJFXHDmod
         yw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734627623; x=1735232423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY48cM88V/hoEtiU2jZWM2+6ic5R8sHZknBHQXdoTnM=;
        b=V2ORrHsSisZN8qvr8SD39GiAsLW7AmqR5ZHLyLk8CclLaLWDB86/xcahXBHkgL760a
         NWoNedd9g8kf6QRX+B/EkikMRjTOv1AylK8e5adDmDnt9w0wF1y+9Hs7TR4Ow0ubyPnN
         vn3hhyNFSg8prgmxPH3kFzmzGQCTliZgSSAYpdXCTl9VazEfPQe7PMSvbaqs21VQ0awA
         okuq5jNl4xTcUpelNz+R6vO7vXgLlOwBuNlTM/G3oVQymZzz2mj3m5mazVXfxULOX+yG
         RwRHgs+Sf8gTsX0l5qmlUHZFF0eYjMfnJn4B4VMESfeZufiJkGIFFPn5YWP3BwVpLz07
         /csg==
X-Gm-Message-State: AOJu0YwglZFk7stYwf1W+QWLcZ0gLm02MfY7NTQ2Od2e69ePJQl+q3WB
	v4lCyjVmhQGa8NBsGh2RU6Xy8Uhxn/+xHiq4OwbGG+AcAUMqRx1v3wCfakr0Pg==
X-Gm-Gg: ASbGncueSD1vrryeXfYkJoPm9cBKdOxseieJ8OS4H1Ivd8sXVX3IsaZoZN8MeEmb3vr
	5d51/P3qLtLbWUHZKuCIApsaUpPlVvrOyVipJEo/LdnK5DWeh6/gYTP2IiZgZEXoe9sG4VGFgN2
	zPY7jJPjBsXwJjFRW1XurH/YQSyYCOcOblDxgQ2HKDagYBLoC6SJXAo27TFk2ON92weECRjFH0n
	0tQHSJakMij5r84lsdYiWR7CZ6HffVzWpTpSsbgOIbC+QbjWtsy5kvnUsPVTkiuj/ih8h/u1UEr
	g4Rqtg7uiQ==
X-Google-Smtp-Source: AGHT+IF61HYlBzOFtWSOXFDjQ6xXqIF+VEUhsruBuhPEigas2YyUqvrel2CTtb8tVYlJgL/VkknJUA==
X-Received: by 2002:a17:903:2342:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-219d9692d58mr57695015ad.42.1734627622843;
        Thu, 19 Dec 2024 09:00:22 -0800 (PST)
Received: from localhost.localdomain ([117.193.209.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e32f5f00sm1407655a12.72.2024.12.19.09.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:00:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/2] clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Thu, 19 Dec 2024 22:30:11 +0530
Message-Id: <20241219170011.70140-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
References: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Cc: stable@vger.kernel.org # 6.8
Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index fd9d6544bdd5..9dd5c48f33be 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3437,7 +3437,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -3448,7 +3448,7 @@ static struct gdsc pcie_0_phy_gdsc = {
 	.pd = {
 		.name = "pcie_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -3459,7 +3459,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -3470,7 +3470,7 @@ static struct gdsc pcie_1_phy_gdsc = {
 	.pd = {
 		.name = "pcie_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
-- 
2.25.1


