Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E484710A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 03:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhLKCVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 21:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhLKCVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 21:21:40 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C6AC061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:18:04 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id cf39so9084133lfb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ih8VEbLk5HADGlpnEJHtvirNVFfEWHbWt9yeGC0U/m4=;
        b=tfE7zCFn9P4fBH4D36xBAcVI7cw8uw+ugmzQANbHlVW3woHUXcmE5o5Aei6B28D1o/
         xBFEP0ookfGDun5ChIOuuQnyPEKbmtt/U5DpNDrV1Mm8eQRkvRExDZtDChv3nEiN9Qxo
         oQuThv3sqdK/TNt8DN9g0pvuZmScfnYsIWQU3UdupCfz1LYhNJknmP6wkd7UHAyflvth
         QQRqPyXOB3LEc9izelCJv2a9Yv066GjhBbQ7Z1SNKCMOW00O2fdsCLDFeGDNSjrz+FGz
         XK2j0iqQmP23WpZR9fsGJUcf6DM6fQu+gxXHkIxYyp4TxKhLBbY41U/sAxORwdORhPcE
         mb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ih8VEbLk5HADGlpnEJHtvirNVFfEWHbWt9yeGC0U/m4=;
        b=yeZXk2SSWxch7TFd8SQYBS2t7/GNQ9ByN40UFuO9k64JIEQ+iaa75cHDOxpveL6Flw
         GHPvvSle+eBKil+BUc6HGr5uhxRmy0/a4n5oA4OGQWr2UZUU5Q05TvGn5VGzE4Zp7Dtk
         Pn+qfFysuzV7bGQTF4jjQWNr4HUrqvU0Qa6XXHe5BiAyB01U9vKNgLD6rKCcT7H6kGu3
         WUtp1gEmU4WnLMxgvJaxZqJmjh3E7XefBaPOZS+sAg+K10Xb88YpSQ0yyXZdd8oStUcC
         azb1BIGaksqUI8kS7gX8aDr53Gg0Ep0El3H3sazjjm/7cqwQ2MamH9t880x/Y4M6PIq9
         qyHw==
X-Gm-Message-State: AOAM531gKPGn87odqVysA6GiRLDs5Az4KoiP/+vY8q+dSciibBOsSYFr
        dO9jH+anAHh6RLAfigiGXNSlLA==
X-Google-Smtp-Source: ABdhPJzSANxpPqCT3Gq8MtF6TYbQpdPwmnk8n4mvREaQ01TeH7E5Oy9b1zhluBVdXST1n7jlMyPj6g==
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr16387154lfu.454.1639189082414;
        Fri, 10 Dec 2021 18:18:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y7sm504663lfj.90.2021.12.10.18.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:18:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 00/10] qcom: add support for PCIe0 on SM8450 platform
Date:   Sat, 11 Dec 2021 05:17:48 +0300
Message-Id: <20211211021758.1712299-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two different PCIe controllers and PHYs on SM8450, one having
one lane and another with two lanes. This set of patches adds support
for the first PCIe phy and controller only, support for the second PCIe
part will come later.

Changes since v2:
 - Remove unnecessary comment in struct qcom_pcie_cfg

Changes since v1:
 - Fix capitalization/wording of PCI patch subjects
 - Add missing gen3x1 specification to PHY table names

----------------------------------------------------------------
Dmitry Baryshkov (10):
      dt-bindings: pci: qcom: Document PCIe bindings for SM8450
      dt-bindings: phy: qcom,qmp: Add SM8450 PCIe PHY bindings
      phy: qcom-qmp: Add SM8450 PCIe0 PHY support
      PCI: qcom: Remove redundancy between qcom_pcie and qcom_pcie_cfg
      PCI: qcom: Add ddrss_sf_tbu flag
      PCI: qcom: Add SM8450 PCIe support
      arm64: dts: qcom: sm8450: add PCIe0 PHY node
      arm64: dts: qcom: sm8450: add PCIe0 RC device
      arm64: dts: qcom: sm8450-qrd: enable PCIe0 PHY device
      arm64: dts: qcom: sm8450-qrd: enable PCIe0 host

 .../devicetree/bindings/pci/qcom,pcie.txt          |  21 ++-
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      |   2 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |  14 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 143 ++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c             |  88 ++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 125 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  33 +++++
 7 files changed, 388 insertions(+), 38 deletions(-)


