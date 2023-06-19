Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3146B734FAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjFSJYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjFSJYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:24:16 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE984137
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:24:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f9b258f3d8so3894865e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166652; x=1689758652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQTveEsgflRe93KWoqKfVrG8nlhmeJM2igknKYDTnhc=;
        b=IZtOngQUj48lgG6+O3gJagYiNPDkkKMc7uI2DjMmiXkaARrGWmmQvNwSiNHfP3KdKp
         dozz3gHy+RHYrFV4qgVZ4vtDPnXGAc6pOR2sGowPourxz9omYODemTCa+hKq73BSuP2z
         /5ofFH/d5yWb38OupfrR1VIsUG6BQo/lqQ1xM5wyudFSS3eLfyNoPFf46zx2e1b+1EL1
         m+BqoUq0JHODu5HlzPhPNlzttRHatazImjhorjexyLFNbBl+zm1TGmtAOqGWl716j3p/
         v/JchKmSDWZdtsDfqTTEvnuUZ8VRMyQN/ge0sJShHNNYEs5HbTC5moAI3pTv7UFzbP3h
         f+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166652; x=1689758652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQTveEsgflRe93KWoqKfVrG8nlhmeJM2igknKYDTnhc=;
        b=dl9aLc+TDebns5YwgvIRL0FvC4QmwIzlwt1Q0BjPiC19in1dfLd4nC2YnoNdUv3AwE
         WvB5+eFV4QQSp0aTjNlbZxPqnin7b/H8lfq1hJFasx2aSQIRMWQz4tcxrwR7yHP0hf6c
         HNtyrrU4hwBf0Oc2XXg2KHhszwyiklnFCpp55+q4kxu9TqB8eIb5Mbufrk7350gEVYCa
         JqbuLeY04lHViZO4EMhuirGAFNGhk4riJK8Svw2V62r2G8K637uY4P2mSvyq62IWJviV
         4cx/u6TF7FryfMqdO94ReUgeZDtKaifszzYeTMTN0K5+z65kYjzmO1po+BLE7FDzyXL4
         CAUw==
X-Gm-Message-State: AC+VfDz630YQQcfcDHK3xZ4mcyy/WHAB5Ut+8lt/Zjp9fklOBaBZOHCd
        YYpsmRmHaWgDCrXUdA+rPnX1igpShxodLpdqquk=
X-Google-Smtp-Source: ACHHUZ5TX/nrqYHgNnCprkhTEFlW0oqAmEf9RibG7Vs2uuQjjjYsYzduC9TIQoszFHG3eJiYems05Q==
X-Received: by 2002:a05:600c:4f96:b0:3f7:f302:161 with SMTP id n22-20020a05600c4f9600b003f7f3020161mr13122941wmq.8.1687166651986;
        Mon, 19 Jun 2023 02:24:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:24:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH net-next v2 00/14] net: stmmac: dwmac-qcom-ethqos: add support for EMAC4
Date:   Mon, 19 Jun 2023 11:23:48 +0200
Message-Id: <20230619092402.195578-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the dwmac-qcom-ethqos driver to support EMAC4. While at it: rework the
code somewhat. The bindings have been reviewed by DT maintainers.

This is a sub-series of [1] with only the patches targetting the net subsystem
as they can go in independently.

[1] https://lore.kernel.org/lkml/20230617001644.4e093326@kernel.org/T/

Bartosz Golaszewski (14):
  net: stmmac: dwmac-qcom-ethqos: shrink clock code with devres
  net: stmmac: dwmac-qcom-ethqos: rename a label in probe()
  net: stmmac: dwmac-qcom-ethqos: tweak the order of local variables
  net: stmmac: dwmac-qcom-ethqos: use a helper variable for &pdev->dev
  net: stmmac: dwmac-qcom-ethqos: add missing include
  net: stmmac: dwmac-qcom-ethqos: add a newline between headers
  net: stmmac: dwmac-qcom-ethqos: remove stray space
  net: stmmac: dwmac-qcom-ethqos: add support for the optional serdes
    phy
  net: stmmac: dwmac-qcom-ethqos: add support for the phyaux clock
  net: stmmac: dwmac-qcom-ethqos: prepare the driver for more PHY modes
  net: stmmac: dwmac-qcom-ethqos: add support for SGMII
  net: stmmac: add new switch to struct plat_stmmacenet_data
  dt-bindings: net: qcom,ethqos: add description for sa8775p
  net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p
    platforms

 .../devicetree/bindings/net/qcom,ethqos.yaml  |  12 +-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 284 +++++++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
 include/linux/stmmac.h                        |   1 +
 5 files changed, 226 insertions(+), 76 deletions(-)

-- 
2.39.2

