Return-Path: <linux-arm-msm+bounces-61950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58152AE2B1E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B390F3B527D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE29272E74;
	Sat, 21 Jun 2025 18:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSQQbo2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD7E272E42
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529670; cv=none; b=fXc5SIzCDC5vgFEiMbl+dLBtlWex4SV1bC/s/9yLmrWoaUjiQRChm+WNqZ/gqPkrhoF/9jSepHtVF1xOOSsw310FQO1wlo7ucxnKn3q2lIYBdu2sRd1qeNYgr49Kr3PzUF3q38OlUMbM25Dv+an9hZOzC5nzazGRGp7DpWQwU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529670; c=relaxed/simple;
	bh=FpW79T9YvftggI3m1nG4aTepTbBBYG8c+lDmZC/zvy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vg/HuivcWVUSSIFkyqm1NN+Ic3tPPjW6krtrWjRxlWKHcIXTEbhI+mSKWrtfaUm2ukwzKnkLm0/SSzl6rLQ03pIp0G/Z6gP4VGmumaOmLusHAClZc5r0Xj7u9RrqXmnYNOPxA4OoIUeKpYHMF63XP4cjqvZwNWA1e81BTRLXxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSQQbo2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LI6jWe016738
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6W7bz7mumVKjkQi3vedorRqnABekWR1kRWVKvxBpQYs=; b=pSQQbo2NxtSZglt2
	IKG9FzI57m0lbu6GkQyas+xghftyNTqeJ3KfqzdzQdnXH7VjZrk3HESksmcRzIS7
	SqxFZJ06tx/AwWwg48Z5LK9n48id+Thi9wI7SDSCqU8hFfYMO72eiXCqMGNyahRW
	88/ihr1ZtqpuoCMEGQCuuKiRY3FcHrEEUyNIuRxmOeJtvxFMS0z/IcVG8JrttVb2
	60eU9UblrNHKjShsZb32+jK0OZnLSkwCww3kTOPcY46j95Kta+cpcJM7w816Cju/
	Q1hNaFk34yPIcKbmWLio3i2TR35TF8r9IvQXWvwHbgB1aAfu8xSttyvgvqZNGAFD
	5+xPEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e1qgr090-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f71813so405730985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529666; x=1751134466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W7bz7mumVKjkQi3vedorRqnABekWR1kRWVKvxBpQYs=;
        b=CkZE7FobYGK6tpygwhraReG6XiHUh/w7VAPyM0brR17Y59D17+geEzuN+AqcPP6Mv1
         dWZRdZnp4pVe6sK/rMuh/CwGBGmh7+adnRHGm5izXjQESlMQ2G+883LRM2m9xtLNUIfH
         xTG44OQb9uH8QvMnvA43zOQIEMcPlsH8P2Th/XPzX3mwlvr3voCg6NVB6KCIg62S4BEY
         e46dyEsnMTwSfsc1th/nxa8ItHTrjKZXIs2RVz34LG5D/8qUCOFtEeKIhma1HcdfiuGR
         wPHoPMQyTIEEwIfT2ZNrCU3hPfNGpljX/Y6VBHYk9Eo6S3QrsHF1pWJKbeIEm26lJyyo
         YXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvZnwYDv/ZSk7/otqdElLnUEZml0CfizGtHZ6FuQ96curGZbQFJKQ3Fy+atR6n5JeBEPBFxDi3gZyWxe9@vger.kernel.org
X-Gm-Message-State: AOJu0YxAkHv1Kuojhc1WqzPOs3pZTSRuFuSkOKJkLwahqNm8GV4TWEn2
	HDhCKg9B/nCq457gMCRSJB73wDds5KRoi3EjmDOk9jVgeVRf4AE0H4BOE+cbnuS5BLQXNLWM5tG
	K9pbcUHhlKHLDzN/9BAVx/eew58j8kLSmh0KPcEYun3rYKYx2sDObmnow1x/KUuNwPEBf0hc7jr
	EvzyE=
