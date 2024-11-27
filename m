Return-Path: <linux-arm-msm+bounces-39323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D59DA88B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7644A1662D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E371FC0F6;
	Wed, 27 Nov 2024 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Exkw5gWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB71957E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732714287; cv=none; b=BbvCxbd2gFmdEmkQUwbkjrX9yZocNvwKbIgGLwmXokWGJd9N3M6R7Phkh+wfv86Ruiuh7UCHhsh8rWV3KNAyUYrKL2YCFMOaM9A/iZ+Nxriv2JsThpMjY2Dg+czMAPicuvpLc0dq2kPuoY8xEU4edFrdnuSVGA+R3nIMmvJRmAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732714287; c=relaxed/simple;
	bh=FCq/wz9CODrxpUcZSiq/K80sBf8feqP0ZtgImUXPI88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y0IhxKNkiOzlsYSY0NgPqOq8BfrJx7MpbkT7kGduAmeq8WvbwJe/6U8NDSi+fS9YVlvbm5qH+szbsS3OxOeoaKSrNuzzdbMDALiUEcplw8aEAqibkXrxhaDT2RS0HFlxDB3/FzWuMHE++qWhEIDJUqaGoaDCWQNRzkmXnCeGnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Exkw5gWh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a1639637so24976475e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732714282; x=1733319082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRGKjYxWwsRelyuP0tWpLLQewWr/T1xF1uSm0KaiNUo=;
        b=Exkw5gWh8o+TTFiTmqa788aRQ7EarUDRziCanpPFPJJ5KZOwltUrrixIGW1U/67HUH
         FeAE1Ic2kOCJGTYo//EXTGNe4LxrZJLr3rfyQKnfJEnKRLdAKjbS+CBYYMGP992neXqV
         JGxwoKGB6G5pC85Hhf7JogEEubxAj/OW+AsHt/yqmAfvXqXyOavE+Ko41KE6MN/pYzI8
         XCO6Def7SgpMEfO6Zuucn7/bKbeK47y2w2pqk7twRm21qOx+u64mx7XYsCknRWUPZ8xt
         Qly02NRVNZ11Dwd/kRnLFSNNQ27QVW8y6BZZ22ZBDB0LcQPDRmB5l00UeTa0gS/CoFI1
         3RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714282; x=1733319082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRGKjYxWwsRelyuP0tWpLLQewWr/T1xF1uSm0KaiNUo=;
        b=FUKpdTWeVl6M18YlTQ5cYQdsLtdD4COPKVBIeXScGy//WRQ7IUj6A1DtIcPYteF4sH
         qHnz/bc/WTo3aIrdsTlJtQ+tRfAiKOQU202SBLGK5eeuqrbMBjmukO4ImZrJh4I7//p3
         TkWHsrmP/gIXiF8fPvjM/e6QVNz31hFLiuLmkbMBQxXBEkz1b88I/P3TIGulebnefr2X
         JHLYTMOprLOtDqSJMBB564Mfa4R3tqMqJocWmH0uHYe7IxXDP5aw4jOZ9mlgdA6kQNiE
         fG7WZ2idXSMmmUXGHQXKJn738Ha0Us7wHxiMrSyEP2qa+qa1f9CJYVKggd6CUEKpnlVm
         cXNA==
X-Forwarded-Encrypted: i=1; AJvYcCVRvCNHpvTj/xFrbXogS12/iZvr0JYnj5+FwZDIic049kObUM5vygAFBqNmfP8s1+XmxTa86Wpjk3U/g0Si@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvCO6m4UPBzQ4/hDfX7NLBF/0BeNFmza37u3aHfat25TUsDA2
	wZVhBwKfCvppQRCJAPJyeXNHApgXvpZopj4RnHfhu/virSdJ/HJAnjh248PnM6I=
