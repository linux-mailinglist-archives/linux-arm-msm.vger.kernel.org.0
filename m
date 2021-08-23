Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4563F4DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 17:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhHWPtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 11:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhHWPtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 11:49:25 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C6DC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:48:42 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id l12-20020a4a94cc0000b02902618ad2ea55so5530825ooi.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0glvYqSibU40VAMSp5zjWVJ43TCEbbX6uJzxWnHUtQ=;
        b=GAgnkM0wwEJjlEIz5GfHoZT4iw/5ADhWhs1ldWYEliZNeEWZE1eYVuqFOv+bwbP0+h
         dNMV4z480Oy9vrzGqF3v9bzBc5kpjq4OMOSCK3lcxA8Q79RN8WFwym2AvuLZIJt4cG3s
         pg6+Tk/1wlY5XnSXIjqJrVruTDz+R719TUOAM1aSq5mYGvsuT6AZIAqdkfK3V+eVflfv
         RvaZ+78Lhp6CzJ0gzVSk0wFIHz1lYpDPBwpJKKwJsfmAk46qqjCqaIeKcE3G0P+uC/+W
         B5rsbMe0jDEtc9arRbYs+EsTh/RPmUS3oF9iK4VwQqjNKore2ToKIjeDZdhnpXBQYaGT
         1k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0glvYqSibU40VAMSp5zjWVJ43TCEbbX6uJzxWnHUtQ=;
        b=LrokOxjc6OxJfq87y92GAzlA3AYeHcl4yeElW/APUmUrnwR6xN6YlaN+PSLLswqqx1
         VvR58fH5hxK2xtEIaXCJ7si7sdSS0N8gufK1dmdxfgqa3HmCpw2R8A+L17rUeiPUlkww
         Nfflsi17WZIjcJ038f4m9w7tm16ZOK0dJ/q20OFC1qfFL/ZqNG4VidsmwfT8xzsYT6f8
         jpHgnOeLp7ryGRY2kPPQS7oXdDncwto/D6eaNSaS28M/i+XUkAEQPa/G+x2ixuCMEeSk
         VmJ8ewIREZTQmXyqaeShgn2Qa9sAPtdRO0F3Zag/YrHcuGEkxt/CDRY9D6YxNBURAnDE
         CHww==
X-Gm-Message-State: AOAM531RVUSadypfKsHT3RPW5eI97bJ9pR5OEYYaDd5entcUjr2p2ROw
        LgEnwTm4LXKcTwYIZHa5XtU/Kw==
X-Google-Smtp-Source: ABdhPJx6xlpMMcZaKdGUdFtmFiSaPC9Z8sINfr3GWqNyEX+Yf77J/bef2VBPMuvy4y1nsGj8mfxheg==
X-Received: by 2002:a4a:9211:: with SMTP id f17mr14188311ooh.25.1629733721930;
        Mon, 23 Aug 2021 08:48:41 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 4sm3704379oil.38.2021.08.23.08.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 08:48:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] PCI: dwc: Perform host_init() before registering msi
Date:   Mon, 23 Aug 2021 08:49:57 -0700
Message-Id: <20210823154958.305677-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the Qualcomm sc8180x platform the bootloader does something related
to PCI that leaves a pending "msi" interrupt, which with the current
ordering often fires before init has a chance to enable the clocks that
are necessary for the interrupt handler to access the hardware.

Move the host_init() call before the registration of the "msi" interrupt
handler to ensure the host driver has a chance to enable the clocks.

The assignment of the bridge's ops and child_ops is moved along, because
at least the TI Keystone driver overwrites these in its host_init
callback.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch, instead of enabling resources in the qcom driver before jumping to
  dw_pcie_host_init(), per Rob Herring's suggestion.

 .../pci/controller/dwc/pcie-designware-host.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index d1d9b8344ec9..f4755f3a03be 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -335,6 +335,16 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	if (pci->link_gen < 1)
 		pci->link_gen = of_pci_get_max_link_speed(np);
 
+	/* Set default bus ops */
+	bridge->ops = &dw_pcie_ops;
+	bridge->child_ops = &dw_child_pcie_ops;
+
+	if (pp->ops->host_init) {
+		ret = pp->ops->host_init(pp);
+		if (ret)
+			return ret;
+	}
+
 	if (pci_msi_enabled()) {
 		pp->has_msi_ctrl = !(pp->ops->msi_host_init ||
 				     of_property_read_bool(np, "msi-parent") ||
@@ -388,15 +398,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}
 
-	/* Set default bus ops */
-	bridge->ops = &dw_pcie_ops;
-	bridge->child_ops = &dw_child_pcie_ops;
-
-	if (pp->ops->host_init) {
-		ret = pp->ops->host_init(pp);
-		if (ret)
-			goto err_free_msi;
-	}
 	dw_pcie_iatu_detect(pci);
 
 	dw_pcie_setup_rc(pp);
-- 
2.29.2

