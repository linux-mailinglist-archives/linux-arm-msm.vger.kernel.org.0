Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A305E283042
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 08:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgJEGAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 02:00:34 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:48527 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbgJEGAe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 02:00:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601877633; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=vrdM/2wrNsHdYoObDsxyGdJFCClcRDod+TrwzKiL3Wc=; b=ITfYxu6vFjcm1BXP99DDSePq0AUWyKKyj4Owp7rmp02V4TRTwxSk6hrRknpvD3aqkgvE7fMs
 vXZmFT6MkbEfnMmpRiyv5HbxUXodIEMAgRIGSajcAolceFdmJ9a2rD5roPwlrMp3xWw/xdpi
 Vb/otmB6bY6i5q3IalT4jriqzz0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f7ab678a03b63d6733cd80c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 06:00:24
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C74B4C433CA; Mon,  5 Oct 2020 06:00:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB40BC433CA;
        Mon,  5 Oct 2020 06:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB40BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        John Stultz <john.stultz@linaro.org>,
        Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [RESEND v2 2/2] soc: qcom: rpmh: Allow RPMH driver to be loaded as a module
Date:   Mon,  5 Oct 2020 11:29:56 +0530
Message-Id: <1601877596-32676-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601877596-32676-1-git-send-email-mkshah@codeaurora.org>
References: <1601877596-32676-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Stultz <john.stultz@linaro.org>

This patch allow the rpmh driver to be loaded as a permenent
module. Meaning it can be loaded from a module, but then cannot
be unloaded.

Ideally, it would include a remove hook and related logic, but
the rpmh driver is fairly core to the system, so once its loaded
with almost anything else to get the system to go, the dependencies
are not likely to ever also be removed.

So making it a permanent module at least improves things slightly
over requiring it to be a built in driver.

Cc: Todd Kjos <tkjos@google.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[mkshah: Fix typos in commit message, send after removing _rcuidle trace]
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/Kconfig    | 2 +-
 drivers/soc/qcom/rpmh-rsc.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 3dc3e3d..892bdc7 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -92,7 +92,7 @@ config QCOM_RMTFS_MEM
 	  Say y here if you intend to boot the modem remoteproc.
 
 config QCOM_RPMH
-	bool "Qualcomm RPM-Hardened (RPMH) Communication"
+	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for communication with the hardened-RPM blocks in
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 35a7a50..37969dc 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -13,6 +13,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
@@ -1018,6 +1019,7 @@ static const struct of_device_id rpmh_drv_match[] = {
 	{ .compatible = "qcom,rpmh-rsc", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, rpmh_drv_match);
 
 static struct platform_driver rpmh_driver = {
 	.probe = rpmh_rsc_probe,
@@ -1033,3 +1035,6 @@ static int __init rpmh_driver_init(void)
 	return platform_driver_register(&rpmh_driver);
 }
 arch_initcall(rpmh_driver_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPMh Driver");
+MODULE_LICENSE("GPL v2");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

