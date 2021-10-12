Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BAB42AAE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhJLRhC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhJLRhB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:37:01 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABCAC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:34:59 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so291919otv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tld25oTrEk0Rr4dIbLQkkTv3D7B1kDK0KBIoATKHkIA=;
        b=B/VL9YEHMy2g0wh4f3eyupehoWeWzCc0NGrhNvY40NvPX+alNFIyrOAeatDzyPAhGD
         HgqGxKVbpJHE9HzIHNdqag1CBiqgRHPW1v1U6Cyxur5Uid80SQqpLGBuKsT68ClxkbfH
         Tmn1Ik3Eh/QdEW2ls/hzJYy32NisiwwK1itrfm4qR3NVcPm0+NZJ5o1ptkurpY/0bC+f
         zhtG48N+fWNmvpCAM5MGNG7dpKQ8lGhb6Dj4n2OMIgJU6RLUnCeT5qsh4GHmeouM6dpJ
         H4vcBY/35CgoZz9jc/ldoo8E9coD7ijcdriGIBwAtmAO3T2LiGsM9Bx7uwpEfICzR/8Z
         dsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tld25oTrEk0Rr4dIbLQkkTv3D7B1kDK0KBIoATKHkIA=;
        b=RiHZmfcLCvC3/T4scUcuOymmoKK7vr9SFcAL35FvGadJYZKHbqloRWS7eHFS6yQ5BX
         IZStwSiNu3BtFYTgOUoUvH32mBPScNQImEMGzkyPg0MDESzwyO2sepGzrYFKbpjT2c8o
         byAYb5T5a23Muw/UfrNPmh/vl888eYEPNgDRFN4XYP1yeb5yt5TvDIHPWM3Yc6QIzAOn
         W9jAY9EoqZ4ZHP0G1S/FMJELhwEqcrWli+imfPp6uMM8D5/ET6NtyjaNARyJLHdr/SNm
         8i3Uq1zWYuaTqMxoGRSXozxMG0dZ07sDVbNAck/vHEQAa7rx9w1MuRTeVxOtBYHWtc4k
         OxTA==
X-Gm-Message-State: AOAM533ojSEMzExd0AkiEnyQqxLkbARJKwbUbz5N/EpGRFZwZ+XB+6v/
        aBpun+pCn82rALCP+ljUn1yW7Q==
X-Google-Smtp-Source: ABdhPJy70nl0w5+9IcgQWrbty9OaRxq9Sm6lE00T8XG/cqavfRZhd/B6edIihMpGJ1jh2AuwEOnPWw==
X-Received: by 2002:a05:6830:3184:: with SMTP id p4mr7644795ots.219.1634060083730;
        Tue, 12 Oct 2021 10:34:43 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j4sm2431428oia.56.2021.10.12.10.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:34:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Len Baker <len.baker@gmx.com>, Luca Weiss <luca@z3ntu.xyz>,
        Naina Mehta <nainmeht@codeaurora.org>,
        Robert Marko <robimarko@gmail.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.16
Date:   Tue, 12 Oct 2021 12:34:42 -0500
Message-Id: <20211012173442.1017010-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.16

for you to fetch changes up to f27591125a56c8c50491919b159569ab5730878d:

  Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org' into drivers-for-5.16 (2021-09-27 22:13:45 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.16

This drops the use of power-domains for exposing the load_state from the
QMP driver to clients, to avoid issues related to system suspend.

SMP2P becomes wakeup capable, to allow dying remoteprocs to wake up
Linux from suspend to perform recovery.

It adds RPM power-domain support for SM6350 and MSM8953 and base RPM
support for MSM8953 and QCM2290.

It adds support for MSM8996, SDM630 and SDM660 in the SPM driver, which
will enable the introduction of proper voltage scaling of the CPU
subsystem.

Support for releasing secondary CPUs on MSM8226 is introduced.

The Asynchronous Packet Router (APR) driver is extended to support the
new Generic Packet Router (GPR) variant, which is used to communicate
with the firmware in the new AudioReach audio driver.

Lastly it transitions a number of drivers to safer string functions, as
well as switching things to use devm_platform_ioremap_resource().

----------------------------------------------------------------
AngeloGioacchino Del Regno (5):
      cpuidle: qcom_spm: Detach state machine from main SPM handling
      dt-bindings: soc: qcom: Add devicetree binding for QCOM SPM
      soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS
      soc: qcom: spm: Add compatible for MSM8998 SAWv4.1 L2
      dt-bindings: soc: qcom: spm: Document SDM660 and MSM8998 compatibles

Bartosz Dudziak (2):
      dt-bindings: arm: Add SMP enable-method for MSM8226
      arm: qcom: Add SMP support for MSM8226

