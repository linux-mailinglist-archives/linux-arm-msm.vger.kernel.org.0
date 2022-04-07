Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00CC4F81A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 16:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiDGOdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 10:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343929AbiDGOdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 10:33:05 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FF41925BD
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 07:31:04 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id s11so5063691pla.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37j9SE62t2u2+DYxve8+3rqrKL3ZJ+WZ0z8KDQ9KkI0=;
        b=UmbnAYWl4njZf+uMFUJhYSuLGBqPL3XcEjh6DjUZVbMH/G6fg6BGA2CwMkxcjhhQec
         wKnnO5xNTfUA1FpWNz5cRwLUF2lVJQN/DFrv6iGKRI0HlkjxPPYfmdlXagoLhMUN+B18
         XY2Nh2WERIspmG9DuqLXZS8H3wJv9PkvDLrg1W/C+H46iJvNrxxSCiVgSbioIcqAXkfe
         Nh0NFeAUZ3C3iMMjwM90NWLYm2CqmxfIZ/QB5SR9uvQVkTzvv/CkrC4iKJavGS0gk4at
         pBClZkxgyu/deoaNIG0pGA/9QIW53JJ8KTNevx9jK8AhW9Y8P2TLX111qy4PSEK/gyRo
         xcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37j9SE62t2u2+DYxve8+3rqrKL3ZJ+WZ0z8KDQ9KkI0=;
        b=Fhchyizg3+XM6hOBIIehtttCz09DtGekGwc4M2Upf0tz6Sl9ML+qXzlH6adtRUwegS
         5bHvpG6+h8ZVs/5AAcBajuLPiOfYl1AgzqVIOq30SsXavaUfY/g/jGjGdVcVKCf4TuNU
         ooKJjS7I/xREDY7tlhSLbxaq9it0sj3aWzstgzhwwuocaRACmvEpZn5FTGGJXajp5XOs
         zBe5FmpZIvaPzClLLZUkU+Wm7b4QM/NtbOCYU4DVRQadUM4qCTZGjx3xz/nqPg6Xs7DC
         1WqjcflWwvypt0vH9f4c6s2YfBLKDyzGNgTMjr1NZ8J7Rd/elq0ETx8oDs51t9nzQZ1b
         jzrg==
X-Gm-Message-State: AOAM533iNqzumOkjYXviVae07WHSPP33Zz/6KES+FRUklFqQY1ysbKOu
        yQ6dcVTv7BHZrvhpA7TADZF2
X-Google-Smtp-Source: ABdhPJyXWXKUaW+7OCKy41Er8nzqdtypv+JyTxK5cr3lFjZ/SzPUxVGU+aHDVnBS6iZ9s1FMFUtDhg==
X-Received: by 2002:a17:902:c94c:b0:154:45c6:fbea with SMTP id i12-20020a170902c94c00b0015445c6fbeamr14309339pla.117.1649341860219;
        Thu, 07 Apr 2022 07:31:00 -0700 (PDT)
Received: from localhost.localdomain ([59.92.99.101])
        by smtp.gmail.com with ESMTPSA id x36-20020a634a24000000b0039cc6fff510sm2377181pga.58.2022.04.07.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:30:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Flush recovery wq during freeze
Date:   Thu,  7 Apr 2022 20:00:49 +0530
Message-Id: <20220407143049.126104-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible that the recovery work might be running while the freeze
gets executed (during hibernation etc.,). Currently, we don't powerdown
the stack if it is not up but if the recovery work completes after freeze,
then the device will be up afterwards. This will not be a sane situation.

So let's flush the recovery workqueue before trying to powerdown the
device.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Reported-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ef85dbfb3216..c65f749c05bf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1060,6 +1060,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
 	 * the intermediate restore kernel reinitializes MHI device with new
 	 * context.
 	 */
+	flush_workqueue(system_long_wq);
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
-- 
2.25.1

