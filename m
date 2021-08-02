Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1BD93DCFF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhHBFNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhHBFNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:47 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EB7C061798
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:37 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id a20so18443186plm.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vCP14x51ZT3xHTsGRwNOFfupBHNf+HcNjz+uJv37tc=;
        b=x/mIjNE+24kV1H5SQ6ix8OLO7gv+5Tz0esOdFtziEesVaCOm1kXKAxxCQdJ2+bR4Vi
         U+2T4GTCWg/BOhvjPFSktswOBLHuFvwGmCiZa2HEAd91mM3g50TkcN9+8DLQb/nrqAiy
         W8uXSZLCoFjayPTMOf/HW8jVNOw7LMI2XK92t6Le0Phf34ruyQ6sqVRk8h7TRWoHqpap
         NBfnd9vEXtdO8x5c2lohK+IESBH3mW623HSV460BCNkdlRTR8bPiJrF71NrVeGAyKDZy
         X0I07I71EJn/rtt8SZrgqGgbN4Sn10VSPLUHcgDsx3Zp7/GUuA5AZL4Qu3rmsA0xhbzg
         q1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vCP14x51ZT3xHTsGRwNOFfupBHNf+HcNjz+uJv37tc=;
        b=DjJPUoWI4ECy2lqklIpfnRg7ncAIy9IAlND+FwaSkUZJDIfE0HTwuZjYHDq5Ad2Dii
         6bUrySgJ1pfduSjtwuJamwCP55mqPYmdSi9ZDDTp6+W9/4bRZtBX0srQ+5u2xodwfcVn
         XpC0MvgZ2RH5Y+5lkA6HaEr/IgR4RJlm8yhIniufiUxlTfhZE9CfBWspNLpOoe0QvV95
         xegujl1J47vvGJFgbOU2O0FrFJpj5JRr4sPKTQvgStYo1mcnY0wYRRyr9f+rYMaEFFue
         fW1njd8B/j4gdDvl9trjhYnEBcm7Ls6GmXewE/w3pDrIdEykLkgppVXSd/Ddrp0+6d8U
         b0SQ==
X-Gm-Message-State: AOAM532UYvswXHhluQC3aHtj5IZ+aVDlDRSbL8fmWhzZ01k3tDrDZOFM
        mwtBeoQjJeKPr9gq57ol+6O8
X-Google-Smtp-Source: ABdhPJwIgL7DjD+lO/IcKy9pCLYAJQ+Q+hqyRM472MIKtxQ+ZBSnu8eu4I02mbxULY3n+xLcRFH7AA==
X-Received: by 2002:a17:90b:514:: with SMTP id r20mr15221889pjz.80.1627881217301;
        Sun, 01 Aug 2021 22:13:37 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/10] bus: mhi: Add MMIO region length to controller structure
Date:   Mon,  2 Aug 2021 10:42:50 +0530
Message-Id: <20210802051255.5771-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Make controller driver specify the MMIO register region length
for range checking of BHI or BHIe space. This can help validate
that offsets are in acceptable memory region or not and avoid any
boot-up issues due to BHI or BHIe memory accesses.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-4-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 5e08468854db..b8ca6943f0b7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -303,6 +303,7 @@ struct mhi_controller_config {
  * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size downloaded through BHIe (optional)
  * @seg_len: BHIe vector size (optional)
+ * @reg_len: Length of the MHI MMIO region (required)
  * @fbc_image: Points to firmware image buffer
  * @rddm_image: Points to RAM dump buffer
  * @mhi_chan: Points to the channel configuration table
@@ -386,6 +387,7 @@ struct mhi_controller {
 	size_t rddm_size;
 	size_t sbl_size;
 	size_t seg_len;
+	size_t reg_len;
 	struct image_info *fbc_image;
 	struct image_info *rddm_image;
 	struct mhi_chan *mhi_chan;
-- 
2.25.1

