Return-Path: <linux-arm-msm+bounces-70193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CFB2FBA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FCEAE5740
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA3921CC71;
	Thu, 21 Aug 2025 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTpXBVtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045D2EC57D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784414; cv=none; b=iuSjd0NlcNofa5DXC3P+3yc+CEOaYFnIRJTNnF1cjqT9Z09r6QAQouINiAUyLH/qAkyRmlddC8J7FFwKJXd7ZkZ18i7HChw74x8HwBiwZSDjgtaGDfU1V+R367r6Pnsfgx+U5bs3PTJuVugnOV4rZjA0Vyt/IdgawQSjIQ4QVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784414; c=relaxed/simple;
	bh=pyH/63l8u2jxoznNAi489bH4KgxW+yncyv7Dzzy0ooQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9kcc4A7lDlHABYHwSjihJ8C9M3KDQGF8EPQUlA1tf5AgbjlWx5racF7IFOalpz78+G2gL0pkfwrosWenfB/j51fYvnz9uRGC96Q7whculu1OFc/l6GNmUarSy4eEY8GCgt2GIohgsCDPvNd+UZg7KW5xcHMiQdzYyKeKELswj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTpXBVtC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so6384055e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784411; x=1756389211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1ILbTWVVpwSmSFNMNdMYlh6Zb0YmwB9OaOmacH3ozk=;
        b=sTpXBVtCu+D4oUsyTrdbP25FjZdnpJYc8+RzxJGw1nTejs7JmXTTodv3FAitU5x4gj
         ZzrJiawmEdMayV2eqAd+A1Z/6NxHQT021Hv330i772apU/y7fGpd2gHVJiVAgxhdTR18
         DlK/K4txS95CqHRbiqOZuckR6J3ecHu8c9VlqGz4/YSmxHaGg2ZqCoTqDMRFPE0V5MOJ
         wfBQWpebW8PTIKQfbeuUVuepGPJ+0n7WxTnSarBbCnxHN/W0IYXdO3ZC7ymguTEymfOa
         42aPnwHtkmmJ9PPJ7wYtKRX2T0nB/kLbRAIxTohWXk68LuFCUjPQ+vkg3kLCYijvlNbY
         c7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784411; x=1756389211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1ILbTWVVpwSmSFNMNdMYlh6Zb0YmwB9OaOmacH3ozk=;
        b=O3ffonTyTgxZDNjpjBGMODn7zUZ2KDpbqruenOd/+tdvtc6BYTTPyoJcjAzDohWYPv
         dP1cAEcIMp358a6BAcdYCIweppFr2gD2H4dKc9KmU5KOwr4ky9iNdLiRnVQEgr7p4S98
         9RQFuYtMxQHA2ecWVOv+NIQXeSYRiWuvkELsm/btW3GbVArjjX+MLiykkbcox5eoV18X
         FHb/bwApRitUwIBUWTMOcYwo5EKDX8Z6yxARcgOZt/I5yTlndBv2a+N3BzGDx9qnEAT0
         wKoN/YlGmXLHDxkiWO8DdKjsbAMDAS7to4vdh1hWDd/v8T1DTTPRbN2k7YhkuBLHc1NU
         dvKw==
X-Gm-Message-State: AOJu0YzplDwUKXIZDvvV0Jls4LdruqqCM3t7owVR/b4+6t/h/f6Onhrn
	TcZRmbgd/U9yGCHo8oDJLEH9Vz5KZ+wf3vcquRO+0ztP7gA9NQ0I1wWbS4F2BNvmvl5O1w3xrXG
	nh3wThi0=
X-Gm-Gg: ASbGncvZPT+p2HxMTb+PrG9U0Ucc4r2sXh4DD5AAMH23mZbYEvPl2b4+CXqDib7SLJK
	P4lrLDj6ncQka74nVBSi4QpraxdHORr9NDr3+eJ9ydHIwqQEFkkQdeMOO3sOl87RdYeAhOs9y2T
	PMgwnTTYSrDStg9QaJDyVfUFjfDTGBjDb+JGEpntTPGBlwmpCe3oTZPGD90pCTDy9slKpUuDS2V
	hBEpclZY0gFvxjuhVU+kr4zRHQMY8JnNaiIab4alM4VLavTQxbum40RSAzjEDfyOT3K8C+ayUHN
	Kqo0oqpsPTRgiIrtTlXKcuoC0S5/TTAPRYfvojeBm9JaSpo3sfi3q7i9s3bSJTtFG1TaOyEZUpY
	gYK4RAsd/BASNUNDyBJ607qgwTRrUninSvzf84kpSito=
