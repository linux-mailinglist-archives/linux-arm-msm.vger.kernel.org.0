Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BE043B398
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 16:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbhJZOJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 10:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbhJZOJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 10:09:32 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3311EC061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 07:07:09 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so19988233ott.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5Qlx1y7ALla3mofzLviDldMhP9x8JiihdYD246zlCY=;
        b=JmNzDIh4MWt3N9J8HsHlhZS+nlhV7KoxC7nizgJuk8hQsmjIouKI6bZ5bpUnuqfv9F
         eYV+4iGHhN5KXAdPqk14uGbuD89z20WMaKbJ3yHzvhJ5b+1OEVg34W+Fze33WKrTBCNg
         ksxMj0PjQNXIkkeWcxguTLeeSKKuYwATCYfMlf+RklW+iae+QVlRAvbAkzB0cnE/D8qn
         1Xa5yEy4VEvsh5vlETy2qNsjMsqnFzPDdIh33FdFP7oSUpmcsfIEI8g6WvNneS0+x86E
         wd7FgHSN0dvPvMXYrXFZsTLwdU/lCpty2XRCuhk+tybAdZ0rGPumQ/58kbLyufSdZ0e6
         GMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5Qlx1y7ALla3mofzLviDldMhP9x8JiihdYD246zlCY=;
        b=rDdqaFGZjCgHIhrEtSDL9s+KVy6xSAwb3/mrNJoIJkrw9CwvJQSE2d95yaine72EV5
         ylGOc/Dl0roX7J2qylQ/Y7Om/zXsp/BGMfp1A1UXerD8GPMTdGZinRSWENPo/9M03IR1
         vHUuY1O8uBVDTPo9/oKFgLd16v8PGDYGRm5/vYmu8KN0PzEIvKXHfuHX2mOi4YR56Dz2
         VepTg14AotapFkgAhIfsga85N6NXw7jHf3dMwQDAFpfL0io8A7jgl8cZctB1veQe9nsu
         iza83eP68IhItGuMorJAo3ySp3GWVAAQWLGFEBQCq5lEFHwFzYt49HeV33CnzFpRg2Yl
         MFOQ==
X-Gm-Message-State: AOAM5326cETPEaCnl9sRV2ZIiUxTFwqNl0hw+FD+mBvoYpQSpaZCvgwb
        5sZxOpqtsvxWl6xz2GevnAxjuQ==
X-Google-Smtp-Source: ABdhPJySoYtqBF6E1gZIxLymCcbN+YVTvANHlMP5w77ok+wlM6XMABiz0bKovqVOltEZwyU2aKVweQ==
X-Received: by 2002:a05:6830:60f:: with SMTP id w15mr1773894oti.150.1635257228425;
        Tue, 26 Oct 2021 07:07:08 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id f8sm4473429otp.63.2021.10.26.07.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:07:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Chris Lew <clew@codeaurora.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Lina Iyer <lina.iyer@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [GIT PULL] More Qualcomm driver updates for v5.16
Date:   Tue, 26 Oct 2021 09:07:06 -0500
Message-Id: <20211026140706.1205989-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit f27591125a56c8c50491919b159569ab5730878d:

  Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org' into drivers-for-5.16 (2021-09-27 22:13:45 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.16-2

for you to fetch changes up to c50031f03dfe1c1462f326973ddc5f0db839fb68:

  firmware: qcom: scm: Don't break compile test on non-ARM platforms (2021-10-25 14:21:34 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v5.16

This introduces the Qualcomm "sleep stats" driver, which aids the
efforts of bringing various Qualcomm platforms into low power mode.

The SMP2P driver gains support for negotiating the "SSR" feature, which
is used to better synchronize some corner cases that might appear as the
remoteproc is recovering from a crash.

The socinfo driver learns about a few new PMICs.

SMEM is updated so that it's possible to put the compatible property
directly in the reserved-memory node, to avoid having to have a separate
node just pointing to the memory-region.

Lastly it fixes some bugs in smp2p, apr, rpmhpd drivers, notably
avoiding the issue where powering on a power-domain using rpmhpd while
keeping the performance_state at 0 is a nop

----------------------------------------------------------------
Bjorn Andersson (6):
      dt-bindings: sram: Document qcom,rpm-msg-ram
      dt-bindings: soc: smem: Make indirection optional
      soc: qcom: smem: Support reserved-memory description
      soc: qcom: rpmhpd: Make power_on actually enable the domain
      soc: qcom: socinfo: Add PM8150C and SMB2351 models
      firmware: qcom: scm: Don't break compile test on non-ARM platforms

Chris Lew (1):
      soc: qcom: smp2p: add feature negotiation and ssr ack feature support

Dmitry Baryshkov (2):
      soc: qcom: socinfo: add two missing PMIC IDs
      soc: qcom: rpmhpd: fix sm8350_mxc's peer domain

Guru Das Srinagesh (1):
      firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()

Lina Iyer (1):
      soc: qcom: spm: Add 8916 SPM register data

Mahesh Sivasubramanian (2):
      dt-bindings: Introduce QCOM Sleep stats bindings
      soc: qcom: Add Sleep stats driver

Maulik Shah (1):
      soc: qcom: qcom_stats: Fix client votes offset

Stephan Gerhold (4):
      dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
      firmware: qcom: scm: Add support for MC boot address API
      ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
      dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method

Wan Jiabing (2):
      soc: qcom: apr: Add of_node_put() before return
      soc: qcom: smp2p: Add of_node_put() before goto

 Documentation/devicetree/bindings/arm/cpus.yaml    |   5 +-
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |  34 ++-
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |   1 +
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  47 ++++
 Documentation/devicetree/bindings/sram/sram.yaml   |   5 +-
 arch/arm/mach-qcom/platsmp.c                       |   1 +
 drivers/firmware/qcom_scm.c                        |  96 +++++--
 drivers/firmware/qcom_scm.h                        |   4 +
 drivers/of/platform.c                              |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             |   2 +
 drivers/soc/qcom/qcom_stats.c                      | 277 +++++++++++++++++++++
 drivers/soc/qcom/rpmhpd.c                          |  20 +-
 drivers/soc/qcom/smem.c                            |  57 +++--
 drivers/soc/qcom/smp2p.c                           | 134 +++++++---
 drivers/soc/qcom/socinfo.c                         |   6 +-
 drivers/soc/qcom/spm.c                             |  21 ++
 18 files changed, 645 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
 create mode 100644 drivers/soc/qcom/qcom_stats.c
