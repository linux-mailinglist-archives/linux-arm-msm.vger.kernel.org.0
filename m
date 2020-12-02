Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC382CB977
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388531AbgLBJod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388552AbgLBJod (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:33 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B91EC0617A7
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:14 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t37so751680pga.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=As+64t4In9qgfO6oiaQfB+CQCXZv+hCjtZ0HhYLGPu4=;
        b=nHfys83GpKTfu7SddXUVTvpPDZ29CmUwRuWoieNCtEPlo5MQbR/JT/Ja3uw4zBYu6u
         WmI5zSwtECGNAJy1QMmYmfO7MSpTwd5GRHCfWfjPg7+7RCdS4VtfIezZjoFvzsvtqLuO
         CyYgqnqJ+71LDwrgEOJy+4nrmSoR4aKE5Ali/yLsgPKgpHP8XzsIx3zC58JamYaQZZnD
         Z45Aa1fHE+q/gXnkjli415odxozqBY1XZxpdblLpYUcyFKuTptwPOJRor0w34GrniwDZ
         uHq1GoA5ODIRduQGSb+GvESMHGjtp6VKlLen9pDYJMGNE1v8sAlcQaXddVkRVuimZCOZ
         GcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=As+64t4In9qgfO6oiaQfB+CQCXZv+hCjtZ0HhYLGPu4=;
        b=rJM4J/9m8ekmVeeW6amLcBYMcbtEPm//kwb6tm2/aNJlU2YDrY3kTYBPlr/xw0df4R
         92FCibk8kDZFon0JVmWT6kK2ExzCYUPXZcgHpb/R142JVttoR38CVtLBCxqBVC+DDLQy
         6z5DdibZ+cUz/WYrGRUkLRXv1KOEIEixsH9uWiWiTGjXG8NcDxHDHfJkd4aza5KqJN9n
         xoWHqCtPQKN7YRsciGUzjalT5P5IMQmQ4zhObvANh+L5mWEpp/amFn4b/QfmaCDORw5B
         K65Usb7uFahgZJ0mIILC4SI1a4yO0fCMZE4ZsOLRk4ntzRrPzSpRafVkiBctOVOWN/93
         ekcg==
X-Gm-Message-State: AOAM533VpRl8WPAZtwebR6KYhe9Xld6XS9wwL09/eBC911gQSnAlhWzV
        23O+V1yBGU7VwiE6KBb1nmim65e+CrYp
X-Google-Smtp-Source: ABdhPJw1NWQcpNngblCqva+MFz+7MwdRH9fxhBLv4l2MT6aDsrKgSO7h8P1UqvF+FufG/JPiHoGtpg==
X-Received: by 2002:a62:8705:0:b029:198:22e5:adcd with SMTP id i5-20020a6287050000b029019822e5adcdmr1769218pfe.74.1606902194040;
        Wed, 02 Dec 2020 01:43:14 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:13 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 12/29] bus: mhi: core: Skip RDDM download for unknown execution environment
Date:   Wed,  2 Dec 2020 15:11:42 +0530
Message-Id: <20201202094159.107075-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

If MHI is unable to determine the execution environment during
the panic path, host must skip the RDDM download. This can happen
if the BHI offset read or the BHI_EXECENV register read fails
indicating that the underlying transport is unresponsive. Hence,
there is no need to trigger an RDDM using SYSERR or request an
SOC reset.

Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 16244cc8fbe7..6f0cfb9922b4 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -92,6 +92,9 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	 * image download completion.
 	 */
 	ee = mhi_get_exec_env(mhi_cntrl);
+	if (ee == MHI_EE_MAX)
+		goto error_exit_rddm;
+
 	if (ee != MHI_EE_RDDM) {
 		dev_dbg(dev, "Trigger device into RDDM mode using SYS ERR\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
@@ -139,10 +142,12 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	ee = mhi_get_exec_env(mhi_cntrl);
 	ret = mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx_status);
 
-	dev_err(dev, "Did not complete RDDM transfer\n");
-	dev_err(dev, "Current EE: %s\n", TO_MHI_EXEC_STR(ee));
 	dev_err(dev, "RXVEC_STATUS: 0x%x\n", rx_status);
 
+error_exit_rddm:
+	dev_err(dev, "RDDM transfer failed. Current EE: %s\n",
+		TO_MHI_EXEC_STR(ee));
+
 	return -EIO;
 }
 
-- 
2.25.1

