Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08BD51C198
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 15:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380183AbiEEN55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380129AbiEEN5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:57:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B040057178
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 06:54:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b18so7605995lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WbPm7wPFz42k3w9HjVTRf/Wo4cb2U+ygFCZJLREQuWI=;
        b=Xn+8z8ql0h5nj7WQRPPklQCv4vzgkLbNrjDogwUJw9hlZ+xiYTGzIbLBYyGHqdCo9l
         1+oVjLjlQMbVQPIfCbXuXjrGin2VJD5zeGJz7O80qZ7krgrW1Lo8R3kFBnNE7RhHvuEM
         lTBvVX52Tqc2WWmGt5+xPIs4sfC2W+kIozvwFNK2PZUMk5HIPejKEvOSr4SsluGztQH+
         Gh1t+nkZDVQVfWbvLCXwHuaWx/b7dfhL7ZUe656lFalBWZ4Sq2KOL6+yfyoRJtY1p2g4
         VE+JGEyOJYcQtwkt6I7B2baL+uVbnKgJSnvHahYPLni02pXe5MSuWzEbl01J2bkjJ69i
         Flxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbPm7wPFz42k3w9HjVTRf/Wo4cb2U+ygFCZJLREQuWI=;
        b=wz2ebS80mTxhPMipQSvQQAhWb1n2rmQlHeWvicel77DJriCy4vgR4gcAeMjpxdlrp9
         4uaLOX+78B+GD02uc+bf74DdL7r6BN6/0J6o26lTKlEc8pdORR3qpDPWFjnN+tnIKwtJ
         ewq7BtAUhIaQsjBIgR+pdagxKrxLWB1QtVvl0ZGeU1VpuvPcivJ5CXNI3T+gW+UUptLd
         ggwPtTXjT+CUf9j42xK7GNB9ofVfdlXqWgs2DsV+71q363EQxDQrJyB9X4lGAvxNw+zD
         Zb7xmqrZ9zpEdUfppihLnBKm/wFZuBeT8pnf4YcIOtUkUn9rD15eW0GBfVwR1r05/r/I
         uluQ==
X-Gm-Message-State: AOAM530O9m0FDDaoHqNfykNsx3tWGIa+8hbIRhhrJ4vlTdWBRDXRb0B6
        FxXDlWQyOujbqD9V0QlWKPcEiA==
X-Google-Smtp-Source: ABdhPJweT0d33EPcdMX3DaxBXIJifrw1qhZigxI3qvTMuhBG+U9o6VTEuGWBZ/ud2jnXqSLddFE0yw==
X-Received: by 2002:a05:6512:39d5:b0:473:c255:b811 with SMTP id k21-20020a05651239d500b00473c255b811mr4941705lfu.201.1651758849664;
        Thu, 05 May 2022 06:54:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z24-20020ac25df8000000b0047255d211ccsm221788lfq.251.2022.05.05.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:54:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 2/7] PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
Date:   Thu,  5 May 2022 16:54:02 +0300
Message-Id: <20220505135407.1352382-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505135407.1352382-1-dmitry.baryshkov@linaro.org>
References: <20220505135407.1352382-1-dmitry.baryshkov@linaro.org>
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

The subdrivers pass -ESOMETHING if they do not want the core to touch
MSI IRQ. dw_pcie_host_init() also checks if (msi_irq > 0) rather than
just if (msi_irq). So let's make dw_pcie_free_msi() also check that
msi_irq is greater than zero.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 2fa86f32d964..43d1d6116007 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -257,7 +257,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 
 static void dw_pcie_free_msi(struct pcie_port *pp)
 {
-	if (pp->msi_irq)
+	if (pp->msi_irq > 0)
 		irq_set_chained_handler_and_data(pp->msi_irq, NULL, NULL);
 
 	irq_domain_remove(pp->msi_domain);
-- 
2.35.1

