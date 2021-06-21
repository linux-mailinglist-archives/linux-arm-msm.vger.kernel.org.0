Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519E13AED4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 18:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhFUQTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 12:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhFUQTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 12:19:04 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11D7C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:16:50 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id g4so10306996pjk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l7439q0QWn/sG+k50g0pQMNG6HMcUnXDSIhGmcRTE7w=;
        b=blOPIW+F55KF4vlpfyGyUepsN7A0d5NO8oKuJvzEvkFQKPLB/wz89k1Uy9pv5Ov7NX
         1Vca/9nHQ0HGQoUfEBhap5lLqp20Ich8fjBocMBFaUryg2XxjR5NpYYJCXIfOq0Mlw+n
         n1gPtq9LCIwX4MMTF1JC/3Zbbakwdf80LI44fR0VG3m5/Hgt1K4sf2oV2WED+68fOSUu
         mfmXXUUmqzBiyS3DWi5xe7icBCDdd+ClhD9rqXqCMBaxYRUHM+VgJHiVw/ykrUAZsBUk
         kljweNsyb0taSE18dIllx4T8oLqEA8ZHKUuWz4naFGsi4bKnJxlITD9JNVhks2QZLwIQ
         jbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l7439q0QWn/sG+k50g0pQMNG6HMcUnXDSIhGmcRTE7w=;
        b=iM/GG+eEMSuyS268q/Z2Wwgcc5/9KX2DPF3hFQrHmecMNuP0epRbzegt1NXDuXwhTh
         FwXceYJWz4zFkNwHFrPoDdIzLWZlDlSC/QA1OlfJ1RSsFZWdzxLG4VCPC6oaGl66xUcf
         4RdOsRdPYUOVmDxh6jD45GbqMciV5Hef+dW3pFjZI/9RV5s46l1d4598lvFJ+TIkKgIa
         CVk/J5V7klvz+vTbJsm1DnLZObZuGWQGKtLkdpQtFVs2P8YZVOk8aGdf0UWtPdS1VptE
         nBDRRk5NeifSrmhrsaZzcR5VetY9EqtjeYtkX180Tl+STy3121FjKZ4goo0ED0jtcUiR
         higw==
X-Gm-Message-State: AOAM533UuzjZPtV7dV/Ut/oEZtYtr5jx5GOduk6EaOuB4J85pVEYmC7v
        fDvOI2HjXHMZrRmBfRrgEc9I
X-Google-Smtp-Source: ABdhPJzAU5KZi1yzGFaO3TmgDt8yZohmE5Z69MD2JFb0LvxBGvfb43Mp+j2isq0Acu9j5+fvuvt7tg==
X-Received: by 2002:a17:90b:3886:: with SMTP id mu6mr14319816pjb.112.1624292210136;
        Mon, 21 Jun 2021 09:16:50 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.116])
        by smtp.gmail.com with ESMTPSA id k88sm10734730pjk.15.2021.06.21.09.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:16:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        stable@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/8] bus: mhi: pci-generic: Add missing 'pci_disable_pcie_error_reporting()' calls
Date:   Mon, 21 Jun 2021 21:46:13 +0530
Message-Id: <20210621161616.77524-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an error occurs after a 'pci_enable_pcie_error_reporting()' call, it
must be undone by a corresponding 'pci_disable_pcie_error_reporting()'
call

Add the missing call in the error handling path of the probe and in the
remove function.

Cc: <stable@vger.kernel.org>
Fixes: b012ee6bfe2a ("mhi: pci_generic: Add PCI error handlers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/f70c14701f4922d67e717633c91b6c481b59f298.1623445348.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f02a2ef..d84b74396c6a 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -665,7 +665,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
-		return err;
+		goto err_disable_reporting;
 
 	/* MHI bus does not power up the controller by default */
 	err = mhi_prepare_for_power_up(mhi_cntrl);
@@ -699,6 +699,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_unprepare_after_power_down(mhi_cntrl);
 err_unregister:
 	mhi_unregister_controller(mhi_cntrl);
+err_disable_reporting:
+	pci_disable_pcie_error_reporting(pdev);
 
 	return err;
 }
@@ -721,6 +723,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		pm_runtime_get_noresume(&pdev->dev);
 
 	mhi_unregister_controller(mhi_cntrl);
+	pci_disable_pcie_error_reporting(pdev);
 }
 
 static void mhi_pci_shutdown(struct pci_dev *pdev)
-- 
2.25.1

