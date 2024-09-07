Return-Path: <linux-arm-msm+bounces-31205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC249702ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 17:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF961C21731
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 15:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9442615C13B;
	Sat,  7 Sep 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="app5iGCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BDA134B1
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725722732; cv=none; b=Ufi6hd+1BcMa8ld2EtR25Zt9QXKWb21ySYlOb0mZunc4yEQs1q0d2t5l1vkZJXtd4v9DJtGP4QSOIPY/P7q+XMDPxpTFaB/2kkGuqA43ioFMde8uFVaL2YatmTfneyQvOCrsm3zxK32iTYnlpCu76iHJgWDCn7QspefChHB4w9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725722732; c=relaxed/simple;
	bh=sDSJzjbe9SwW3XEwzeptHKwpOfM0Wc9XeRpqM4o2J4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OVBxyQUVZFhgUI9vUCSWSpI+mQG1rsSanpfpZkxBcWefcOTHh23YJIcKJthUbl6T8myqjovWEqDKSddQp+opf/4nyIxLdlVkGPnbSX7GCGWm659uadKsaXzN4824rdZb0+XzzJmoJagcO/VkTsZKGq97jjvQ8co5/E+rpoFbGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=app5iGCR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a83597ce5beso487015766b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725722729; x=1726327529; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fvAf3Zi7afb3hAttKi9iQz055LSe8tePyulwLorJok=;
        b=app5iGCR+gYD5eVc5+gf4SSdDQi/mcpYm+5J1qbFm/4RSuKOg+PeYN8U+PrL9clmGy
         eMhvAqwnsLDhhUeKhPLwg3nf35lj0w1FzUfuULQanARM6VOb4Gw1XxFUtboL49LTIbQB
         ELilbFSvyLRe+Lyf3PUWHAW87nV119zwlBlaClXUT1j43o4YFk1ZZ4rJSgGa5xAwhGRr
         tMU3enAdmu2Wkh9swr8Pb7trT17BqGBG3g28aLJRU0VsgUq9YGpRigTYLyAG146GyYpH
         2oJVS8BW6CtL/hHlzbVh3XeE495AJi0AofrWhTw3mwqLuYW430/SS0S88R+ztGF6MwCk
         ORyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725722729; x=1726327529;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fvAf3Zi7afb3hAttKi9iQz055LSe8tePyulwLorJok=;
        b=I4kt14gVQ4BJPx9S3uu2IVdHpd4mnW65IimSSLyPcDKCMylNl18/5/j2+DIAkQF4ie
         tJESN/1yGQwGRttZDygt4OEqUfbogfNOsER7gKqSKlJ/qYguVLSNCUEkJ8/pOXoOTc2x
         QojBBBEFV6Mqgi+dxYItsBhrO/AaByI7Mo0B9fY954eiq9kIATt7K4aZMgvel0tru5nX
         boQq/1cF/Ux0GPjTlgc373jl2WbXfjbpCSTcX5KdZRziYBfPBTDlYRawafYRY3YAhwz9
         3QDG6HRjkaSb59DjP48EjPs7hn2d6FRu8yk1ccytjMZG3jSXdMyoYWvGunhwS1eWtnjk
         S+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlLgJwwrtgcdE6TCucpw7Bq1EctZzPyHzzhjyv9OYme0wspIuuVVm6Of/Y6Gs0opbiETGGMOulEE5FwFCM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1tjwi5xTFUgeFacc3FIKcVreqUX1lHDtyDbaCn8QVeRRfGTpO
	uxzuYWS1Mo5gyDT6LOCjsyGJoEMQaORnkGwLC+MKkTyRkprtTJRhHm9JfEfjTrE=
X-Google-Smtp-Source: AGHT+IG757vxvbnW/BrUlpvUGVFgD/Evu6QPkcxl7x0Zje8vkZwedRoOZTUwYxuBTWMDpjFXckc0LQ==
X-Received: by 2002:a17:906:ee8e:b0:a75:7a8:d70c with SMTP id a640c23a62f3a-a8a85f330a6mr710509766b.4.1725722727877;
        Sat, 07 Sep 2024 08:25:27 -0700 (PDT)
Received: from [127.0.1.1] ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d40cebsm82331766b.200.2024.09.07.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 08:25:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sat, 07 Sep 2024 18:25:21 +0300
Subject: [PATCH] phy: qcom: edp: Add runtime PM support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGBw3GYC/x3NQQ7CIBBG4as0s3YSbJpivYpxgeVHJhGKoKYN6
 d1LXH6b9yoVZEGha1cp4ydFlthwPnU0exOfYLHN1Kt+UJPSnPzG73kJDJsY0Txe4PyNHwngFHh
 0xipt3GUaNLVIynCy/ge3+74fWd+spHAAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6068; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=sDSJzjbe9SwW3XEwzeptHKwpOfM0Wc9XeRpqM4o2J4Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm3HBinTe8PkdY049jgiarPEruDCIrfKJuJmAOg
 z7tdxJToOGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZtxwYgAKCRAbX0TJAJUV
 Vqf3EACe+Uxs/dHAw+SM5tt19Plu+PGlhhWTuCnnbOu8l4lFas5jSI2FZMwHeyh8NUesPMKt9JD
 cdcfk6gKLDTtmru83M4Icbe35X5Eq7zEsopNeMV/Uu6sjRFa4YAlJOuhMBGKjNQegYdiz818s15
 UPJKW8+oD89f1BdBH8gd87lxTPjlJRvks2XwPHbPMNqd84bolGuSOUaOSUmMLpOVlpQQVevBCh7
 3iOCv49BxkG4pU6ukVc0B/+jNnWcHWd7cUbkRhZr5i+Y5QjwyVQviK5WrS3sktVHNYRvlGAPk9k
 cLEK6lA8Z6QPlD3IFy1NjCymka+N147wyBk82xlY0hyBTf9jqiqSghXtV2V4qh0OpNvqob22OM8
 5q1z8TUg/g3K7M2jjOsYqbDJbx+F8aO526Pho5NlNhHXbJXytsFSeKVW4Oog6EB+D5YwJ3HFoW/
 jj3P+D+/D5u45hXRS5u47SyjCNSogc+Zzj0be4SH+7seSWWxNaZ2A2c/rIl4ILigU4gm5MBe5+n
 ORpEi0b4qAUQvar11VoGYRyy9Ou5M0O6XcKGKZdKqh4fwaxHKYFvwUxEevm4AN2KTTbhDdPYJm+
 tWVf1/5vrTiRbGkZTrxL1pmcQ/gNi2ThVadBBRFVcc0BGMaZ+v2OZzmU0HU7VWgmT9RJsVtSDLU
 PolYRo7e+06fdHA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Enable runtime PM support by adding proper ops which will handle the