X-Gm-Gg: ASbGncuMxgleFQYRqughaLynfyGcI8ODr7zWzLeDnp+o3w7p/tQRujkqlIgv+SwdExc
	HfkUfbou9fCfErqcJlcLPs1Res4aW3dQHirdY1xK/rV32WrFVXHUopV6ThQ4X2K0AGwkPD5rAII
	hBc3bXUuRgWCdM/yBKQOHhKse2intdamdOIgGnKDyYKHyzV77Dl57q3w+mdIe2hxyDczgB7vfm9
	nOBnGUa9RWTuWfX597pp8p9f4LV0Cw0ZKWXuLXVTpvBFVAnAdAllgrOFp3Rdb51b0V0XQw/069M
	WmysD6zNuW9IRSl8QOr7K4NY+QZ1JtSLb+7ReHTWqitZ4SHORfOEfieN3YAGC12iS21OVrGgmft
	6VKxIJlZLPzEJx1kmshd2J77a8MwgIspLzQA=
X-Received: by 2002:a05:620a:4711:b0:7d3:f0b0:3923 with SMTP id af79cd13be357-7d3f98c058cmr794839685a.11.1750529666470;
        Sat, 21 Jun 2025 11:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNu3e+Vqi/twA6YrEVVy5gvr3OvSabeNJNWBdMJf9Nc3t7dBPNmwhVHngVNg58YjWOkm3g1w==
X-Received: by 2002:a05:620a:4711:b0:7d3:f0b0:3923 with SMTP id af79cd13be357-7d3f98c058cmr794837585a.11.1750529666039;
        Sat, 21 Jun 2025 11:14:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:03 +0300
Subject: [PATCH 8/8] usb: typec: ucsi: yoga-c630: register DRM HPD bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-8-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FpW79T9YvftggI3m1nG4aTepTbBBYG8c+lDmZC/zvy8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzIqHyyr70rdlkR2ynE+980npLhS9AnFqt6
 48F5PPvF/+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1acnB/9NmCptu0kBEeP30DyUCAMSo1tFZMXGQ0MnaP11ImnSRZ78l+nehBzl2wZFKmSH1tlyXRv
 VTRUtBAkt61D7csum9Mqp7qLHsb1fBFFdnVOCafQRNGngXFcNI03wcCzvg3x4QQ5dSjXRYLeFI9
 9XOK2lnYEJpSZJ1Qa2sE4d+lHf4tabQ44cGvYHE3URRdZIzqwcRhqA0EHbtPAk8MnQzpHgfBFL/
 XK7wx2ETVGeH4GbNbkXwyj3Hhd316On6ZIChDR7yWA0ja1sV7PuiPtXxMjtfQh3GZ6XdBCamoU0
 k2vNfS0l6QvnQLiFtAZZmYR3OaXo2ByvBLg6KhKZ77a1uTvN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1BtYTjjzLIUZyZgZ6obcQTipionPkKnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX15AxCSCoF8Ey
 EkZoGS3febmkOCFiX7+fnNr/nP2WlIH3iJOohq9M8bPRPZmrhFilZDGmch71Y/Xi7p3BVplvFbQ
 SsXtXAvNNH2VmER6Cw+PfslwBbIV6gMU1rvf1qX7EO50dAPiNvxm0yPgwEZnwCQfaWzqeMg10Np
 l14BeszLH39M6Rik3cWFNbqUe/pCeLabaGpPtPwBmmolHeO4zCs7sZ8kLyLjQEpIgSCz0ji5M3N
 xaVlBj03jfNX6ssKRvGXqe8HaYFmX6JbGxlpW1Za8dDp+lA2VSdm7tRmBiGnVdhizAypZvOBA3C
 TBwqXltpWI8TO6C6YCHxXgLUFv5fOvbCWxf6mEaAgtC0gSf8QPmFVYHPbDB2Bw4UEFDaqfCCciF
 4/gCCqnDhhH/ayCoQNnhfVWL6ocFrl42HdXnZY66Sy+b31p8UcU7EziF4ZROtb3t9lGj7kJ0
