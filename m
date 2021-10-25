Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92262439196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 10:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhJYInR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 04:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbhJYInR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 04:43:17 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F62C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 01:40:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g201-20020a1c20d2000000b00327775075f7so4094449wmg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PXO9vIvASbXW/KezcJEkCWT7bDbSSwlLiI7vdiVw5cE=;
        b=znCzIaxlm6qkunSFMXwlFrJ6COaG7wwhBk1n9z+BxFvEO40H/JYCrbOJJGbYyw52u5
         gbNlnl15ZcuoUAOlAMQcI2dp4ZEbZsbv+4lpEnSR2FlHsiS+5HAlNzBu+KOsVpHZxC3y
         Gm3Cijl6MSIp6jb+ewgMJ65/+KTQxyYiOE4rurEiNj73Jx4mu4rQ4H17syVd6WpOmJfr
         2On03RxstJ0STrzbEvBS/upsmGXgUhQk+eCxdHvN7VNZ4tsdFCc5cx70X0HLoRFvkKue
         M0zcJ7UQWwIATfYnfiSUCOQb+AGaBew6d9HUtHQLVeIIoh0fhCq8iBXHTLTP+aK0cqHn
         rRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PXO9vIvASbXW/KezcJEkCWT7bDbSSwlLiI7vdiVw5cE=;
        b=0kXG+zt57qjaJOVIHdjrcvPWp+op06jFvYNYJ84x3fMGiQ+5t4jMKtC3ETioDKvHTl
         OMoFHUtczqp6W7tdZDoBQxu+DgzQWqYw7/3N+tIO+B5ciDHrBr2EW+HrnpkEqCj/HnPz
         Hl1gSz8MfLsiMZ+geWD3HfHSDGj9zis8Gt9g6sULH6T3XvqkJGDEMjQbCDGer6XMW3SJ
         x5gokFnwf71WOVG5JzYkQz8As+zZi20BDJSSjLvYwGJPJm/p03WfsqL5E7P90zv9L3Vf
         IMuMqUm1tILCRebrDJyVgP0gTqLi6/EdeNb87Py8c5wUd6oJxsh+Q5a4S2+mZAvVcvGI
         mv1g==
X-Gm-Message-State: AOAM531qVVe808NG4TOxtuM+3M7JjbvxNmx6wANGgV+FpG4jJJsYu+rz
        3Jmk13UkdFq9FjshCb81ilM9Mg==
X-Google-Smtp-Source: ABdhPJwbsL5sfXXoXBA09rJMwqJ+FinTCoxAqG4Vn/lbZZbZ5xxQTAqk0lkApv+lXgjEi+Y749fOZg==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr48056418wme.13.1635151253493;
        Mon, 25 Oct 2021 01:40:53 -0700 (PDT)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id u1sm9239414wrt.97.2021.10.25.01.40.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Oct 2021 01:40:53 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] mhi: pci_generic: Graceful shutdown on freeze
Date:   Mon, 25 Oct 2021 10:52:20 +0200
Message-Id: <1635151940-22147-1-git-send-email-loic.poulain@linaro.org>
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
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
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

