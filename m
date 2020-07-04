Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3C82147B4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 19:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgGDRXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 13:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgGDRXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 13:23:40 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BCFC061794;
        Sat,  4 Jul 2020 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=G8yXxDShVwrQA0v5h9br4pp8LoK+D/7j1foC/3SaMd0=; b=iqfnV0fXgswM+NU9tB7/k/igqY
        NP9n+DzJ7C6kJj2L2NRdKOUqo8j6rHsEL0aj7MnPiPazV1Nx8I6H5+SvI8u/RM/Q24EAIZhwYnkX2
        fQWScbSibNM1uo+zLJZz78GiIDtTztunonFuK/r1nhmrd55dIrKmGeFMpGJo22EhD2zKHK8kzXgaZ
        fNvxIpLsb7rcSmf8u/a947Qvjn2wjU/rW56GyfKfjOERIRvCg94Fzl1T79/IIL80pds6mW/sndC4k
        xk1PG0HpGnESFBsYjFZIh/1qdecXHaWlQcvi+O8zS9X3SCahSvh593D39m3FPGLHln2kunSy8/Z1S
        wXbVsL1g==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1jrlt0-0000EO-OQ; Sat, 04 Jul 2020 18:23:34 +0100
Date:   Sat, 4 Jul 2020 18:23:34 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Elliot Berman <eberman@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom_scm: Fix legacy convention SCM accessors
Message-ID: <20200704172334.GA759@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The move to a combined driver for the QCOM SCM hardware changed the
io_writel and io_readl helpers to use non-atomic calls, despite the
commit message saying that atomic was a better option. This breaks these
helpers on hardware that uses the old legacy convention (access fails
with a -95 return code). Switch back to using the atomic calls.

Observed as a failure routing GPIO interrupts to the Apps processor on
an IPQ8064; fix is confirmed as correctly allowing the interrupts to be
routed and observed.

Fixes: 57d3b816718c ("firmware: qcom_scm: Remove thin wrappers")
Cc: stable@vger.kernel.org
Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 drivers/firmware/qcom_scm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0e7233a20f34..d4fda210adfe 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -391,7 +391,7 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 
-	return qcom_scm_call(__scm->dev, &desc, NULL);
+	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }
 
 static void qcom_scm_set_download_mode(bool enable)
@@ -650,7 +650,7 @@ int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 	int ret;
 
 
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
 	if (ret >= 0)
 		*val = res.result[0];
 
@@ -669,8 +669,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-
-	return qcom_scm_call(__scm->dev, &desc, NULL);
+	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL(qcom_scm_io_writel);
 
-- 
2.20.1

