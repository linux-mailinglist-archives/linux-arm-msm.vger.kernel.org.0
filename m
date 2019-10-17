Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5376FDAA19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 12:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501991AbfJQKbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 06:31:23 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36178 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501996AbfJQKbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 06:31:19 -0400
Received: by mail-pl1-f193.google.com with SMTP id j11so928154plk.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=smRwPgvncTjnAR1YtPvLb1bA4/kxUscSlcxDGMtB+pk=;
        b=DDQW0dW0reHs8t1GXSVyT9VgUmlnBcjxefVEiiSkhjqDBKk6/6035Yl+3gAe3iREvz
         aEfAlmZCgqggMlR75cYhw+NRjIvUTX3lNVXQaue09BQetHpE9/mVW5+bwVYmASPpCUCg
         VMiBx7zjSopPB1lPhYghf7lylEASdwn+lDyZlX8eQoajYOkkQEjL3P0oebZJ6/uTY02u
         RcEl7YAv7sTaoQm6kcNNyFyUE2y6HJuT4r+UCVJLimmo39wSX5IPtjB7oNJvysjqpL0J
         OZiN61pd5RMvEfFfpAULYiMAeW0j7gMu9I9ZyY8z490J2vX9UEWcA1DdQBqobPtpq2Bc
         hM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=smRwPgvncTjnAR1YtPvLb1bA4/kxUscSlcxDGMtB+pk=;
        b=i0e6jP6DbQEFHOFa/dO6llJMajIil0JOqnort/3gaQmeI1oCdAW9VoEYJ0Iym1a+kc
         VtByNiLIE6sVLQxdcGLYQErbiBuY8LhO0X4wDpRdg57eBNODgYaSuxLTKO63DeuOSTWR
         Tvfiw2GD868hwMoR88lcvy39f/Tm8aaF87CxmgRfcM7Cqq+8qw6xD89rJdDmPAc7tqae
         AD09m72m+i5/PBM5RhJ2Q9D7z5DYAS3dAAwudrhpuaeEZNCf+ZCcwjKNiUsn/xcBgiRs
         nJnLzukfrMOvGRh348Ix4SpHnT6+iSXGGp8tB0qPS7XdpJsDWVFJqCqPvuY5IDJjmOUz
         zsLQ==
X-Gm-Message-State: APjAAAWi+e3Pj1NbwQWrJajhEu3xL0BxqmiXgtw2THRrDHUYUMexG4o8
        s6VlLSwawzZsOF6KrY7QllNBSurcn5f6mQ==
X-Google-Smtp-Source: APXvYqwGQKQHsOV8uBmheqM16mQRxnhppIgWy5oZkoWCLezI/u2DUJJPCreCJsUc0l3q9jmUg1xGrA==
X-Received: by 2002:a17:902:bd47:: with SMTP id b7mr3278948plx.28.1571308278241;
        Thu, 17 Oct 2019 03:31:18 -0700 (PDT)
Received: from localhost ([49.248.54.231])
        by smtp.gmail.com with ESMTPSA id p189sm2040225pfp.163.2019.10.17.03.31.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 03:31:17 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v2 5/5] cpufreq: qcom-hw: Move driver initialisation earlier
Date:   Thu, 17 Oct 2019 16:00:54 +0530
Message-Id: <3468b8cf9c764ea139296ee149d33cd7a9d79e3e.1571307382.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571307382.git.amit.kucheria@linaro.org>
References: <cover.1571307382.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571307382.git.amit.kucheria@linaro.org>
References: <cover.1571307382.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow qcom-hw driver to initialise right after the cpufreq and thermal
subsystems are initialised in core_initcall so we get earlier access to
thermal mitigation.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index a9ae2f84a4ef..fc92a8842e25 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -334,7 +334,7 @@ static int __init qcom_cpufreq_hw_init(void)
 {
 	return platform_driver_register(&qcom_cpufreq_hw_driver);
 }
-device_initcall(qcom_cpufreq_hw_init);
+postcore_initcall(qcom_cpufreq_hw_init);
 
 static void __exit qcom_cpufreq_hw_exit(void)
 {
-- 
2.17.1

