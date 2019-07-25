Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B05D74BE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387731AbfGYKl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:41:57 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42667 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387561AbfGYKl4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:41:56 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so47516846lje.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvWgj2tLfjTT6ys9Fl+A1tAK7bl+2z+EbE4rGBPrBvM=;
        b=dCQj9qKvNrgCsTaCAhdLP6um5sOud+ExpIRz6VRmcDO8V16e6auaDMKTZ2tCSiSptU
         9hBUSdQkixtvhgOIgl9IEpDmuClhbvCh4PDL0JLajsCs9NL14NYe1SXF2p8TaXcg6OIu
         yW+prw+GeE5FMOMXKxJjUuSsrwKg1U3s6jVFIBvnbvsCHAGkMhyCEIRnh0YZ+qqU73Gf
         BHdPlBnaCbiLNsoPTDb32ZD1aPrtUTyqcozAZVbmfj+A3ebZSf1f3bWZPYsm00z1adXz
         3URRMKTGWPlfwo8U2OkWuW6BTctxVU0ia1guMGp7pQ/45KEo0Au6PxYhKbiewwRANjBp
         fSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvWgj2tLfjTT6ys9Fl+A1tAK7bl+2z+EbE4rGBPrBvM=;
        b=E53S+WA7e+08SRmt0yvtgmw2M4viYhjCSu6bl07nKKFEAcwfJtRHrpy4SddJODOks8
         oXmNJdUGRfinMOfwFwl6gHUrSVzeDby/Op8hQ/vhDiCqh8i3BnL7vW6kfsufcvqVVgeQ
         2C+VvgvQyy0+D/zHUhbH6XS++tKocLp7yTPHx/1cCplUsoul/dmjQovhP4OHEXhLnNsc
         oVwrPm9fISBosErQYzru2I0zggtNasxMhU2kGG48UM6BZKZi+k1/S6k0ViSVhZzIerSC
         GAMLYi26DV6vMe8tAhXr9Y6sj6Txl04dXJWckRBUMmyQ73rd/ce3wyE7BqSCNtCvJjBN
         PQHg==
X-Gm-Message-State: APjAAAXi0CxSM9Mb5WKoyiCfIyk7+vTmy3NvXriXvJennCkhBfM6MoCZ
        1vjU9n+u8Kgq2Xb6RQE3Zfs5aA==
X-Google-Smtp-Source: APXvYqwWCfA7jP+bmTsKQhvE+1uuPlEWbOWBEvxvWHwvWdM81cldd8ufDXpg1y89e7Zdre+X6cVTfg==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr45247025ljj.144.1564051314505;
        Thu, 25 Jul 2019 03:41:54 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id b6sm8268306lfa.54.2019.07.25.03.41.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:41:54 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/14] Add support for QCOM Core Power Reduction
Date:   Thu, 25 Jul 2019 12:41:28 +0200
Message-Id: <20190725104144.22924-1-niklas.cassel@linaro.org>
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

Changes since V1:
Added a new patch implementing dev_pm_opp_find_level_exact() in order to
make the CPR OPP table in device tree cleaner.
For more detailed changes, check the "Changes since V1" as comments in
the individual patches, where applicable.

Jorge Ramirez-Ortiz (1):
  cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist

Niklas Cassel (11):
  opp: Add dev_pm_opp_find_level_exact()
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
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  142 +-
 arch/arm64/configs/defconfig                  |    2 +
 drivers/cpufreq/Kconfig.arm                   |    4 +-
 drivers/cpufreq/Makefile                      |    2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |    1 +
 drivers/cpufreq/qcom-cpufreq-kryo.c           |  249 ---
 drivers/cpufreq/qcom-cpufreq-nvmem.c          |  352 +++
 drivers/opp/core.c                            |   48 +
 drivers/power/avs/Kconfig                     |   15 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/qcom-cpr.c                  | 1885 +++++++++++++++++
 include/linux/pm_opp.h                        |    8 +
 16 files changed, 2792 insertions(+), 267 deletions(-)
 rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (87%)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
 delete mode 100644 drivers/cpufreq/qcom-cpufreq-kryo.c
 create mode 100644 drivers/cpufreq/qcom-cpufreq-nvmem.c
 create mode 100644 drivers/power/avs/qcom-cpr.c

-- 
2.21.0

