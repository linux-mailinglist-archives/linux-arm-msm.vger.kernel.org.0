Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEAFA50B674
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 13:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447167AbiDVLvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 07:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447162AbiDVLvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 07:51:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFAC56415
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 04:48:45 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u24so1768647ljd.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 04:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZT/TykfMBCVk8d3xWr6e8o/MGP9L3Bc57oie76TSkw=;
        b=W+7yNPwJBCf6O8jxaNp7vTbIrZfvI98OqXcx6TEPsRsqoUsSvp7CrYdAChOPhlCWYw
         bs6f80ubE3uyH2iKZ0OHKc6iW2cDWLMydzMgJXP1vnoN/QCsEU41UUdCzIK1rawryw0Z
         VMPcpI4JRVvKEYZ2FUJZHJjOmhmBWvd2TCOQ68P9d1gGHZJfnyX81dKOrX27eYCw0CaD
         c+e2mLEV/4AK3BstUPbMc3iXkGxMbdwq4XFQMUeeb7DWEIXZ7d/GJYsZy9RBnehEc9m3
         1qpaxPGcWa3uGaKExa962sH+ZE8DXFPB5A4laq/NZh1Hhwhcf/pn1m2DYgePofeGX/9f
         kNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZT/TykfMBCVk8d3xWr6e8o/MGP9L3Bc57oie76TSkw=;
        b=r7iUAdOdir9NPG4ZOXA91mARO5zUvEm9i6OVMZbplqUBUvuEhZcX4tfGHLhOf94i3a
         Oqw9mny1qBNBxQ5F1gsdkjSNpU2K/HwI62vIn4VLAjEKC1PiCO7u3A3nN55t5vnvGDwI
         6dV+im4zbwig2idKZANfzZ2kkrA3+qOhdEE3eEJPnTmGXg4dcQxPOiyAL9suXaEliA3Q
         8m8xu+GhvNV/AEa5JuMFNYLWPqP62RuH5XBioPOaVLSVBZWluqSgcIxZKju+h6L7YErK
         k4Kt1xPILddt3Us8ECWTPe3iMBZXsVVs4EBmNceqrIe/P8qehaCAWENdeujw52W5N+NB
         R78A==
X-Gm-Message-State: AOAM531S8SPTpgC1iqboTAsKjPofTNYdbVrQODSG+Yj7OZ67N84iBLuX
        5BLBSLbKgRw1HaOZorm2TkmK7A==
X-Google-Smtp-Source: ABdhPJyppi8DNcV45XTcmBLpWWHvYlql+hZLlqy8Nnn2S80SviDVAFF4inFYXqNrUenHR2Sg97ArUA==
X-Received: by 2002:a2e:8e93:0:b0:24d:ab45:4053 with SMTP id z19-20020a2e8e93000000b0024dab454053mr2487282ljk.231.1650628123482;
        Fri, 22 Apr 2022 04:48:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.65.189])
        by smtp.gmail.com with ESMTPSA id h7-20020a19ca47000000b0047014ca10f2sm200695lfj.8.2022.04.22.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 04:48:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/6] dt-bindings: YAMLify pci/qcom,pcie schema
Date:   Fri, 22 Apr 2022 14:48:35 +0300
Message-Id: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert pci/qcom,pcie schema to YAML description. The first patch
introduces several warnings which are fixed by the other patches in the
series.

Note regarding the snps,dw-pcie compatibility. The Qualcomm PCIe
controller uses Synopsys PCIe IP core. However it is not just fused to
the address space. Accessing PCIe registers requires several clocks and
regulators to be powered up. Thus it can be assumed that the qcom,pcie
bindings are not fully compatible with the snps,dw-pcie schema.

Dmitry Baryshkov (6):
  dt-bindings: pci/qcom,pcie: convert to YAML
  dt-bindings: pci/qcom,pcie: add schema for sc7280 chipset
  dt-bindings: pci/qcom-pcie: specify reg-names explicitly
  dt-bindings: pci/qcom,pcie: stop using snps,dw-pcie fallback
  arm64: dts: qcom: stop using snps,dw-pcie falback
  arm: dts: qcom: stop using snps,dw-pcie falback

 .../devicetree/bindings/pci/qcom,pcie.txt     | 397 ----------
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 701 ++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   2 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 8 files changed, 712 insertions(+), 408 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.yaml

-- 
2.35.1

