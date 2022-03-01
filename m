Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67BF4C8237
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiCAEWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiCAEWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:22:03 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A256419AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:20:58 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id 40-20020a9d032b000000b005b02923e2e6so1947992otv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZgheNeV6VrgCPvvzDNqhywBXqs/fZYu3BC+daTMfd98=;
        b=tq8MBO3V0zr88DDeg89MfKWnSi8V7O7E88Ji6hGxsAjoouxnJYBshPC3Q7Mk9Ft4vS
         UcQy/Svc98lQ5E5rsI/9X+m74GEiJ3H6axrZLnbKfX/2xiJgcugHBdm1IE17E5GkN6t5
         6pH1OK9zet+kGbtmm6SAkYSN6S5phi/IdZEvLRzEKSYEZ7xFix52udh+CzIB5gV0iMBt
         oyqLm8KMEu+tWKc8vlnDJLz+mAvWsaO9gYASSn2THmbny3x20jCub+IWTKOsfZ4bIGIM
         JmgYkvLrruEIELEg8VPyjAoT8QAc/cAKTb9VJKQRXjQ6XkbwoPxwOlS/XTupRh/hoMPf
         RN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZgheNeV6VrgCPvvzDNqhywBXqs/fZYu3BC+daTMfd98=;
        b=nkD3tcIc64yqDjtSGJjDZee9ry+U+gZB1PFCo5QHXFbT2oYkIaf9yD0lBVL/O4cusb
         5nlerG0oWOXIT1xg5OKnPakKWauOlJStX9pJHgS+SI0FNItYmcmTZCxyyTjrH+ioVNwm
         urJYO+xGZswZPtWrPQsrDFzL+Fz+RbtfIIyRnev6mGSUKBWV6ekIVTuMegzjNgiAF3N9
         0bGUYfovdYOVg7PEvnGA1rQITprkWLHunPmjr5lG9s71obfXu+VAyg/6RTWGQ7KgomBo
         96vYaNw+PRncuGi2dB1PvXoShjHjvNHcT1GOEnHkzsAnGNohI5vWlWvA4zhYaSXEh+uU
         hroQ==
X-Gm-Message-State: AOAM531rBS+6X+nkK03ZrIGARyC/ogcmGaH5q7eKubLavmzQS9n2OSJS
        lnSwon7L7/iPXohLny8Ae6NBAg==
X-Google-Smtp-Source: ABdhPJyBKG8Npw9lGTXw5Vd8d2rCiuknyYix4lQxzx5/5XgM7tkN6QTTj6l9z/JNu5hlFbALW/9lhw==
X-Received: by 2002:a05:6830:b92:b0:5af:44c9:f115 with SMTP id a18-20020a0568300b9200b005af44c9f115mr11386307otv.24.1646108457198;
        Mon, 28 Feb 2022 20:20:57 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bh42-20020a056808182a00b002d538a8d5afsm7512671oib.7.2022.02.28.20.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:20:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Miaoqian Lin <linmq006@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Huang Yiwei <hyiwei@codeaurora.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xu Wang <vulab@iscas.ac.cn>,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.18
Date:   Mon, 28 Feb 2022 22:20:55 -0600
Message-Id: <20220301042055.1804859-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.18

