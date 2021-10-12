Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E6D42AB07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhJLRpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbhJLRpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:45:15 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74B3C061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:43:12 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u69so335091oie.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oieb4OrqRN1dvVsQsrZ8bxCmGZsPPNS5A9M+zq6bmd4=;
        b=K5eo+RZXFaThvBbu7DX1pVieUg0Ax/2kCH4lBO8oCVsnT6wlWfzWhQ/VUqAdiT63LX
         8YgG3SnMuRQbyqmNpGn3CrsCXCEdzeRzgDx7lQyg0t1S7RQKnXvIRD6cy/NyLNNwlnwp
         Jney/AUPnZeOMGvFKmz717WFO+/qdoHBnaO8cSptQt/raO7M81Z0BYqQzhXp9Hp6nWoX
         v1y3ZHSV1PUF+lCPH4gd3RyHiCRW9rRzLulPlhLPZ/LvaijClq7iho/36MAneaPU9fSR
         3Ho+ImD4dXeNx792rH2HKgQzW34q+YM4idwmZGGG1RUgALwSsdqBwQdu0WK8NazHMLcZ
         0B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oieb4OrqRN1dvVsQsrZ8bxCmGZsPPNS5A9M+zq6bmd4=;
        b=ndoxpK9s0EIXyBCKyc5W0vIqg4tbqOlT1zgEo9RlezJY8kTDyNHfngSgafKajWE43Q
         MfTonN7NMR3DXjcxLaPjb3ZVr1alZD5Y4DUhfArcjEsGDk+TGtOdCn6ogY6Slw9NNJRr
         cTKyTqs4mCYS8IoaeyytZ8Cz638p2h10UPPCAxnYyjIZdVBvV8FxLV9Q7i91wryKtj27
         xSwVjCbzxgl+yYjCsxDVZqY2FS2BhzmsZEilF4DnQS6hZzrzP99htcL28YIKuhu1vTqi
         P4FwTQAj79O+fQZug1Q3gDc7tC5a+aked5pBLnBViHCQaTawxtoAjJRfm3s10unTgH2R
         c6HA==
X-Gm-Message-State: AOAM5319yiGyxwkpnFwkB/GrqfbGf8RqDHEcPc0n+Vfva2lqGLYjyrN2
        C6QGvXiV4lO+jAQhALyWxchDFw==
X-Google-Smtp-Source: ABdhPJwbRYpYCOiC7RrwkZEX7PfVxFvC0rnVgXF0S2YNuSJBtPh+qxPMIrAWKmlSOcroSMAjPb0SMg==
X-Received: by 2002:a54:4807:: with SMTP id j7mr4571885oij.140.1634060592214;
        Tue, 12 Oct 2021 10:43:12 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s20sm65487oiw.44.2021.10.12.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:43:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        David Heidelberg <david@ixit.cz>, Luca Weiss <luca@z3ntu.xyz>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: [GIT PULL] Qualcomm DTS updates for v5.16
Date:   Tue, 12 Oct 2021 12:43:10 -0500
Message-Id: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.16

for you to fetch changes up to 9304af37d07b63244e4b3c80e5a245c978beb015:

  dt-bindings: arm: qcom, add missing devices (2021-09-19 23:33:06 -0500)

----------------------------------------------------------------
Qualcomm DTS updates for v5.16

This extends the previous limited description of MSM8226 with SDHC,
UART, I2C, SCM, SMEM, RPM and basic PMIC definitions. Based on this,
initial support for the LG G Watch R smartwatch is introduced.

APQ8064 gets a couple of DT updates, one which will allow the GPU driver
to drop supporting legacy "opp tables" in the future.

DT bindings and DTS files are updated with additional compatibles, for
completeness.

----------------------------------------------------------------
David Heidelberg (4):
      ARM: dts: qcom: apq8064: Convert adreno from legacy gpu-pwrlevels to opp-v2
      ARM: dts: qcom: apq8064: adjust memory node according to specs
      ARM: dts: qcom: fill secondary compatible for multiple boards
      dt-bindings: arm: qcom, add missing devices

Luca Weiss (4):
      ARM: dts: qcom: msm8226: Add more SoC bits
      ARM: dts: qcom: Add pm8226 PMIC
      dt-bindings: arm: qcom: Document APQ8026 SoC binding
      ARM: dts: qcom: Add support for LG G Watch R

Marijn Suijten (1):
      ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY

Vamsi krishna Lanka (1):
      dt-bindings: arm: qcom: Document SDX65 platform and boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  16 ++
 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts    | 237 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi             |  18 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts        |   2 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi             | 263 +++++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi             |   4 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi              |  27 +++
 12 files changed, 554 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
 create mode 100644 arch/arm/boot/dts/qcom-pm8226.dtsi
