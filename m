Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F079C50CAFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 16:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236004AbiDWOGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 10:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235967AbiDWOGM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 10:06:12 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3192D381B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 07:03:11 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id w16so4173976pfj.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ECvzXHU09e7tohEuWxnYpZ1mqXMV8LroIn2Hj9v1yc=;
        b=Cx+fTQjNp1AQgKF4oC2mY/V6LtUdnXW0xhSrGBEIKHNg1J2iuvbdaoP6qPTVzYS2eW
         Te8iqumiQymFC5vSwgM0TLc3ywpWESWFaaE6/XJXjrO1G/CJRvCg/ahSC1u/d30pFx05
         t3iyqiQqD7/ERn9iSFNRPQUbwoMJqj984pICcO/NGoLS8YHtILi/Z0gyXhCsDh2kZoLv
         4nfdhSBhTNouUG+elWQDq0tEKgG5xUoEYEE6yXmlHc33h42nffM/fwoAFMUCuzLxJqOo
         tYh94dTtK6XgHYB21QrdP29bxZ8SrgNr3YbD+UyK1GrBAvnLCStbAfyaGMjO0CJrz9yT
         oIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ECvzXHU09e7tohEuWxnYpZ1mqXMV8LroIn2Hj9v1yc=;
        b=ZxbFCN/4Ew32AW1nuMwQkUMksQ7/sc6g+Y4J6eefkfO6nMQdVkl92eRMpLbtRuEcE9
         MbsVexSuypjSRtJZjWmi891Ge2qJzZH0JZT8dvHOcSx4GnqxtaGjnCHYvjjnAVfigtjK
         qLaaWw4cG4luCRYPkFrtO02nznfvakk+z2gHA6242fsUm5K1P9m+jgZlfKtr1TfYeRGN
         vHz3ThZkt+rCWs83XFjkB9thT4cQ0bEAD04kCYrj+iU4ynPYBNEEbDTnTO6cnqZRGfg1
         dBguB0Ht0WRLlHyr6Xxt5Nfca2dclKaytwPr4Btr5Uy0BIT6cmfjk3DGb8Ewrobtqgj1
         xLzw==
X-Gm-Message-State: AOAM530u/wNRpEXcC/bM//uOK9O47bBcYE1RGrxDDkAFEVhmlEVewpXc
        LGveSYMwUhEFn6NLU3a0BFkF
X-Google-Smtp-Source: ABdhPJzVBBTly3+BsCzB+2HEWvv9rXHVBzCF1z5bLlwrpi1f6Kc5d+cx0wODSjM/tR4pZO0VhUCXnQ==
X-Received: by 2002:a05:6a00:1946:b0:4fe:309f:d612 with SMTP id s6-20020a056a00194600b004fe309fd612mr10198371pfk.10.1650722590693;
        Sat, 23 Apr 2022 07:03:10 -0700 (PDT)
Received: from localhost.localdomain ([117.207.28.196])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090a390500b001cd4989ff50sm9452728pjb.23.2022.04.23.07.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 07:03:10 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2 3/5] scsi: ufs: qcom: Add a readl() to make sure ref_clk gets enabled
Date:   Sat, 23 Apr 2022 19:32:43 +0530
Message-Id: <20220423140245.394092-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
References: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In ufs_qcom_dev_ref_clk_ctrl(), it was noted that the ref_clk needs to be
stable for at least 1us. Even though there is wmb() to make sure the write
gets "completed", there is no guarantee that the write actually reached
the UFS device. There is a good chance that the write could be stored in
a Write Buffer (WB). In that case, even though the CPU waits for 1us, the
ref_clk might not be stable for that period.

So lets do a readl() to make sure that the previous write has reached the
UFS device before udelay().

Also, the wmb() after writel_relaxed is not really needed. Both writel and
readl are ordered on all architectures and the CPU won't speculate
instructions after readl() due to the in-built control dependency with
read value on weakly ordered architectures. So it can be safely removed.

Cc: stable@vger.kernel.org
Fixes: f06fcc7155dc ("scsi: ufs-qcom: add QUniPro hardware support and power optimizations")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 6ee33cc0ad09..f47a16b7cff5 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -687,8 +687,11 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 
 		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);
 
-		/* ensure that ref_clk is enabled/disabled before we return */
-		wmb();
+		/*
+		 * Make sure the write to ref_clk reaches the destination and
+		 * not stored in a Write Buffer (WB).
+		 */
+		readl(host->dev_ref_clk_ctrl_mmio);
 
 		/*
 		 * If we call hibern8 exit after this, we need to make sure that
-- 
2.25.1

