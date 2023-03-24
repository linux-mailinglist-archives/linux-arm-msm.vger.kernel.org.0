Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF906C87C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 22:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjCXVzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 17:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjCXVzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 17:55:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC42CC04
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 14:55:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id q16so3936435lfe.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679694951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6r6YUtJaIvDW9dxujuzmYnOokbQTzuDSN123E5tnr4=;
        b=oEOS+ZAQa1GC4SxYIhpaEusTbfy5ZV6F3FCcs7hC2jJUGsQoVvkxcbJm0yXaliL3Tc
         wIF4AGLwd8WlFmPbbrU/AB3ZbiYV9kC4bb+EJZ5/TpKpd405zDxvbb3GFPcMLDlU7gUE
         kawDuc0LtIs7fXdZIBOxjZ2MZ24z/DZMNGjDtTOyQ4u3d1EPg4Scxb9doRyToSB81tAA
         AXFCqiIvY9f4Kd6XqdNL6HvRNHeFtUaa3LJN61dyet4zkVjfIIikZzj68CQPCn1TrhAs
         XzZ530n+wCWepmtHP/R3JPtm8B5+ywIfPIIF3inEqOZLyW90afRroeIVg54U4O83NuRK
         2hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679694951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6r6YUtJaIvDW9dxujuzmYnOokbQTzuDSN123E5tnr4=;
        b=gFfEQz2AXrDJ7hDlJXJQdcVum9u4dg9nEDBkHPl9o/L4aMfAYeVEqNM/7KU7pk1SIk
         XBy4XzPPzQOiSGL3VTggNqweDEsmentKBbd+zSNm3NpjX1yUj7pKh5Wjrof8GzsWP/yR
         2drYuWHyL5XopV+LHt/i5yc0fu0KTipUTKDnkDb4+whQuj1wRcpcQjhNTf3uIiqZy4bV
         pmHnPZYJ7Z6FUySQvklRxIEs/2vRXyYfY+BYdMxXoiFOLA7p6aKrw0gbhDYY8ZLpChLm
         +GNY0me5sqY6BJUR2GXm+qnh3a69IhzOcfJv9ICYWab2Z2B8gA7rLJbnGKanxGa5vPBJ
         uHrA==
X-Gm-Message-State: AAQBX9fKnEDXHmkKpBDTHyaPAf+ocnVXNlSi0v7VIGXesxwZHhzjdeqT
        f1u+ok8CD2EemzQRIERHNu7KgA==
X-Google-Smtp-Source: AKy350Zpnx42ljFHPDrMpwccNeOv58XHYr/SgImc0QJ9S3YRUx9t36guHM0o14ghTq+AMnTzK/Y51g==
X-Received: by 2002:ac2:428c:0:b0:4dd:a060:402d with SMTP id m12-20020ac2428c000000b004dda060402dmr1024035lfh.15.1679694951379;
        Fri, 24 Mar 2023 14:55:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y1-20020a197501000000b004dcf20843efsm3488285lfe.239.2023.03.24.14.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 14:55:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/5] phy: qcom-qmp-usb: split away legacy USB+DP code
Date:   Sat, 25 Mar 2023 00:55:45 +0300
Message-Id: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
2.30.2

