Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04730307D44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 19:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhA1SBU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 13:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbhA1Rxx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 12:53:53 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1A8C0617A9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:52:38 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id t8so7378194ljk.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 09:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+h4iY3X8KWYJxdBXqwutJPnHSSsLNjVIGMbK8ENRaO4=;
        b=Xth5HkEyru+I/oRftl/ZDJ9BqQGqc9PFbpXVMzQIqiTTVRZ+jKPaJfu0eeutGCPqFq
         Ux551LITZ4RfdT8b7yhUdO//5/rBe2o/7XpMvPbBCon1yCMjsEK8pgn0yrWo+Fv1CIJ0
         9O1rjM4pky3dsuyVhSzEXGJIuPFNRDJMnSVV2Zh6XFXfaGNbgmkCAe6W/mQElPh/SMzd
         f52zcd2PK0kuChVNe4fmk/K/xGJmGWrX5479qcGUZ3ZDBAXWZ6dl16+Dc/L/ePNygrLC
         +bt67kayzncAC9A3x2kRVfNKB+uOVSetpWWq5VptLZ3NBuG10+jNYmnnJ0Dh4aCn6esd
         FM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+h4iY3X8KWYJxdBXqwutJPnHSSsLNjVIGMbK8ENRaO4=;
        b=Vsi3C6/BIMs7/UrABZtDML/xLbX4dH02UmCONprbnbeSN++/wsDV0yVqMxZBmFPbAG
         PNvetFhEY1vZub1baGQsHEVghtd66Yf8X+HIGvjs7y7B9JEa2SW9EL+rUfZGDc8ZoEm6
         0vN3vAPSYpZfWA73bV+Sc4/XnGL2DJYN2z8H0BgRQaQg9UvNBPrJgg57Fx+woK8W17Oi
         Uy7ucEkTJtalCmpLlYp+emBBI52hfrzBNMDfIxPCHxLIDFUiL3Nn4m90H9wyi9dFDZTP
         8Doxzgbza0O78i7o2vjp7Whx61A2F7T9bO9lKQLFENkf8o1zz5D4mhnoQWrp1WkeEKsL
         Tysw==
X-Gm-Message-State: AOAM531Q3Rzh+ChbDowW8jU0QmA7RcCexkzRSWU0aUJovfGO915N14a1
        wtL32L/fqv4+kzGs46XjsutTCg==
X-Google-Smtp-Source: ABdhPJwaaiMy0PndRhrLl8JkAsSnUorqd4IdFfg4mBRAi9QArmC3uK+gQIstRLDRTFKyKTlp7frTkQ==
X-Received: by 2002:a2e:9ed1:: with SMTP id h17mr240397ljk.160.1611856356937;
        Thu, 28 Jan 2021 09:52:36 -0800 (PST)
Received: from eriador.lan ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id w10sm2216119ljj.37.2021.01.28.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:52:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 3/5] pcie-qcom: provide a way to power up qca6390 chip on RB5 platform
Date:   Thu, 28 Jan 2021 20:52:23 +0300
Message-Id: <20210128175225.3102958-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
References: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some Qualcomm platforms require to power up an external device before
probing the PCI bus. E.g. on RB5 platform the QCA6390 WiFi/BT chip needs
to be powered up before PCIe0 bus is probed. Add a quirk to the
respective PCIe root bridge to attach to the power domain if one is
required, so that the QCA chip is started before scanning the PCIe bus.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ab21aa01c95d..eb73c8540d4d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -20,6 +20,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pci.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -1568,6 +1569,26 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x0302, qcom_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x1000, qcom_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x1001, qcom_fixup_class);
 
+static void qcom_fixup_power(struct pci_dev *dev)
+{
+	int ret;
+	struct pcie_port *pp = dev->bus->sysdata;
+	struct dw_pcie *pci;
+
+	if (!pci_is_root_bus(dev->bus))
+		return;
+
+	ret = dev_pm_domain_attach(&dev->dev, true);
+	if (ret < 0 || !dev->dev.pm_domain)
+		return;
+
+	pci = to_dw_pcie_from_pp(pp);
+	dev_info(&dev->dev, "Bus powered up, waiting for link to come up\n");
+
+	dw_pcie_wait_for_link(pci);
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x010b, qcom_fixup_power);
+
 static struct platform_driver qcom_pcie_driver = {
 	.probe = qcom_pcie_probe,
 	.driver = {
-- 
2.29.2

