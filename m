Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6584152BC99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 16:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237671AbiERNTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 09:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbiERNTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 09:19:54 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8477713F911
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:19:51 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id w17-20020a17090a529100b001db302efed6so2013313pjh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MnDyHs2MuOBTYTZqMG6fv0gi5HnIJHFVYwZNehBynVo=;
        b=Gb7hlyWGSwEGvXPHTyrg47FBM/6vom5xkAKFHXURmg6UVnev5DicIGpI22deIiwRYe
         1vwNPVnl79uHsq2vfp+Zq+7YvnIMJz0lN1dbMOjQE56/Y0ZnghlxZ9FitoV0pbqCrSvK
         FFylVwCsKOTkWRJn0dVrNJml8UIkoXKFC3OCC/zdqorcZ5w76yWNSV7usc1Y6vunc6zF
         zL8e5wj0fQMpyd1qT9xC+ZwB/OkoFqs5qW0psjmBflEn4AuMyYyE2Apt+a4lFil+Z51W
         8p96EYZz/SXrqGueOtntDzUzxnXdpHt2oaK5/U1REC+dvLmHgk9cbreImvwT1EFx+/qK
         AynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MnDyHs2MuOBTYTZqMG6fv0gi5HnIJHFVYwZNehBynVo=;
        b=VboYO42jgu+sYiQMb/dZgCjuo8ZLRd32xjrasPw1CPuud+/ME/vVFbCBX+i5G9BsF7
         tCREEedsWPIwf4LhmfT1nGgecm2Jf4G3Tw2BRQwous75fxtKJW1AzNfmmllMKoyKURO4
         /WHqxfNbG8fo1yW7TnxkILy+HHvlyrKYtHjtSijymrtjgW9Dm1v7hlcmruSaen2itb1W
         U9fELL/Un9zDjMNOk8VYJoQZ1QBi3RSk20OjckyB1Vhu9fI0S7eDOr+YP14UVlIHhtr3
         8eg+jtd4qX5SapDQbAhCJEmUtKeZQQ96rNFiYthlu7tGtGpOlwfthj/lETgmMv0adjUv
         bUlw==
X-Gm-Message-State: AOAM531EkeOEHknBwdAIwJvlFEzV+kvFFMLrMiy6+/9VIvbPkeqtP9iA
        o8TJabemFybyBEb5uxk/JVjT
X-Google-Smtp-Source: ABdhPJxTyC9sMCUpQo22UY5IOj1tKIEFt5bK4JNQ+ltl3bxoy1ym3mVWnjrTKA7ZEwahtkVXeCDyvw==
X-Received: by 2002:a17:902:e882:b0:15e:b9e8:ba1b with SMTP id w2-20020a170902e88200b0015eb9e8ba1bmr26942176plg.71.1652879990995;
        Wed, 18 May 2022 06:19:50 -0700 (PDT)
Received: from localhost.localdomain ([117.217.181.192])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b0015e8d4eb27esm1663908plh.200.2022.05.18.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 06:19:50 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com, kbusch@kernel.org,
        hch@lst.de
Cc:     linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        svarbanov@mm-sol.com, bjorn.andersson@linaro.org, axboe@fb.com,
        quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
        quic_nitirawa@quicinc.com, vidyas@nvidia.com, sagi@grimberg.me,
        linux-pm@vger.kernel.org, rafael@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] nvme-pci: Make use of "suspend_poweroff" flag during system suspend
Date:   Wed, 18 May 2022 18:49:12 +0530
Message-Id: <20220518131913.26974-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518131913.26974-1-manivannan.sadhasivam@linaro.org>
References: <20220518131913.26974-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some platforms like Chromebooks based on Qcom SC7280, the power to the
PCI devices will be taken off during system suspend. For these platforms,
the PCI RC will set the "system_poweroff" flag to notify the PCI device
drivers of the poweroff scenario.

Hence, make use of the flag in the system suspend path and if set, properly
shutdown the device.

Acked-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Added Ack from Christoph
* Reworded the commit message to include SC7280

 drivers/nvme/host/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index d817ca17463e..381bf0c7cf8d 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3238,6 +3238,7 @@ static int nvme_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct nvme_dev *ndev = pci_get_drvdata(pdev);
+	struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->bus);
 	struct nvme_ctrl *ctrl = &ndev->ctrl;
 	int ret = -EBUSY;
 
@@ -3257,7 +3258,7 @@ static int nvme_suspend(struct device *dev)
 	 * state (which may not be possible if the link is up).
 	 */
 	if (pm_suspend_via_firmware() || !ctrl->npss ||
-	    !pcie_aspm_enabled(pdev) ||
+	    !pcie_aspm_enabled(pdev) || bridge->suspend_poweroff ||
 	    (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
 		return nvme_disable_prepare_reset(ndev, true);
 
-- 
2.25.1

