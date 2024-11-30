Return-Path: <linux-arm-msm+bounces-39728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA19DF164
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 16:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56BF3B207D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DB315666A;
	Sat, 30 Nov 2024 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OOLEN1Xf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4D4087C
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732978964; cv=none; b=T6AvGOTn4fqBJoeAkhcxIEAAR/f2wNb7D8n5EIPyQ3dVwh2lbhX++DeUZHv+oeXKh9iM39kgsGXBPNAoCl3PBPzLaxd+8GigUVbnt3qgqnG/AQrxSCBqakWL6+We1rTDIMny2dMBuyAazOOxoiJXxB1mPr8kaR1fv8IGLI8wtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732978964; c=relaxed/simple;
	bh=1zRfjh/TbGwcSXp6t+/CfaYBgE6ti0sCaNcOyp9qsIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ecdIczBRN1nNc9P9WOcScfMZHss2b9CCFFn+n5lH93Efq5kzfk4IaYCVX1X7jC02ydIW1V2HEBNuD7t/hJCUsMRuJ4OCv/IlNChWrfz1GP3T8L667gy2x9bXDB2t2vCKjgdHxwiSvBivDOckpbFGCdx4ut1Hof+fZDfrggU7lGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OOLEN1Xf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e075255fso845334f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 07:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732978960; x=1733583760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
        b=OOLEN1XfoHL7FbXrxchtCrB/QBUH4Uo/Ug6Kqz8kIhaqzHr/BhpXuTigE+AqztruDk
         +HJIDKk6rVPkgoi3002TWMYsyzQFL6A3q2ysmuUsOAp5Jy/hDfRAlM9jxhhksiiieJCE
         bGuAcd3np2JeQ/S5NnFhMRNkfDnFv2Le2iKipl8pCGd9/ZEdpbc7bR2KMsKSDAw3QcB5
         YY1+ki/q4j4ylCYQvoJc+mXkyF44WqlOO+MsSDt6333RjBRI1g/KM28+zeor0gqFN/X5
         2n+DbqB4V+K77xMfDBSk++sMdqFcnqjWD04KmPTM8sb8+hiUbpTkVTeHUmQz4uznjHNO
         AnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732978960; x=1733583760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
        b=Ecpt7Gl++7ty35J/tI5SeIIhL9lA/kexkbu/vPG7f7VhHK7SBUugwVdfVmQLCWRNxv
         AH1UEzzExmjlDNAKoqFTkIp+m8+YEortcah0c2GWvQpn1SI6gaOcERpzP0jweD9+zfJG
         F891J3dj/fIkozP+w67MaxM2w9T2y2VbLz5xdcOMMZshv+LgpsAiJYYjapj7xz/KtnGs
         YPlNUfZR2yhOKwaqFk4i6C58Nxt8DzOMtg9wgtp8pkwZLO/Oxp+kRZoSE2QakTEpzwI9
         4rvRTT3SYFVAfMqCN8/W/IGlotcFQm3SXp9WAK4qAKSQaZhAHgu/KnRcKInLoa5i5dDo
         ty7w==
X-Forwarded-Encrypted: i=1; AJvYcCVCXmmB+5KNWTq+H63wzbSgkJW5bSz109Mdaj+XJdl9v3YvoYUYvitI/mheE95Rx7Fchy/k423cBNi/Yqzk@vger.kernel.org
X-Gm-Message-State: AOJu0YymuUGVzdRQEp3eEtKsln/qDXCcl+oX3PQ3+rJZwaQ+pz1DbBdz
	bZRLYj6kCCxWX+aIoweNbM8Cr//pE/8kzjAxFaFMEYqKJ2LsxMUOsEjmloJvhXM=
X-Gm-Gg: ASbGncuomhB7HH6kif+uNBdL/YUsyZg/IBwDb35JVcWuGYbB1vfwgJ6jJiEGWfbjnAU
	BOA1zacZa44Lh793f1pxAeN4szIh+rbD28YP3KVBG76RrzVdYlMae6cAMhTzvJ3L+5lIuVoyLlW
	1sH3IeF9A9UFdMivwlOYLqbAjoceNi7sdYAk1iC4NAINMD8OE4Q/FEGgPdFGvCXIpM7Ss70/Lhu
	EHi4/LX5klUQgmrbf5egT8qUuBpI5ISm5k+RrStwXN0qlSKcQ==
