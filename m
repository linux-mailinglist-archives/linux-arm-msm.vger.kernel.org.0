Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931F33979BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 20:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhFASJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 14:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhFASJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 14:09:22 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE6DC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 11:07:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so2154391wmq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 11:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cI3xd88aJlUdbK02qTBXKO1kFo3WfoLb7axOSIt/zjs=;
        b=v9aaNQnhpdaeQ9vevyAosZ3MwikxESDl/o99lQaMTEbnK3wTaTSP7oUc4lzipb/mKi
         +n33ccdCkCTf+hvIEXA51GRazbr37A0lQZ6nri8dhS137gxZUBzmuzKXPnARhueU+o0s
         clVsfvsAjR9Ts5DT8dETjbbNB+LX6EafOz9NMmH0rgRfF2QEd7Cq9l7B45cr2/htH4Bp
         QWakOQAvWUOS1eGFKPcHSttpS/Hx9XcbP/wilbsKYKv7Bi4NQPkoQZozNO8G3KLaxe+N
         Xw26lEL3aoQ8EHVbIgAxuMwcijUQ+RYSzSezz+ut6X4HA3zC+9pdYKGNiIDFHu9igP71
         5tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cI3xd88aJlUdbK02qTBXKO1kFo3WfoLb7axOSIt/zjs=;
        b=BsNhMUmvP65i1n92QGjb+R1frnLuuZcFQIXhKS0lv/JTEH5cayU8CHvb1fI1vPXTuf
         n7l+E6O6u5pmMaXZnpF1hkEv/dC4pGdknai+DN3JVJ+zyDKYW0AE6Bdg09ZrIt95WnUt
         zzoi3KCG4iSMvCHGordMNdWSquXBLJNcP+v4igB2fmJo1YrZQF7W7iLEP+5JUa6koRDR
         F3kSQRyObLXo1gzPFFidQTcQw1uWk9hpa1YJ4gghlnRqh+cEX7l4bzGqDRzqwUn5x81h
         4fezNud12NMmb/wcy8t4zpNnerWcp2Z2hVXXP6NMJSj7b9UT6kplB6CewET2g6KgYQZ4
         mPlQ==
X-Gm-Message-State: AOAM533JvP3YV9QlXa5MEOh0vaUjuBCuzaXlT4yaFM4om+Op4fuXafoU
        t4X3cSEvxCyvYevR+l2k9cPanQ==
X-Google-Smtp-Source: ABdhPJx3ClVxtviFlTIUhRnKzD7QwxlZCEetNshtIagecApJBa/nkkbo+drh2xx1vGYs1lQOWQmZ6g==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr2008376wmc.150.1622570857748;
        Tue, 01 Jun 2021 11:07:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:85ed:406e:1bc4:a268])
        by smtp.gmail.com with ESMTPSA id x3sm238328wmj.30.2021.06.01.11.07.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 11:07:37 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: pci-generic: Fix hibernation
Date:   Tue,  1 Jun 2021 20:17:25 +0200
Message-Id: <1622571445-4505-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes crash after resuming from hibernation. The issue
occurs when mhi stack is builtin and so part of the 'restore-kernel',
causing the device to be resumed from 'restored kernel' with a no
more valid context (memory mappings etc...) and leading to spurious
crashes.

This patch fixes the issue by implementing proper freeze/restore
callbacks.

Reported-by: Shujun Wang <wsj20369@163.com>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index aa8f8d5..afa8763 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -888,9 +888,43 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused mhi_pci_freeze(struct device *dev)
+{
+	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	/* We want to stop all operations, hibernation does not guarantee that
+	 * device will be in the same state as before freezing, especially if
+	 * the intermediate restore kernel reinitializes MHI device with new
+	 * context.
+	 */
+	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
+		mhi_power_down(mhi_cntrl, false);
+		mhi_unprepare_after_power_down(mhi_cntrl);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused mhi_pci_restore(struct device *dev)
+{
+	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
+
+	/* Reinitialize the device */
+	queue_work(system_long_wq, &mhi_pdev->recovery_work);
+
+	return 0;
+}
+
 static const struct dev_pm_ops mhi_pci_pm_ops = {
 	SET_RUNTIME_PM_OPS(mhi_pci_runtime_suspend, mhi_pci_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
+#ifdef CONFIG_PM_SLEEP
+	.suspend = mhi_pci_suspend,
+	.resume = mhi_pci_resume,
+	.freeze = mhi_pci_freeze,
+	.thaw = mhi_pci_restore,
+	.restore = mhi_pci_restore,
+#endif
 };
 
 static struct pci_driver mhi_pci_driver = {
-- 
2.7.4

