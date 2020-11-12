Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477282B10F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 23:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbgKLWF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 17:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKLWFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 17:05:24 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C59C0613D1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 14:05:24 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id v12so5789097pfm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 14:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=slkfJzLThfnq7dp6T3hHJaR873aqxgp2bKc6BsX9aV0=;
        b=pinvfDrDrB6ctJHlCeWOYTxu5y04SDYjFnGR3GwyyCDGTbeCvS4VYROYFBfSi2WhCz
         KW8hlBAR3YFiOuLUNYTwBi+g9xr/VGgaTV2vWsnITUq9ZQfhas5xNg3/Wvr7gQtYykWF
         C3B5YcxnleGCEfOn0Zfx+3JoXDzz31JRxEVdZGfFXjiWK2kPeZShiRBZNDNR2dkccIHZ
         09dI+FJpIwdTrg4w417/w3FRyR1QxjvsUHtxlGdjbN5GPCV2rGhtJCEskGqnB02OcG1R
         rmfQpkDGFfpQI0yg5p5VTLNbwQf16YFY5P5b+a5jjZmN8Lo4xmNb2kaSEa4ytkn2SBwv
         Nuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=slkfJzLThfnq7dp6T3hHJaR873aqxgp2bKc6BsX9aV0=;
        b=iG42DcOQ7RrD8I45XXKX+vwctOaI4OGNoQyrNaMzkYZ5jnKMSTOiIy7m1badgVl9sZ
         LYMoYhnsGut0GzVYbBt6Lh/Zr4KPPyIZDViv/sw9XpD9ueXX7eb+oUWBB2wu8V72y78u
         eh+oFqgiwHcRxQb0zmecJhwnkm+pYIkRwqVuPeEla7uerybXJmmcBOyDo14RkJtKgWnC
         1Cuy9otsD4DjNGRr1gxFbpkx7ubP8TaxVdTUsEZGnOtMn/Ud7QtB5y8w05O8sCGem1Jr
         qksxp8TruBl4BVjTEtXfASrn64U3ZHUCNb/j3vUN33U8XhMDWpyVZgsGCvG/NVkKJAfQ
         Q2VA==
X-Gm-Message-State: AOAM5338t7pfrBKx2TQfSiM7AKgeqjalaJZNR1AF2JcT6EOt4BEDuwNi
        hr4iUtE+geozUk1Icr4DyRMl9w==
X-Google-Smtp-Source: ABdhPJxfhZH/q5hThNOBnnLYhFe96bQakZ1Aix4ClMUJBa7gSEj5LlM3tIe7QGLlxguFwIACTomUHQ==
X-Received: by 2002:aa7:9888:0:b029:18b:a9e2:dc7a with SMTP id r8-20020aa798880000b029018ba9e2dc7amr1335896pfl.67.1605218723741;
        Thu, 12 Nov 2020 14:05:23 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id mv5sm7638976pjb.42.2020.11.12.14.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 14:05:22 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: [RESEND][PATCH 1/2] arm-smmu-qcom: Ensure the qcom_scm driver has finished probing
Date:   Thu, 12 Nov 2020 22:05:19 +0000
Message-Id: <20201112220520.48159-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Robin Murphy pointed out that if the arm-smmu driver probes before
the qcom_scm driver, we may call qcom_scm_qsmmu500_wait_safe_toggle()
before the __scm is initialized.

Now, getting this to happen is a bit contrived, as in my efforts it
required enabling asynchronous probing for both drivers, moving the
firmware dts node to the end of the dtsi file, as well as forcing a
long delay in the qcom_scm_probe function.

With those tweaks we ran into the following crash:
[    2.631040] arm-smmu 15000000.iommu:         Stage-1: 48-bit VA -> 48-bit IPA
[    2.633372] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
...
[    2.633402] [0000000000000000] user address but active_mm is swapper
[    2.633409] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[    2.633415] Modules linked in:
[    2.633427] CPU: 5 PID: 117 Comm: kworker/u16:2 Tainted: G        W         5.10.0-rc1-mainline-00025-g272a618fc36-dirty #3971
[    2.633430] Hardware name: Thundercomm Dragonboard 845c (DT)
[    2.633448] Workqueue: events_unbound async_run_entry_fn
[    2.633456] pstate: 80c00005 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
[    2.633465] pc : qcom_scm_qsmmu500_wait_safe_toggle+0x78/0xb0
[    2.633473] lr : qcom_smmu500_reset+0x58/0x78
[    2.633476] sp : ffffffc0105a3b60
...
[    2.633567] Call trace:
[    2.633572]  qcom_scm_qsmmu500_wait_safe_toggle+0x78/0xb0
[    2.633576]  qcom_smmu500_reset+0x58/0x78
[    2.633581]  arm_smmu_device_reset+0x194/0x270
[    2.633585]  arm_smmu_device_probe+0xc94/0xeb8
[    2.633592]  platform_drv_probe+0x58/0xa8
[    2.633597]  really_probe+0xec/0x398
[    2.633601]  driver_probe_device+0x5c/0xb8
[    2.633606]  __driver_attach_async_helper+0x64/0x88
[    2.633610]  async_run_entry_fn+0x4c/0x118
[    2.633617]  process_one_work+0x20c/0x4b0
[    2.633621]  worker_thread+0x48/0x460
[    2.633628]  kthread+0x14c/0x158
[    2.633634]  ret_from_fork+0x10/0x18
[    2.633642] Code: a9034fa0 d0007f73 29107fa0 91342273 (f9400020)

To avoid this, this patch adds a check on qcom_scm_is_available() in
the qcom_smmu_impl_init() function, returning -EPROBE_DEFER if its
not ready.

This allows the driver to try to probe again later after qcom_scm has
finished probing.

Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: iommu@lists.linux-foundation.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Reported-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 66ba4870659f4..ef37ccfa82562 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -159,6 +159,10 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	struct qcom_smmu *qsmmu;
 
+	/* Check to make sure qcom_scm has finished probing */
+	if (!qcom_scm_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	qsmmu = devm_kzalloc(smmu->dev, sizeof(*qsmmu), GFP_KERNEL);
 	if (!qsmmu)
 		return ERR_PTR(-ENOMEM);
-- 
2.17.1

