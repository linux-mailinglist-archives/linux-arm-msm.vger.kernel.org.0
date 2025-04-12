Return-Path: <linux-arm-msm+bounces-54115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7CA86F71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D233517F3D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0344A230999;
	Sat, 12 Apr 2025 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sj8cAfai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0BD22D78E;
	Sat, 12 Apr 2025 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489626; cv=none; b=hszu4a3L8ByZIhBXjcn0bkeQQ9M963mO4pDxAP7DTjoPY6rOWJ6/R5YzfU9eInGhMT3Iv6/R+ZiykRljfv9TFDpXje7UI2FuiD0P00DJuYusiVv5m3Ql4s9v0/T5fpnbXzf5Spn6lrur4/78R3ZYidKKOXMajGMWxKfreM92wy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489626; c=relaxed/simple;
	bh=2yy6EjiXxSAPVufYCa9ePZHsjODKDJ7K9wk6lj3SPyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WX9zkkK4KCa6FxVhreAZT+8kqgvaNch+MnkMNKQn2XAFT1eamLFCV5h+ncG1fvxGJ964XbJsaLJNfNWFjfD83UxyJqDoeT7JHtlATIjTnR9QyWEs9Ci10kdjxYHZIw1j7VSfEgpW13y5dt9qt5Fu+waHaUjWIRDwDpIjyYi1TX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sj8cAfai; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1674899f8f.2;
        Sat, 12 Apr 2025 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489623; x=1745094423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=Sj8cAfaiTTgqr/FjwvLSttXs4xT/GFl1I2BQL14AymDqMySD+ZO9ueVZUn7lfOqeoR
         balx4JBhce8bhiZn8/XhZ0qnJtY02LFiLCgltlOzFDApT0CT9kKu1TgiRUIoCNHfLesl
         CS1dktEW+1J095GTocALigh23W/8ZpqsR3dbU6E/sCrgQAEzg2lOcFo/wYY2EebTMEaH
         UpDHdI60R/mbg8RlXdrDbpWIpFLH1unYjvLGoTnGjfT1yrUiWv9fIbIETXcwOyKiGOfG
         INj3Nkwz4VboXZR/xkqzIZwEfHZYWMxzMBo6oarSccJoe3SG7KT03Le+fdyhIY0Bengx
         cjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489623; x=1745094423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=HU7IXqcuXY58ss0t0Yhi3PqVe+iyfg7KbGy7uHoWpJrhK5spVwcsIQBN4M488dx8pw
         ML3pIzJFNuXaqrtmEeE4ReTelw4Vcqaso6U8/6LQutWj5/CWeZtYKrByZzmEWOnVX/jt
         cVqLV1uFGeRqBUDkQNcJA0/oYlFgwyEP/9yUQj7koh8w5M+2OMW0MlRZcWehTZLx738s
         XV3iDoTiplN4Pm4PTfKlgs5R7Z6Pchpf4+Hd7oYUwmojywm6xS8JFPWApxZO52tuCfk1
         BAIFk71VKGMilm+KFGlMxk8UYb6U/fQFEUdxYmErQyjGzrejiwE9p4hx8RANpxK9zRGl
         2XIg==
X-Forwarded-Encrypted: i=1; AJvYcCU+OqNm13PZvSnzVNi4JkRkz/41DDGhsPOXTn/Mvg+339ODQWGiY+hmnnaZ0Yc404Rz6v3wGEQFPW9fbJfF@vger.kernel.org, AJvYcCUXOk5njWqPN/VmH9Jv6POlNkXgavI70Z/aDrYY8eSkWaU8NH68GQWdWPmwOSV5oji100T2wF8O3u+2@vger.kernel.org, AJvYcCUxwytJI8BdYo7ffJDD60oftcCSH9wSFQKXLMIm2aBS+FhHPTmQTvF54ieSVsUO9FegEETEA25qAK818JdvJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6TPa9MhW7Qt6ewLC2Rj9IzPAVpKT4zu56W0jk4ScQuK+oBu1
	aATg6hXdwOYF/7LAlzeC/fzR6BCF6bwfIao2eKJt9LJ2Tyoj1w2PunWQMw==
