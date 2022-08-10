Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F1358E625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 06:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiHJEU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 00:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiHJEU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 00:20:26 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43424D836
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 21:20:25 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-f2a4c51c45so16456729fac.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Y2F/994jbOUuOzskqySafRo+v+bWjW7tzqSFDir2eDE=;
        b=HCasqI3zEFTqcRbSy6Z2RutepSY3bx3zTM8dWQxCLo3l2tiwXIaYKic/NhqolJKNn4
         u8wxFOidOhg/Z3GqXmgkmMUKGmccfDU6sqjfoWLdkPKyf0qWN4f4f3vtIQWZPU0kr8KH
         cYqGY05/46v9jZ55HLmPg/b7xUGb0yp7Fp1q1D/bMJKSGazAp9ZjOuJY8lajQaQfBPRR
         CSi6cPJB/v4tdeLsmGVme8pbI/8eweaYMMYFQsLaFLReCvO8ahczqIlacUyRSr/oOpZu
         vIYEbwfG5EPs+c4raVOlmMf1La+JhyYnRXC20rtQKsScOvZkL5KsAM4UafnBI2dkibnY
         N87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Y2F/994jbOUuOzskqySafRo+v+bWjW7tzqSFDir2eDE=;
        b=jdp5eCmSjvtVi+TkjgGPvfheT3BWg0OwUk3iXzdWA2p5RLCkqnOML/d0pGeFnFOEAJ
         7/83SaSiMYICa3VUyDGcL+2+OaFdljLqiv9CelE752TzF00FJYfbCGbZgvCVDUId1/DW
         6ygAypvROwCg11hvwiDEcDX26d95ykz4Haog6gIb4i8AH8e7jFI6Ool7cl8e5cFlpCv9
         rh9cZSpQDwRLaps/JnXU7OQHiywTlOvfsdG3chJrBF7uDGpuCv2AesVXKyxEMsZpXuVt
         EH7yO1+DKo25C75Q/sy/FJ9KnDwqpEcOu2H57YSvyuIDZ+s4wSMRJ0cJXVn+frDNeaXa
         +kYw==
X-Gm-Message-State: ACgBeo2Ht0esuE4dt7V3wDhIH582OP09BjGOUMjAshc9k4t0Wkx85afB
        UoNvnQzRMfq3LPieWjcssRfAGQ==
X-Google-Smtp-Source: AA6agR6xjgWLcH1EVQ8VHgzX3ntP5Y/nOcHPPxxv1R7K/CLkFS94I1b+s/jIwsyV52qSYg3hdn2hqA==
X-Received: by 2002:a05:6870:c8a9:b0:f2:87f0:6707 with SMTP id er41-20020a056870c8a900b000f287f06707mr672930oab.97.1660105225236;
        Tue, 09 Aug 2022 21:20:25 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id ba41-20020a056870c5a900b00101c76f7831sm3622747oab.24.2022.08.09.21.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 21:20:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] phy: qcom-qmp: Add SC8280XP USB PHYs
Date:   Tue,  9 Aug 2022 21:22:59 -0700
Message-Id: <20220810042303.3583194-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce UNI and combo USB PHYs for the Qualcomm SC8280XP platform.

Changes since v1:
- Replace direct import of downstream register definitions

Bjorn Andersson (4):
  dt-bindings: phy: qcom,qmp: Add compatible for SC8280XP USB phys
  phy: qcom-qmp-combo: Parameterize swing and pre_emphasis tables
  phy: qcom-qmp: Add SC8280XP USB3 UNI phy
  phy: qcom-qmp-combo: Add sc8280xp USB/DP combo phys

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   2 +
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 429 ++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h    |  13 +
 .../phy-qcom-qmp-qserdes-txrx-v5_5nm.h        | 333 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 137 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   1 +
 7 files changed, 880 insertions(+), 36 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_5nm.h

-- 
2.35.1