X-Google-Smtp-Source: AGHT+IG7SmAgqLWpO0w58FJsWRhtR3KnnLD0aUy9Ativ6+ehPD5OdDccednlqkuUW6sKW7TgS9z6Nw==
X-Received: by 2002:a5d:5f56:0:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-385df7330bamr5372688f8f.51.1732978958736;
        Sat, 30 Nov 2024 07:02:38 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:7ca4:5604:f5:65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7611af2sm5979701f8f.22.2024.11.30.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:02:38 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	John Stultz <jstultz@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] misc: Switch back to struct platform_driver::remove()
Date: Sat, 30 Nov 2024 16:02:31 +0100
Message-ID: <20241130150231.900755-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7078; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=1zRfjh/TbGwcSXp6t+/CfaYBgE6ti0sCaNcOyp9qsIY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSykIDZe9lqJpeaZD+flWQcLxbEmBh0Sux49lu SV5ovm6vmaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0spCAAKCRCPgPtYfRL+ TtyOB/9YEH0yxGtL0vZKsFbJLnEoT7d0IhAdw1TIS3Tu49473WdlyNzJjlbVk97uJZ5ATzOH3/S RQleqOs5gDX4t53tpB3MtLeAwxz/sfHd0fmKOvAJMxiVANNndwZzNkI1NFsC8qMdwewk2OWvCgc g+rIGbQ6E9n/WnqNFVgbm9tb26AkONi25AuHbk3raB50YQl3S7J+mFFcXaceC1cqMHinsT2wOjW pSbyH+FtZM5vKfi39iZxeH0qf9XaKA+v+5jIxt2yPzS+HRz7Qlw7u7fnPAMUeE07Gb0LsQaXgBo oWlNIHTHc+d9uyGKGhr6BGfKM5YS+f4xXhodbR78ItTZsAoc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/auxdisplay to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on Friday's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

This is merge window material.

Best regards
Uwe

 drivers/misc/atmel-ssc.c           | 2 +-
 drivers/misc/cxl/of.c              | 2 +-
 drivers/misc/fastrpc.c             | 2 +-
 drivers/misc/hisi_hikey_usb.c      | 2 +-
 drivers/misc/mei/platform-vsc.c    | 2 +-
 drivers/misc/open-dice.c           | 2 +-
 drivers/misc/sram.c                | 2 +-
 drivers/misc/tps6594-esm.c         | 2 +-
 drivers/misc/tps6594-pfsm.c        | 2 +-
 drivers/misc/vcpu_stall_detector.c | 2 +-
 drivers/misc/xilinx_sdfec.c        | 2 +-
 drivers/misc/xilinx_tmr_inject.c   | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 1d0322dfaf79..35a196341534 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -269,7 +269,7 @@ static struct platform_driver ssc_driver = {
 	},
 	.id_table	= atmel_ssc_devtypes,
 	.probe		= ssc_probe,
-	.remove_new	= ssc_remove,
+	.remove		= ssc_remove,
 };
 module_platform_driver(ssc_driver);
 
diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index 03633cccd043..cf6bd8a43056 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -339,6 +339,6 @@ struct platform_driver cxl_of_driver = {
 		.owner = THIS_MODULE
 	},
 	.probe = cxl_of_probe,