X-Gm-Gg: ASbGnctFIOXrsp/SA2Tk/mPWa+p38uS/UjJ0rlvPz25pI1IdB+yFJsNXY8molNjhKp9
	x9WpVl3bS1fbiWci5Jkgzlr+fW/yAjUYW9nmSO2RwIYJi7p6mW/RcWZZDsMX0bRCXUpTXHr1xsI
	AEzLuxcNi2qHUr6XcRkp+RPGIvOfaToMsMBMkMKVSaZgghfQwGVnVDXz7yRYWqrhWYCCczGHikS
	WswMCP4pWEr+hMchGUgdsiQGoi5+97WAANXw9sJYEPWwHPFqFD4gwQVrUaN3+awhfN5PQsMDVrZ
	UK9D6aN4p2uvv0+pY0U2qJ9bOGUsZ6Xfwhlj/FDmINrB9objN7wCxKtcBaP5inxd4K05qAjIF3d
	HAyxCbAD7Aw+FfxEy
X-Google-Smtp-Source: AGHT+IFJDUur0adD/E+6mc6RzqJoyEDVCAPitJd/TRf5iOWy3NXGIjLX4HQcNm9eTWMzQfsVlLv4vQ==
X-Received: by 2002:a05:6000:40cd:b0:39c:266c:421 with SMTP id ffacd0b85a97d-39e9f3d9c2cmr5527869f8f.0.1744489622902;
        Sat, 12 Apr 2025 13:27:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 05/10] phy: phy-snps-eusb2: split phy init code
Date: Sat, 12 Apr 2025 23:26:15 +0300
Message-ID: <20250412202620.738150-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current phy init consists of hardware power-up, as well as
QCOM-specific eUSB2 init code. Split it into two parts, to make room
for such non-QCOM init code.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 94 +++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e1b175f48..1933e8440 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -121,6 +121,10 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 #define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
 
+struct snps_eusb2_phy_drvdata {
+	int (*phy_init)(struct phy *p);
+};
+
 struct snps_eusb2_hsphy {
 	struct phy *phy;
 	void __iomem *base;
@@ -133,6 +137,8 @@ struct snps_eusb2_hsphy {
 	enum phy_mode mode;
 
 	struct phy *repeater;
+
+	const struct snps_eusb2_phy_drvdata *data;
 };
 
 static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
@@ -230,41 +236,11 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	return 0;
 }
 
-static int snps_eusb2_hsphy_init(struct phy *p)
+static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
-	if (ret)
-		return ret;
-
-	ret = phy_init(phy->repeater);
-	if (ret) {
-		dev_err(&p->dev, "repeater init failed. %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = clk_prepare_enable(phy->ref_clk);
-	if (ret) {
-		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = reset_control_assert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
-	usleep_range(100, 150);
-
-	ret = reset_control_deassert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
 				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
 
@@ -334,6 +310,52 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 				    USB2_SUSPEND_N_SEL, 0);
 
 	return 0;
+}
+
+static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+};
+
+static int snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = phy_init(phy->repeater);
+	if (ret) {
+		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = clk_prepare_enable(phy->ref_clk);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = reset_control_assert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	usleep_range(100, 150);
+
+	ret = reset_control_deassert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	ret = phy->data->phy_init(p);
+	if (ret)
+		goto disable_ref_clk;
+
+	return 0;
 
 disable_ref_clk:
 	clk_disable_unprepare(phy->ref_clk);
@@ -378,6 +400,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	phy->data = device_get_match_data(dev);
+	if (!phy->data)
+		return -EINVAL;
+
 	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
@@ -424,8 +450,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
-	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
-	{ },
+	{
+		.compatible = "qcom,sm8550-snps-eusb2-phy",
+		.data = &sm8550_snps_eusb2_phy,
+	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-- 
2.43.0


