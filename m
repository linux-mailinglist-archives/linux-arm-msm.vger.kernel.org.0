Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA4D4FBB41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 13:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345109AbiDKLvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 07:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344951AbiDKLvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 07:51:43 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635D4B1CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:49:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r18so4098139ljp.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GbP4wFO6U2YlYAqrT0rofVl8iN2ZLjsgRHVQuuJCNM0=;
        b=ZnCkrpv0JadXbjS4/1B1OSQFtbm5jTQMorYstBasdFn31j3aDXy5V29/zT/3v6FEpi
         LL7qwBnmXOSdQvj9Rtjd1xnvdfrlDqyd7pcG9h9wsHwrAacN4wp3hRrUY4QMm/6qNzPZ
         ecdt0ekMAIP9W69YGTamswZDWICQVZh0lNAdu5xUgMBwHZnvEbirJN0daq9FQTh5A5Ot
         Vv1H3/aTYJEF0cwS6wywjvYgFFELRI7nMR7LcPpqWUgz9LLaDyc9AWO2ASfIacTSES9d
         PB0/7jcIQyLN/M/Yi7IVLJ0soXKpWjRQb4yvbyOYqu/agaRmOlC83sFMF7Q7wgXtPrPW
         9LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GbP4wFO6U2YlYAqrT0rofVl8iN2ZLjsgRHVQuuJCNM0=;
        b=5ags0PTv7kILjl0BrxmJlTSy6H50eQG8ALyGU8ybu42isWGC/XOywxz6bWxw9SAi2o
         xoV9xmuQUdi84hbaKOaB4pVGNzmQTwAmXdMnXeq8FXFd+pRqEa7RR/2iNTN8n3GQCefg
         OBP5fFg6ykib6cDvD6TBFn8xXn7S74u9PsDlx7Opa06UuKmUjDpSWcCN2e06qzWrSQIw
         BFll+CgQp/HTpJz0YOeukXUfoBM01+KE0ogOG8eYrJC+9/Raq/4EXTBIr7UCj1gcbRND
         lcY9jYtY8fxWWPYfepwvcW5Lic7htXPnHsBKENdEK6FKA8Gq6BghP48WH6nIVFU8lCUf
         2BOA==
X-Gm-Message-State: AOAM531X5ptMv0P5l/MebAM0fL+phQC0n12lvZRenhj3UnqmqpACa8Ul
        OVOW/BY05/aC+Jm9TjaIboHblw==
X-Google-Smtp-Source: ABdhPJwEwmHLg4vAhn+GcFJEqZPvSfOxW7lHS38Pvi0ygBv3xF6LWdDupVpcfcmZQ45DQqOgPDsNwQ==
X-Received: by 2002:a2e:a169:0:b0:24a:fed8:d1f4 with SMTP id u9-20020a2ea169000000b0024afed8d1f4mr19890053ljl.348.1649677767652;
        Mon, 11 Apr 2022 04:49:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y21-20020a05651c021500b0024b5d56484dsm587973ljn.83.2022.04.11.04.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:49:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 0/4] PCI: qcom: Fix higher MSI vectors handling
Date:   Mon, 11 Apr 2022 14:49:22 +0300
Message-Id: <20220411114926.1975363-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

I have replied with my Tested-by to the commit 8ae0117418f3 ("PCI: qcom:
Add support for handling MSIs from 8 endpoints"). However lately I
noticed that during the tests I still had 'pcie_pme=nomsi', so the
device was not forced to use higher MSI vectors.

After removing this option I noticed that hight MSI vectors are not
delivered on tested platforms. After additional research I stumbled upon
a patch in msm-4.14 ([1]), which describes that each group of MSI
vectors is mapped to the separate interrupt. Implement corresponding
mapping.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/commit/671a3d5f129f4bfe477152292ada2194c8440d22

Dmitry Baryshkov (4):
  PCI: qcom: Handle MSI IRQs properly
  dt-bindings: pci: qcom: Document additional PCI MSI interrupts
  arm64: dts: qcom: sm8250: remove snps,dw-pcie compatibles
  arm64: dts: qcom: sm8250: provide additional MSI interrupts

 .../devicetree/bindings/pci/qcom,pcie.txt     |  4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 17 ++++--
 drivers/pci/controller/dwc/pci-dra7xx.c       |  2 +-
 drivers/pci/controller/dwc/pci-exynos.c       |  2 +-
 .../pci/controller/dwc/pcie-designware-host.c | 54 ++++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h  |  3 +-
 drivers/pci/controller/dwc/pcie-keembay.c     |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c        |  1 +
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  2 +-
 10 files changed, 65 insertions(+), 24 deletions(-)

-- 
2.35.1

