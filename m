Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD8554137
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 06:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347993AbiFVEKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 00:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbiFVEKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 00:10:20 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA11C33E17
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 21:10:19 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-101ec2d6087so10538974fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ERBTNZYy1BbiXil4wGReIFa0+xbTgQOOsoni8m4d7Fw=;
        b=shUkpP14ikfFApr9WxUYDRTChvkIC0FcV9ueZifLsuD0p/cRNMm/yXB0720i7HOSNM
         lwiHNuFW0lB59tNo/rMY0MHlTONkuxb9r6m01OqfUNSRkGPPQBR9ceUKnwfCy2WYNBxj
         Z+fAAusZZ1rGD3ilWs/Uq8+B5X/LArNd8Dc5MI5FYIUdvFlxI7fucPjgRHixd91IE+5l
         7oK5bSKZD7Eg7U4rsjQQKXGQR4DAdlO0jjSu3HN0XWfxnDWpwbki6JaQ2KWD9Ix/iu6P
         p6Neg8ng8f7mVVHOYyJ9TVOMj/9b3+Z+338TMav6G5J/iggwkfDFr3zFcPN21ZIeH0xS
         +W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ERBTNZYy1BbiXil4wGReIFa0+xbTgQOOsoni8m4d7Fw=;
        b=EICXRhjwbL4Gt8WCP4igLKlO6Q5VvShpMxXep6qz9MMFP31ekZ818s+luijeZxxcY8
         HGx8MJ842bcQ8r3FLRhQKT61n+QF8wANFvKwQp5s+SUtZtUOn2/PBtJe4XkEzQDBmBYO
         yYLTI5qpWOj6No/6AzIgYO5yIeah5LsgYh8eBKFfQUusPJ1Lp09rQA3S2EhAZCwPtb1h
         wECTJGDB5ZP5skJF0E6phBBqcaEdLIHTWna394369hG4jT1s/RfviCjUA9c5paCxcdQB
         dBIUGHxEiNXnfvnvHHEedy/a+2NFBvnG9m+X1arX5NamC/FA0qMAM8obWr/JC5jx12kh
         Kdlg==
X-Gm-Message-State: AJIora8VVNe4o2v9Usmzepo9LJQxNT52GcWRl3Vy7AW4FVedocpbhz77
        cgUR7u1NCbQRs4xDLMaUfmEnfg==
X-Google-Smtp-Source: AGRyM1tCEhiBmkSz67O/uKdSovXj0R2rIc/1Cn7fzuFBthSOF1Bi1+TeLO/cmoxiq4GbzTpA1ZSGuA==
X-Received: by 2002:a05:6870:58a6:b0:101:af0a:2858 with SMTP id be38-20020a05687058a600b00101af0a2858mr951556oab.61.1655871019058;
        Tue, 21 Jun 2022 21:10:19 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b7-20020a056870918700b000f2455e26acsm2314718oaf.48.2022.06.21.21.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:10:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: dts: qcom: Introduce SC8280XP
Date:   Tue, 21 Jun 2022 21:12:18 -0700
Message-Id: <20220622041224.627803-1-bjorn.andersson@linaro.org>
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

This series introduces the Qualcomm 8cx Gen 3 platform, with basic support for
the CRD reference device, the Lenovo Thinkpad X13s and the SA8295P automotive
development platform.

Bjorn Andersson (5):
  dt-bindings: arm: qcom: Document additional sc8280xp devices
  dt-bindings: mailbox: qcom-ipcc: Add NSP1 client
  arm64: dts: qcom: add SC8280XP platform
  arm64: dts: qcom: sc8280xp: Add reference device
  arm64: dts: qcom: add SA8540P and ADP

Johan Hovold (1):
  arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree

 .../devicetree/bindings/arm/qcom.yaml         |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    3 +
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts      |  427 ++++
 arch/arm64/boot/dts/qcom/sa8540p.dtsi         |  133 +
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  432 ++++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  393 +++
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi  |  108 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 2145 +++++++++++++++++
 include/dt-bindings/mailbox/qcom-ipcc.h       |    1 +
 9 files changed, 3644 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8295p-adp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8540p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp.dtsi

-- 
2.35.1

