Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0C7274BE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390140AbfGYKmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:42:36 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44973 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389566AbfGYKmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:42:35 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so17183326lfm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=78HcFQpe5dwNeXFNQEST3LONCweS/YxfhvN+bWwWiRM=;
        b=F2iHwiOM9Fg1pexm655bf4v/yYZ1JSSOG7bleCwne6gW1kURYh9WmgsHfmDGr0jn9u
         mXg+FeGbXJTdyLyGnZum8gMvonOtgrR8zidr8NKJCh+4g+s63bdI7lsKsB2yNhTIfC4+
         XemZWM+qeBL7ZzD1ibMR+ej5tRSaDVGRJkKF4sfbs7rbjz0Ae3I+FIp8Fm59/LZhUYA+
         fjSGf4KaEciiZ55GuXeegV0j8jJTq9jLYHlV1TGfxFVMjeXvDDdsu90xXcyhfgWB0CUw
         g/o8OzGz4g0QZQA1KvoGzS3EmNnTDOV9vtncpmP69nRLcAFrC2qqrei3ilVhiQZVrqgT
         xavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=78HcFQpe5dwNeXFNQEST3LONCweS/YxfhvN+bWwWiRM=;
        b=P9bpAcc120OVGKOHKv/a67OtF7Fl/vDkO/6MCJp+sdYLcJacuOzzB54aiHVK86PNU9
         6mYPfCVYdGPg2+dy1v+rZJsa2lfPPmYdtkeFYbO7ymwpaE6GtLfLxttbe3cSX5aXmEFZ
         r4WNKFTY/zxN6vfXuEwn/wqE08mTK87QHw8lGfXinR1pIcW3iqyZoMErm0INg+LKpz0X
         9dt/e0dwWg+kUZP5SGzFgSnoNmRjjXGOnzVNtjoWNIGvxYSIsn0o1g/qu8s8OBHFLMTD
         Ac90WoUYEJKsDk2RPSWST2cJI6/PiHSg7DvkEKI0onTILAfRqDrekkQWSEt5MJIq7g6B
         de1A==
X-Gm-Message-State: APjAAAX5nCLuz9Yu7IA6Zub7TocYkneufC7UyNK8AjLaB4kMTzHxTkLJ
        rlsFj1Wj9IpnRckGNdxBZuV27Q==
X-Google-Smtp-Source: APXvYqwAo84A238zF4AbQKdKLdydEBI6YuDKQ0X/EF/EfLAD0Iq2h3InFiMQDfmhmhF66iLOx1Epqw==
X-Received: by 2002:a19:c514:: with SMTP id w20mr41258688lfe.182.1564051353682;
        Thu, 25 Jul 2019 03:42:33 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id k124sm7461299lfd.60.2019.07.25.03.42.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:42:33 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/14] cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist
Date:   Thu, 25 Jul 2019 12:41:36 +0200
Message-Id: <20190725104144.22924-9-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Add qcs404 to cpufreq-dt-platdev blacklist.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index f9444ddd35ab..ec2057ddb4f4 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -125,6 +125,7 @@ static const struct of_device_id blacklist[] __initconst = {
 
 	{ .compatible = "qcom,apq8096", },
 	{ .compatible = "qcom,msm8996", },
+	{ .compatible = "qcom,qcs404", },
 
 	{ .compatible = "st,stih407", },
 	{ .compatible = "st,stih410", },
-- 
2.21.0

