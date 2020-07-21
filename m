Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AF12277B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 06:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgGUEuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 00:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgGUEuI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 00:50:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A3CC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:50:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so1043332pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8X12jc2MSvnR/mSOp1lta7IMumNH/veg8iaKIiGwz4=;
        b=X+JJQaU+ySgTTNs8SIl+dYOmf1fYnMk1o6WMTDoC0G9Zq8tfr1YN0mM6ejHPe70Rq6
         RPpAetuZS6y6J7c/7R7Yv2ug3xfetwQgL8Lsa45m+P22EbYnSGroc9ByQC0W24nda9je
         QLb/C/WC+VQ8jMSMgTkXHtKpOmnx0IRc+eNrbJ2eNUNi37SDmRU6qWRcA8y3hth1cpso
         8pO+lou3HSxlc8NoWqMfPb/AWmLzzYGXD3LFzhvH3oxLJEkIy57EmGpXj0buk3ZfUwoX
         Uh/onn+Yt9Z8Sd0InRVUujCiJEf775bh3BL67tbtO5u5cfRWvWjqVRf3jO7LmG2dqnbx
         /MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8X12jc2MSvnR/mSOp1lta7IMumNH/veg8iaKIiGwz4=;
        b=q2pM4P+R1hIPgWzYewaIzZJDoxYglsqWdMo4s+xLHl7weUPuQ6hrO39sxW4x9X3wrI
         ow3nUmHXccOXIT9Tlr7EuP1oIgFvkksJ+XNDsTP5KEhXqPPdUYaslxH77Ly87LyW4qeD
         SNZsph48JWSsWemSm1PPKIJ+fvJLsVMNOYrR3WDiEjGPADY5lLHBdB6Kn8jGmvcuj8xe
         mK/OlznsZvEG1rPegZEL6of2MKvUmS7B6QpbKYx1YtL5e1bIazOtOlxFs7kOvQbsESp1
         yInaRjOQX671aCP/vWXBYJvkHO9nWEKdelgx9Ty8fQU4j0Bpd1SfrFeEZeZXAkginG2D
         PAKA==
X-Gm-Message-State: AOAM532TDKs3Zp0a9RO7UpqV4PioJE5IvW7clVymGJtfSXhd1gJ2+RgG
        CDMJHQCAU1D8LTZh/8vBxC48dg==
X-Google-Smtp-Source: ABdhPJzrn5rTk/mRPmkzaZ8AYU15Y2x3W1eMg6tFijfU1HzlWUy5s7dyMj8mfAWAeYn3S7Zrh5zXYA==
X-Received: by 2002:a17:902:9890:: with SMTP id s16mr18222306plp.112.1595307007258;
        Mon, 20 Jul 2020 21:50:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 17sm18733866pfv.16.2020.07.20.21.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:50:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Jonathan McDowell <noodles@earth.li>,
        Lina Iyer <ilina@codeaurora.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Greg KH <greg@kroah.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.9
Date:   Mon, 20 Jul 2020 21:48:12 -0700
Message-Id: <20200721044812.3429652-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please note that, as reported by Stephen Rothwell last week, Linus will hit a
minor merge conflict between:

  650c8bd36a66 ("serial: qcom_geni_serial: Always use 4 bytes per TX FIFO word")

and

  3550f8979a7b ("tty: serial: qcom_geni_serial: Clean up an ARRAY_SIZE() vs sizeof()")

found in the tty tree.

The solution for this conflict is the following:

