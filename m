Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B6F7099D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 16:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjESOc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 10:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjESOcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 10:32:25 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BFBE72
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 07:31:59 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2535edae73cso1866578a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684506719; x=1687098719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkQkFXSrqR5MDMbqBcH7Nxin9P2rGGa9soJkqC/yxfY=;
        b=bwm/X4pMr8MwYBpFxgbtrdPEnQVZlktmQcTkB5+TrS8zlCJkEN8VDgewXp8Ju/XmsW
         mobigOKrqd9SV8PvXBlhoPTyVhviDEV/X5tvPoZcG7SQSDEtVrB5SKFi50u+ATW1k61k
         oLdabeZhinepamdwCimBMJjcOVb0DTPdK3R0eVrNpt4M8hQ8DZVhwz3gAq3Jwxle6E6/
         KUTsDj3ReTi0IVug0CTJxF3n+zApxOsazseIcWr30rl4JA4KzXosl6O57j7B1JKTL0Zf
         A0U9p9GQ3P5mosV8zHs6YZO8DrMqALXEybry6CV0Ad1eLs5h2UjgqZf7twHncsie+rTn
         RCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684506719; x=1687098719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkQkFXSrqR5MDMbqBcH7Nxin9P2rGGa9soJkqC/yxfY=;
        b=G8v4ciHEEyV3kcS5BPestxlpmyS3nUrwqjAEdM8MyOD7w4zP7bJwtlgQWaYsLd7Go3
         Wn807eIpYm5z/Hv0I6ieFX4c9LHJQO9BGEsbDVXqqS5y1IYJP+rx3dq6SX3/MZj6xpHQ
         8mSnkBxXKtGGzWsEpwVIT8kzerXxY3ewpnG/gyNtraurh8LoftibXRienQ8vrZUTqWiY
         MjQ1hJjTxb4UqJjWFkKhgraF1spK69Vy6YEPhJZK9w/Zc74anyVMr+AMWzUZ39qSekWr
         qZOoJFLtFkr2Pi3Xs1JUEAhMTuWxevMvBL1pbJUm0KkZ7FariBDxd/ejeCzcvVB++oIi
         Or6w==
X-Gm-Message-State: AC+VfDzgC61Uxrxdspshaj85lzGizupdwFmd/+Z6g2V4dBH6YLII/BuB
        YL8TRnRxYrqn2IRIqUN4jF2C
X-Google-Smtp-Source: ACHHUZ7L4BNRnO2AO8+x/0VeQ3qqRfXjKD6RjZHEvBFJ27gt0YQqcifFfTec2K/wR2chakMau/BgCw==
X-Received: by 2002:a17:90b:46c1:b0:250:4847:426a with SMTP id jx1-20020a17090b46c100b002504847426amr2284620pjb.11.1684506719250;
        Fri, 19 May 2023 07:31:59 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.13])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a09a100b00250d908a771sm1634845pjo.50.2023.05.19.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:31:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 7/8] PCI: qcom: Do not advertise hotplug capability for IP v1.0.0
Date:   Fri, 19 May 2023 20:01:16 +0530
Message-Id: <20230519143117.23875-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519143117.23875-1-manivannan.sadhasivam@linaro.org>
References: <20230519143117.23875-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs making use of Qcom PCIe controller IP v1.0.0 do not support hotplug
functionality. But the hotplug capability bit is set by default in the
hardware. This causes the kernel PCI core to register hotplug service for
the controller and send hotplug commands to it. But those commands will
timeout generating messages as below during boot and suspend/resume.

[    5.782159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)
[    5.810161] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2048 msec ago)
[    7.838162] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2020 msec ago)
[    7.870159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2052 msec ago)

This not only spams the console output but also induces a delay of a
couple of seconds. To fix this issue, let's clear the HPC bit in
PCI_EXP_SLTCAP register as a part of the post init sequence to not
advertise the hotplug capability for the controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e6db9e551752..612266fb849a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -521,6 +521,8 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 		writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT);
 	}
 
+	qcom_pcie_clear_hpc(pcie->pci);
+
 	return 0;
 }
 
-- 
2.25.1

