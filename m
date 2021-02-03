Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4966B30DFB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 17:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhBCQ0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 11:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhBCQ0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 11:26:03 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D60C061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 08:25:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id l12so25103237wry.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mZtKCFeSZ7YtgJTLNAMjO8CL16GchCOBM1eFkgbXiic=;
        b=o7DIE9/86yqlIjZAuY+SLAlPzZG1X69Y8/F7VTZXZTVuTCHy65N5Q4nL7EhstALiXO
         ie7y0gACvDDIjaq6NSrO94SnKQ9nyps3K0d+K4hZhM66QIbeFJ+r7Bt5rrx3wiqXdnAd
         MUbxTHYoEWx8zwWKfjX5KZ6K8PwdjMwlgSQjXQdi8s2lvlzlLYTC/aHELwGaaCNCxisU
         GaWgOJd+hZeoMyTYz+GJvhW77hGEH7SzFP64/R9vR1BBYxyVukeud74SMhmD10P0zUl1
         F8lBHPNR9dCBPIuHC40vq9Kb2aDYOZtjRNE/z+zc+7501Wv3039MhwQ8xnj2eRjLqmfW
         yhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mZtKCFeSZ7YtgJTLNAMjO8CL16GchCOBM1eFkgbXiic=;
        b=aQiYVPGwtzJo+gT6WTnkRKPF4yMT3SmY1ajDwRzO189dZW65xTVdcma+IOTslNZGBG
         sxco5Rk7i35XZVT1DB/yATeqEtYUOuK0h07r8uwr+8JAFchRRwYMLoIJnQhUblwpfeoF
         30Ix9c6wGoY17xpJXlgn88TqAwMArwoJo1STVIEBgdTBuUwSuJTruQOB9LhCUOWDlDG9
         Q+X9ePqpf7DWtIFIdYAOmfXyZOd3yV0ltZxJqInUsRXS40KPUQoDESXT+N58MxtPX2DH
         cdbp4Z1QQhXbyK61vQT5ddEL/RJhF4Edjcq8+A25+yNNNL4UjZc7qF6d4BM2Q6vSixE4
         g2IA==
X-Gm-Message-State: AOAM5324zacYvgdlZXYrFswotojp3zVm18NSZlKzh74z98Vf1vtlgH+z
        equ9zgQKs2mdm4ttG18PRdiLGk3WA3rKfQ==
X-Google-Smtp-Source: ABdhPJzfV5EAJYymiZZGdstB6HYNI3Wnl1cJ/hi3GcHSvYOsJaA9N2nGFmWiqopeY8mpJuX/WsBcMw==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4326526wrk.89.1612369521214;
        Wed, 03 Feb 2021 08:25:21 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id r15sm4468350wrj.61.2021.02.03.08.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 08:25:20 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: Print warning in case of firmware crash
Date:   Wed,  3 Feb 2021 17:33:03 +0100
Message-Id: <1612369983-21013-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print warning when MHI detects sys error.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 444693e..81b1500 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -217,7 +217,19 @@ static void mhi_pci_write_reg(struct mhi_controller *mhi_cntrl,
 static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 			      enum mhi_callback cb)
 {
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+
 	/* Nothing to do for now */
+	switch (cb) {
+	case MHI_CB_FATAL_ERROR:
+		/* fallthrough */
+	case MHI_CB_SYS_ERROR:
+		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
+		break;
+	default:
+		break;
+	}
 }
 
 static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
-- 
2.7.4

