Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE30368F79A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 20:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjBHTCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 14:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjBHTCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 14:02:07 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821BD4DBF4
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 11:02:05 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso2189788wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3A5KG8ddYt3K2NbI6U6lMWAvkEN/aV9gsP0XbAJMpVo=;
        b=KQ/Y2/c3NdJg1E0/3saDg4EN8eLMH/ZHol8lekGfsVkkz7gVSbqot26OEIaD88s6TM
         ZMtr3nipTC3n4XCDBlEeSHWXtBXFXrb/AIGJJrQWHZy4fQwoByMVNmlyduIZ7tbgftBU
         Gh6r0kqwYyNPgLYWijdBIcYitcCw9zxOIO5YauoaVkdR4mKIe0cJ7Xmqc3hzpR6unI4H
         bpz5o4p+3kZBZY9n9u01jb9DsU9mOBmyUc9QPLeHxsXMU7SrQSvPSotw2WXW3eV7rRCC
         lN+4ZWQ/ukr3n46SblitVuvkJAOTlKjHmveC/lZdUtB+pr+e+0DQFs+L45dMk1ES8j+1
         cfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3A5KG8ddYt3K2NbI6U6lMWAvkEN/aV9gsP0XbAJMpVo=;
        b=mLH6Rz+CxA52EZnzWTLV9zrvc1y8LjbD9Etdm6edAfhLk+aVMun9fSz6OfYDg8wdIN
         7iKGfACpZNyFn2VSBjMRcP6g5bfZm+0Qb9d66tI/jgq4btPHaGmsavlLsX600eaoR9k/
         wXOXTeDbPNpGZ2kn/2+nOJLflqDMa1skIMgBs+Hj/9z43KWA7YfMXK+LE2FGxDNwz1EQ
         zTpboCZ0Eq37BGp1gt69iFjraRjNpjs7bdb1FSW+o1Cwqw1b79fs/PijyqEq30F4+jWI
         JF4OkgPWR+m+5ucs7SaZR4gRmQeamD7YxNWbfDll3nG/DrnVmJOa+IE8BAs8kES92Xy2
         v/sg==
X-Gm-Message-State: AO0yUKWr2nH39aDVHvkvADK3S2YRr+U0fldvYWbtOggH95BqMHu7Zi90
        hSaFnl+ZzPhDvZhXNo/lfIB12Q==
X-Google-Smtp-Source: AK7set82THdX95O78KDVlFQudiHHASK8Ft9xkYyq9++/erK3Gg4+fmZQAhI3tGjKYsryDyYx4Z6lBw==
X-Received: by 2002:a05:600c:30d2:b0:3dc:4fd7:31f7 with SMTP id h18-20020a05600c30d200b003dc4fd731f7mr7142679wmn.41.1675882923974;
        Wed, 08 Feb 2023 11:02:03 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm2650327wmc.10.2023.02.08.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:02:03 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/7] sm8550: Add support for eUSB2 repeater
Date:   Wed,  8 Feb 2023 21:01:53 +0200
Message-Id: <20230208190200.2966723-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds support for the eUSB2 repeater found in pmic PM8550B,
used along with SM8550. Since there is no dedicated generic framework
for eUSB2 repeaters, the most appropriate subsystem to model it is the
generic phy. This patchset also adds support for such repeater to the
eUSB2 PHY found in SM8550. Basically, the eUSB2 PHY will have its own
"phy" which is actually a repeater.

This patchset is based on the following patchset:
https://lore.kernel.org/all/20230208183421.2874423-1-abel.vesa@linaro.org/

Changes since v4:
 * added Krzysztof's R-b tag got patch #1 and A-b tag to patch #3

Changes since v3:
 * This time is a normal patchset, rather than an RFC

Changes since v2:
 * moved the bindings qcom,spmi-pmic patch before the repeater schema
   patch in order to avoid the repeater schema validation failure due to
   phy pattern property not being found in qcom,spmi-pmic schema

Changes since v1:
 * the repeater driver is implemented now as a PHY rather than adding
   a new generic framework for USB repeaters

Abel Vesa (5):
  dt-bindings: phy: Add qcom,snps-eusb2-repeater schema file
  dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
  dt-bindings: phy: qcom,snps-eusb2-phy: Add phys property for the
    repeater
  phy: qcom: Add QCOM SNPS eUSB2 repeater driver
  arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node

Neil Armstrong (2):
  phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater
  arm64: dts: qcom: pm8550b: Add eUSB2 repeater node

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     |   5 +
 .../phy/qcom,snps-eusb2-repeater.yaml         |  52 ++++
 arch/arm64/boot/dts/qcom/pm8550b.dtsi         |   6 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |   7 +
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 259 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    |  19 +-
 9 files changed, 361 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c

-- 
2.34.1

