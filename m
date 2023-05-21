Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3797070AFF5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjEUTgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjEUTgj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:36:39 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DC3CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:38 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af2602848aso29792531fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684697797; x=1687289797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfUuosppnnvPXefcrMwxVhtyjnjhrdnm5TpWO7x6umY=;
        b=vpiYXod8/V5Hwcj3BxAOd25fwGE+3nWqC5GIsuc7Ussrou98XYljupR/6n09sR1JSM
         WIqrJhTaaBLnb/AkEIvg+dmClqH1BYpjg7zekBa4Uz4vRT4SVkdYiEPfDxBBESzRRAZE
         SbsRjaXqBcP3Fm9pkCrqGu61LcTBZXYlQ9NyXhpxg2QPcuHg+AImP+TLtNqwNaa301od
         AyNIeODs12iY/xtcGT+9xz09wI8Dd6JtuWxg0sppCkfml/8vM9fYdu60V0U43ZcHZotj
         trV8SNu6hx8yQJCZPKTjKZCXoeQXQZPtG4w9no0sYIlCbx9g8vaB2UwfVgzV2DbbTme2
         dOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684697797; x=1687289797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfUuosppnnvPXefcrMwxVhtyjnjhrdnm5TpWO7x6umY=;
        b=YhCuGztJa9R3FHJhkrPI0m/fEdAyTYTOkqbHnFe9KcG7XTPqSDROulY4aYwtmU1IbP
         ZI6imCXD+SM9FhFPX8+6dOVSGwkk1GJkt5Rx7eNZMtUz+Ba14Zi8wu01magZg8mxGs4W
         2p+vqEA6JtXp/IOM3spwT0IhEBIe7HjaDeGg1dZcmv3j9ngzXwndY/mnlxW+4gcWt7GP
         2xemMW4Xz11UVeGJnOp2NdTV8a9wCMobNfWFQ8qvDGq3nOKzp4U2QEzmpVKbUPYfrWiO
         y5zTuCpPj+fIQT5wmuhhBOTFaIquBWbvuh7qgDSG0jKpNPBLBwsjarikKPX2NxgvptNJ
         +paw==
X-Gm-Message-State: AC+VfDzNOKpM5JL1tTv5qjT/VlrvaCgWzhbYxy+K1ffDzPRTp+bVRDpj
        O0caa1O4h3YQrQ30UEs/FB6zkw==
X-Google-Smtp-Source: ACHHUZ6joq/6rzGJow4uSwYkk50ZsOxo6hW+qJ120q/HX3uTpokDTKZqSMVM29lwBAjAh112qKviSQ==
X-Received: by 2002:a2e:8945:0:b0:2af:c2b:40c1 with SMTP id b5-20020a2e8945000000b002af0c2b40c1mr3273238ljk.3.1684697796827;
        Sun, 21 May 2023 12:36:36 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm830009ljj.7.2023.05.21.12.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:36:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 0/5] phy: qcom-qmp-usb: split away legacy USB+DP code
Date:   Sun, 21 May 2023 22:36:30 +0300
Message-Id: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

While working on the QMP binding cleanup, I noticed that USB QMP driver
supports both simple USB PHYs (which should be updated) and USB-only
part of USB+DP PHYs (which are largely legacy and don't need to be
updated). To ease further cleanup perform a quick cleanup of the last
remaining USB+DP PHY (on sm8150 platform) and split the legacy codepath
from the USB QMP PHY driver.

Dmitry Baryshkov (5):
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: add sm8150 USB+DP PHY
  phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
  arm64: dts: qcom: sm8150: turn first USB PHY into USB+DP PHY
  dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop legacy bindings
  phy: qcom-qmp-usb: split off the legacy USB+dp_com support

 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        |   80 -
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |    2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   17 +-
 drivers/phy/qualcomm/Kconfig                  |   10 +
 drivers/phy/qualcomm/Makefile                 |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |    4 +
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 1407 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  556 -------
 8 files changed, 1437 insertions(+), 640 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c

-- 
2.39.2

