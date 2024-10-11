Return-Path: <linux-arm-msm+bounces-34129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C557C99A796
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5530428316C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFEB195B1A;
	Fri, 11 Oct 2024 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="LDgX+4bX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382B194C78
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660454; cv=none; b=d0Dl6wvUHqlTHIYvJoYAVlqqVk25t5yf0EhhsULsB7nrh6B0OuCyWT6UGhFE4oh2E/9H9CjK+RZlRKD1FlpMu3abdt4yop8Rbz1EV6rOatFopItMK8VGha/MDI1Vk679NqShplLrkKC2k2hnx3pU6Art4tGFra8mYq9X/LyzQ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660454; c=relaxed/simple;
	bh=m279UNxDg86MeiepLCsRcDWK8TQ3a2VS5ATEvwMBUgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LW9vcMccbwWYpHH3Ka1vvIbqpnz4V3QvDeILQExv5DOow8LHyC29DF5X0loY6ixi10HcBj3bA7Ttcvcwuay0hx/59tCrcA6Zz165W61PlKGyaiuhJ7YYblkw7jC3hG5Uc48pZHnRLoM9EPU4rY8CZQUAi5xe4u0NOQUCz4y79vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=LDgX+4bX; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-45f07eb6f5fso20059981cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728660451; x=1729265251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENjo8WaNMM2SxgI285IjIz9pg6uqFRWPMbu3WxVYb8I=;
        b=LDgX+4bXqQ5v/UyT/v1RwVyRnbGeiiY6nnjGiKrlQTlg+MedbMX8cw083PAjEejltd
         gMZs8HphK9HP9U3a9hADp4FvQ8SCwgJjrbI/J2VI3jrxJ8Q4b7B+bSsT5t+iERzJYtdh
         xatTW4X0Xvd8h4NBGA1vhDJtxRExMMts/uwXYYNgducWOKibNKFoeL+4CwdjVbRYsySA
         85EM/e4PVhBvLGNldYidKu09zxMCkDd4CTzxQ0LDN0mT8X+oYgZSB4Y/To7gqTThZYnh
         6IdylrTnLhoLzr4OPZ2CsV2Y5liVi+ueEtgVnGYVnizTyiZ/Y7FDg/yrrXFaomt23OB9
         bjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660451; x=1729265251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENjo8WaNMM2SxgI285IjIz9pg6uqFRWPMbu3WxVYb8I=;
        b=FeVKp8jMrPp1Buw4BLvQg/KSmortVeW4RlAsFnhocymPjl++LRrak8UGVQr7kLsfk5
         lVka+gQzVrnEYg2BWcWP/tiIb593WPo7o0gD+cFNEdKG1/b3q95qKMSL6Po+2VQ2IHUI
         TDhP1qbB/W3Jq8Cgv6DoNn/4Q440CA6n45OcUPd/rD/H2tXWXtDhSA19k+fhest1EBBq
         yvb3YtHmyG2dEWfn0IeHkxwtLOTGfwOE4MjMGW8+oA7kF3tKdTBlXeGe3R8PVBsAha6B
         xZxDs37dLaM/qtxCIzM1u0RKIQhkc+7qExcGYaetz9k+aOnZ9laSy1IdIMce+nlj/FFo
         zUlQ==
X-Gm-Message-State: AOJu0Yylpji3P6kG89ZGj1DEOOh0GtnZfvSSJUIdfOxTuY1EQX+xbPMp
	1XKoyjjpl/6bl71gItgJZeChLx7ZRMDWGD1XPm2f9XvFAZFCx0Ghv+RjFM/iIdmoXDwznq5ZGpb
	PggU=
X-Google-Smtp-Source: AGHT+IHYNJkgaLLv/w799rZpdoAMPPyoB55wmJ3IpkehRsO0xuYABXaHyGFaAam7/8aabgIuvV/wDQ==
X-Received: by 2002:a05:622a:15cf:b0:45f:3d1:24ad with SMTP id d75a77b69052e-4604b273053mr50520501cf.13.1728660450735;
        Fri, 11 Oct 2024 08:27:30 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5220sm16344131cf.32.2024.10.11.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:27:30 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] rtc: pm8xxx: implement no-alarm flag for non-HLOS owned alarm
Date: Fri, 11 Oct 2024 11:22:39 -0400
Message-ID: <20241011152244.31267-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/rtc/rtc-pm8xxx.c | 48 ++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index c32fba550c8e0..9240844022092 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -61,6 +61,7 @@ struct pm8xxx_rtc {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
 	bool allow_set_time;
+	bool no_alarm;
 	int alarm_irq;
 	const struct pm8xxx_rtc_regs *regs;
 	struct device *dev;
@@ -375,6 +376,11 @@ static const struct rtc_class_ops pm8xxx_rtc_ops = {
 	.alarm_irq_enable = pm8xxx_rtc_alarm_irq_enable,
 };
 
+static const struct rtc_class_ops pm8xxx_rtc_no_alarm_ops = {
+	.read_time	= pm8xxx_rtc_read_time,
+	.set_time	= pm8xxx_rtc_set_time,
+};
+
 static irqreturn_t pm8xxx_alarm_trigger(int irq, void *dev_id)
 {
 	struct pm8xxx_rtc *rtc_dd = dev_id;
@@ -473,9 +479,13 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (!rtc_dd->regmap)
 		return -ENXIO;
 
-	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
-	if (rtc_dd->alarm_irq < 0)
-		return -ENXIO;
+	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node, "no-alarm");
+
+	if (!rtc_dd->no_alarm) {
+		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
+		if (rtc_dd->alarm_irq < 0)
+			return -ENXIO;
+	}
 
 	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
 						      "allow-set-time");
@@ -503,7 +513,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, 1);
+	if (!rtc_dd->no_alarm)
+		device_init_wakeup(&pdev->dev, 1);
 
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
@@ -512,27 +523,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
 	rtc_dd->rtc->range_max = U32_MAX;
 
-	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
-					  pm8xxx_alarm_trigger,
-					  IRQF_TRIGGER_RISING,
-					  "pm8xxx_rtc_alarm", rtc_dd);
-	if (rc < 0)
-		return rc;
+	if (!rtc_dd->no_alarm) {
+		rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
+						  pm8xxx_alarm_trigger,
+						  IRQF_TRIGGER_RISING,
+						  "pm8xxx_rtc_alarm", rtc_dd);
+		if (rc < 0)
+			return rc;
+	} else {
+		rtc_dd->rtc->ops = &pm8xxx_rtc_no_alarm_ops;
+	}
 
 	rc = devm_rtc_register_device(rtc_dd->rtc);
 	if (rc)
 		return rc;
 
-	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
-	if (rc)
-		return rc;
+	if (!rtc_dd->no_alarm) {
+		rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
+		if (rc)
+			return rc;
+	}
 
 	return 0;
 }
 
 static void pm8xxx_remove(struct platform_device *pdev)
 {
-	dev_pm_clear_wake_irq(&pdev->dev);
+	struct pm8xxx_rtc *rtc_dd = platform_get_drvdata(pdev);
+
+	if (!rtc_dd->no_alarm)
+		dev_pm_clear_wake_irq(&pdev->dev);
 }
 
 static struct platform_driver pm8xxx_rtc_driver = {
-- 
2.45.1


