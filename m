Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3F635AAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236601AbiKWKyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbiKWKyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:54:10 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1017C469
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:17 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z4so4006133ljq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YF9nXGIHmq/lAYQEKmHO/iVT/Vstl98BtvDe9TMyGGQ=;
        b=gVAdc5EGfSByHOB4D30oEvuiho+nMw72g5qPkyNizyB5g0DtLhDz+1MfuRHtUfw6F7
         u+mdvDE4mZTpmOR3a559CjyfsxI/fO390T3UbKgnKRBjaTTsJkOgWZr5hij04dYuJoMC
         3QYBFUA6cBhZfdxqQ1qudbiFhEOJXOSctNcKobjH6nXRZwO7IZ2lekwG0WL/JkfnIFAk
         CKXkqzE9ZaSJb6vSifbM7eOAv5oE+QeXwr2jSjwjh9AN3vo3bl9r/QXR5ytyVJWpzpCx
         sjn672XS4099JhfMQD1wDFnxlZ9dSXicoJvv662eImXnGSp9rd19RrP+RUbKVyPLA4Fn
         NMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF9nXGIHmq/lAYQEKmHO/iVT/Vstl98BtvDe9TMyGGQ=;
        b=ThyF1xqSIhNVGGQD/hoE/ICTSMXhDIoz3T4rBa74SdHQtBXgRooUxoMIc9DlQRBkaT
         cDdY3ZNU39zGz/IoTUtr+KwbcN2UVlGsySSzZ4NJopTAYqdmlLYlCg0cQ5L/77znDeu7
         ZgrJ7cQjbHcGcCXVZDxKgNO0Ntv3hp/iGRlJKg10LVVeMNAQv/VLJjVbyr9Q1lET6Ju9
         MvfUa5ZnvkaK0weeUiEKZcLA/YnXWYESY3v8zfV/F0hZrYIhD9b1Yf/xHF1QUGIlOPq9
         QiEKRXuNNJpGmlb1+YyQIUjzxfQoFtyktvJKgznzEnOUWNIM6o+IR8OQIpypPkq/lJxM
         0/qw==
X-Gm-Message-State: ANoB5pnxwX+GQWvBKfygQSt6cYehMN82ql3svVNuo6MCHNbPJpOFbWUP
        zUFwmoA9gu1YwaEyAqAXxGABK/xKooEq+Q==
X-Google-Smtp-Source: AA0mqf52T8CV2bruamVh89OGSC8zH2FkHaYTMJXoCPcXlDKLoMjF4ZyxrojGkAJ5CO1NCHu54lUo/A==
X-Received: by 2002:a2e:b631:0:b0:277:890a:f1cc with SMTP id s17-20020a2eb631000000b00277890af1ccmr8851591ljn.395.1669200136132;
        Wed, 23 Nov 2022 02:42:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id n5-20020a05651203e500b00498f570aef2sm2862908lfq.209.2022.11.23.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:42:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 0/4] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Wed, 23 Nov 2022 12:42:11 +0200
Message-Id: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
be used as GCC clock parents).

Changes since v7:
- Rebased on top of phy/next
- Renamed the clock registration function (Johan)
- Dropped rogue qcom_qmp_ufs_ops (Johan)
- Fixed the comment following Johan's suggestion.

Changes since v6:
- Added bindings change (Johan, thanks for the reminder)
- Added corresponding dts changes for msm8996 and sm8350/sm8450.

Changes since v5:
- Rebased on top of phy/next

Changes since v4:
- Rebased, dropping merged clk patches
- Fixed whitespace errors
- Added linebreaks to fit into 100 chars limit

Changes since v3:
- Rewrote asm9260 clk driver to fix the TODO item by using parent index
  rather than calling of_clk_get_parent_name().

Changes since v2:
- Added error handling to phy_symbols_clk_register() (requested by
  Johan).

Changes since v1:
- Added a macro used by clk-asm9260, so that the clk-fixed-rate changes
  do not affect the driver
- Changed registered clock names to be unique (as e.g. SC8280XP will
  have two UFS PHYs).


Dmitry Baryshkov (2):
  dt-bindings: phy: qcom,*-qmp-ufs-phy: add clock-cells property
  phy: qcom-qmp-ufs: provide symbol clocks

Yoshihiro Shimoda (2):
  dt-bindings: phy: renesas: Document Renesas Ethernet SERDES
  phy: renesas: Add Renesas Ethernet SERDES driver for R-Car S4-8

 .../phy/qcom,msm8996-qmp-ufs-phy.yaml         |   3 +
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   3 +
 .../phy/renesas,r8a779f0-ether-serdes.yaml    |  54 +++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  64 +++
 drivers/phy/renesas/Kconfig                   |   8 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/r8a779f0-ether-serdes.c   | 417 ++++++++++++++++++
 7 files changed, 550 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
 create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c

-- 
2.35.1

