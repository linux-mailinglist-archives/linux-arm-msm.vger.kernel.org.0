Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9562C2C58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgKXQIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgKXQIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:08:36 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52D3C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:08:35 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id i2so3827955wrs.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iVG5LeW2N6+S6Mby+fwbRgeDnGzBrkEwJlmP3LrxfHI=;
        b=idg5uZhHh1SkMl3ce9XjEHBD5Vq08mvMTygdT9HfMYm7/ybKpnO4Eh5OdWbUMAMctj
         1mFMED6vLtLskBTieEcsX/EbYP9LXfEcjrKnhBZFQ5z05d9p+mFrOkKysglUNb82JpRC
         msE/U6HnurUuufDwHWLgSWipolQIGdztL6lYJLcB7JObcbzq8x8t71Rsow8zH7DfMhKJ
         pYpicfmOyhtCtTEyKrPkSxsWc2DfV75KEIw+Qg65XxeFTlw9cCnx7HoD03/TPU6c+vcx
         WooV5jcB8nkue90Vz2XeMpzBZZr9QZVJvuOvVrZv++3lBTruPLzjAFWkLKtRucLDqjVp
         awdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iVG5LeW2N6+S6Mby+fwbRgeDnGzBrkEwJlmP3LrxfHI=;
        b=VuKHnNB9gK/Gyw9q11OrABfX2G2teEy8FwUJcZBjCENP4znlwY96HIi2hTeiAoJ/nJ
         sKJGiqPURZ48//r3zvowPK+GE+20Zgn36jKCOChLyeXIVL4TvjwVzsT/FyqPAEiw4el6
         24xD67LH9FlWa6BEBOe/iw2ASAVbjwPjKRH5hn10294U0ObDi3jCtA1ofkV0eJTSXF7r
         GYdZRQFeAIxqW3DweE0aaNEBEgFl1gljEpQJJhOS3NeDSwdzvTC7qhNp13jxB1BRpdb1
         t/0RTvvcji3FeZusXy7vCXjG1O/Og9U4owXv0Hdluwfv3/djKADEJDniJmzuWw+/69Dx
         Opag==
X-Gm-Message-State: AOAM532myhdV4CpPizs8aIM60AEJc+d/2jqQhB2ZOJmVYcWiDhfpEr3c
        6GpA1Yrdu/+eGQfF/VwidW4tLxqjNdNfD4eg
X-Google-Smtp-Source: ABdhPJzRMmcjJHqiVISlVd8v4VxQ+d6vWDJWK0Vw+PZ/CIX08r78w/n1f/VJ0xpM5NY06r8+7H2B7g==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr6126418wrp.209.1606234114544;
        Tue, 24 Nov 2020 08:08:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id b73sm6671383wmb.0.2020.11.24.08.08.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 08:08:33 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: core: Fix device hierarchy issue
Date:   Tue, 24 Nov 2020 17:15:22 +0100
Message-Id: <1606234522-19889-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A MHI client device should be child as the MHI controller device.
Today both MHI controller and its MHI clients are child of the same
bus device. This patch fixes the hierarchy.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 436221c..c7a7354 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 	device_initialize(dev);
 	dev->bus = &mhi_bus_type;
 	dev->release = mhi_release_device;
-	dev->parent = mhi_cntrl->cntrl_dev;
+
+	if (mhi_cntrl->mhi_dev) {
+		/* for MHI client devices, parent is the MHI controller device */
+		dev->parent = &mhi_cntrl->mhi_dev->dev;
+	} else {
+		/* for MHI controller device, parent is the bus device (e.g. pci device) */
+		dev->parent = mhi_cntrl->cntrl_dev;
+	}
+
 	mhi_dev->mhi_cntrl = mhi_cntrl;
 	mhi_dev->dev_wake = 0;
 
-- 
2.7.4

