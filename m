Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BC84261B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbhJHB1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234356AbhJHB1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD70C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id n8so30598302lfk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tslhCmU5HkrqNcODnf9yBvexV8zyi6aRcSvkyUK+Lxo=;
        b=tdWoxHQ9qTDGe2B8XEe8CfwnR2uhyJ4HUouX9vc5O51Yf0CU3BKPwrFuDI/D9+/gBf
         XworeWC2T+VzDWcYSF/r2DE2/7EQYCY/q+csOzHMxAn4M+QQlZpXODpoKx3M0IwoNxL+
         YC+LR3RulR6yPuNEgqiBqkHEi+xkZg2+vFQ4zl8Oxdpnnqzm6AJ63c0b6PXUh3WkTnf2
         tImnjuAZZcO5wf/yk+vpIAicW9ZPtJGg4HSTnn+H2AS7lCbngxPS2AxgV2aEdF5XtNel
         ZJvlTK5SxUi60q4hg5ZjFBTP3RmbaZ0GsvMS2rsmoNFkYTyX1npSbR3I0flAwVfFmjvm
         DfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tslhCmU5HkrqNcODnf9yBvexV8zyi6aRcSvkyUK+Lxo=;
        b=ejK8VZnZt49oj68XHbRw6PmHnxNkPmdjw4YG1eUVfhH98HA4gIwAh/KgsWyYXWz4m4
         bL+n3PWNM6vSe5jqfcKmZo9d6oLZAjiM7cMgC9MOR3qPl65ZbA9urxHxU85Rqq3i1Dwj
         kJAxJ08jMs3+7BNdBelu7agUTquJmooIW7I8yqK8g1WIlQtiqVpSY3JLeqSZVfN4k/lh
         NYxAeRA4WvPC4E8JuBBm0Ernbu41lOMmiid6EROtqWKzzbOhpYE46rItZTPq2TxLhBPK
         EiZSl/+x69MZbWeFQHhIKUkt3EZvufHp0MTNi3reujh/xwuo4qo4UDE/mSvJBK4h4IH6
         Cc9A==
X-Gm-Message-State: AOAM533LP3rv9741Oj2EqJpevHm1XRVRdoenDUdPcw9radMOaqzGM+pi
        9RmQbMmxoHilamEzKCRA73SvOg==
X-Google-Smtp-Source: ABdhPJypGsnIPcHP6hOej12p4onJM9bS3V4jWUI5ruP3IKui3Ic1uvDEzTG5YfmPZR/YEmNKlPJeOg==
X-Received: by 2002:a05:6512:3b08:: with SMTP id f8mr7556094lfv.88.1633656328244;
        Thu, 07 Oct 2021 18:25:28 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: 
Date:   Fri,  8 Oct 2021 04:24:59 +0300
Message-Id: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
to hierarchical IRQ helpers, however MPP drivers were not converted at
that moment. Complete this by converting MPP drivers.

Changes since v2:
 - Add patches fixing/updating mpps nodes in the existing device trees

Changes since v1:
 - Drop the interrupt-controller from initial schema conversion
 - Add gpio-line-names to the qcom,pmic-mpp schema and to the example

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git spmi-mpp

for you to fetch changes up to 9bccc31fc5cec98f26ca639a2ee21a9831efe1de:

  arm64: dts: qcom: pm8994: add interrupt controller properties (2021-10-08 04:19:33 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (25):
      dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
      dt-bindings: mfd: qcom-pm8xxx: add missing child nodes
      ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
      ARM: dts: qcom-msm8660: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8841: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8941: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pma8084: add gpio-ranges to mpps nodes
      ARM: dts: qcom-mdm9615: add gpio-ranges to mpps node, fix its name
      ARM: dts: qcom-apq8060-dragonboard: fix mpps state names
      arm64: dts: qcom: pm8916: fix mpps device tree node
      arm64: dts: qcom: pm8994: fix mpps device tree node
      arm64: dts: qcom: apq8016-sbc: fix mpps state names
      pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
      pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
      pinctrl: qcom: spmi-mpp: hardcode IRQ counts
      pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip
      dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells
      ARM: dts: qcom-apq8064: add interrupt controller properties
      ARM: dts: qcom-mdm9615: add interrupt controller properties
      ARM: dts: qcom-msm8660: add interrupt controller properties
      ARM: dts: qcom-pm8841: add interrupt controller properties
      ARM: dts: qcom-pm8941: add interrupt controller properties
      ARM: dts: qcom-pma8084: add interrupt controller properties
      arm64: dts: qcom: pm8916: add interrupt controller properties
      arm64: dts: qcom: pm8994: add interrupt controller properties

 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  12 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  | 187 --------------------
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml | 188 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |   4 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  23 +--
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |  12 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |  17 +-
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |   7 +-
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |  11 +-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |  11 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |   4 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   9 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |  13 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            | 111 ++++++++----
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            | 133 +++++++++++----
 15 files changed, 414 insertions(+), 328 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml


