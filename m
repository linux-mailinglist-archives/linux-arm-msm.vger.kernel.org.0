Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3BF4B10D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 15:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243198AbiBJOuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 09:50:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243180AbiBJOuI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 09:50:08 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50333EB0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:50:09 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso8855921pjg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mldDtPK/YShlaxniuH+3uQLRX7HHInnMOPZ6vrRICic=;
        b=IPAZVFUrFJKLW/2M19S1gOpWRk5N811dE8ZSeDPl474N9O6CUPX3MurHqyYaCOcKPk
         jAUBSDiCIDkCIpL1sP0nOO0xX9KXtH2DPohRcE/VIaCQ+uWQVd1vrqzdN0Er2eTyVe5x
         8M0zyBg+0hX6o3e26SweX9vDuvT55BhT+XVpoCr0ztzeXWflP2aFYGrfYdZnDbhkCE0v
         5bueIft6l2Bh9tw8onbJMOyAPZSfLgukj8StGxzkcHnp/gKjoiwVN7b2WeHn+/RZxTxc
         LQPN6t7RxgqS11KUjG/ZuQIG/JRwyb2ULe7cea0kDlaQ03NK9Zg6OKlSpkXEHaWXVCPz
         97rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mldDtPK/YShlaxniuH+3uQLRX7HHInnMOPZ6vrRICic=;
        b=8ArmJ1MNvSfb1eImYtiFxGo4WAjo/IzyEaxAEjlSIy/NeIdh8CRfkpHv1tRAWcMvKM
         /hcVTlb+jGexbehyXNr5hbZogvtSpngmXGKCcPC0a3Y0F3oOjyCzBa9flzO6ssQAnG0C
         7S8CWxj94RDAcFtQHZtdhUZ7yZIi99vBSYCC9pu0p3Yy1ZHfKldxgzCiqG6vZrTxvej+
         ojuJy715gA5NRkUdu8lyogMmEsm0d8HMlR/8RFRGAQqScEdRUohmTtntdfOiW8lkak4b
         5yidrq663jZnNTd5M3xe9DCxQUTnLbQq9Hb3JzfVV9T5I8MYCjOgmtAdxHldiCwn9/WE
         nGmQ==
X-Gm-Message-State: AOAM530xVPrUSkfgGzIUJnrnf7WLOhCQRpuyUIjpsQc1iRIX39rrtTns
        Gb4otvediP9jBo8MAzLL4B+z
X-Google-Smtp-Source: ABdhPJyZq00sxNb5hAHpRbhT6EmJjtzQ75byHD7XHTLWQnIKn8R1+p4oCNwbrxsl5vTZQr6effGtuQ==
X-Received: by 2002:a17:90a:8804:: with SMTP id s4mr3169533pjn.129.1644504608770;
        Thu, 10 Feb 2022 06:50:08 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.88])
        by smtp.gmail.com with ESMTPSA id f8sm24219206pfe.204.2022.02.10.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:50:08 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bhelgaas@google.com
Cc:     bjorn.andersson@linaro.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] PCI: pciehp: Add Qualcomm bridge (0x0110) to the command completed quirk
Date:   Thu, 10 Feb 2022 20:20:03 +0530
Message-Id: <20220210145003.135907-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

The Qualcomm PCI bridge device (0x0110) found in chipsets such as SM8450
does not set the command completed bit unless writes to the Slot Command
register change "Control" bits.

This results in timeouts like below:

pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)

Hence, add the device to the command completed quirk to mark commands
"completed" immediately unless they change the "Control" bits.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/hotplug/pciehp_hpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 1c1ebf3dad43..4e4ccf3afbe3 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -1084,6 +1084,8 @@ static void quirk_cmd_compl(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
 			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0110,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
 DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0400,
 			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
 DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0401,
-- 
2.25.1

