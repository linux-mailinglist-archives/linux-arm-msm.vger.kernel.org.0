Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073F646D959
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbhLHRSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237656AbhLHRSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:18:20 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1FFC0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:14:47 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id u3so6967835lfl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5DqbsAczzIDbPjb8Q5k9xE5iuuwEbj+RJ3i6IjnaB0=;
        b=MpXwQTluI1THfP0K3jQ8aG7sz9yjvYEm0DF2Oa1EreGb+6TA6HraO0gxv3OfVhwa5D
         eDVzi1TrLwrzYZouGqvSTSdbCKPI915q3PGf51k4xrj7lxBbpp7x80jwW9W5UJOs6PUg
         DbFV5B1GXgK/2s38+XC/cdxYM4DGmN3hebL5XTlEB77o/p3HmVI71OwXvShPPzQBJ+Pj
         b10rDQSUEsImvz4Lu/JLa2dTHcQFsyifmd8YWxaqi/pw7+7xRZrt6GONLhasd6a/vJOr
         MRzZQES1WJcajLnMx4bl1B7Ck7wNSNWS3yh30Bf0cID3ZWtRaVzEuhCpkvnIcGP2mE3x
         xzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5DqbsAczzIDbPjb8Q5k9xE5iuuwEbj+RJ3i6IjnaB0=;
        b=GsGuFscHVl7F6Mg4APEYpe0GeNBVHPpcab5msJkRVdeyLvW+kqE745WoaDShg+1QN4
         5hbAK6pQMV9LVUEPFGaz1dUmX5awxGUlhjNV720GFiig22NeebUFwXTCf2D0u1UmBLtM
         x8QPnW9paaQGQ06HkQwY28RkYbXBq0cZNKJRGSQDdIMCXEz+nLXbM+hiLrkPpGetLx0W
         mgN65isyHVM+4hNI/fuPOlbK9zNEDbSMGdXwTqA5jo+TXEL2afZ0MgNjd6j8ZNJ6/KVK
         C9yZwY18ua1I4tGjHPc7kT2c3Q2FwUExM4upbg2n0BCkwgJPNzkzCN8GB9ja8r9jp7tb
         zY3g==
X-Gm-Message-State: AOAM531E7puCdmn9QOin6Fa8zbacsAG36GPBgmuS4ciwQ/eZhTrI5Rzm
        KVzYMYF2jpqS3XOYVqOAqzzyrw==
X-Google-Smtp-Source: ABdhPJwNddYOmUQWWSCyrFz4mrMmtkHCl4efTtefvONi9p1mMLG0kQrDAh7KuusRm3WeD01Fr3TnVA==
X-Received: by 2002:a19:4f02:: with SMTP id d2mr655934lfb.547.1638983686032;
        Wed, 08 Dec 2021 09:14:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t9sm307213lfe.88.2021.12.08.09.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:14:45 -0800 (PST)
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
Subject: [PATCH v2 00/10] qcom: add support for PCIe0 on SM8450 platform
Date:   Wed,  8 Dec 2021 20:14:32 +0300
Message-Id: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
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
 drivers/pci/controller/dwc/pcie-qcom.c             |  89 ++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 125 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  33 +++++
 7 files changed, 389 insertions(+), 38 deletions(-)