for you to fetch changes up to 20f36361b7dd45787fa9872b3591f7148001eb6f:

  soc: qcom: rpmpd: Add MSM8226 support (2022-02-24 14:12:34 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v5.18

This refactors the Qualcomm mdt file loader, to partially decouple it
from the SCM peripheral-authentication-service. This is needed as newer
platforms, such as the Qualcomm SM8450, require the metadata to remain
accessible to TrustZone during a longer time. This is followed by the
introduction of remoteproc drivers for SM8450 (Snapdragon 8 Gen 1).

It changes the way hardware version differences are handled in the LLCC
driver and introduces support for Qualcomm SM8450. While updating the dt
binding for LLCC it also introduces the missing SM8350 compatible.

The ocmem and aoss drivers gains missing put_device() calls and rpmpd
gains a missing check for kcalloc() failure.

The SPM driver is updated to avoid instantiating the SPM cpuidle devices
if the CPUs aren't controlled by SPM, such as when Snapdragon 8916
operates in 32-bit mode without PSCI.

The RPM power-domain driver gains MSM8226 support.

Lastly the socinfo driver gains knowledge about a few new SoCs and
PMICs.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      firmware: qcom: scm: Add function to set the maximum IOMMU pool size
      firmware: qcom: scm: Add function to set IOMMU pagetable addressing

Bjorn Andersson (13):
      firmware: qcom: scm: Introduce pas_metadata context
      soc: qcom: mdt_loader: Split out split-file-loader
      soc: qcom: mdt_loader: Allow hash segment to be split out
      soc: qcom: mdt_loader: Allow hash to reside in any segment
      soc: qcom: mdt_loader: Extend check for split firmware
      soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
      soc: qcom: mdt_loader: Always invoke PAS mem_setup
      soc: qcom: mdt_loader: Extract PAS operations
      remoteproc: qcom: pas: Carry PAS metadata context
      dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
      remoteproc: qcom: pas: Add SM8450 remoteproc support
      soc: qcom: socinfo: Add some more PMICs and SoCs
      soc: qcom: mdt_loader: Fix split-firmware condition

Christophe JAILLET (1):
      soc: qcom: llcc: Use devm_bitmap_zalloc() when applicable

Daniel Thompson (1):
      soc: qcom: aoss: remove spurious IRQF_ONESHOT flags

Huang Yiwei (1):
      soc: qcom: llcc: Add support for 16 ways of allocation

Jiasheng Jiang (1):
      soc: qcom: rpmpd: Check for null return of devm_kcalloc

Luca Weiss (2):
      dt-bindings: power: rpmpd: Add MSM8226 to rpmpd binding
      soc: qcom: rpmpd: Add MSM8226 support

Marijn Suijten (1):
      firmware: qcom: scm: Remove reassignment to desc following initializer

Miaoqian Lin (2):
      soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
      soc: qcom: aoss: Fix missing put_device call in qmp_get

Sai Prakash Ranjan (7):
      soc: qcom: llcc: Update the logic for version info extraction
      soc: qcom: llcc: Add write-cache cacheable support
      soc: qcom: llcc: Add missing llcc configuration data
      soc: qcom: llcc: Update register offsets for newer LLCC HW
      soc: qcom: llcc: Add configuration data for SM8450 SoC
      dt-bindings: arm: msm: Add LLCC compatible for SM8350
      dt-bindings: arm: msm: Add LLCC compatible for SM8450

Stephan Gerhold (4):
      cpuidle: qcom-spm: Check if any CPU is managed by SPM
      firmware: qcom: scm: Simplify set_cold/warm_boot_addr()
      firmware: qcom: scm: Drop cpumask parameter from set_boot_addr()
      firmware: qcom: scm: Add support for MC boot address API

Xu Wang (1):
      soc: qcom: apr: Remove redundant 'flush_workqueue()' calls

Yang Li (1):
      firmware: qcom: scm: Fix some kernel-doc comments

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  16 ++
 arch/arm/mach-qcom/platsmp.c                       |   3 +-
 drivers/cpuidle/cpuidle-qcom-spm.c                 |  28 ++-
 drivers/firmware/qcom_scm.c                        | 215 ++++++++++---------
 drivers/firmware/qcom_scm.h                        |   7 +
 drivers/remoteproc/qcom_q6v5_mss.c                 |   7 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  36 +++-
 drivers/soc/qcom/apr.c                             |   1 -
 drivers/soc/qcom/llcc-qcom.c                       | 107 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      | 232 ++++++++++++++-------
 drivers/soc/qcom/ocmem.c                           |   1 +
 drivers/soc/qcom/qcom_aoss.c                       |   8 +-
 drivers/soc/qcom/rpmpd.c                           |  20 ++
 drivers/soc/qcom/socinfo.c                         |  12 ++
 include/dt-bindings/power/qcom-rpmpd.h             |   5 +
 include/linux/qcom_scm.h                           |  16 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   9 +-
 include/linux/soc/qcom/mdt_loader.h                |  17 +-
 20 files changed, 528 insertions(+), 215 deletions(-)
