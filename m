Return-Path: <linux-arm-msm+bounces-8372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F9383D097
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 473471C23326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE9F12E72;
	Thu, 25 Jan 2024 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zz1Nulsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC312E75
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224982; cv=none; b=EvCkiKtutYDxX1rIqXixR0Scw0XJ1EDazMm0sdwH4yhjynvRd3IB29M8DKKWjpTfxCfo6bwlopfGvZgG8j3Xwhz4Yiw1nQfpKIXG7eJm/tLocU3Oy/8ZOZZU2KRKedHkNviZfgAsItr3SmaNNVhEc/30ISMGe3giD8+rfWnue50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224982; c=relaxed/simple;
	bh=xfy7BAj+ACcEx1oTiapyYpNyJtDZXQxvSQMM++aVC9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtfPfAlK2UYxFTOe3hDeul1/0uskTVRgi4hwWriwZYwBWnMs6r5m25mrwDxzHrKvvRVmmC1XFfj2dB+X1WEOVYkgDVc2P4ipISvEP6klNdk50xpxuQSPq+f3MFGozimEplr97SIQqxj6l53uBHJ6B/VxbQVwQo5E7FRTblzQST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zz1Nulsq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5100b424f8fso3659302e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224978; x=1706829778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTLQ0kfdIhJdgR/fG9fR9g8J3eTXdHDr7rApwkCXY8Y=;
        b=zz1NulsqyebydIwXwjqGzcts0y4VzgXJTyNyEd4omP1ALmlfNPO3+aIQDVVkMfqXj9
         kTuuTINqE/DjFFk2VCi2BXCL+E4jxQGMd0auFJcpDErPRAGbwqSsWusp5131VB0vNe7d
         AWRm4dwGiEvOF6rh9nHz4nPEV6TDCCZ9N4D2GDcad9YBZjeLlEaBBnLwuRI3M1B7ZBd4
         I1Ugg/FaW7EajOqbYMhzn9j0GfSipLNEIXgoN/37dZvXli9RWTpLnUaDGEOM2wrKhSWk
         21JfrJ2j4bAiQ/SWS/TBgNaiTOcV3LGu+K1NJ1szBYvY6Ks8vKI0BXnnT2X6RCDCZlof
         KiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224978; x=1706829778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTLQ0kfdIhJdgR/fG9fR9g8J3eTXdHDr7rApwkCXY8Y=;
        b=wwuWkYejN6VN2oK/SR/xiKS+Hmzu2BjH+QnoinfoFc2i5hAhG/QqSxA5fBEgoPRmEj
         EjoZEq67E3SKFS6J2XcFoo3koNSIOzur63IP1orrLc9Fp9nurt9OGpKjOnLmftmSzrog
         DYg0/yd65kuG70I+DmY3QGp+pYf7GuQoAiBTyG7cqjXUimxjzfbNyPM8Fnz9Iz5M07yu
         QIzueEhd4yQLT/40rGp+7561TVAhhpyvXqrjq4T46baOcaiZMxDAnsznfRKM3nu57pXB
         L8e9fN8v2swJqQBDLl7+nFKVflCH962lgEjwvJa4WOyTc2CaUpr59+g44tnt/rNw/nWJ
         KCrw==
X-Gm-Message-State: AOJu0YyjaiLXMdWcymjVgUB1DF0UKNVAZTKGwkSO83YwXW7JM14DVHq2
	0lcwwc9xf5dUbSIlWis2muxCpncy0pXDEGpv3ZeZEk5N+cedlKDZIrObrM90kce5zQbj1kM7U2a
	7
X-Google-Smtp-Source: AGHT+IHHnJqIw8PPU1MRVugvUG+jEy8OfOhkdkdaaqbSUCOae+6lNS4FRTJKDOBQ1vNhqHtxUXtQYA==
X-Received: by 2002:a05:6512:370b:b0:50e:93fa:336 with SMTP id z11-20020a056512370b00b0050e93fa0336mr232692lfr.95.1706224978550;
        Thu, 25 Jan 2024 15:22:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:22:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:36 +0200
Subject: [PATCH v2 2/8] phy: qcom: qmp-usb-legacy: drop
 qmp_usb_legacy_iomap
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-2-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfy7BAj+ACcEx1oTiapyYpNyJtDZXQxvSQMM++aVC9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1P16hHKFzMvHRNqrUIpEsLhOM8lxGMXxtOh
 B0RxGdP4NaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtTwAKCRCLPIo+Aiko
 1bxAB/4/ct+IAbrIsh7ZeBG4MVctyNs00Oj37xkAUrYAPD+ZLpnORjGwfJIxalfiztxkAVTibIG
 q/DbcSQ0mnbtHY1IFQKoiMlWQGhxAy3BZJM8LCBzTlWtEAq2XllMQpB5nZ8PSf1PbQbNgutKIoN
 pqt4nxk9yWql+RSQhVWYIQhCtAMS10SdFLa/Z+lgWSS31/2H6c3OjXMHMIClzFmmVhA5Umw5voj
 K7zgTG/BLS/HbcLVYDquxGTpKulb/0ZnGwQrAX7Nwr49qEeuY+AfsA1fN5QJAW42NVH4J+XxdwK
 zmdI0uGv+2EHSA3iou1HL2ShfNWcr959mzFKjBxNwP+MFaH+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All PHYs supported by qmp-usb-legacy driver don't have issues with the
PCS region. Replace qmp_usb_legacy_iomap() with devm_of_iomap().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 2f8891bc3da8..5d7bb4f58af8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -1166,27 +1166,11 @@ static int phy_pipe_clk_register(struct qmp_usb *qmp, struct device_node *np)
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
-static void __iomem *qmp_usb_legacy_iomap(struct device *dev, struct device_node *np,
-					int index, bool exclusive)
-{
-	struct resource res;
-
-	if (!exclusive) {
-		if (of_address_to_resource(np, index, &res))
-			return IOMEM_ERR_PTR(-EINVAL);
-
-		return devm_ioremap(dev, res.start, resource_size(&res));
-	}
-
-	return devm_of_iomap(dev, np, index, NULL);
-}
-
 static int qmp_usb_legacy_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
-	bool exclusive = true;
 
 	qmp->serdes = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qmp->serdes))
@@ -1210,7 +1194,7 @@ static int qmp_usb_legacy_parse_dt_legacy(struct qmp_usb *qmp, struct device_nod
 	if (IS_ERR(qmp->rx))
 		return PTR_ERR(qmp->rx);
 
-	qmp->pcs = qmp_usb_legacy_iomap(dev, np, 2, exclusive);
+	qmp->pcs = devm_of_iomap(dev, np, 2, NULL);
 	if (IS_ERR(qmp->pcs))
 		return PTR_ERR(qmp->pcs);
 

-- 
2.39.2


