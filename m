Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE05333853D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhCLF2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:34586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhCLF1r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:27:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7112A64F84;
        Fri, 12 Mar 2021 05:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526867;
        bh=/77vYUZ7UpTZLZ/EC5B9NNsAAOngBKOHsaK4ikMjpIo=;
        h=From:To:Cc:Subject:Date:From;
        b=p30EEwoKXEqajPzSimL3b8YyczWtyIV5Q8/DZ0h0oz00qETqHq91sacY9iJUTJyOH
         CDPbLPJ0xdIqCHio7OJxRm/MHbS5tMMG3fqbTdSz+sM8D03chNKmgGMj10t0l18S0F
         ZyxrKbaqhcUvvsYqf4HCXabgApb1fiQMgcMUlfF/uCb9Zl6Z3X3yQdyjhE8QiZyEkO
         2YCvgEJUpzmTz6oGlkLvIti5g4r43N9Hsf7fHXeeV0gekKTuFYfHsnnFYAa/12byxb
         RyXd0Fv+cxPWold83BgZppD/cODxofnWvwbNxD2LAjKzuwbjtJ7/6/nY0Yw59kEADt
         tfccwLGqOgC/Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] arm64: dts: qcom: sm8350: Add PMICs
Date:   Fri, 12 Mar 2021 10:57:29 +0530
Message-Id: <20210312052737.3558801-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the SPMI nodes for SM8350 followed by PMIC base file containing
the GPIO nodes for these pmics (pmic compatibles have been picked by LinusW)

SM8350-MTP includes PM8350, PM8350B, PM8350C, PMK8350, PMR735A AND PMR735B
pmics.

Vinod Koul (8):
  arm64: dts: qcom: sm8350: Add spmi node
  arm64: dts: qcom: pmk8350: Add base dts file
  arm64: dts: qcom: pm8350: Add base dts file
  arm64: dts: qcom: pm8350b: Add base dts file
  arm64: dts: qcom: pm8350c: Add base dts file
  arm64: dts: qcom: pmr735a: Add base dts file
  arm64: dts: qcom: pmr735b: Add base dts file
  arm64: dts: qcom: sm8350-mtp: Add PMICs

 arch/arm64/boot/dts/qcom/pm8350.dtsi    | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8350b.dtsi   | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8350c.dtsi   | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmk8350.dtsi   | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmr735a.dtsi   | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmr735b.dtsi   | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts |  6 ++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 18 ++++++++++++++++++
 8 files changed, 174 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735b.dtsi

-- 
2.26.2

