Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1503E179F5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 06:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgCEFmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 00:42:52 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35904 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgCEFmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 00:42:52 -0500
Received: by mail-pg1-f193.google.com with SMTP id d9so2192523pgu.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 21:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cNQGrNZI2YLBUBgRppVQ1AFH/YzUKaKdzB/7ZzNdnn8=;
        b=neFlY3AzXQwk38I3fCwFvt5ea+6QcafBvcuXUQgf6wn1h9Fmksg+lwGVKtbXUdFpbD
         iFrEvVLJ/nqm6IVqw2M5/CBrwEwFT94PjdZvxzC4JVTewsKmQokKrRj2IesC0+TfNwxZ
         D2c7SVFaLJaNIbTfn/sTDXldlYxLgmUzHjZhrpNjINbtV+y6ydgeH3ht+VB7S5wiDGIh
         VoKXTeRH9KSswYCSw7P7clX+pqRm+m+MKtHDg65bPZ0FItepMfaNvZzlthJfF/vtn6i5
         kEm0pKmcN8BTcDjq8ABJ6Ts6CXGRI7C4hYuG6l0X9Y/orblbcgQ0GPzMEzCw+Z9DvHHp
         DBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cNQGrNZI2YLBUBgRppVQ1AFH/YzUKaKdzB/7ZzNdnn8=;
        b=EEOGi6E/ufXSqjrQdwzTcBTSqocGYTSvWRiw+Vy68pTrNlyqzfbaL1y8EGE1Wls+Q3
         wKXnuBZMp4hYy8r/ps03VZkoCSUCbgVHq64/8Yc635ptzZadETBLPa6yPXmhQ894bKR3
         ROWSrUSqq06snvrcn4b+aVHSk/OLOOpDWe0up2pLU/dXry9O136Iy4wT+T7HrqA8e77g
         a1tTSPeirvuCcYcSBM40SlzzzvKcLlhmL5i07l4xYmq0rEE7NEc2SQzPzVWH4qZpPBkY
         +X75NXqCbrcYf0O0lJntPfEavs/CkMA/T4PwYDNQVf9uPE41Rg6N0E0wiOVV9SXo4cxE
         1Zfg==
X-Gm-Message-State: ANhLgQ3hQPJK8EgotSvcRED3kvZ2+sse9AtCMsTMEfoTromxkhIOdVus
        DcHhF0KsYmalOWCaLTlcRYl9qlxwRA8=
X-Google-Smtp-Source: ADFU+vvzjkS9TGRcblpeqpN0ZPT+dotszbngZ5ty0l0O8K/HOOu6mUTWyw5dOp04GzZet7pPJd+gNA==
X-Received: by 2002:a62:37c7:: with SMTP id e190mr6745679pfa.165.1583386970893;
        Wed, 04 Mar 2020 21:42:50 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id w17sm25177400pfg.33.2020.03.04.21.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 21:42:50 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [RFC][PATCH] soc: qcom: rpmpd: Allow RPMPD driver to be loaded as a module
Date:   Thu,  5 Mar 2020 05:42:44 +0000
Message-Id: <20200305054244.128950-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow the rpmpd driver to be loaded as a module.

Cc: Todd Kjos <tkjos@google.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/soc/qcom/Kconfig | 4 ++--
 drivers/soc/qcom/rpmpd.c | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

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
index 2b1834c5609a..9c0834913f3f 100644
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
@@ -421,4 +423,5 @@ static int __init rpmpd_init(void)
 {
 	return platform_driver_register(&rpmpd_driver);
 }
-core_initcall(rpmpd_init);
+module_init(rpmpd_init);
+MODULE_LICENSE("GPL");
-- 
2.17.1

