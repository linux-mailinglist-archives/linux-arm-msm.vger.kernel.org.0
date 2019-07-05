Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D1D60378
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 11:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfGEJ57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 05:57:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44978 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728167AbfGEJ5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 05:57:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so5925635lfm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2019 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfb8N34fRP1vMCo/Q4EmvhjgMM4QUZHFL/DkTTJzvfw=;
        b=iV/bDXXGIF2SCjKP+mvbagzIEpJnRgeHAciZAGW4BAO+x7mUbVcnb6ujCII0qEIvag
         B+9nuDksqPI0mCEFf75sXKlOCwbGaD06VAJKLym1HR6+vEmcMdSgMufD1qQ/UigCRXAc
         ptdXpUj40ht00oZMamy9VwDHzoqUG68PoDxL4ROV3wu5aCujWyY/WunfDhJQCaz9ynJl
         N/1kQdYUCXSx9Fm84Zt8RYZkiAtS9DpsG2O3kzNO9PkNVw3QFS+N6aIUajmN8tWvEanV
         HZ6NUpwwyn1yxwN8ZDmnb1hLDsHVF3pcTl+e2zwIfycP/z9LpD7+CsDS58kkqjo2//QY
         wm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfb8N34fRP1vMCo/Q4EmvhjgMM4QUZHFL/DkTTJzvfw=;
        b=X14wXLmQGU1WYHidPSr3ANA7fXkegrGtRZ3JRUYLqEMUuMCck59vN2sATGbJwxZmM3
         t3tyf0pUb+BrNkPHWAbPKTa7ZA48zq0yJoJrGUi7iPm5hfn3XspYMwTa+o2FkjvwzARb
         WYMT2Uc8E/0XByfJuncMk2iuygOmkgfrp5OeYUqKqlBWOrCWxtmbJj1DM/fw/8nLus31
         Syn35cHar6Bb4Py3RuI6Yhx3E65YaC0/i/tWNwzqa2InCIyPj7qQXArVhNUHglEoEcfw
         yQNrXxFdeiSHIBcvMHnP4zyswCsEV4ot3stLbVp8834jsTWeiWjFRfeQcxIM94rQKSIu
         KBag==
X-Gm-Message-State: APjAAAXNfLPVeKzxKDUq7hwb2ndhAC6T1fHwIEDEuuuVMlfRf9oa8huO
        JpmV/wQbBZbCmUguF7xMGm+xcQ==
X-Google-Smtp-Source: APXvYqx9EhPfIFQ2thFYyWS7eAeKd9dHNJjeDKHsaKcMgIIIDNLz6k1LLpbOBztfQBHbBqX0PbK42g==
X-Received: by 2002:a19:9111:: with SMTP id t17mr1532125lfd.113.1562320664397;
        Fri, 05 Jul 2019 02:57:44 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-34-119.bbcust.telenor.se. [83.226.34.119])
        by smtp.gmail.com with ESMTPSA id q2sm1298364lfj.25.2019.07.05.02.57.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 02:57:43 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/13] Add support for QCOM Core Power Reduction
Date:   Fri,  5 Jul 2019 11:57:11 +0200
Message-Id: <20190705095726.21433-1-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for Core Power Reduction (CPR), a form of
Adaptive Voltage Scaling (AVS), found on certain Qualcomm SoCs.

This series is based on top of the qcs404 cpufreq patch series that
hasn't landed yet:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=137809

CPR is a technology that reduces core power on a CPU or on other device.
It reads voltage settings from efuses (that have been written in
production), it uses these voltage settings as initial values, for each
OPP.

After moving to a certain OPP, CPR monitors dynamic factors such as
temperature, etc. and adjusts the voltage for that frequency accordingly
to save power and meet silicon characteristic requirements.

This driver has been developed together with Jorge Ramirez-Ortiz, and
is based on an RFC by Stephen Boyd[1], which in turn is based on work
by others on codeaurora.org[2].

[1] https://lkml.org/lkml/2015/9/18/833
[2] https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/regulator/cpr-regulator.c?h=msm-3.10

Jorge Ramirez-Ortiz (1):
  cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist

Niklas Cassel (10):
  dt-bindings: cpufreq: qcom-nvmem: Make speedbin related properties
    optional
  cpufreq: qcom: Refactor the driver to make it easier to extend
  dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power
    domain
  cpufreq: qcom: Add support for qcs404 on nvmem driver
  dt-bindings: opp: Add qcom-opp bindings with properties needed for CPR
  dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
  power: avs: Add support for CPR (Core Power Reduction)
  arm64: dts: qcom: qcs404: Add CPR and populate OPP table
  arm64: defconfig: enable CONFIG_QCOM_CPR
  arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM

Sricharan R (2):
  dt-bindings: cpufreq: Re-organise kryo cpufreq to use it for other
    nvmem based qcom socs
  cpufreq: qcom: Re-organise kryo cpufreq to use it for other nvmem
    based qcom socs

 ...ryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} |  125 +-
 .../devicetree/bindings/opp/qcom-opp.txt      |   19 +
 .../bindings/power/avs/qcom,cpr.txt           |  193 ++
 MAINTAINERS                                   |   13 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  145 +-
 arch/arm64/configs/defconfig                  |    2 +
 drivers/cpufreq/Kconfig.arm                   |    4 +-
 drivers/cpufreq/Makefile                      |    2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |    1 +
 drivers/cpufreq/qcom-cpufreq-kryo.c           |  249 ---
 drivers/cpufreq/qcom-cpufreq-nvmem.c          |  351 ++++
 drivers/power/avs/Kconfig                     |   15 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/qcom-cpr.c                  | 1839 +++++++++++++++++
 14 files changed, 2692 insertions(+), 267 deletions(-)
 rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (87%)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
 delete mode 100644 drivers/cpufreq/qcom-cpufreq-kryo.c
 create mode 100644 drivers/cpufreq/qcom-cpufreq-nvmem.c
 create mode 100644 drivers/power/avs/qcom-cpr.c

-- 
2.21.0

