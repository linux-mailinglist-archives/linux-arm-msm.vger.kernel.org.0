Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA14643B7B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 18:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236295AbhJZRAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 13:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbhJZRAk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 13:00:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A30EC061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 09:58:16 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k7so15819750wrd.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=zTEZYPI9/d7veyMrSB1TfsKqIwH3Vyu7VmuuMxTxDGQ=;
        b=jMBv0zwDMyWXrmOd3tlMbzLV+7gCRPIPdspTIJZllfjNzW4QJDpBe3+qT8j6lGCYPm
         CYohCQqTSUUnqt1G9ISmUrRBQ4YSUuXaPoCkAsEubEiW9Kdq4eUX6D4w7Ib95GPiWtA7
         /8dcH1FPOs44oziJaqg1UW1eAWbEWT0LlqRsnA918Yfo4j1SKQEyb+cIelHwcRJUjwNT
         QyLa1Q9hI6eENgRAihvmTw+UqU4WjDrjCgEFRET64a9nZNFOGQ8xZpDQ/IFQd3YRFnKZ
         3X84Xk7K6jtM9ehTqQicBWvh5iuvcaPwja2lxcL81NFg1Nm0pscG3qwv93DvBx0FDUiE
         q0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zTEZYPI9/d7veyMrSB1TfsKqIwH3Vyu7VmuuMxTxDGQ=;
        b=Fj2IRBT55ChiToJHyS1UIYTRPD+j4rgXKr2j7zbTSWOl93f2nGdNVr0KYCN6KJsFhZ
         bKMAqDTBcEYUuEtw5z9twlYIGFZyWHWRHmUK2wdzquataabngNgBnjwUf7Wnu+uxp0ss
         HmrlR9pUCPc9lwSc3zPJ2tLJX5tQUTtERRguTtxzuFeq20JtT89cPBd12x9mma9A6wNL
         5VcI7fKFa+4mf+HxMTqs1iRys5bP+U8qsCyxLpARNQz89Awd57La924qcQxYNSapB5I2
         7OtzIZFB0Fk8DfGsg62giBZzlROQe8f9ToSBvU28TmwIbUyGyv0Ak8eil9tXiKqflFZA
         8tXA==
X-Gm-Message-State: AOAM5321Mogg6fc/ea6GxwciE3EuEsxaFgcnn9RLoo53oct+rFNsLBSK
        rf7nCGaV32v5RJeSLw1Y+pHRxg==
X-Google-Smtp-Source: ABdhPJzQxh565RvzbOV3gUrwRtJS+VhTZ2g7qT/2hxUI5AdkqewzO2L882JnEenhTdN7ghKrikWDyg==
X-Received: by 2002:a5d:5402:: with SMTP id g2mr29506285wrv.290.1635267494542;
        Tue, 26 Oct 2021 09:58:14 -0700 (PDT)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id q1sm1097415wmj.20.2021.10.26.09.58.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 09:58:14 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2] mhi: pci_generic: Graceful shutdown on freeze
Date:   Tue, 26 Oct 2021 19:09:40 +0200
Message-Id: <1635268180-13699-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no reason for shutting down MHI ungracefully on freeze,
this causes the MHI host stack & device stack to not be aligned
anymore since the proper MHI reset sequence is not performed for
ungraceful shutdown.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Suggested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 v2: Forgot to mention this change comes from a Bhaumik suggestion

 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 6a42425..d4a3ce2 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -1018,7 +1018,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
 	 * context.
 	 */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
-		mhi_power_down(mhi_cntrl, false);
+		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
-- 
2.7.4

