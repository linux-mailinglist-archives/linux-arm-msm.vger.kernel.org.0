Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218F5670CAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjAQXHu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjAQXHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:07:12 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEF553F86
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:41:57 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id e3so22945447wru.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUqDldFBsGR6KbhnRzegEmDQZV+g6bdLTxhuChW3+yA=;
        b=mAZZfV7P+Q90do3euBBjMfHjd9Z28dfSDEXugPemuVlQtAm0EltZXIOFGtPgOvljTk
         VUTXklPR2yRTVfPXohWZudFj3ps0ZXPYC1X0pEstWTU4QJef/qzSkuOY+iNDgZ6tRIQN
         82g+yPTAlai230VJclNcGibm3dHIIDAc0xDN/ntlrEIC9yirl0mftsRhImMQPMwmBsmN
         CQrrA74BVScQAuw5SOIqwE/6jqYwNae8L9RzDP9i3cQYKnZDXoM6xs5JpfA4BIJSUoRY
         50hrPyxI/ZHTMeuOM94MzHUcTXzSSyFuNJTELJ+D5Qmg05DcY4ty00lGounB/LZIwIZK
         S1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUqDldFBsGR6KbhnRzegEmDQZV+g6bdLTxhuChW3+yA=;
        b=ymrrACtlFHvGy2dSJ75rOaP46uSNyLaCOj3LOTxZIrRLGWjeBUgPlQdFEW8FKzmWSC
         MJRBxY0Lb+FGxojPnJssQB/ymZMX/gAd12PFspczOvTjxHE/w7EUmZ6xPPDUjdmSfdGo
         KNHjYg8PvYIHcVeNZMVwsuGAcDd9OBJJyRBOa5MWofQO5S6dFO++lmDBnT7vHkeXzcNu
         Eguzu4NBdQxVbR5859cmULzVnpNvWOrrr9vMXQsn5HjZ2PFB5lTT0n+zhW7aFx77lnDP
         i6E+Z3Ba75DzMJCxvIUeBm3h1tGZDbxyygz5PbLDoACU7UQ9yPZFVasBFDCobDortTYx
         GBdw==
X-Gm-Message-State: AFqh2kriRFNBPU+/+hk/Ju5oPGFyW4pgxvB2vkL+oHvku6+wEcsp/iPr
        z5ZzFgqlGFU3OTPXpQjHM1i6XdwlhFwOa/og
X-Google-Smtp-Source: AMrXdXvM3tw3J7ANIPzNfGtPJCABq67WAU2OzSlerJZLOzHR9rP6cwmASEJFfLAXYeoiS5A5qnrcjw==
X-Received: by 2002:adf:de10:0:b0:2bc:8555:5d19 with SMTP id b16-20020adfde10000000b002bc85555d19mr4546046wrm.12.1673995314211;
        Tue, 17 Jan 2023 14:41:54 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm27024916wrv.113.2023.01.17.14.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:41:53 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v5 0/6] phy: qualcomm: Add UFS support for SM8550
Date:   Wed, 18 Jan 2023 00:41:42 +0200
Message-Id: <20230117224148.1914627-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The v4 of this patchset is:
https://lore.kernel.org/all/20230117142015.509675-1-abel.vesa@linaro.org/

Changes since v4:
 * Renamed QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE[24] to
   QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE[24] in patch #4
 * Added Dmitry's R-b tag to patches 2, 3, 5 and 6

Abel Vesa (6):
  dt-bindings: phy: Add QMP UFS PHY comptible for SM8550
  phy: qcom-qmp: qserdes-com: Add v6 register offsets
  phy: qcom-qmp: qserdes-txrx: Add v6 register offsets
  phy: qcom-qmp: qserdes-txrx-ufs: Add v6 register offsets
  phy: qcom-qmp: pcs-ufs: Add v6 register offsets
  phy: qcom-qmp-ufs: Add SM8550 support

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  1 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h    | 31 ++++++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v6.h    | 82 +++++++++++++++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v6.h        | 30 ++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   | 77 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 99 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  3 +
 7 files changed, 323 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h

-- 
2.34.1

