Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B1A3A99BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 13:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhFPMBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbhFPMBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:01:48 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A25C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 04:59:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id x10so1002373plg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 04:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wBFNGODi4+IQZGSkhLMjEMWhaFVciA1BV9abExcmheI=;
        b=Khp/5VHWa9RO+Wv7fXDuVuUHvHBwiwNGRZmzlW0BVGyur+iYObfepoK7JVKOjyhhqK
         1liRueu15843s+cBrpr9AIC7eBS5jJaaQzhwpeDtVkpJISmRww/J2+JtJmFBPu8XI6OT
         jljlMIefrZtXMeMuKL6enxsT5naz0GNMkOgTDxJ1WHnvvrhevS2hH2WP9tbUNfNnxTxO
         ZJmAbh0PkkKAl6prklr3696vvLJn+7wW3ed8j9d7cGk1lMR+ghvItUcEzSC2EmCKktVb
         IG67IUTR67H/RCOEdVv589NAt8WVXe12kVfa7j9e9OCkPLGbL1oMqQD8R/oZBjWQc+sC
         lOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wBFNGODi4+IQZGSkhLMjEMWhaFVciA1BV9abExcmheI=;
        b=TKJDO72mcUVaMBVar+KnUcYnJ5hGt2rDJPnNiWZFM5Q1g89Jpm98zLXUNBWpP5tSTR
         9S2HifxUu2+8Kx/A3Z/r+K/j3/8zCAVPSOus23XBIjTpTKR/03sMDjfUgOAcvXY76xE1
         jBcbGJtuuQv7LK9qtZu/nlucZ1gRPzCZ0NppB7TkkCfe3ZAQusI1ju+6HI9mGa8vtzWY
         JLGRf/boKysuZbeai0uG0CW/FYKIc/pbrWya/ujdKCQbSwbGlwC+NCaSot08BwOSeC4D
         ViZyS+fGaP5RiYzFC9ABZhwN6/eUpviytz3fZq32pyUUzjWqpojszcdmbZ6lYBva2woQ
         Y8ig==
X-Gm-Message-State: AOAM532OloaJfLRmRFKj/x+RttNnE+ggy9F//Ctj0oocby+Zy81n+Pn/
        HLdPHXdI9IBw/QoSG+HIvzhc
X-Google-Smtp-Source: ABdhPJwi0GaP3yeBK8KzC6uunAjY9rDzvOjgYtYyY+E40CjNcgzGyiD9yA2rielnzWhE4vDL3d4jow==
X-Received: by 2002:a17:90b:190a:: with SMTP id mp10mr10622022pjb.145.1623844781604;
        Wed, 16 Jun 2021 04:59:41 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:280:c67a:95b5:d877:b175:798e])
        by smtp.gmail.com with ESMTPSA id m1sm2307646pjk.35.2021.06.16.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 04:59:41 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com
Cc:     linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        smohanad@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] PCI: endpoint: Add support for additional notifiers
Date:   Wed, 16 Jun 2021 17:29:08 +0530
Message-Id: <20210616115913.138778-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds support for additional notifiers in the PCI endpoint
framework. The notifiers LINK_DOWN, BME, PME, and D_STATE are generic
for all PCI endpoints but there is also a custom notifier (CUSTOM) added
to pass the device/vendor specific events to EPF from EPC.

The example usage of all notifiers is provided in the commit description.

Thanks,
Mani

Manivannan Sadhasivam (5):
  PCI: endpoint: Add linkdown notifier support
  PCI: endpoint: Add BME notifier support
  PCI: endpoint: Add PME notifier support
  PCI: endpoint: Add D_STATE notifier support
  PCI: endpoint: Add custom notifier support

 drivers/pci/endpoint/pci-epc-core.c | 89 +++++++++++++++++++++++++++++
 include/linux/pci-epc.h             |  5 ++
 include/linux/pci-epf.h             |  5 ++
 3 files changed, 99 insertions(+)

-- 
2.25.1