Bjorn Andersson (2):
      Merge tag '1630420228-31075-2-git-send-email-deesin@codeaurora.org' into drivers-for-5.16
      Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org' into drivers-for-5.16

Cai Huoqing (6):
      PM: AVS: qcom-cpr: Make use of the helper function devm_platform_ioremap_resource()
      soc: qcom: ocmem: Make use of the helper function devm_platform_ioremap_resource_byname()
      soc: qcom: geni: Make use of the helper function devm_platform_ioremap_resource()
      soc: qcom: aoss: Make use of the helper function devm_platform_ioremap_resource()
      soc: qcom: gsbi: Make use of the helper function devm_platform_ioremap_resource()
      soc: qcom: rpmh-rsc: Make use of the helper function devm_platform_ioremap_resource_byname()

Deepak Kumar Singh (2):
      soc: qcom: aoss: Expose send for generic usecase
      soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ

Konrad Dybcio (4):
      soc: qcom: rpmhpd: Add SM6350
      soc: qcom: llcc: Add configuration data for SM6350
      dt-bindings: soc: qcom: aoss: Add SM6350 compatible
      dt-bindings: power: rpmpd: Add SM6350 to rpmpd binding

Len Baker (1):
      soc: qcom: pdr: Prefer strscpy over strcpy

Luca Weiss (1):
      dt-bindings: firmware: scm: Add compatible for msm8226

Naina Mehta (1):
      soc: qcom: llcc: Disable MMUHWT retention

Robert Marko (1):
      soc: qcom: socinfo: Add IPQ8074 family ID-s

Shawn Guo (2):
      dt-bindings: soc: qcom: smd-rpm: Add QCM2290 compatible
      soc: qcom: smd-rpm: Add QCM2290 compatible

Sibi Sankar (4):
      dt-bindings: soc: qcom: aoss: Drop the load state power-domain
      soc: qcom: aoss: Drop power domain support
      dt-bindings: msm/dp: Remove aoss-qmp header
      dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions

Srinivas Kandagatla (5):
      soc: dt-bindings: qcom: apr: convert to yaml
      soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
      soc: qcom: apr: make code more reuseable
      soc: dt-bindings: qcom: add gpr bindings
      soc: qcom: apr: Add GPR support

Vladimir Lypak (6):
      dt-bindings: soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
      soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
      dt-bindings: power: rpmpd: Add MSM8953 to rpmpd binding
      soc: qcom: rpmpd: Add power domains for MSM8953
      dt-bindings: firmware: qcom-scm: Document msm8953 bindings
      firmware: qcom_scm: Add compatible for MSM8953 SoC

 Documentation/devicetree/bindings/arm/cpus.yaml    |   3 +-
 .../bindings/display/msm/dp-controller.yaml        |   1 -
 .../devicetree/bindings/firmware/qcom,scm.txt      |   4 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  12 +-
 .../devicetree/bindings/soc/qcom/qcom,apr.txt      | 134 ---------
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     | 177 ++++++++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   3 +
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |  80 ++++++
 arch/arm/mach-qcom/platsmp.c                       |  71 +++++
 drivers/cpuidle/Kconfig.arm                        |   1 +
 drivers/cpuidle/cpuidle-qcom-spm.c                 | 318 +++++----------------
 drivers/firmware/qcom_scm.c                        |   4 +
 drivers/soc/qcom/Kconfig                           |  11 +-
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             | 287 +++++++++++++++----
 drivers/soc/qcom/cpr.c                             |   4 +-
 drivers/soc/qcom/llcc-qcom.c                       |  18 +-
 drivers/soc/qcom/ocmem.c                           |   4 +-
 drivers/soc/qcom/pdr_interface.c                   |  12 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   4 +-
 drivers/soc/qcom/qcom_aoss.c                       | 165 ++++-------
 drivers/soc/qcom/qcom_gsbi.c                       |   4 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   4 +-
 drivers/soc/qcom/rpmhpd.c                          |  16 ++
 drivers/soc/qcom/rpmpd.c                           |  24 ++
 drivers/soc/qcom/smd-rpm.c                         |   2 +
 drivers/soc/qcom/smp2p.c                           |  20 ++
 drivers/soc/qcom/socinfo.c                         |  12 +
 drivers/soc/qcom/spm.c                             | 258 +++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h          |  14 -
 include/dt-bindings/power/qcom-rpmpd.h             |  17 ++
 include/dt-bindings/soc/qcom,gpr.h                 |  19 ++
 include/linux/soc/qcom/apr.h                       |  70 ++++-
 include/linux/soc/qcom/qcom_aoss.h                 |  38 +++
 include/soc/qcom/spm.h                             |  43 +++
 36 files changed, 1259 insertions(+), 598 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
 create mode 100644 drivers/soc/qcom/spm.c
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h
 create mode 100644 include/soc/qcom/spm.h
