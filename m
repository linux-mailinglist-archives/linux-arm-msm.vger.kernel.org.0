Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A0E39DB7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhFGLlA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhFGLk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:40:59 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD540C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 04:39:08 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id u7so8493693plq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z6Ewiz/FJiBEreBJpRrZidhXQHm4TISHkUY9VOlUYRc=;
        b=l49RTEObja/G+frH4vnsjVumtrn+XxXWJXi91FrnyeDTSy73kjtiat9p6kAxrZIeu+
         B+6CRo8GnJEFtFfifrYGaXqGApGhmlA+sWXl1YXWpk8z5EKeMjkSkfF4iBIL28E/wbYa
         XB/GkLtjMMynH7/q8drDo5lsO6PcTmWS47QwELTSmeAVccfKlp4/4bdGmtvICAnGn2Pd
         +k3Sen4Hrytnf03azFiHy5+6qyRacmeBiI5yda7TE3rTblg0xjPzfgn931D5EOEayoO8
         7YMGYlKnNxvAfPDXwqbpWHHPFTjwtxME7pjUi8VHz3YBRGZ4Apfotq15LgJFiAxBZd1s
         niMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z6Ewiz/FJiBEreBJpRrZidhXQHm4TISHkUY9VOlUYRc=;
        b=nDAikTEJ2Sd5Y4z0kyOsZUrRK70ZqcWSrT8IMQp7UUS97gb1EQnVB+Gw6QA5s8taPl
         l2DR+ha/U7xRHCMoPXLiMbfWBm0j0YTvWa5su1hLQpqaGzyNa2Txy2Yl536D6ZsPjjvB
         dEADUfdFeoZ9PWuBk9J9QxLdiNvFF4lWvfjFLa04jzn8heWL96RXrZdUTIkvMS5jQDOu
         hwn6lSwgeSkvnyHrXwIni7zAw1lNARsJGYa7JkNCBVwiCojT4ba8LqjGNGI8ledYGU1E
         Q+dBzAl/vEzJ/XgxIlSRm7GG2KMBDNf0XQ3SZHrCVssk6y4cPTop3NkN29WVi6TZ8JZX
         JMPA==
X-Gm-Message-State: AOAM530D6+9Dgm6G65m7t+ntaXs+Q4wlYeqmsvq31pD7ql//mBqmyxuY
        Ifqd4P6ZBVVHjD9owtQxyLDBKpSHaeCYGw==
X-Google-Smtp-Source: ABdhPJzUfAcjcqiD6DRmYHASLVohVLn7RbK703ta+Wr36NnZhdAUBzUcZ5DQEuns6LI9KVFJ3jHs0A==
X-Received: by 2002:a17:90b:882:: with SMTP id bj2mr19631112pjb.167.1623065948131;
        Mon, 07 Jun 2021 04:39:08 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.177.211])
        by smtp.gmail.com with ESMTPSA id j7sm7223939pjf.0.2021.06.07.04.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:39:07 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 0/8] arm64: dts: qcom: Add SA8155p-adp board DTS
Date:   Mon,  7 Jun 2021 17:08:32 +0530
Message-Id: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds DTS for SA8155p-adp board which is based on
Qualcomm snapdragon sm8150 SoC. 

This patchset also includes DTS for the two new PMICs PMM8155AU_1
and PMM8155AU_2 found on the adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: bhupesh.linux@gmail.com

Bhupesh Sharma (8):
  dt-bindings: qcom: rpmh-regulator: Add compatible for SA8155p-adp
    board pmics
  dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
  dt-bindings: arm: qcom: Add compatible for SA8155p-adp board
  regulator: qcom-rpmh: Add new regulator types found on SA8155p adp
    board
  pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for pmic-gpios on
    SA8155p-adp
  arm64: dts: qcom: pmm8155au_1: Add base dts file
  arm64: dts: qcom: pmm8155au_2: Add base dts file
  arm64: dts: qcom: sa8155p-adp: Add base dts file

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 .../bindings/pinctrl/qcom,pmic-gpio.txt       |   5 +
 .../regulator/qcom,rpmh-regulator.yaml        |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi     | 134 +++++++
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi     | 107 +++++
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts      | 375 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   4 +
 drivers/regulator/qcom-rpmh-regulator.c       |  72 ++++
 9 files changed, 708 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8155p-adp.dts

-- 
2.31.1

