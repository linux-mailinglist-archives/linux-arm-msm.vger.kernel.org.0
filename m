Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3180234211A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCSPmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhCSPmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:42:04 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE416C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:42:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id e18so9578203wrt.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=GRAl5Em2B1mCYlVdeSo9RSVSNPlh6dys+c8hwugvgok=;
        b=O+NloZDENgFf4zVcct1MkM+oY18j8ycOp17VdzjUOhpm6rekijsi/hV9MP5labrKgQ
         YxuKPR1v6E5CvSxO3RO5fwjnBkw99Gnsu+eBMy36g6fceNUcriJePP4OeHyFf9Iqojki
         1x/ygrCyqLJC7lpcR3n3LHgAy77kvfCOqe2Suvn8PEYUjx5+N+x6+ZsGtUPhso8oAwRQ
         40WqvB0jT0W609H0rMcG2BxOG+U2+KWtVeEvIbo4OngTYvmw2R+lcAWSLU/iDk5L9JaH
         Y2SZuBzVnLGd7z5FV8MpxJi9PxHpaIgLU8TUXrADlE88uSEqSJbA/nTsVjm7BtapG1gW
         S1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GRAl5Em2B1mCYlVdeSo9RSVSNPlh6dys+c8hwugvgok=;
        b=nprjbC4/OEiwcH0Y0bdVcYWeX8ksFCPkGNgzJhBYLxKl04N7DDruj62OYVMB6O6PbF
         WlNHHLqMQ0iH3jgQ1c/qfjwvYATXWM7YUXoeJ5/gROXK/dxwD1VHQeJPTqeDsfQmz3sh
         DqMfOAdAwop4YgDKP1DhVRnhWyz6d7Af3JcY3Gy7yQFh+SFnquWYAtWAxsoHQl6kQ/qx
         nropTKJvZzE+UvUerWFG1Z23z5oBXIpp4L/zSuimZ/Kai6zRKUPsZFQ3PCECT/JIFRcw
         T1fbxmrVjbi7MQvkw5E3SSRaIUa7Aoli1uiY2VQsWaheee3R8g7SS9JD8JvbI/TwVHtD
         n2Tw==
X-Gm-Message-State: AOAM533mTi8JeOtv0+p8w7bik4BlAGNYDM1bgvvetiOygs2Yi+DCA0Lv
        zwAcnALxg4Pzbf7QHfOjmIePJA==
X-Google-Smtp-Source: ABdhPJwrM17/Gr1VGx9/05r/ZiqNNeuN7IlzVsTbHRUPOBJVv5J/vxV45O4ygsVeo+Bhhrsat/ghkQ==
X-Received: by 2002:a05:6000:221:: with SMTP id l1mr5189715wrz.370.1616168522460;
        Fri, 19 Mar 2021 08:42:02 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:ae5e:7ec2:5176:d0c0])
        by smtp.gmail.com with ESMTPSA id i4sm6111346wmq.12.2021.03.19.08.42.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 08:42:02 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: pci_generic: Implement PCI shutdown callback
Date:   Fri, 19 Mar 2021 16:50:37 +0100
Message-Id: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Deinit the device on shutdown to halt MHI/PCI operation on device
side. This change fixes floating device state with some hosts that
do not fully shutdown PCIe device when rebooting.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index cbd2224..b104ab8 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -532,6 +532,12 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	mhi_unregister_controller(mhi_cntrl);
 }
 
+static void mhi_pci_shutdown(struct pci_dev *pdev)
+{
+	mhi_pci_remove(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+}
+
 static void mhi_pci_reset_prepare(struct pci_dev *pdev)
 {
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
@@ -704,6 +710,7 @@ static struct pci_driver mhi_pci_driver = {
 	.id_table	= mhi_pci_id_table,
 	.probe		= mhi_pci_probe,
 	.remove		= mhi_pci_remove,
+	.shutdown	= mhi_pci_shutdown,
 	.err_handler	= &mhi_pci_err_handler,
 	.driver.pm	= &mhi_pci_pm_ops
 };
-- 
2.7.4