diff --cc drivers/tty/serial/qcom_geni_serial.c
index 07b7b6b05b8b,1ed3d354e16d..000000000000
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@@ -768,8 -718,8 +768,8 @@@ static void qcom_geni_serial_handle_tx(
                u8 buf[sizeof(u32)];
                int c;

-               memset(buf, 0, ARRAY_SIZE(buf));
+               memset(buf, 0, sizeof(buf));
 -              tx_bytes = min_t(size_t, remaining, port->tx_bytes_pw);
 +              tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);

                for (c = 0; c < tx_bytes ; c++) {
                        buf[c] = xmit->buf[tail++];

I hope you can pass this information on to Linus?

Regards,
Bjorn


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.9

for you to fetch changes up to 03c900b3be116003ccd0e798431f6d0c25ff6729:

  soc: qcom: geni: Fix NULL pointer dereference (2020-07-20 13:11:15 -0700)

----------------------------------------------------------------
Qualcomm driver updates for v5.9

For RPMh this fixes an issue where ktime was used during suspend, allows
the driver to be used on ARM targets and some minor cleanups.

It adds support for the latest format version in the socinfo driver and
adds identifiers for SM8250 and SDM630.

SMD-RPM gains compatibles for MSM8994 and MSM8936 and the Qualcomm SCM
gains compatibles MSM8994 and IPQ8074.

The GENI core code gains interconnect path voting and performance level
support, with subsequent patches integrating this with the SPI, I2C,
UART and QSPI drivers.

Following this the KGDB support for the GENI serial driver is improved,
the performance related to chip-select is improved for SPI and QSPI.

----------------------------------------------------------------
Akash Asthana (7):
      soc: qcom: geni: Support for ICC voting
      soc: qcom-geni-se: Add interconnect support to fix earlycon crash
      i2c: i2c-qcom-geni: Add interconnect support
      tty: serial: qcom_geni_serial: Add interconnect support
      spi: spi-geni-qcom: Add interconnect support
      spi: spi-qcom-qspi: Add interconnect support
      soc: qcom: geni: Fix NULL pointer dereference

Dmitry Baryshkov (4):
      soc: qcom: socinfo: add support for newer socinfo data
      soc: qcom: socinfo: fix printing of pmic_model
      soc: qcom: socinfo: add file with SoC info format version
      soc: qcom: socinfo: add SM8250 entry to soc_id array

Douglas Anderson (9):
      soc: qcom: rpmh-rsc: Don't use ktime for timeout in write_tcs_reg_sync()
      spi: spi-geni-qcom: Combine the clock setting code
      spi: spi-qcom-qspi: Avoid clock setting if not needed
      spi: spi-qcom-qspi: Set an autosuspend delay of 250 ms
      spi: spi-geni-qcom: Avoid clock setting if not needed
      spi: spi-geni-qcom: Set the clock properly at runtime resume
      spi: spi-geni-qcom: Get rid of most overhead in prepare_message()
      serial: qcom_geni_serial: Make kgdb work even if UART isn't console
      serial: qcom_geni_serial: Always use 4 bytes per TX FIFO word

Gokul Sriram Palanisamy (1):
      dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC

Jonathan McDowell (1):
      firmware: qcom_scm: Fix legacy convention SCM accessors

Konrad Dybcio (4):
      soc: qcom: socinfo: Add socinfo entry for SDM630
      drivers: soc: Add MSM8936 SMD RPM compatible
      soc: qcom: smd-rpm: Add msm8994 compatible
      firmware: qcom_scm: Add msm8994 compatible

Lina Iyer (1):
      soc: qcom: rpmh: Allow RPMH on ARM SoC

Maulik Shah (2):
      soc: qcom: rpmh-rsc: Set suppress_bind_attrs flag
      soc: qcom: rpmh: Update rpmh_invalidate function to return void

Rajendra Nayak (4):
      tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
      spi: spi-geni-qcom: Use OPP API to set clk/perf state
      spi: spi-qcom-qspi: Use OPP API to set clk/perf state
      tty: serial: qcom-geni-serial: Drop the icc bw votes in suspend for console

Randy Dunlap (1):
      <linux/of.h>: add stub for of_get_next_parent() to fix qcom build error

Vincent Knecht (1):
      dt-bindings: soc: qcom: Document MSM8936 SMD RPM

 .../devicetree/bindings/firmware/qcom,scm.txt      |   2 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |   2 +
 drivers/firmware/qcom_scm.c                        |   8 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |  26 ++-
 drivers/interconnect/qcom/bcm-voter.c              |   6 +-
 drivers/soc/qcom/Kconfig                           |   2 +-
 drivers/soc/qcom/qcom-geni-se.c                    | 165 ++++++++++++++++
 drivers/soc/qcom/rpmh-rsc.c                        |  19 +-
 drivers/soc/qcom/rpmh.c                            |   4 +-
 drivers/soc/qcom/smd-rpm.c                         |   2 +
 drivers/soc/qcom/socinfo.c                         |  65 ++++++-
 drivers/spi/spi-geni-qcom.c                        | 193 ++++++++++++-------
 drivers/spi/spi-qcom-qspi.c                        | 117 +++++++++++-
 drivers/tty/serial/qcom_geni_serial.c              | 210 ++++++++++++++++-----
 include/linux/of.h                                 |   5 +
 include/linux/qcom-geni-se.h                       |  45 +++++
 include/soc/qcom/rpmh.h                            |   7 +-
 17 files changed, 729 insertions(+), 149 deletions(-)