clocks and regulators. These resources will now be handled on power_on and
power_off instead of init and exit PHY ops. Also enable these resources on
probe in order to balance out the disabling that is happening right after.
Prevent runtime PM from being ON by default as well.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 105 ++++++++++++++++++++++++++----------
 1 file changed, 77 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index da2b32fb5b45..3affeef261bf 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -192,14 +192,6 @@ static int qcom_edp_phy_init(struct phy *phy)
 	int ret;
 	u8 cfg8;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
-	if (ret)
-		return ret;
-
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
-	if (ret)
-		goto out_disable_supplies;
-
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
@@ -246,11 +238,6 @@ static int qcom_edp_phy_init(struct phy *phy)
 	msleep(20);
 
 	return 0;
-
-out_disable_supplies:
-	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
-
-	return ret;
 }
 
 static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
@@ -721,6 +708,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	u32 val;
 	u8 cfg1;
 
+	pm_runtime_get_sync(&phy->dev);
+
 	ret = edp->cfg->ver_ops->com_power_on(edp);
 	if (ret)
 		return ret;
@@ -841,6 +830,8 @@ static int qcom_edp_phy_power_off(struct phy *phy)
 
 	writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
 
+	pm_runtime_put(&phy->dev);
+
 	return 0;
 }
 
@@ -856,23 +847,12 @@ static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod
 	return 0;
 }
 
-static int qcom_edp_phy_exit(struct phy *phy)
-{
-	struct qcom_edp *edp = phy_get_drvdata(phy);
-
-	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
-	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
-
-	return 0;
-}
-
 static const struct phy_ops qcom_edp_ops = {
 	.init		= qcom_edp_phy_init,
 	.configure	= qcom_edp_phy_configure,
 	.power_on	= qcom_edp_phy_power_on,
 	.power_off	= qcom_edp_phy_power_off,
 	.set_mode	= qcom_edp_phy_set_mode,
-	.exit		= qcom_edp_phy_exit,
 	.owner		= THIS_MODULE,
 };
 
@@ -1036,6 +1016,32 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
 	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
 }
 
+static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
+{
+	struct qcom_edp *edp = dev_get_drvdata(dev);
+
+	dev_err(dev, "Suspending DP phy\n");
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
+	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
+
+	return 0;
+}
+
+static int __maybe_unused qcom_edp_runtime_resume(struct device *dev)
+{
+	struct qcom_edp *edp = dev_get_drvdata(dev);
+	int ret;
+
+	dev_err(dev, "Resuming DP phy\n");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
+	if (ret)
+		return ret;
+
+	return clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
+}
+
 static int qcom_edp_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
-	if (ret)
+	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators, err=%d\n", ret);
 		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks, err=%d\n", ret);
+		goto err_disable_regulators;
+	}
+
+	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
+	if (ret) {
+		dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
+		goto err_disable_clocks;
+	}
 
 	edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
 	if (IS_ERR(edp->phy)) {
 		dev_err(dev, "failed to register phy\n");
-		return PTR_ERR(edp->phy);
+		ret = PTR_ERR(edp->phy);
+		goto err_disable_clocks;
 	}
 
+	pm_runtime_set_active(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_disable_clocks;
+	/*
+	 * Prevent runtime pm from being ON by default. Users can enable
+	 * it using power/control in sysfs.
+	 */
+	pm_runtime_forbid(dev);
+
+	dev_set_drvdata(dev, edp);
 	phy_set_drvdata(edp->phy, edp);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	return PTR_ERR_OR_ZERO(phy_provider);
+	if (IS_ERR(phy_provider))
+		goto err_disable_clocks;
+
+	return 0;
+
+err_disable_clocks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
+
+err_disable_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
+
+	return ret;
 }
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
@@ -1117,10 +1160,16 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
 
+static const struct dev_pm_ops qcom_edp_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_edp_runtime_suspend,
+			   qcom_edp_runtime_resume, NULL)
+};
+
 static struct platform_driver qcom_edp_phy_driver = {
 	.probe		= qcom_edp_phy_probe,
 	.driver = {
 		.name	= "qcom-edp-phy",
+		.pm	= &qcom_edp_pm_ops,
 		.of_match_table = qcom_edp_phy_match_table,
 	},
 };

---
base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
change-id: 20240907-phy-qcom-edp-enable-runtime-pm-6fad07af8947

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