X-Authority-Analysis: v=2.4 cv=UetRSLSN c=1 sm=1 tr=0 ts=6856f683 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6fbo0VkVZcmtXeJ5A9EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1BtYTjjzLIUZyZgZ6obcQTipionPkKnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Qualcomm platforms DisplayPort driver expects to have a drm bridge in
the final device on the USB-C chain. Register the DRM HPD bridge in
order to fulfill this requirement and to send HPD events to the DRM
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/Kconfig          |  1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 39 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 8bf8fefb4f07bccc4be90a4b7f771d91294386b0..52b53bb6dfed28c4272f8ccc5e31601aede29911 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -85,6 +85,7 @@ config CROS_EC_UCSI
 config UCSI_LENOVO_YOGA_C630
 	tristate "UCSI Interface Driver for Lenovo Yoga C630"
 	depends on EC_LENOVO_YOGA_C630
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  This driver enables UCSI support on the Lenovo Yoga C630 laptop.
 
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index f85170417d19cdc5ae39a15e2f97010259ef12f6..0187c1c4b21abc7b5429526ebb4538c28b2e2e77 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -12,10 +12,14 @@
 #include <linux/container_of.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/string.h>
 #include <linux/platform_data/lenovo-yoga-c630.h>
 #include <linux/usb/typec_dp.h>
 
+#include <drm/bridge/aux-bridge.h>
+
 #include "ucsi.h"
 
 #define LENOVO_EC_USB_MUX	0x08
@@ -29,6 +33,7 @@
 struct yoga_c630_ucsi {
 	struct yoga_c630_ec *ec;
 	struct ucsi *ucsi;
+	struct auxiliary_device *bridge;
 	struct notifier_block nb;
 	u16 version;
 };
@@ -193,6 +198,13 @@ static void yoga_c630_ucsi_read_port0_status(struct yoga_c630_ucsi *uec)
 				      ccst == 1 ?
 				      TYPEC_ORIENTATION_REVERSE :
 				      TYPEC_ORIENTATION_NORMAL);
+
+	if (uec->bridge)
+		drm_aux_hpd_bridge_notify(&uec->bridge->dev,
+					  dppn != 0 ?
+					  connector_status_connected :
+					  connector_status_disconnected);
+
 }
 
 static int yoga_c630_ucsi_notify(struct notifier_block *nb,
@@ -237,6 +249,24 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
 	uec->ec = ec;
 	uec->nb.notifier_call = yoga_c630_ucsi_notify;
 
+	device_for_each_child_node_scoped(&adev->dev, fwnode) {
+		u32 port;
+
+		ret = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (ret < 0) {
+			dev_err(&adev->dev, "missing reg property of %pfwP\n", fwnode);
+			return ret;
+		}
+
+		/* DP is only on port0 */
+		if (port != 0)
+			continue;
+
+		uec->bridge = devm_drm_dp_hpd_bridge_alloc(&adev->dev, to_of_node(fwnode));
+		if (IS_ERR(uec->bridge))
+			return PTR_ERR(uec->bridge);
+	}
+
 	uec->ucsi = ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
 	if (IS_ERR(uec->ucsi))
 		return PTR_ERR(uec->ucsi);
@@ -255,8 +285,17 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
 	if (ret)
 		goto err_unregister;
 
+	if (uec->bridge) {
+		ret = devm_drm_dp_hpd_bridge_add(&adev->dev, uec->bridge);
+		if (ret)
+			goto err_ucsi_unregister;
+	}
+
 	return 0;
 
+err_ucsi_unregister:
+	ucsi_unregister(uec->ucsi);
+
 err_unregister:
 	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
 

-- 
2.39.5


