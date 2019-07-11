Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1CC654EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 13:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfGKLD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 07:03:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33736 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbfGKLD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 07:03:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 19A18609EF; Thu, 11 Jul 2019 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562843036;
        bh=P8qQ6Aa5k5s6i04D8hFXQyMGNzAbRB0F2DGbOTaj1pk=;
        h=From:To:Cc:Subject:Date:From;
        b=EF/Y3Nx8KtwMYduBLS/aDGQOxA11vsNZtoSULSZGbkjNnquHAIjkzNK90l7MIjFjX
         WeKWnfg5q1rIDVyWCRka0qLr+NsmVWUy/Rv8i5q5zATZfD4tGX5ASoGNid11L/knN2
         EVXQoEernruAExcEMtu/eoUqsBaU29JqIrroyEno=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9615607EB;
        Thu, 11 Jul 2019 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562843035;
        bh=P8qQ6Aa5k5s6i04D8hFXQyMGNzAbRB0F2DGbOTaj1pk=;
        h=From:To:Cc:Subject:Date:From;
        b=RTgtRLAiXLb0bb01LZ+b0oP1GObDr+LqTHWB9J0t52fqqf0RFxYVdTqCrGvlJdDRI
         TqXJ+yI5cNOqpbL3BnBN8SdvMpHnUrlw3ihzfKlMShNpZj2ntm98VhC13OZ0MiG8sx
         b0D0w+lYGuLPOCnPfdj3OOVTh6XY5TMaRLK/oDhg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9615607EB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        rishabhb@codeaurora.org, vnkgutta@codeaurora.org,
        evgreen@chromium.org, linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 1/2] soc: qcom: llcc: Rename llcc-sdm845 to llcc-plat
Date:   Thu, 11 Jul 2019 16:33:39 +0530
Message-Id: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To avoid adding files for each future supported SoCs rename
the file to a generic name - llcc-plat, so that llcc configuration
tables for other SoCs can be added in the same driver.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/qcom/Kconfig                        | 10 +++++-----
 drivers/soc/qcom/Makefile                       |  2 +-
 drivers/soc/qcom/{llcc-sdm845.c => llcc-plat.c} |  0
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/soc/qcom/{llcc-sdm845.c => llcc-plat.c} (100%)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index a6d1bfb17279..8110d415b18e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -62,13 +62,13 @@ config QCOM_LLCC
 	  to clients that use the LLCC. Say yes here to enable LLCC slice
 	  driver.
 
-config QCOM_SDM845_LLCC
-	tristate "Qualcomm Technologies, Inc. SDM845 LLCC driver"
+config QCOM_PLAT_LLCC
+	tristate "Qualcomm Technologies, Inc. platform LLCC driver"
 	depends on QCOM_LLCC
 	help
-	  Say yes here to enable the LLCC driver for SDM845. This provides
-	  data required to configure LLCC so that clients can start using the
-	  LLCC slices.
+	  Say yes here to enable the LLCC driver for Qcom platforms, such as
+	  SDM845. This provides data required to configure LLCC so that
+	  clients can start using the LLCC slices.
 
 config QCOM_MDT_LOADER
 	tristate
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index eeb088beb15f..3bf26667d7ee 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -21,6 +21,6 @@ obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-slice.o
-obj-$(CONFIG_QCOM_SDM845_LLCC) += llcc-sdm845.o
+obj-$(CONFIG_QCOM_PLAT_LLCC) += llcc-plat.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
diff --git a/drivers/soc/qcom/llcc-sdm845.c b/drivers/soc/qcom/llcc-plat.c
similarity index 100%
rename from drivers/soc/qcom/llcc-sdm845.c
rename to drivers/soc/qcom/llcc-plat.c
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

