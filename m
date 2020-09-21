Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFFA272B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgIUQJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgIUQJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:09:01 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61F4C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:09:00 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x123so9651495pfc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GocdqLYTODm0NoMZyaUYMh/e3m0B19dnr1p1DXm0VJA=;
        b=NTSt2v9arOod1uXHwNCfZHQFOzxV+1PVVM2RwfkQdnE/mJjLaVxKtlgJbxR7Cs8kxq
         /rJIjVnc5rOpdBlzcB7l8oNFRKmAVguCw51bnQOzx8B9W2SU89FLdVty2pP9ahea9g0/
         vdR4SLG/ybdTt5LKJOaC3FDwC4oi+HFAbaxL8cDO8Cr4nM6KN3faBHi3ogTPGYnzvrMr
         DCAB9/j3Zrl0O4n664NYInCshskryZyddsDVIEkrX3/o1VzVlPC+jHdHzUm2hFXlmZJd
         rT17v7VbQdqgFKAH8C6nEqCydwp31IqtQjMm85WT6b+yv/0KYoaM83qa964tc/5EKl9h
         gqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GocdqLYTODm0NoMZyaUYMh/e3m0B19dnr1p1DXm0VJA=;
        b=mY0O/WLpZ1DkOAmclLypE8iIP2+/2fOe+NXaIpQVr6p5pYg9CZnvtOGZgvk/hOUMbw
         f0hlbKSpTHSygYplzTAXjJmWsTT4WSEO7Qy//jGvxIuqnLAACcmDFIMa8SX2JVnbn2kK
         DQP8x9AY/lt6KrLUXM5sayEI8MFeryX0H6u8wsTXSoLRuygQnIoZd9XomT835UJcNoHF
         Xps5jyzKDB7Px9gN04a8hZqcSM17dejGU/3rzSNaGs6r5K87m9fn0+uvO63HpaNSJRVB
         KIMpZ9AK+UkrDntzZejTDCg4v/6+c4BInQbAqKEeClZvk4c25ZmShpg7XT+edlOctk9G
         liQQ==
X-Gm-Message-State: AOAM530fqfIp/z2378deL7hzuHrFSwHkIX52LLgOf+GNEgwzPkee6/KY
        tzykUaEc8Kl2P0vlMG8leAJo
X-Google-Smtp-Source: ABdhPJycjErgwLy6G8DhzkFy0bNL+f2tlRE0q3nsqZdFCGYa54iGIJNLnlfTuPupnIwi72bsM4a/vA==
X-Received: by 2002:a63:d242:: with SMTP id t2mr286895pgi.47.1600704540289;
        Mon, 21 Sep 2020 09:09:00 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:08:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/18] bus: mhi: core: Abort suspends due to outgoing pending packets
Date:   Mon, 21 Sep 2020 21:38:00 +0530
Message-Id: <20200921160815.28071-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Add the missing check to abort suspends if a client driver has pending
outgoing packets to send to the device. This allows better utilization
of the MHI bus wherein clients on the host are not left waiting for
longer suspend or resume cycles to finish for data transfers.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 796098078083..661d704c8093 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -686,7 +686,8 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 		return -EIO;
 
 	/* Return busy if there are any pending resources */
-	if (atomic_read(&mhi_cntrl->dev_wake))
+	if (atomic_read(&mhi_cntrl->dev_wake) ||
+	    atomic_read(&mhi_cntrl->pending_pkts))
 		return -EBUSY;
 
 	/* Take MHI out of M2 state */
@@ -712,7 +713,8 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 
-	if (atomic_read(&mhi_cntrl->dev_wake)) {
+	if (atomic_read(&mhi_cntrl->dev_wake) ||
+	    atomic_read(&mhi_cntrl->pending_pkts)) {
 		write_unlock_irq(&mhi_cntrl->pm_lock);
 		return -EBUSY;
 	}
-- 
2.17.1

