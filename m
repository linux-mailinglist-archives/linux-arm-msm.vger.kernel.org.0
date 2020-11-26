Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF4F2C5E21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 00:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391922AbgKZXYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 18:24:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58199 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391918AbgKZXYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 18:24:04 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kiQcK-0001Ms-Q8; Thu, 26 Nov 2020 23:24:00 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: Kconfig: Fix spelling mistake "dyanmic" -> "dynamic"
Date:   Thu, 26 Nov 2020 23:24:00 +0000
Message-Id: <20201126232400.15011-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 48c624a1eff1..8c8b568609d4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -44,7 +44,7 @@ config QCOM_CLK_APCC_MSM8996
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
-	  drivers for dyanmic power management.
+	  drivers for dynamic power management.
 
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
-- 
2.29.2

