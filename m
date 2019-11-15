Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1EABFDD30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 13:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKOMRm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 07:17:42 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40206 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfKOMRm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 07:17:42 -0500
Received: by mail-lf1-f68.google.com with SMTP id j26so7861023lfh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zwPMwB2RiSUmNRM4skEo53AFmHsnpLdRklqrJ7M1CGM=;
        b=R/IeUVq5jtooBozJfg6+vEOzIjVyKvh8ynV9jDhQlqMMrafkBHAo9kMd1uOsX/2V8p
         Pkr8FRF4tISl0WyhLaYSn0aMjMS5mYul2MGQtCK/kcZ5lqD8IvaNBjBJG9SRCrZ8Pgku
         DQOAvCi0qK8sMpttXEY21rDRg4GLYIKzZnHPRmSd9z4t7pWzNtH/TeGA/+ixM/T/dwhU
         H44oJZBrBFx7nLUxam9Oj3M+pTkxSS6Gs+YvEMKh4kdjMWl278P8ROhCU/r7c7FpR13d
         iycN9Ma2jf0rlvPDGTQgfJGrEW+2O/jInKuYeVVGZDTUmN2lCXbcvZj6UIMoCGb00M0s
         66pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zwPMwB2RiSUmNRM4skEo53AFmHsnpLdRklqrJ7M1CGM=;
        b=PHbR0VMWdFqxOTEfUto9RkdY1T/+VppEj8duBqt+CYrwjH3w72I0VyZXSC3TjOxVNf
         zGbTFxclFV4Y4G5MiO9P0i9Wi30jvhLYJq6va1xknpMj+qQre3r2VWr4njndlggyK7AJ
         +KjFdV0/PLVA7vmt5oBqWspJK2vH03XboCKEM6DY/JZz58B9HW/aoi1j0CrERGzt/UUj
         wV7HLGAX8Ktu0+7Sv34A9SqXqA42QqEYhVFn+YY1u7iuKJd2JTLlUY8P5qMyTiDs5Cot
         CdFnuV4Ch7PHn1oC4H9pxSW/VUnvlpeF+jTxYeKhhttQZlTXRdc/TSEBLNtza5N3oTlo
         MdXQ==
X-Gm-Message-State: APjAAAUxI1J1x5rslBw8G5/T5LDsl4IZm7Ojic0AhR7TA/RXx2ShLlQc
        RKRPiESWjIg6qlbXgiZgNdgSMQ==
X-Google-Smtp-Source: APXvYqzdc5fuKqfou46ifmV2Mw6UXjuQyNPexWnBdQPEUi4aFQIDIPm0q0tNU5Y3xbZP1CVo6yViyg==
X-Received: by 2002:a19:c514:: with SMTP id w20mr11215839lfe.143.1573820258087;
        Fri, 15 Nov 2019 04:17:38 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id y18sm4107961lja.12.2019.11.15.04.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 04:17:37 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     amit.kucheria@linaro.org, sboyd@kernel.org, vireshk@kernel.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/5] Add support for QCOM Core Power Reduction
Date:   Fri, 15 Nov 2019 13:15:37 +0100
Message-Id: <20191115121544.2339036-1-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
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
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=173423
as well as that series' matching device tree changes:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=165457

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

Changes since V4:
Implemented review comments from Stephen Boyd.
Removed suspend()/resume(), since they did the same things as ->power_on()/
->power_off() genpd callbacks.

Niklas Cassel (5):
  dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
  power: avs: Add support for CPR (Core Power Reduction)
  arm64: dts: qcom: qcs404: Add CPR and populate OPP table
  arm64: defconfig: enable CONFIG_QCOM_CPR
  arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM

 .../bindings/power/avs/qcom,cpr.txt           |  130 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  132 +-
 arch/arm64/configs/defconfig                  |    2 +
 drivers/power/avs/Kconfig                     |   15 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/qcom-cpr.c                  | 1755 +++++++++++++++++
 7 files changed, 2035 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
 create mode 100644 drivers/power/avs/qcom-cpr.c

-- 
2.23.0