-	.remove_new = cxl_of_remove,
+	.remove = cxl_of_remove,
 	.shutdown = cxl_of_shutdown,
 };
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 74181b8c386b..412683e0ea86 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2215,7 +2215,7 @@ static const struct of_device_id fastrpc_match_table[] = {
 
 static struct platform_driver fastrpc_cb_driver = {
 	.probe = fastrpc_cb_probe,
-	.remove_new = fastrpc_cb_remove,
+	.remove = fastrpc_cb_remove,
 	.driver = {
 		.name = "qcom,fastrpc-cb",
 		.of_match_table = fastrpc_match_table,
diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index fb9be37057a8..ffe7b945a298 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(of, id_table_hisi_hikey_usb);
 
 static struct platform_driver hisi_hikey_usb_driver = {
 	.probe = hisi_hikey_usb_probe,
-	.remove_new = hisi_hikey_usb_remove,
+	.remove = hisi_hikey_usb_remove,
 	.driver = {
 		.name = DEVICE_DRIVER_NAME,
 		.of_match_table = id_table_hisi_hikey_usb,
diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 71f9994da2cc..a70e64acf571 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -435,7 +435,7 @@ MODULE_DEVICE_TABLE(platform, mei_vsc_id_table);
 
 static struct platform_driver mei_vsc_drv = {
 	.probe = mei_vsc_probe,
-	.remove_new = mei_vsc_remove,
+	.remove = mei_vsc_remove,
 	.id_table = mei_vsc_id_table,
 	.driver = {
 		.name = MEI_VSC_DRV_NAME,
diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
index e6a61e6d9427..24c29e0f00ef 100644
--- a/drivers/misc/open-dice.c
+++ b/drivers/misc/open-dice.c
@@ -178,7 +178,7 @@ static const struct of_device_id open_dice_of_match[] = {
 };
 
 static struct platform_driver open_dice_driver = {
-	.remove_new = open_dice_remove,
+	.remove = open_dice_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = open_dice_of_match,
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 546eb06a40d0..e40b027a88e2 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -451,7 +451,7 @@ static struct platform_driver sram_driver = {
 		.of_match_table = sram_dt_ids,
 	},
 	.probe = sram_probe,
-	.remove_new = sram_remove,
+	.remove = sram_remove,
 };
 
 static int __init sram_init(void)
diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
index b4d67a1a24e4..2fbd3fbdf713 100644
--- a/drivers/misc/tps6594-esm.c
+++ b/drivers/misc/tps6594-esm.c
@@ -135,7 +135,7 @@ static struct platform_driver tps6594_esm_driver = {
 		.pm = pm_sleep_ptr(&tps6594_esm_pm_ops),
 	},
 	.probe = tps6594_esm_probe,
-	.remove_new = tps6594_esm_remove,
+	.remove = tps6594_esm_remove,
 };
 
 module_platform_driver(tps6594_esm_driver);
diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 9bcca1856bfe..0a24ce44cc37 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -314,7 +314,7 @@ static struct platform_driver tps6594_pfsm_driver = {
 		.name = "tps6594-pfsm",
 	},
 	.probe = tps6594_pfsm_probe,
-	.remove_new = tps6594_pfsm_remove,
+	.remove = tps6594_pfsm_remove,
 };
 
 module_platform_driver(tps6594_pfsm_driver);
diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall_detector.c
index 41b8c2119e20..f0b1fc87490e 100644
--- a/drivers/misc/vcpu_stall_detector.c
+++ b/drivers/misc/vcpu_stall_detector.c
@@ -233,7 +233,7 @@ MODULE_DEVICE_TABLE(of, vcpu_stall_detect_of_match);
 
 static struct platform_driver vcpu_stall_detect_driver = {
 	.probe  = vcpu_stall_detect_probe,
-	.remove_new = vcpu_stall_detect_remove,
+	.remove = vcpu_stall_detect_remove,
 	.driver = {
 		.name           = KBUILD_MODNAME,
 		.of_match_table = vcpu_stall_detect_of_match,
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index ea433695f4c4..3135ba3a58ee 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -1444,7 +1444,7 @@ static struct platform_driver xsdfec_driver = {
 		.of_match_table = xsdfec_of_match,
 	},
 	.probe = xsdfec_probe,
-	.remove_new =  xsdfec_remove,
+	.remove = xsdfec_remove,
 };
 
 module_platform_driver(xsdfec_driver);
diff --git a/drivers/misc/xilinx_tmr_inject.c b/drivers/misc/xilinx_tmr_inject.c
index 734fdfac19ef..6284606ffb9f 100644
--- a/drivers/misc/xilinx_tmr_inject.c
+++ b/drivers/misc/xilinx_tmr_inject.c
@@ -164,7 +164,7 @@ static struct platform_driver xtmr_inject_driver = {
 		.of_match_table = xtmr_inject_of_match,
 	},
 	.probe = xtmr_inject_probe,
-	.remove_new = xtmr_inject_remove,
+	.remove = xtmr_inject_remove,
 };
 module_platform_driver(xtmr_inject_driver);
 MODULE_AUTHOR("Advanced Micro Devices, Inc");

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


