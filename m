Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D411EDD39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 08:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgFDGg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 02:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgFDGg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 02:36:28 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D7DC03E96D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 23:36:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nm22so724954pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3OTdeVCvSUjOBcj6MS4hXMUrhdRM9CDvX4e1/CfV3A4=;
        b=hYKEptt2qyz/b32b0YAtEha20e0sYfLCeLpb93ZQit9FI0v559hjC6QoUSoCMHMQ80
         FyuIzbyMI9wpBSN0A+N4TmGbIr9/2WEMfeWQddlbcLfBgrIr9wxMDhyOz2MHaB2iLUaF
         /dug2Tp5tbHXmSmHZ98Kk5UkOGLDij/L9G6vJX76bdfX6cwDM7pnb/+GxQMCDzu7tMjC
         rCzhLJPGVZZWuXJcsPYBhISx7F5m0v9LV99iQpG15f+jLdRQLs6nvMqQ2zT8OevOehWi
         fZlEtafJVXEn9qzHeN+ajzCewsWfUR4aVAXkIr2GIUoI/poUsT8rjdoVXQL0nm3H91ye
         l/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3OTdeVCvSUjOBcj6MS4hXMUrhdRM9CDvX4e1/CfV3A4=;
        b=qikyf0Y/E2LVlDcLuSGsuD9yR1eN41YhQGpHeQqXBF6M7EYZ43+IIvgK42jhpLl9F1
         mZBKh+eR74XCwut6dbvwDazHi62dm2qTJ9542bvK3uCibcMU4OWJwRSZQRiWu5eKBR4x
         3vSsZEg6i1iPemDvo1vapFFgLUg81dqVs2ViDFzl2dD5XEsEn4YoCMgZLk9GW1MG1wLf
         VsknBxryu9S08QtSps9wujxnt21pQWq2ib8LG+iRQc0UbdoyZBSwIwAkepfAYUM6ANeY
         7E8qV2/jaxIKdGF66MzUD+0ikTtRtsJOhfjhUKehjDXLZNW2GJPWxfPbEUN8sg0OV1jN
         Th1A==
X-Gm-Message-State: AOAM531m+ZvuazG4KQjbOMR0G0h7mReIlqJRMu2spzVhpofnHOTdHd/W
        kn/anDo8Vf+PAHxwoaMgjTPH
X-Google-Smtp-Source: ABdhPJxZFyD9ApfGTaosPM9xnsxT2eLocjXpwskWZ/m7MbjMnO6O7YogS3uzJgd4BXSlU/GvAToGAg==
X-Received: by 2002:a17:90a:6584:: with SMTP id k4mr4332997pjj.171.1591252587482;
        Wed, 03 Jun 2020 23:36:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id r205sm2040767pfr.112.2020.06.03.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 23:36:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] scsi: ufs: Bump supported UFS HCI version to 3.0
Date:   Thu,  4 Jun 2020 12:05:59 +0530
Message-Id: <20200604063559.18080-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS HCI 3.0 versions are being used in Qcom SM8250 based boards. Hence,
adding it to the list of supported versions.

I don't have the exact information of the additional registers supported
in version 3.0. Hence the change just adds 0x300 to the list of supported
versions to remove the below warning:

"ufshcd-qcom 1d84000.ufshc: invalid UFS version 0x300"

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufshci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufshci.h b/drivers/scsi/ufs/ufshci.h
index c2961d37cc1c..f2ee81669b00 100644
--- a/drivers/scsi/ufs/ufshci.h
+++ b/drivers/scsi/ufs/ufshci.h
@@ -104,6 +104,7 @@ enum {
 	UFSHCI_VERSION_11 = 0x00010100, /* 1.1 */
 	UFSHCI_VERSION_20 = 0x00000200, /* 2.0 */
 	UFSHCI_VERSION_21 = 0x00000210, /* 2.1 */
+	UFSHCI_VERSION_30 = 0x00000300, /* 3.0 */
 };
 
 /*
-- 
2.17.1

