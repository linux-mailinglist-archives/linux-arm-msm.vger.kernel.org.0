Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081803EDF7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 23:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbhHPVtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 17:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbhHPVtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 17:49:14 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A14BC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:48:42 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u10so28871279oiw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PDYxqFE/CWqy58DQxmymohk6TT+/HRY/YJqeo41m6QE=;
        b=lq9gNB55sPPejjQ+diDADMcszFLtHT90QT1cicyG62KLrBs7sKSNycBk/A94bWwUye
         b79HlbvDZ2enQbzAjvA2ezvGcvpKqFwmjn6xEOLNHJ7jKw/9QfX6Ag346lT23PxuoL2d
         YUwNGkcJfaAMTePKNC+bipucoDRsbgNCGxean9P/pPISKb+n3ukiNWJM4SWdTEG3FjSi
         Qo5lHq6ZAzl3aK30o0/4xX/eu5jF4t5R1zdRz/DScCmrjCulHlDmVeszDYP4yCC2T0rC
         azo93V4cqHuOjRZ2kdlGxGW7cXMl9Oa+DnXDez/vMdDgfgG0JO/kP1pNhevC5lP6TbzD
         u5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PDYxqFE/CWqy58DQxmymohk6TT+/HRY/YJqeo41m6QE=;
        b=nKltBSxH6dcM0NV451nNxrMOhlc/zZeYmcsNkTHAu0PZskhAXZHSkbJ5b6vyhYeTBP
         bHogZH5gWJQT37oC5oGOuNltQLSfpZzpzUyNVr2aOLcnhMa6Bs1aSe8zUlApMlzjpyWx
         dJncykAEgYpnQRjJnuTr9MByGN8sxAP7ZHDcxLx8/GnrvmMOKZEEq55dsMqi5VXavIyL
         2Ol9tK5mDZNCDdNhD23sOpON+ltTA8MHtIhzEi/NRN4ZktZWmD448CYsf4xT0+I7Lv64
         rXvUrC/KyVlIxPS+REP3/Ii7jBEDTI+UVfgWD45pphHOtzDhyKWSz/NjuLi99ymZ8515
         VczA==
X-Gm-Message-State: AOAM533kn29A4iAgAjyWpS7bmQOj51lJ/FRumOfe5i7gAZn9TvxtJ5Cm
        6RKwc/XO3zXf72Dxfy8tvooXPQ==
X-Google-Smtp-Source: ABdhPJzo2V8StsZGnjUwA5FIEBjMqlgcI9aMORZKOjv+r1G5beGSJVL6/m43bis0aR2MM2UsIOyqNQ==
X-Received: by 2002:a05:6808:10d4:: with SMTP id s20mr1866ois.143.1629150521697;
        Mon, 16 Aug 2021 14:48:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c11sm56944oot.25.2021.08.16.14.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:48:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Douglas Anderson <dianders@chromium.org>,
        John Stultz <john.stultz@linaro.org>,
        Junlin Yang <yangjunlin@yulong.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm driver updates for v5.15
Date:   Mon, 16 Aug 2021 16:48:40 -0500
Message-Id: <20210816214840.581244-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.15

for you to fetch changes up to e3d4571955050736bbf3eda0a9538a09d9fcfce8:

  soc: qcom: smsm: Fix missed interrupts if state changes while masked (2021-08-04 22:20:09 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.15

This fixes the "shared memory state machine" (SMSM) interrupt logic to
avoid missing transitions happening while the interrupts are masked.

SM6115 support is added to smd-rpm and rpmpd.

The Qualcomm SCM firmware driver is once again made possible to compile
and load as a kernel module.

An out-of-bounds error related to the cooling devices of the AOSS driver
is corrected. The binding is converted to YAML and a generic compatible
is introduced to reduce the driver churn.

The GENI wrapper gains a helper function used in I2C and SPI for
switching the serial engine hardware to use the wrapper's DMA-engine.

Lastly it contains a number of cleanups and smaller fixes for rpmhpd,
socinfo, CPR, mdt_loader and the GENI DT binding.

----------------------------------------------------------------
Alex Elder (1):
      soc: qcom: mdt_loader: be more informative on errors

Bjorn Andersson (4):
      dt-bindings: soc: qcom: aoss: Add SC8180X and generic compatible
      dt-bindings: soc: qcom: aoss: Convert to YAML
      soc: qcom: aoss: Add generic compatible
      soc: qcom: rpmhpd: Use corner in power_off

Caleb Connolly (1):
      dt-bindings: qcom: geni-se: document iommus

Douglas Anderson (1):
      PM: AVS: qcom-cpr: Use nvmem_cell_read_variable_le_u32()

Iskren Chernev (4):
      dt-bindings: soc: qcom: smd-rpm: Add SM6115 compatible
      dt-bindings: power: rpmpd: Add SM6115 to rpmpd binding
      drivers: soc: qcom: rpmpd: Add SM6115 RPM Power Domains
      soc: qcom: smd-rpm: Add SM6115 compatible

John Stultz (1):
      firmware: qcom_scm: Allow qcom_scm driver to be loadable as a permenent module

Junlin Yang (1):
      firmware: qcom_scm: remove a duplicative condition

Manivannan Sadhasivam (1):
      soc: qcom: aoss: Fix the out of bound usage of cooling_devs

Stephan Gerhold (2):
      soc: qcom: smsm: Implement support for get_irqchip_state
      soc: qcom: smsm: Fix missed interrupts if state changes while masked

Stephen Boyd (2):
      firmware: qcom_scm: Mark string array const
      soc: qcom: socinfo: Don't print anything if nothing found

Vinod Koul (2):
      soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
      soc: qcom: geni: Add support for gpi dma

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  87 ----------------
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           | 114 +++++++++++++++++++++
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   3 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   1 +
 drivers/firmware/Kconfig                           |   2 +-
 drivers/firmware/Makefile                          |   3 +-
 drivers/firmware/qcom_scm.c                        |   8 +-
 drivers/iommu/Kconfig                              |   2 +
 drivers/net/wireless/ath/ath10k/Kconfig            |   1 +
 drivers/soc/qcom/cpr.c                             |  43 +-------
 drivers/soc/qcom/mdt_loader.c                      |  18 ++--
 drivers/soc/qcom/qcom-geni-se.c                    |  30 +++++-
 drivers/soc/qcom/qcom_aoss.c                       |   9 +-
 drivers/soc/qcom/rpmhpd.c                          |   5 +-
 drivers/soc/qcom/rpmpd.c                           |  28 +++++
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 drivers/soc/qcom/smsm.c                            |  28 ++++-
 drivers/soc/qcom/socinfo.c                         |   4 +-
 include/dt-bindings/power/qcom-rpmpd.h             |  10 ++
 include/linux/qcom-geni-se.h                       |  19 +++-
 21 files changed, 269 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
