Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2956318C0B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 20:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgCSTt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 15:49:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37037 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgCSTt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 15:49:59 -0400
Received: by mail-pf1-f193.google.com with SMTP id 3so1981307pff.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pYVz/q/oYfSRcEW9kuy6vXjgqJxNH9kUoZVwT624bk4=;
        b=IP+8fN97RRyISsjp13UrNbWub91yoKTrJ+dLi/IFdFwlMeln8RUzPJABNSvRg7oClB
         4IDElPtf6Zru/hDRJxfOkImoE/cCiAZrwUfBKSF6Khxu4tws9CFZOSqS02HprXba4v5Q
         48YvYNN/O4/8h1zIZB5nBxGah70564rlEWJtLtYlZnO8HFIlLenjL0hobrKL2mA6UvHm
         dXW0caDwGhwnvupdjGg57HjhXZlrcFEJRemF04YTcrUJeUR++df5K5mrlLj74xZ6mfUJ
         qMH5/ZPC/KKas94YUIfeh5x436aeTceIo2Two2AZQWmBRISXkbrw4koErmNvEP75UsAy
         f1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pYVz/q/oYfSRcEW9kuy6vXjgqJxNH9kUoZVwT624bk4=;
        b=IF4jWdFnq+r+RD1vRyG6tSXqdy3eWz5acbftLsGt5L1euvIRIpMhaFst5pvKqHMMOu
         0UbFyHMRBzt3e29s4MyQIHqnAeMjeN+VReYnVhE6/kaEm01WSGeVeV2OM+/jWY1AtKRJ
         bsuzFlfxtddefK6SvBBRYtO/fIfstESnTfn1EUEexh6Z+9sgn9NalWVvJlan7szCxnbt
         WyGYOtaxWqhLARaKxXP8TejUcPaiVRY4Gr5jzhQ6sNkoWHZt+pMVf5YJGenjFsVsFfIe
         LoHramgStr4gMVcR/DCruTzGS4yqryLcemsxTfrP3XE4gq0whfFU2wncBzGuWDNhEEwY
         cIFw==
X-Gm-Message-State: ANhLgQ3h+wmHG1DSTIZMx6+ui/02uYRoebftKlB/f1Bx4GfeH40E0GCy
        rK5+q6TtMdagDYrmolQClVhI6g==
X-Google-Smtp-Source: ADFU+vvlVU94t5LjsSahudUpZjzSkyz8yES5tDVu4tZoZ6z3hwxUvIzmiDn8xe4iH/duCOlp9e8+ag==
X-Received: by 2002:a63:8c51:: with SMTP id q17mr5094662pgn.320.1584647398261;
        Thu, 19 Mar 2020 12:49:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id y28sm2989377pgc.69.2020.03.19.12.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 12:49:57 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] soc: qcom: rpmpd: Allow RPMPD driver to be loaded as a module
Date:   Thu, 19 Mar 2020 19:49:54 +0000
Message-Id: <20200319194954.39853-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch allow the rpmpd driver to be loaded as a permenent
module. Meaning it can be loaded from a module, but then cannot
be unloaded.

Ideally, it would include a remove hook and related logic, but
apparently the genpd code isn't able to track usage and cleaning
things up? (See: https://lkml.org/lkml/2019/1/24/38)

So making it a permenent module at least improves things slightly
over requiring it to be a built in driver.

Feedback would be appreciated!

Cc: Todd Kjos <tkjos@google.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Fix MODULE_LICENSE to be GPL v2 as suggested by Bjorn
* Leave initcall as core_initcall, since that switches to module_initcall
  only when built as a module, also suggested by Bjorn
* Add module tags taken from Rajendra's earlier patch
---
 drivers/soc/qcom/Kconfig | 4 ++--
 drivers/soc/qcom/rpmpd.c | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index d0a73e76d563..af774555b9d2 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -123,8 +123,8 @@ config QCOM_RPMHPD
 	  for the voltage rail.
 
 config QCOM_RPMPD
-	bool "Qualcomm RPM Power domain driver"
-	depends on QCOM_SMD_RPM=y
+	tristate "Qualcomm RPM Power domain driver"
+	depends on QCOM_SMD_RPM
 	help
 	  QCOM RPM Power domain driver to support power-domains with
 	  performance states. The driver communicates a performance state
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 2b1834c5609a..22fe94c03e79 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mutex.h>
+#include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -226,6 +227,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, rpmpd_match_table);
 
 static int rpmpd_send_enable(struct rpmpd *pd, bool enable)
 {
@@ -422,3 +424,7 @@ static int __init rpmpd_init(void)
 	return platform_driver_register(&rpmpd_driver);
 }
 core_initcall(rpmpd_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPM Power Domain Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-rpmpd");
-- 
2.17.1

