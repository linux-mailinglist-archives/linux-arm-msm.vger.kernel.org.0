Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F88E3538EB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 18:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDDQuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 12:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhDDQt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 12:49:59 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874AEC061756
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 09:49:53 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so9393522otb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xTMgW45Pf8wC7ZRL/3TK62BwJGeS6Chx/bVTjL7mA8=;
        b=nk2BEyZT3RueLrxOExLKWBZJ4EKVhn3pOd321Mci6cTy9UF10XDahELujCxuwySvUG
         B2Ncy1Ibr8C/BV431PRL+pG/rtYU7DgQRQ/QBZtv9lQzB+gV/6gw9EnpQZHFNoileHEl
         aJk+FKh0d9iL+K+GwmkuQvvLH2lekIAZFXFnwENU2TMsCLeFpDg97YQdSuBkqAVD7ukn
         S1akeMTq+egbXQjJH87qf2r9+Dwyk6HU588mMZtrkqo4ZjxaMwmYjI6cemLhElQbPnLE
         c27XVgHV2hb9IK1ukCiis03sxeNkl2iF+HA5GDj6FKOPX+CIGd9StpJT+8vwzRZZ4DH5
         Fuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xTMgW45Pf8wC7ZRL/3TK62BwJGeS6Chx/bVTjL7mA8=;
        b=Ii7qT2VKOS53cPmRtfVwqHczbAoHLDD25D51R5PtjKs9IhIp2qyPIM4aD4g0ltUKcT
         wvBc93uVA3RPkbOktTiKc496A1M7O4l6Q6aDtymPp5l/qzVtaZfsyd/KFy5l8QVSGOh7
         KtoiKdxg7QylCaFQntCH2xiqkTzWPQYiQRwEpCOQlD3lzKO4X69ehbDI6F0NGPYGz7y2
         aPl+SgMxKnk03Ppz6UOl7aslYa6FFyo70UevTKUbTDnyi2CK2ICOIgDerhAp6AgMXMjB
         BgE07N40oeLlEdk1QDDo8RKATsRUFryGpcSCeRL1r1KY+UJ2wwaytc2Cph4xXozjVQOH
         EIrQ==
X-Gm-Message-State: AOAM532Tha2tu/qMsxI9uUPraRu1GOlp8ZYMLxIrxSrnc1+aZQ8NJOjJ
        UOrxBFdOnws0uNrOkTTpQRfkbw==
X-Google-Smtp-Source: ABdhPJzsBh85jkPN+kupmkbaUDVIvy3owM/rhUReliF+WgCmBH3OAadg8PUmUrCoHGwPT+2ljycS0g==
X-Received: by 2002:a05:6830:164e:: with SMTP id h14mr19956152otr.200.1617554992963;
        Sun, 04 Apr 2021 09:49:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e34sm3379081ote.70.2021.04.04.09.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 09:49:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Pan Bian <bianpan2016@163.com>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [GIT PULL] Qualcomm driver updates for 5.13
Date:   Sun,  4 Apr 2021 11:49:51 -0500
Message-Id: <20210404164951.713045-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13

for you to fetch changes up to ac6ad7c2a862d682bb584a4bc904d89fa7721af8:

  bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)

----------------------------------------------------------------
Qualcomm driver updates for 5.13

This introduces SC7280 and SM8350 support in the RPMH power-domain
driver, SC7280 support to the LLCC driver, SC7280 support tot he AOSS
QMP driver, cleanups to the RPMH driver and a few smaller fixes to the
SMEM, QMI and EBI2 drivers.

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      soc: qcom: Fix typos in the file qmi_encdec.c

Pan Bian (1):
      bus: qcom: Put child node before return

Rajendra Nayak (3):
      dt-bindings: power: rpmpd: Add sc7280 to rpmpd binding
      soc: qcom: rpmhpd: Add sc7280 powerdomains
      dt-bindings: firmware: scm: Add sc7280 support

Sai Prakash Ranjan (4):
      dt-bindings: arm: msm: Add LLCC for SC7280
      soc: qcom: llcc: Add configuration data for SC7280
      dt-bindings: soc: qcom: aoss: Add SC7280 compatible
      soc: qcom: aoss: Add AOSS QMP support for SC7280

Sibi Sankar (1):
      soc: qcom: smem: Update max processor count

Stephen Boyd (3):
      soc: qcom: rpmh-rsc: Remove tcs_is_free() API
      soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
      soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition

Vinod Koul (2):
      dt-bindings: power: Add rpm power domain bindings for SM8350
      soc: qcom: rpmhpd: Add SM8350 power domains

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |  1 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  2 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  1 +
 drivers/bus/qcom-ebi2.c                            |  4 +-
 drivers/soc/qcom/llcc-qcom.c                       | 19 +++++++
 drivers/soc/qcom/qcom_aoss.c                       |  1 +
 drivers/soc/qcom/qmi_encdec.c                      |  8 +--
 drivers/soc/qcom/rpmh-rsc.c                        | 65 ++++++++--------------
 drivers/soc/qcom/rpmhpd.c                          | 56 +++++++++++++++++++
 drivers/soc/qcom/smem.c                            |  2 +-
 include/dt-bindings/power/qcom-rpmpd.h             | 26 +++++++++
 12 files changed, 137 insertions(+), 49 deletions(-)
