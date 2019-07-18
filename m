Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFFF6CE7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 15:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390414AbfGRNDB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 09:03:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41760 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbfGRNDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 09:03:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A276861778; Thu, 18 Jul 2019 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563454980;
        bh=PnlY0OT4+E5Po2cWFTcq7xAwQokdKWy4JaLrTZw93uQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eGWD7Usl9rGzjXlX/wFdtS2AmJXClQWx7RgDsWuTtnrEvn04iaR7niP7ewkRLOKiJ
         vsOmU9iEjgD12WYenuZNT/mQBV2aqjq2c37pamGcYXwl8ghpxU/D7tjBnSKUEOuEKP
         dbP6u2UnyWtCwy8rC4bMLDXLyvJ+yNeWvwrqj1Xc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23B8F611BF;
        Thu, 18 Jul 2019 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563454976;
        bh=PnlY0OT4+E5Po2cWFTcq7xAwQokdKWy4JaLrTZw93uQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oXzlVRLCHEp03MPzuf8JGgn7LfR6j9VXznfULRj/Ylwf4PIunG7GY1ALRXP0mJJA9
         m2uZE8enp5CGtU+dbrzWbqYwaL9dGQefF3QHW1mnakbq/MqRtztKphTBthHMHtdcCk
         ZudRwSZpKW+Sgrpi31odHuIspAljlnZNVXHt9bJ4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 23B8F611BF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        rishabhb@codeaurora.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 2/3] soc: qcom: Rename llcc-slice to llcc-qcom
Date:   Thu, 18 Jul 2019 18:32:37 +0530
Message-Id: <20190718130238.11324-3-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
In-Reply-To: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The cleaning up was done without changing the driver file name
to ensure a cleaner bisect. Change the file name now to facilitate
making the driver generic in subsequent patch.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/qcom/Makefile                      | 2 +-
 drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} (100%)

diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 386bf197e0e5..caf8e0beaa57 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -20,6 +20,6 @@ obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
-obj-$(CONFIG_QCOM_LLCC) += llcc-slice.o
+obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-qcom.c
similarity index 100%
rename from drivers/soc/qcom/llcc-slice.c
rename to drivers/soc/qcom/llcc-qcom.c
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

