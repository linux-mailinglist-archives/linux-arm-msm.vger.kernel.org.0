Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2455B38CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiIINUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIINUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:20:15 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0406852803
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:20:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id by6so1775536ljb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kgJjmgG2j9l0YQpQfT7K6JYUcHmLucXmfDAIxewDkEQ=;
        b=wLdx0WQVdKaFuiXotEDVrzACdRbkEtP9/VBIvllgGPpc+JEy5nKwDRtFOzYvIJ3wms
         5Tr5BtHE28y3onBYCiJpYJJe+y6eBOtV4ZHol9mH79XTg71QsWeI4swlLxSfXCkWssyo
         fFtEv8Z/BRY3oYmgriQnaTFtvHPsRvuYhCkV9KW6MSlwILz2AD1V095/wOx/B53qx5So
         AH4N7BmLonlgNRNJiS8pdRRg/xy989x5H9J0r0WEFUZ/cr8vYH5Z8H+Kj0zJEJLcz6sp
         TmHNzQB62cAI3gPs/L4JW4N2eW7uzPMysykpmjC6TRuX4TQxysXls2Na28aGT0rgE3gS
         MTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kgJjmgG2j9l0YQpQfT7K6JYUcHmLucXmfDAIxewDkEQ=;
        b=qRPWtmNvS7Dj+5ukO+T/HMH88DtEXLxKiODhPCiF1cwyaH356wyPoJS3uuvuLS/u+2
         UlMukZZbuVZ/Jr/dlAu4ryesgmW5NpVvYqIeMsJmqsR0TbXKpxSItKRmUiGCc+0J27Tg
         nS3REZ1GeN9xnJFP5ziM1KAZJByqdl49caVT31f7PY/hrLVr0EqUpoUsfiPEmh1baHEF
         hu+mXmyEpa5bKet8CEDaayHMClma2BHZm7h4lwh87RTkjR1CYWn3s3JZXk13uawwVmXY
         8C+91CbGC6nTG8nqgUihlAdZUzu4U5q92S4ijCLZ8fvljSNJIN0+57IMhqQWF7Qkogtb
         5mOw==
X-Gm-Message-State: ACgBeo1rESPuCnrHhorDDhVtcMRtFOuPhNipzRHjFYZDKHQaCxWqp9qa
        O+5wH78Q3VO5z3sEb/rOwnmePg==
X-Google-Smtp-Source: AA6agR7eLB8sTMVNhaJuhk7/vByF7NnH/TSWVo/5doL8NS2RA9cF1ZgL7lBuo49eromWnnKmZGz5iQ==
X-Received: by 2002:a2e:9604:0:b0:25e:4ed7:ef45 with SMTP id v4-20020a2e9604000000b0025e4ed7ef45mr3818736ljh.389.1662729611374;
        Fri, 09 Sep 2022 06:20:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00498ff4ae746sm71729lfr.294.2022.09.09.06.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:20:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 0/6] drm/msm/hdmi: update hdmi_pll_8960 driver
Date:   Fri,  9 Sep 2022 16:20:04 +0300
Message-Id: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
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

- Update hdmi_pll_8960 to use parent_data rather than parent_names,
- Make hdmi_pll_8960 the clock provider,
- Update the apq8064.dtsi to provide pxo clock and to link hdmi_phy as
  provider for MMCC's hdmipll.

Dmitry Baryshkov (6):
  dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
  dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
  drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
  drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
  ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
  ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock

 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 27 ++++++++++++++++---
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 21 +++++++++------
 3 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.35.1