X-Gm-Gg: ASbGncuwVFsOlJVvg+8TksgBrU7LZAqj7kuP86QG/UmAbgIwRVRtLC+LXP0txLShpg1
	cHwyIprtnq4vHzSILi5+PylHS9hUqFVJZ8shG71MqMndwq7a/GGI8zsE591aOueuxh25G53eyc0
	23z8vAkYCLxRNr0T+14Mt74BeXd5gWUI45XjPfZzcozJonAfAoBcqjJBvKEJCzAXKy8tLVV6mwl
	R32lOmsIjnF+1uBWKjo16OXkA1NLtfq/YGoSUxAkSlZDP0OMZHpiWE=
X-Google-Smtp-Source: AGHT+IEZ7C9LB7FM3cTaauPjrEMojqCE1Of1m/atUBZHepHaTuyY1CQCKhviAha5orYzGSUtbCVNQw==
X-Received: by 2002:a05:600c:3b9e:b0:434:a4a6:5212 with SMTP id 5b1f17b1804b1-434a9d483a2mr30303435e9.0.1732714281484;
        Wed, 27 Nov 2024 05:31:21 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:d88d:8601:f512:7eed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4d42sm21130305e9.37.2024.11.27.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:31:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Jacky Bai <ping.bai@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] pmdomain: Switch back to struct platform_driver::remove()
Date: Wed, 27 Nov 2024 14:31:04 +0100
Message-ID: <20241127133104.673408-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6060; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=FCq/wz9CODrxpUcZSiq/K80sBf8feqP0ZtgImUXPI88=; b=owGbwMvMwMXY3/A7olbonx/jabUkhnR3eYnzuzV/fUnQrjrQ49PHHO+gcVHK+DnbvNafNiwyd yMyndI6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiIsxn7P302Ocami3Yay4yz heZou26sfvk5+MmlleGe/2cdFmZ5qej1M/IxwwyGd4/fF0v/8JNZ9MrlT/p+/sJPZyQvM7r/OCE nZFb32lKOXWQqm/nH6a8fFz0PMs1VWibzKytH5szRXxH/3rnMFvS/aSRkZxTroKG5mv2EwocgOb /J3kKVE4yjXsSfWnAvnNNvxfqzzmXPehdm/LtsZe9t+Ln3kuTNRV7ROu/Mc2MMv3DwR9Q0PJHdK PXPa2LShPTvX6xfBQi2zkh+1lSsl6JeUuse+77I+ng869z9EboKHJlGlyfz3VL2d83bvlpl5imX jbelvk6NzOnuvlq6YCebfozAbING75TLb2MEnUW+7zkDAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/pmdomain to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

En passant make the alignment of the struct initializer in
imx/gpcv2.c consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on today's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Best regards
Uwe

 drivers/pmdomain/imx/gpc.c                  | 4 ++--
 drivers/pmdomain/imx/gpcv2.c                | 4 ++--
 drivers/pmdomain/imx/imx8m-blk-ctrl.c       | 2 +-
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c      | 2 +-
 drivers/pmdomain/imx/imx93-blk-ctrl.c       | 2 +-
 drivers/pmdomain/imx/imx93-pd.c             | 2 +-
 drivers/pmdomain/qcom/cpr.c                 | 2 +-
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index fbb4c90b72c4..f18c7e6e75dd 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -233,7 +233,7 @@ static struct platform_driver imx_pgc_power_domain_driver = {
 		.name = "imx-pgc-pd",
 	},
 	.probe = imx_pgc_power_domain_probe,
-	.remove_new = imx_pgc_power_domain_remove,
+	.remove = imx_pgc_power_domain_remove,
 	.id_table = imx_pgc_power_domain_id,
 };
 builtin_platform_driver(imx_pgc_power_domain_driver)
@@ -545,6 +545,6 @@ static struct platform_driver imx_gpc_driver = {
 		.of_match_table = imx_gpc_dt_ids,
 	},
 	.probe = imx_gpc_probe,
-	.remove_new = imx_gpc_remove,
+	.remove = imx_gpc_remove,
 };
 builtin_platform_driver(imx_gpc_driver)
diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6e6ecbf2e152..48e3693d2bdc 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1438,8 +1438,8 @@ static struct platform_driver imx_pgc_domain_driver = {
 		.name = "imx-pgc",
 		.pm = &imx_pgc_domain_pm_ops,
 	},
-	.probe    = imx_pgc_domain_probe,
-	.remove_new = imx_pgc_domain_remove,
+	.probe = imx_pgc_domain_probe,
+	.remove = imx_pgc_domain_remove,
 	.id_table = imx_pgc_domain_id,
 };
 builtin_platform_driver(imx_pgc_domain_driver)
diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index ca942d7929c2..23db85b7aa9e 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -889,7 +889,7 @@ MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
 
 static struct platform_driver imx8m_blk_ctrl_driver = {
 	.probe = imx8m_blk_ctrl_probe,
-	.remove_new = imx8m_blk_ctrl_remove,
+	.remove = imx8m_blk_ctrl_remove,
 	.driver = {
 		.name = "imx8m-blk-ctrl",
 		.pm = &imx8m_blk_ctrl_pm_ops,
diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 77e889165eed..e3a0f64c144c 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -857,7 +857,7 @@ MODULE_DEVICE_TABLE(of, imx8mp_blk_ctrl_of_match);
 
 static struct platform_driver imx8mp_blk_ctrl_driver = {
 	.probe = imx8mp_blk_ctrl_probe,
-	.remove_new = imx8mp_blk_ctrl_remove,
+	.remove = imx8mp_blk_ctrl_remove,
 	.driver = {
 		.name = "imx8mp-blk-ctrl",
 		.pm = &imx8mp_blk_ctrl_pm_ops,
diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index b10348ac10f0..0e2ba8ec55d7 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -438,7 +438,7 @@ MODULE_DEVICE_TABLE(of, imx93_blk_ctrl_of_match);
 
 static struct platform_driver imx93_blk_ctrl_driver = {
 	.probe = imx93_blk_ctrl_probe,
-	.remove_new = imx93_blk_ctrl_remove,
+	.remove = imx93_blk_ctrl_remove,
 	.driver = {
 		.name = "imx93-blk-ctrl",
 		.of_match_table = imx93_blk_ctrl_of_match,
diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index 25ab592945bd..d68273330687 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -162,7 +162,7 @@ static struct platform_driver imx93_power_domain_driver = {
 		.of_match_table = imx93_pd_ids,
 	},
 	.probe = imx93_pd_probe,
-	.remove_new = imx93_pd_remove,
+	.remove = imx93_pd_remove,
 };
 module_platform_driver(imx93_power_domain_driver);
 
diff --git a/drivers/pmdomain/qcom/cpr.c b/drivers/pmdomain/qcom/cpr.c
index 26a60a101e42..3ee8184e4be3 100644
--- a/drivers/pmdomain/qcom/cpr.c
+++ b/drivers/pmdomain/qcom/cpr.c
@@ -1717,7 +1717,7 @@ MODULE_DEVICE_TABLE(of, cpr_match_table);
 
 static struct platform_driver cpr_driver = {
 	.probe		= cpr_probe,
-	.remove_new	= cpr_remove,
+	.remove		= cpr_remove,
 	.driver		= {
 		.name	= "qcom-cpr",
 		.of_match_table = cpr_match_table,
diff --git a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
index 0b5831e5ba1b..d579220a4500 100644
--- a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
+++ b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
@@ -313,7 +313,7 @@ static struct platform_driver zynqmp_power_domain_driver = {
 		.sync_state = zynqmp_gpd_sync_state,
 	},
 	.probe = zynqmp_gpd_probe,
-	.remove_new = zynqmp_gpd_remove,
+	.remove = zynqmp_gpd_remove,
 };
 module_platform_driver(zynqmp_power_domain_driver);
 

base-commit: 6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
-- 
2.45.2


