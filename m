Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A9A194BBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 23:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgCZWpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 18:45:10 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40174 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbgCZWpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 18:45:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id c20so975205pfi.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uXFWCA6HsRoFU7UHbCkibQyhhxiptzgR3ncwTu65yOs=;
        b=b6EBDV5D14KVHV3wD3Ol5xWcqk/VSycmLNDdgJZ9srR1xMjA8/P+83qr06g+dwDBF3
         tpkK0HVrqwYlyhyNs/6Fb9jrYz1YUFN1U7dIz0f2lGUMngq8+meZbD8zi0FnI1x2ZtmN
         1NWQpNJL3NrsmF2m+TgTg8rdjT0TVisGMeu9gwy2G1GFTZHLc7kKDbJT2g0kdR4dBT1K
         G/YP2FpEUoY6ZLU2tq9MsyfKtUB3dyAVMgzesmCp+jCzo7yLR7Vu2OCfOFWCzzioei41
         GEZmdwuTUB+wOIx8RY0OI4BaDASpGUy6JVpuOmO70/NECorFsuLdy/35S5QODhrSfwKD
         o/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uXFWCA6HsRoFU7UHbCkibQyhhxiptzgR3ncwTu65yOs=;
        b=KxLQ1ZillG3T9d6KxfJcAzRbec6EmXlX95V1vZ5xvNxtM4G5FalNnz2Kl7EkmV2tIP
         MOGp0XWXOFnm1lL/ck5IUMxBJ47n4x+k1OZla5bmRHSahdWb9F8l7U8ydvwjdP8RaBRJ
         7qKarGmgQvPC/DpTo9Nxcdwlx8McAleQiZ5iZ8qGv0xV0MVTZYhMZ/Dtu/0ituC+iVU2
         gmHGjkP9U2e4a5NDsHtgv5rdkncXCQf7Q4/pwRFrTPTx+puIV3TtbWVddoV/M4PEUoK6
         X8QaiPZKNuSBwM5V6wrX72PDkr1tbnTdmzAE8+bbpYUkeb1sx2cKF//VjUOgUxOXKk7Q
         eSCQ==
X-Gm-Message-State: ANhLgQ10NhOvvRd+8aOjs4Qhxbjruygz5wRYztUmJgUuBQAKAf767Hgn
        rLlvhdciK7OD/umG/Ne+1B47fQ==
X-Google-Smtp-Source: ADFU+vu9KGqoAE4crBP4wJCZ1UO5CXpzN5sdzapPizXKKa7HM9pL5RtmXtBOe7hYseU2KlJwcR0Mww==
X-Received: by 2002:a63:60d:: with SMTP id 13mr10693526pgg.151.1585262706292;
        Thu, 26 Mar 2020 15:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id g10sm2592788pfk.90.2020.03.26.15.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 15:45:05 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] soc: qcom: rpmhpd: Allow RPMHPD driver to be loaded as a module
Date:   Thu, 26 Mar 2020 22:44:59 +0000
Message-Id: <20200326224459.105170-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326224459.105170-1-john.stultz@linaro.org>
References: <20200326224459.105170-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch allow the rpmhpd driver to be loaded as a permenent
module. Meaning it can be loaded from a module, but then cannot
be unloaded.

Ideally, it would include a remove hook and related logic, but
apparently the genpd code isn't able to track usage and cleaning
things up?

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
 drivers/soc/qcom/Kconfig  | 2 +-
 drivers/soc/qcom/rpmhpd.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index ac91eaf810f7..ffc04285840b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -114,7 +114,7 @@ config QCOM_RPMH
 	  help apply the aggregated state on the resource.
 
 config QCOM_RPMHPD
-	bool "Qualcomm RPMh Power domain driver"
+	tristate "Qualcomm RPMh Power domain driver"
 	depends on QCOM_RPMH && QCOM_COMMAND_DB
 	help
 	  QCOM RPMh Power domain driver to support power-domains with
diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 4d264d0672c4..0bb12d5870a7 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -4,6 +4,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -189,6 +190,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, rpmhpd_match_table);
 
 static int rpmhpd_send_corner(struct rpmhpd *pd, int state,
 			      unsigned int corner, bool sync)
@@ -460,3 +462,6 @@ static int __init rpmhpd_init(void)
 	return platform_driver_register(&rpmhpd_driver);
 }
 core_initcall(rpmhpd_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPMh Power Domain Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

