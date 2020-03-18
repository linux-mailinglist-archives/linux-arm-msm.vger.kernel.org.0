Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969EE189506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgCREml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:42:41 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45385 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgCREml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:42:41 -0400
Received: by mail-pf1-f195.google.com with SMTP id 2so13176417pfg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 21:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=p0mJlnl5J+ny/iKBrU8/DQJ2OQII6+Fockv2SGC0ZWA=;
        b=JYS0q8l1On09iQ/mmF+qOJEctqa63bsgE8cwSuUhvwYaFe/k2v1F7m+kc0fh7PgB3E
         Mr4KF9otwVd4fBf2HUIAQjPraw0Dac53aXi8ksr3pDfjEIpPhQ6rI4SQzHSl8FF8KV+y
         35M5462tJ4ZyJ5wX6QxPasvNg6R643eJIoIQsRspyD/PxbXE2RvWttEBRothpcSwELlu
         au9wDatCbfzQKh6rRzk9RiE+DH2xk+fLg3lQ4kpon0uPjLg1qsPj5HkYsBMcnjx7U2x8
         SNZz+x/ZlqKvoOU8222VSsrW1wDv0QfaJoC1P54MvvBNUByRodagBob3H0rbu8ChN9lt
         OViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=p0mJlnl5J+ny/iKBrU8/DQJ2OQII6+Fockv2SGC0ZWA=;
        b=kxkLitfoIy0TmmLiIHW6Z7fwx2BGl2eOVp97ApdsOepGTt/RxnWhnVdtC45flfjsxy
         p9HQGry0IEqrYdzPOI12OZhVr3jNwN8I2Ohwino7mWhsdFDRHC/9bU82kT4yNnmJjuzN
         2D7Kt/rYM1QJBDTF/SCKdnOVVMUCAg/J7gii473w74ao7TOrkzjYg94nWtMZ65v050Ct
         BZlI9SLGv+uAuJxY4nWsNvQluJlvnphXMu56qIO30BxX/MeZJCgfggtCFI3wVZTcoqRg
         9zX/V+/NDK6UIbQtuTHouiZ/xWTPt6aH9EQGHG5QAgqqNUmF+5Ba1hJnYZJUCcDOwkKT
         Ifsg==
X-Gm-Message-State: ANhLgQ0aPPkllU9PMEIHWSu1SUDvW4UybPq4iHR3a6p/rN0JTzUrfjtP
        TTW+ePhXwQTlBxy3cgi63Mth/vGTJys=
X-Google-Smtp-Source: ADFU+vuMLYYaSGwUQTOEPDDlpL/7FDPxqkrpSAndeSuSePwBSn0dmZjI5fmWmCzDdgpNL75O2p9IFA==
X-Received: by 2002:a62:ce48:: with SMTP id y69mr2372975pfg.178.1584506560129;
        Tue, 17 Mar 2020 21:42:40 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w205sm4793864pfc.75.2020.03.17.21.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:42:39 -0700 (PDT)
Date:   Tue, 17 Mar 2020 21:42:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.7
Message-ID: <20200318044236.GD470201@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.7

for you to fetch changes up to de722e410661b9c9173a82af4329d337d341f777:

  soc: qcom: Fix QCOM_APR dependencies (2020-03-16 15:07:19 -0700)

----------------------------------------------------------------
Qualcomm driver updates for v5.7

This adds a new library for subscribing to notifications about
protection domains being stated and stopped and the integration of this
with the APR driver. It also contains fixes and cleanups for AOSS
driver, socinfo and rpmh.

----------------------------------------------------------------
Ansuel Smith (1):
      devicetree: bindings: firmware: add ipq806x to qcom_scm

Arun Kumar Neelakantam (2):
      soc: qcom: aoss: Use wake_up_all() instead of wake_up_interruptible_all()
      soc: qcom: aoss: Read back before triggering the IRQ

Bjorn Andersson (1):
      soc: qcom: Fix QCOM_APR dependencies

Manivannan Sadhasivam (1):
      soc: qcom: Do not depend on ARCH_QCOM for QMI helpers

Maulik Shah (2):
      drivers: qcom: rpmh: fix macro to accept NULL argument
      drivers: qcom: rpmh: remove rpmh_flush export

Nathan Chancellor (1):
      soc: qcom: pdr: Avoid uninitialized use of found in pdr_indication_cb

Sibi Sankar (3):
      soc: qcom: Introduce Protection Domain Restart helpers
      dt-bindings: soc: qcom: apr: Add protection domain bindings
      soc: qcom: apr: Add avs/audio tracking functionality

Stephen Boyd (2):
      drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh
      soc: qcom: socinfo: Use seq_putc() if possible

 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 .../devicetree/bindings/soc/qcom/qcom,apr.txt      |  50 ++
 drivers/soc/qcom/Kconfig                           |   7 +-
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             | 123 +++-
 drivers/soc/qcom/pdr_interface.c                   | 757 +++++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h                    | 379 +++++++++++
 drivers/soc/qcom/qcom_aoss.c                       |   6 +-
 drivers/soc/qcom/rpmh-internal.h                   |   1 +
 drivers/soc/qcom/rpmh-rsc.c                        |   2 +-
 drivers/soc/qcom/rpmh.c                            |  22 +-
 drivers/soc/qcom/socinfo.c                         |   2 +-
 include/linux/soc/qcom/apr.h                       |   1 +
 include/linux/soc/qcom/pdr.h                       |  29 +
 include/linux/soc/qcom/qmi.h                       |   1 +
 include/soc/qcom/rpmh.h                            |   5 -
 16 files changed, 1357 insertions(+), 30 deletions(-)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h