X-Google-Smtp-Source: AGHT+IHzxFhZ5bX07Dc56gfIt9C/HteSV73uQJi38+JQ7zvs/0J0ficW3iAyseTimoWe+tg8LI3jWw==
X-Received: by 2002:a05:600c:1f0e:b0:456:19b2:6aa8 with SMTP id 5b1f17b1804b1-45b4d84c455mr22092775e9.19.1755784410744;
        Thu, 21 Aug 2025 06:53:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm14825015e9.2.2025.08.21.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:53:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:53:27 +0200
Subject: [PATCH RFC 2/3] phy: qcom: qmp-combo: get default qmpphy_mode from
 DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-hdmi-v1-2-f14ad9430e88@linaro.org>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2458;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pyH/63l8u2jxoznNAi489bH4KgxW+yncyv7Dzzy0ooQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyTXxH8cN7bUQsx2ZIWRdTEbt3s4adIu96+85UQQ
 fLvZ5muJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKck1wAKCRB33NvayMhJ0TLhD/
 93xZ6P1uVT6kCXpqkhY/UQNa/NPxUJX9u7kDYnffn2/GBILFXp+woumwdl+2flJztSwB0+KfdQzyKu
 KJPGQaruufOfFYr05BehiOOe2kbjgvNnmn9yyWw4zTo5VrXkFOoHQ4iuTzKHYk32F8uMqG10/RO5qQ
 /nNbVvOKEvs8amuanTT0MbET2lkXyydwwLgXB3gti3aB7c9QmyEBOtwetV0NOdJimpZdnmO2mWtWTe
 I9TX6bZo9RAvOLyE6oB/hn7EXwdrFDuNuoidurmQABLnYeRJOdNZshmKuyFBBxDGz+d7MP2TACSBbs
 UyH1NEHvvHpI3CgO/vr7toDmSb/eJYK+B0M9b+UIBcPo1cKaUPWLXmRMC6arMI4HaznMZIPo3sAt3t
 wUTLPwaJVTff7rE4/Up2VO2xHUfc3kROJUG5hTA8+4Uz8VgDYCl1TwWOWhRS2yqYz+EW7KpqSXboiZ
 R4kC/2X5BpVou+Gq7CiK5JtNLT1LZuQ0v4MNRoE4nFRGwre+lRi1ItlCjx1gv6fPWYHmdrnMhHYyel
 woXs3YXppSdI5a/ui3pEv2bPe6ccbqZOOOlTqKizqJV1fOGBymr1drs04raN77W2x3RD7PSvjy9uSO
 wiJtNpDh1FpTLwa6id8vxMoB0E/UHnyxqUbaDJvw4tnxLs9s9yRxu82YpRXg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

And the layout of the lanes can be swpped depending of an
eventual USB-C connector orientation.

Nevertheless those QMP Comby PHY can be statically used to
drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector...

But if a 4lanes DP->HDMI bridge is directly connected to the
QMP Comby PHY lanes, in the default routing 2 or the 4 lanes would
probbaly be USB3, making the DP->HDMI bridge non functional.

Support the property to set in which layout mode the QMP Comby PHY
should be as startup.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d028c592500e723ecd27b54ed554709..622db8a204d3c7c95f110e59cab96b07eadabade 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4117,13 +4117,19 @@ static struct phy *qmp_combo_phy_xlate(struct device *dev, const struct of_phand
 	return ERR_PTR(-EINVAL);
 }
 
+static const char * const qmpphy_mode_str[] = {
+	[QMPPHY_MODE_USB3DP] = "usb3+dp",
+	[QMPPHY_MODE_DP_ONLY] = "dp",
+	[QMPPHY_MODE_USB3_ONLY] = "usb3",
+};
+
 static int qmp_combo_probe(struct platform_device *pdev)
 {
 	struct qmp_combo *qmp;
 	struct device *dev = &pdev->dev;
 	struct device_node *dp_np, *usb_np;
 	struct phy_provider *phy_provider;
-	int ret;
+	int ret, i;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
 	if (!qmp)
@@ -4195,6 +4201,18 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	 */
 	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
 
+	/* Replace with DT provided mode */
+	if (of_find_property(dev->of_node, "qcom,combo-initial-mode", NULL)) {
+		for (i = 0; i < ARRAY_SIZE(qmpphy_mode_str); ++i) {
+			ret = of_property_match_string(dev->of_node, "qcom,combo-initial-mode",
+						       qmpphy_mode_str[i]);
+			if (!ret) {
+				qmp->qmpphy_mode = i;
+				break;
+			}
+		}
+	}
+
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);

-- 
2.34.1


