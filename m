Return-Path: <linux-arm-msm+bounces-34200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C299B851
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 07:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 875491F21E46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 05:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BF6136E01;
	Sun, 13 Oct 2024 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="cvx74f9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7376EB4A
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Oct 2024 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728796961; cv=none; b=SXHVU3n2G/ytqPqIbjAbDBzYVaTVI0aBcs20tdDjVRZgpL5P4BASXNtPVTk0AXhDiU19Ozl9g/BFOT9d5EYG3EAKulsDZdJg1usV9xwp+zJDiYcN4Ow1MVCR3j3AYmWHf1HqbLi4AtN0MRoQ8QZB0l5OEkyTnhaxMfvmyQmZ2fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728796961; c=relaxed/simple;
	bh=4MZOvQKHClittUmpnQnoq/i+2Op7x5TOc+aMOdSKGRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGmO52d48Us7kTc6BiQAYeaUfwoDZ7XJ2Votbrkx8CxZMD/4DL7DAqHgwqXZxXf8KRWOtzmp2b+r26qNGMJsx4AXuuCnNWl1oxdX7XwDyLNYyQGP1Plb2B4QbIhgfW2pdmCQelKGSWnHYSOXFJIGTuMQFShp98LQGuMhM/4i0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=cvx74f9L; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6c5ab2de184so21564166d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 22:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728796959; x=1729401759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6xxZ43bcNrMRSyYePE5aWtWwfMTqg7K7KAOvUgotws=;
        b=cvx74f9LirfQIpvi8uN+yNHViK0Vu5/j8Nqhu8mJsOjnvlJnZjFHvLWxq9p5J56oS3
         ESmsViBMhZ3sZH9LDwsD0zVlm2Y+XChD2MBvTNfBem/Nx8ToFBOofCXy4vuSKOHmW7ya
         OVp/94rTQ6sGxK7OMI3HsyFTqenU57uuO5HOWQlxfbMDfeqkgxkq33ko5S+2w0oW+JIT
         R7giN2IZfnR1rlVFfOX3uqwpWX00GmrKU7x7RSZR19LBKIOlZyk+4p1RLgU2WOkvMeG9
         dmQhnSiFJAD9OftS4iO3wwSlsm0yKGRxs+RTJ4VKBkLmrT4ktctz0jZTdNh0gcYJgmiX
         QY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728796959; x=1729401759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6xxZ43bcNrMRSyYePE5aWtWwfMTqg7K7KAOvUgotws=;
        b=qyF5FotGYP28uboOPgXxO/M8RCrXVAOGD1vCHZaTDFdt7pOgb3RmKmc3qHJcKQ6j3C
         2Hm8kKQHmV0TOHe+g5UClL9fn5tsGnMDw7tlNz8tIfUv2AL/HHA4YCHOq89QYuR3/cUV
         Q3yN2kjZ7VtArjA2SYzOuaW0OGqV4X/IC28v2H+xUkmD3ZCYie9N8DN1HCsJXwbtPyY4
         HJLoMaX9GkoYGD6XHmK15drcC/V+iv8AiwAOujT1YcxbgiYAzqaNzf2MgDELawh0v7cS
         BPUF2Ton/AcXTft4G9CL0rzEWpV1RGaafio7v8sdcs/HCt+W/lPq1N/OXkULcJaZdNff
         3INw==
X-Gm-Message-State: AOJu0YyjMsJshR/z2hbroPWJvBpGykTuzdSnXDVe2cVeJvapzUq2CkD9
	qgcSKRbC3xnklz2yi2KyU/5B+QobasrLHEL7er6J/p1Xh7mdpnzrIhkNlIpv4iluInyk2a+oPwK
	5Vio=
X-Google-Smtp-Source: AGHT+IHsbqqTS9ovb3ovjSqTfhAbFTCjDmWZz0KsigO/gs/tDfosJX8dkKPETxwqd4+611XM0iYC4A==
X-Received: by 2002:a05:6214:5d0c:b0:6cb:f991:ec51 with SMTP id 6a1803df08f44-6cbf991ec9bmr71722876d6.45.1728796958920;
        Sat, 12 Oct 2024 22:22:38 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608e2csm31821496d6.102.2024.10.12.22.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 22:22:38 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] rtc: pm8xxx: implement no-alarm flag for non-HLOS owned alarm
Date: Sun, 13 Oct 2024 01:15:26 -0400
Message-ID: <20241013051859.22800-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241013051859.22800-1-jonathan@marek.ca>
References: <20241013051859.22800-1-jonathan@marek.ca>
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
 drivers/rtc/rtc-pm8xxx.c | 43 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index c32fba550c8e0..0de55779b04f7 100644
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
@@ -473,9 +474,13 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
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
@@ -503,7 +508,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, 1);
+	if (!rtc_dd->no_alarm)
+		device_init_wakeup(&pdev->dev, 1);
 
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
@@ -512,27 +518,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
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
+	} else {
+		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
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


