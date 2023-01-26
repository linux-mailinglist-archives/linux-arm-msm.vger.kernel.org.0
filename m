Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D61D67CD11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 14:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjAZN7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 08:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjAZN7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:59:34 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E609C6E43D
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:15 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id m14so1401790wrg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SXWg/UEnWdCis3IGlYYusZ1AbVRzZgkweMtomL0X34=;
        b=djedN6EI0YjG2TUzDdsbG62EW7QU8HA1GXxJCVD2bFVwf79BU0bI+CjPIJelY+ZgBX
         mQvhucJ8F2KjnYlgjQyAWgGCAVHVAqaa0gGmih50MbDzafLSctkCQ8UEJZ2VIJkNqgfj
         0iZ9OcO3G0DyH3NYtejsq0C06AXaLLEiqeAAH5Guf6i6PSnIRpLMudY5LTFgvRJk31vL
         L5nVCoFdnVtK4VNeVwlj7IjbJDNLHONboUWP9DfollQCDi/yun+FQhNEk3sfGl1pYl3c
         XnIP+iaR0ND2e7ua5GAnYn0Dnaw51zWISiP26CAUBRChaRvn/pzJO3O3Anyz3fTh3iPH
         gvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SXWg/UEnWdCis3IGlYYusZ1AbVRzZgkweMtomL0X34=;
        b=TWLA6oGNAg9dSZ3NZEMdVpY3bvEoNmqt/xYWfObcOk6bpejQCktCbnA9yNy5S96aTP
         oaqDvo0UnHikK7CiTpa3llnW5c+8MQiNeBLSbJOrtbq1GgTiY2SMUJi/bELISe+J6pEn
         k8E5Ptv8QzhrpfxfM816pjigfijwL+xEc2HBrroD2TEfAuJLeo1QRiWMSqElt10ygxKS
         1ygV0XL7PT0Ukhs5QgdKiSVW+4YyA7v5a6d04geCOY0W0F0HteyoabCju9oaJcSS6dfh
         sZVU6IYpilvgG1hf7U2fGJBER+47SUTBo535tnYKdhZBuXrJPvpPSFcoKHB9uW3l3EVh
         KgGg==
X-Gm-Message-State: AFqh2krKXQ+fWmp6XNBWcqp5DHGACm0lyOZ5VpDaj8pV+IMK36+qUXay
        hiqM6+CvGPKcbgKRDXG+0yBCzA==
X-Google-Smtp-Source: AMrXdXuR3Tyu/FQyhnmqD9G+QvNGcy6jxD2Hq3AI+tj8JQjhgMZA/Lj8JaQs0NUZIbv9iDi0l9zQwg==
X-Received: by 2002:a05:6000:24e:b0:2be:4639:ee26 with SMTP id m14-20020a056000024e00b002be4639ee26mr20771100wrz.0.1674741554063;
        Thu, 26 Jan 2023 05:59:14 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm1594067wrs.31.2023.01.26.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:59:13 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v2 0/7] sm8550: Add support for eUSB2 repeater
Date:   Thu, 26 Jan 2023 15:59:02 +0200
Message-Id: <20230126135909.1624890-1-abel.vesa@linaro.org>
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

This patchset adds support for the eUSB2 repeater found in pmic PM8550B,
used along with SM8550. Since there is no dedicated generic framework
for eUSB2 repeaters, the most appropriate subsystem to model it is the
generic phy. This patchset also adds support for such repeater to the
eUSB2 PHY found in SM8550. Basically, the eUSB2 PHY will have its own
"phy" which is actually a repeater.

This patchset is based on the following patchset:
https://lore.kernel.org/all/?q=20230126131415.1453741-1-abel.vesa%40linaro.org

Changes since v1:
 * the repeater driver is implemented now as a PHY rather than adding
   a new generic framework for USB repeaters

Abel Vesa (5):
  dt-bindings: phy: Add qcom,snps-eusb2-repeater schema file
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add phy related properties
  dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
  phy: qcom: Add QCOM SNPS eUSB2 repeater driver
  arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node

Neil Armstrong (2):
  phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater
  arm64: dts: qcom: pm8550b: Add eUSB2 repeater node

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     |   9 +
 .../phy/qcom,snps-eusb2-repeater.yaml         |  48 +++
 arch/arm64/boot/dts/qcom/pm8550b.dtsi         |   6 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |   8 +
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 278 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    |  17 +-
 9 files changed, 379 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c

-- 
2.34.1

