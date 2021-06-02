Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B063988F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 14:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhFBMJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 08:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbhFBMJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 08:09:49 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D637AC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 05:08:04 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q25so2011577pfh.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wv/GqpQtVNJ6eNnlYZDDtTKJU5/2n/Y/EinQRXFDYco=;
        b=eN5huYwTTRQ6lO7k84mC91zHWmWx1hGyAM9oB3wOgB0t+ZcgT5dd7zm8sKR0qwNcfX
         1AGy4y9eo2pioscpIY/xsYANPlB9QivENGooFgvJxNwv8izUnlzzx2BT8lDUa5e5y0hk
         m7autFSC0cDZFCaBR3v2NCyhU4yus2Fv6niICUYaQZvRvJSBGgeVUJZkgW0V5an6B46p
         fBAPzlS1Uj03keu3H5Bf/0K/BRmNNIr/F3rGWVTVLoI/4pHnjqX5O1CAqco8nBxV5Eya
         bCamUHCdSpOqr+b6qAPwlD1sk2R7elpvRIXaIoNP5g4+2TAqmriUxkxNthn3msG3MGXi
         G22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wv/GqpQtVNJ6eNnlYZDDtTKJU5/2n/Y/EinQRXFDYco=;
        b=LDmcqwO0TsFGVT4eH3kEThosQucyQEKaUh3TT03XkUfvj2XJrZ4EHs+t5AR+IhU7+l
         lSBQjhP+k87WXmESvIuyWuoat96SoJr8YHiJKMypnQZ/n6uanwX9rMpiMBSKJhL0lEBH
         JW0EwhkcdMtseOmFjcQUiH0+CvESTnev75Ik17KggVvmPY7oGXhvtXXvmMZvSwY35JSL
         GGP7Hi/TjAqpLTLRTmL2DPD0U4H9SUsqoxSwU2ojRMywYiFB3+p5gEPDsmRRT7VdL9i3
         s45GKfj+7ztLHcvFVBKFF5JAF18qzaSokyJgoLE1NKMvoPmaMDldHAW3Os/yKAr/fbnI
         Klug==
X-Gm-Message-State: AOAM530Mk1g9xneULipTo4AIGlQsZwkQXUIKiZD9Nbr0+cALg0fDku8T
        7sm0R46H8qkQA24xto1pe1+B
X-Google-Smtp-Source: ABdhPJwZAd0XPU9npLeIfYpA8KAgDMiYPcVfnAmsvna5Q2CZJs8F9kFS7HeOrOvb2wp3nfGZKVC5/Q==
X-Received: by 2002:a62:ee0b:0:b029:2e9:a790:f273 with SMTP id e11-20020a62ee0b0000b02902e9a790f273mr21176365pfi.24.1622635684052;
        Wed, 02 Jun 2021 05:08:04 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.54])
        by smtp.gmail.com with ESMTPSA id h18sm12502907pgl.87.2021.06.02.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 05:08:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add Qualcomm PCIe Endpoint driver support
Date:   Wed,  2 Jun 2021 17:37:49 +0530
Message-Id: <20210602120752.46154-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds support for Qualcomm PCIe Endpoint controller found
in platforms like SDX55. The Endpoint controller is based on the designware
core with additional Qualcomm wrappers around the core.

The driver is added separately unlike other Designware based drivers that
combine RC and EP in a single driver. This is done to avoid complexity and
to maintain this driver autonomously.

The driver has been validated with an out of tree MHI function driver on
SDX55 based Telit FN980 EVB connected to x86 host machine over PCIe.

Thanks,
Mani

Manivannan Sadhasivam (3):
  dt-bindings: pci: Add devicetree binding for Qualcomm PCIe EP
    controller
  PCI: dwc: Add Qualcomm PCIe Endpoint controller driver
  MAINTAINERS: Add entry for Qualcomm PCIe Endpoint driver and binding

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 139 +++
 MAINTAINERS                                   |  10 +-
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 788 ++++++++++++++++++
 5 files changed, 947 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-qcom-ep.c

-- 
2.25.1

