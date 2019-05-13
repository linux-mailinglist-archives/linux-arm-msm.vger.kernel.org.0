Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34B31B3E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbfEMKUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:20:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55764 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbfEMKUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:20:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B9A2660AA8; Mon, 13 May 2019 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742837;
        bh=gv7cZOA40miXv3BP7BEyZB/2v7GNv3dIS+X+E9LBQ48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D7nZeUWxzg+XiGuMd3cl2M201OgzHR/mJX62SXBM6L2svpIy+zXbAVoZRhCGKxipq
         rXQK9epk8mWjQiUIyERdDGG+Zft7p9egONnD/wgWcWAB65N7tiY5diwUF/f3dirVzg
         Tld4+TZuvrLe5x+ChjV0MgfVdBMkPiOVgjPZSWDQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B3B660A0A;
        Mon, 13 May 2019 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742837;
        bh=gv7cZOA40miXv3BP7BEyZB/2v7GNv3dIS+X+E9LBQ48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D7nZeUWxzg+XiGuMd3cl2M201OgzHR/mJX62SXBM6L2svpIy+zXbAVoZRhCGKxipq
         rXQK9epk8mWjQiUIyERdDGG+Zft7p9egONnD/wgWcWAB65N7tiY5diwUF/f3dirVzg
         Tld4+TZuvrLe5x+ChjV0MgfVdBMkPiOVgjPZSWDQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B3B660A0A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 1/9] soc: qcom: rpmpd: fixup rpmpd set performance state
Date:   Mon, 13 May 2019 15:50:07 +0530
Message-Id: <20190513102015.26551-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remoteproc q6v5-mss calls set_performace_state with INT_MAX on
rpmpd. This is currently ignored since it is greater than the
max supported state. Fixup rpmpd state to max if the required
state is greater than all the supported states.

Fixes: 075d3db8d10d ("soc: qcom: rpmpd: Add support for get/set performance state")

Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 005326050c23..235d01870dd8 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -226,7 +226,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
 	struct rpmpd *pd = domain_to_rpmpd(domain);
 
 	if (state > MAX_RPMPD_STATE)
-		goto out;
+		state = MAX_RPMPD_STATE;
 
 	mutex_lock(&rpmpd_lock);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

