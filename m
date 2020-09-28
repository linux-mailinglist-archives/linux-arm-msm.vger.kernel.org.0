Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB0627A642
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgI1ELn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgI1ELm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A9CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z19so8140686pfn.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d5NHMOfzoZtUI9mNkF0dRKXjszoqYK7ekBI5K8v9id0=;
        b=FwfRqc2fUQHMLsff4W9Dft9bi2yyvQYDrmzhkFpw/ePGL6JsK5V9BP8YcCCNn0fYrQ
         wbrH0hWZq/8XHqJAB92g+tPafACCwA7Qzr3FWZisvCLR9itF/CTRVEhN8kt4EkgvjfIA
         J2pigzAWswiWIdOiFcuaaSy5vCumaaeXIwRUwXgPu4xqkpG+ePlwtmdf/HM/e0h82fU+
         p3E7kFTasvX84jakIGzFD0eymH0Y6zvCP2y3aKFu6ExHPkYUxshzzGptE2VkhJB2gu0H
         e9h4OsZBJTJy0qyR66wl8skGLTl3VleiwiSYeAkE8yFKM9ZizZO9M08DfGkw0KtRnFCD
         WODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d5NHMOfzoZtUI9mNkF0dRKXjszoqYK7ekBI5K8v9id0=;
        b=mu8BbL6Tswtdec+bpsqZFgpQ0XiE7rYvsL4DsXe5hy5SDqQy5n0LR4DGEVLIwnBQbb
         yutkxQYG9L7Tw77zkcVrW6BQOc01vj+wpABRgQm+/wrPbQaEHfFw+i5Qf4T/2XRiEs30
         pVN6QJ1PqjXzazPN4iQKSkAGc3b0CmgME2UPFDpLD5qmsh3lD+SJgTPFN+usROloQ/TI
         dPRtEmUtsOE8NdFSFebyCGAmAva5Fy3nDHtTEBchyCsajW/3Pas1fLAGgpmGeOSPZoka
         zThZjoFJ764KgoIv83FoQzmL9z9TrnIRhYODInygnNG6ZCAKwWcTHlSu5a4/dP4hODI8
         2Tfw==
X-Gm-Message-State: AOAM532rRnSqBFfkXcrInJZoDdO16ggVadarWuHiqLgnkyr1wKM5YnJQ
        NkhqsyFZ+jrtc1+pvUshDyID
X-Google-Smtp-Source: ABdhPJwBP30K9zmOpXBvNlFlCfq6/G/amVrj8J2SLRxb3vgucuwV1w2iD79cymQmb83qh4yZAMds1Q==
X-Received: by 2002:a63:4945:: with SMTP id y5mr7423665pgk.181.1601266301533;
        Sun, 27 Sep 2020 21:11:41 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 17/21] bus: mhi: Remove unused nr_irqs_req variable
Date:   Mon, 28 Sep 2020 09:39:47 +0530
Message-Id: <20200928040951.18207-18-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

nr_irqs_req is unused in MHI stack.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 ---
 include/linux/mhi.h         | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 103d51f35e28..0ffdebde8265 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -680,9 +680,6 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_event++;
 	}
 
-	/* We need IRQ for each event ring + additional one for BHI */
-	mhi_cntrl->nr_irqs_req = mhi_cntrl->total_ev_rings + 1;
-
 	return 0;
 
 error_ev_cfg:
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index fb45a0ff9aa3..d4841e5a5f45 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -312,7 +312,6 @@ struct mhi_controller_config {
  * @total_ev_rings: Total # of event rings allocated
  * @hw_ev_rings: Number of hardware event rings
  * @sw_ev_rings: Number of software event rings
- * @nr_irqs_req: Number of IRQs required to operate (optional)
  * @nr_irqs: Number of IRQ allocated by bus master (required)
  * @family_number: MHI controller family number
  * @device_number: MHI controller device number
@@ -393,7 +392,6 @@ struct mhi_controller {
 	u32 total_ev_rings;
 	u32 hw_ev_rings;
 	u32 sw_ev_rings;
-	u32 nr_irqs_req;
 	u32 nr_irqs;
 	u32 family_number;
 	u32 device_number;
-- 
2.17.1

