Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6D32CB970
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgLBJoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388374AbgLBJoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:24 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6141C094243
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:41 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id h7so418790pjk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nTb4bDaGBERzc1DVzOJ+hYUZw8vd3IFev46E0aJe5pM=;
        b=k7weTbPzd4qGAVsY0L3rLmh9fBgRionLY7FttqxE6LGukCO2max1ZCFgN9WSbe+lZG
         JGoOF1iLesIb/xK6tMaVEoTJBYjUfqUctyBTLDYLxxJU9vdgGbgK46NrGKvXtgm+/XJ5
         n3xU45AhitmECN9KrB16z3uy3Rzn5byBI3UTZu/4BNihJiwfEKqv0mSQwcDzB1+CNm5m
         kYOO5Ty7F7jhmnhTRbZgWz58Eok8ejEekHBBPvMUBUFx3vT/2nyu49YPRbdlF3sopMuu
         lpZlGdXlWkJ6yyg9xpFnQtkvMOJ8D/9ecOdUP9Wfrc7b1PtiMrOGf3fTFQZ6qhWk+BTC
         TbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nTb4bDaGBERzc1DVzOJ+hYUZw8vd3IFev46E0aJe5pM=;
        b=abtjXIb8rqR/5xC0QoBagaj7+2dbMakp0UuAbOJ2gXzMBksDzabRcupd4oy9Z5KOuT
         1E4VgXYSKGTnFxfpHc7FGiqgjNSfDKAbnXVFFEZx+SLaPiD/ZwD1hEdYxepgyImtNmmo
         B7xtGuDNUE4vj1T1Tm+gGnhXuVGT3cageCTeCJQ6dhPDbLboR8e+Hn1g2xL6HLocw5Q+
         rbho0SU69FvTcCtPttZEnGkpwCUF5frFWhd8QIPXAgO8Hy0lkYNfFqZmI89kf7ea6dfR
         /B2OOXccdA8SLUpY8XTQb0q+Zg/m0oGP0kEKnww/N22vJyPoWcEwJ2GEkOkZsoFCsKb2
         Y0Sg==
X-Gm-Message-State: AOAM533/PqyDEAeffAK2tTiVttSx0yB7IMSFjyumq8Qsn/YWlzuezluW
        FnWzh1B5WFTJJMtBPePmMGD3Oa0ZIF1A
X-Google-Smtp-Source: ABdhPJyC5yYQ2EQTGtAxBooRC6QRwY8af6nNNc86ZU2nCeZOpUcoHKfvsb2rGHL16G09qur5JZv1YA==
X-Received: by 2002:a17:902:469:b029:da:17d0:e755 with SMTP id 96-20020a1709020469b02900da17d0e755mr1943968ple.53.1606902221432;
        Wed, 02 Dec 2020 01:43:41 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 19/29] bus: mhi: core: Use appropriate label in firmware load handler API
Date:   Wed,  2 Dec 2020 15:11:49 +0530
Message-Id: <20201202094159.107075-20-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Correct the "error_read" label to say "error_ready_state" as that
is the appropriate usage of the label.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 7b57bb9a3080..c2546bf229fb 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -497,7 +497,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (ret) {
 		dev_err(dev, "MHI did not enter READY state\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Wait for the SBL event */
@@ -508,7 +508,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "MHI did not enter SBL\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Start full firmware image download */
@@ -524,7 +524,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	return;
 
-error_read:
+error_ready_state:
 	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 	mhi_cntrl->fbc_image = NULL;
 
-- 
2.25.1

