Return-Path: <linux-arm-msm+bounces-6703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD587827D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616251F244C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6587A4688;
	Tue,  9 Jan 2024 03:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVjL84YG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5433F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd56dac1adso17828381fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769444; x=1705374244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTLQ0kfdIhJdgR/fG9fR9g8J3eTXdHDr7rApwkCXY8Y=;
        b=tVjL84YGVE2CkeJIer15ZHrvFvfXSZy7Jgx3qPfwdriTdNKRRv/P6LT+pQGbR2kyKF
         d22cYgJjt++o+PmnWAFouuEElZ5xsvnvVTO6XCVPoBfFO3x5hued4dig3j3ad47bxDLD
         WnjI31e8a6NrzeayQRORRjYe12429UlZev2ucHrXeYrXfX7+vArRBbHF+j9xPNQ/RVhc
         h5LV2lUVFOskFjYOp5KUFgM389wqHKf9jRMp1QqNW6J3oTXfBq+1LoU8VO7dMlHeyxcW
         kvbOgfpJlYDZd84ARAGbm5tO1B7l27BRUjIGiniB72zpL/9vhuiGt6v4HMC5dK2D6CeL
         5J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769444; x=1705374244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTLQ0kfdIhJdgR/fG9fR9g8J3eTXdHDr7rApwkCXY8Y=;
        b=Avnc5/1Qz/PGuSvtDo+Ib37R/elUj6MnRnvMt+iOG2Lhc/mWdoG5cnrFEWftKHr6uJ
         Zx/wO/UVeZMXaEH1PuEvfjhFGrs7d6CbiXNCWKgSd/xTxh40eA3Bkrghrz6ixMyAdM3E
         XFl9v6qE7MLmzMaJmyozxsml3VD0DruUJp+RaahkAWVpfsgWXqvzDzpUAdTMGsFO/TuK
         hhIDPBTeisSQRPq9hdtYMAD1aSakLxTm/n1KLTNksx5xW6rgILdk32eqKSDPTqPK5AGw
         X/wx0CuCHkybufmLnmSoVALPHM10Xm1vmk//iFjvkXRGpfMVxLsLZDUwIQ+eQOX3FQTI
         tQuw==
X-Gm-Message-State: AOJu0Yy99BE30bX753Hfg5ZvyiYUG7vDZ8YFjGRFs6yDg1q6Ys/eWYTs
	NC3yvraotZrEg1sYlJHIK48IjvM1NtWBsA==
X-Google-Smtp-Source: AGHT+IGhzWMY9a/QjlTHWHe0VvNW8wpdPMej+tRAJyRlBEILmHli09M3nkaitkS80cKRdxacrlTvcA==
X-Received: by 2002:a2e:944c:0:b0:2cd:39ec:c31d with SMTP id o12-20020a2e944c000000b002cd39ecc31dmr2112547ljh.46.1704769443953;
        Mon, 08 Jan 2024 19:04:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:00 +0200
Subject: [PATCH 2/8] phy: qcom: qmp-usb-legacy: drop qmp_usb_legacy_iomap
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-2-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfy7BAj+ACcEx1oTiapyYpNyJtDZXQxvSQMM++aVC9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLeg5wrrW3NkDTuY1UyAIkdFZxUDp0ETEGghl
 IFNtxbxjPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oAAKCRCLPIo+Aiko
 1WCWB/9zyuXLEBTouKZWdQVBhAhqbLE4/W1AV0jCGGMl1FUYDhJKAt2cvLF/hTTvrVKOGepcHO0
 JNxsfIs2TkwtwIxj4yICR4bSRN0E48KkD1PKi0eGrUnOnIOqqjaLd85MkqXK0e0rleEkvmoD7HB
 aXTneYq1EzpMZCmamAchGgrZz5ypzKiJR4F7DufZ/0AyFloFZNnQ47pix4qj6fgODdORCU37MnP
 ObzQf8fJ6cITanK+U4iqonBz3MNK6oOWVryQkk5vJdE/DYmnUv4tAbC5zSYxpRul4SFTm8xFntm
 gXOe8UF5ME7zwqKv67fFNvt7kyc2ZVhH1qv+Cz8ZsHxYLy80
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


