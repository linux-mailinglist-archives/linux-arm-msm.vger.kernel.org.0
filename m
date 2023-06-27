Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B906373FD6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 16:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjF0OKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 10:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjF0OKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 10:10:47 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57A72D74
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 07:10:45 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so288441b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687875045; x=1690467045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9aImzMW/PakC2TBzXaQ7zhnPtPy3XVwM3s4I1XFVYg=;
        b=n30WKHJRZHvMomWhxgqD21t/bO/+pUUYZsxUxB+6+yZUlyC8n5P0vx1KOVfeRe1Wqk
         +W4mbn70eOuN9hgYvUtCmgDd3fjyz/1gSHvOUCY2+SM/5DAjQuwOswD8uLhwN47JeCoo
         KFdfVUeP4iEbpUCAr2kfdhZP6QPr6tuKEC2FzkqzlaJ1tOWbgQALGyuHTzLrOGip+8o/
         pgIAuWMa0c5/042ZpuwBXvpb6A28QSuJnvWE6oWcd1nxUCQE7238ZHsUTueP/hkWLDsP
         RN0grXoMZChL1JJBmPiQXhBC/qokw4Wdv7yVy1SzapYHltYXFhmcG1aJUbI9nN0C43ng
         dKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687875045; x=1690467045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9aImzMW/PakC2TBzXaQ7zhnPtPy3XVwM3s4I1XFVYg=;
        b=dSNBfkArKSzd1vuyFXTkmwE597lvyZOAp7GgJYzJgHBQ+ge1TdcyC+KLaLwadKAbYU
         lOUnrrXZdr/vBmtB0f7L0JP7AohwFgdNXL4Uo8nx4WftCKtyXKUTxjsiPSGXQyM8euGQ
         iAUwUIgWPzI2eJ8md8sASeIAX//iIHBirDQDdP5fGRCDwAvBeXqra6+93GePMKtt8cSW
         IZebu7tUM0wdGVxMP5Hl+fBgkczPR4lBglD2c0Q2N2k0pZ5KnMkthOBY1/f09ourDjxX
         ooe9Yh7r+65BzwKPUZR+kBDyViv9gQ7oJ9PGrp59HLeEDUtXzkdodCP9V7qxsFlQgS6u
         nZGg==
X-Gm-Message-State: AC+VfDztVXAXo8ysCaSNozbxbiWAsQAOAjlGcKZUoXOx1Y9nfp3gd1vP
        D9ZeVUGS6U9XfbOKPUQO6XYH
X-Google-Smtp-Source: ACHHUZ5eTFi4MYyXuXLSQNyQJYHS6PR3qD+HIZBeKLu8dKSCvSR88IV8VKEBkmcEWNl77zPFwrotkw==
X-Received: by 2002:a05:6a20:3d87:b0:127:aaf:59a2 with SMTP id s7-20020a056a203d8700b001270aaf59a2mr8377010pzi.35.1687875045065;
        Tue, 27 Jun 2023 07:10:45 -0700 (PDT)
Received: from localhost.localdomain ([117.217.176.90])
        by smtp.gmail.com with ESMTPSA id n11-20020a6546cb000000b00528da88275bsm5254593pgr.47.2023.06.27.07.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:10:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH] PCI: qcom-ep: Fix the write to PARF_MHI_CLOCK_RESET_CTRL register
Date:   Tue, 27 Jun 2023 19:40:36 +0530
Message-Id: <20230627141036.11600-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of writing the updated "val" that clears PARF_MSTR_AXI_CLK_EN,
"val" is read again. Fix it!

Fixes: c457ac029e44 ("PCI: qcom-ep: Gate Master AXI clock to MHI bus during L1SS")
Reported-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 0fe7f06f2102..267e1247d548 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -415,7 +415,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	/* Gate Master AXI clock to MHI bus during L1SS */
 	val = readl_relaxed(pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
 	val &= ~PARF_MSTR_AXI_CLK_EN;
-	val = readl_relaxed(pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
+	writel_relaxed(val, pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
 
 	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
 
-- 
2.25.1

