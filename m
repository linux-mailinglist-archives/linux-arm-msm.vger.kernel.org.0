Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A162277BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 06:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgGUEup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 00:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgGUEuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 00:50:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C261C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:50:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n5so11369812pgf.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8ebeWeBRFRruYH9t338HyuwX7hx6I5XzKeyLXA4qF0=;
        b=Ih99AaZIJNMOrkLQH5PQtxwUmVOZ1luBwCgXbS7ouLEEkdQeBRRSIVlOzX5zK7iMr7
         KwBjzBiXl5QrvcOO1vRm2x10+KvZ8L/N8+lxCvW7LgnaZvm6tOjrCVWrCJGbfUY46CFO
         5/PkLD/ML/rUNrT4QDcQ3BrgxV+YMwJuBHoixUz+TKtmAem6csczqRuK2Ejz/baJRdPo
         rrgWn07voJeOEdNwjcoTU9YThjP1y8w84DnB7+EgzYQnAbOkPPJvZnzEYnSMxNfrHh6y
         GOSZe6j7E6kNRGyNSqHEU01Ktn7YwdhjK6F+2AYxfOJ72qaDa5KoXffc+UK/GKDWZJFK
         fLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8ebeWeBRFRruYH9t338HyuwX7hx6I5XzKeyLXA4qF0=;
        b=NgmxgG3CVTwTCNezGP17w824p+/td/gPiQeL+Tjm2ABRxe321UlokKPDDdL5ODRzT2
         w2r0I232ssmBq/hiIvyi9emeuqXLBYQNEWiNRWqau2XDiBUloPi9zN7jt7xE7INThCY3
         WEd8M3uEeUWVm27VZrNclyHNe/6V+U9vaSA2We9iv7xZC/HjOPjhlrnAzZq93coJy4eK
         JyJb22ikTkVvAxMCr1ysjmvPNzrn6BkiMHtH4BoyJmEMagLcKHrZsQrGk8IUxxhZSmNV
         riX0Rs8T1PoHsN9FOWQ7F4Gzxi+NSZtDbDgO9gN/rGfZZ11gXHpoRUQIeEvUHY+FBbJf
         vfLg==
X-Gm-Message-State: AOAM5331unysFr6E4WeSf479cmP9LB1esl900TiNawA5V8aRs1V5L5an
        /DGW/llE3vLCrz3tIWeOjlwH2A==
X-Google-Smtp-Source: ABdhPJxYyT4mSExmoaAHnUlY+WxIDoMdxgCfAfHvEQG12674UjGrnAylbOMR5r1PGfPD98mKHsOQaw==
X-Received: by 2002:a63:720b:: with SMTP id n11mr20632769pgc.137.1595307043552;
        Mon, 20 Jul 2020 21:50:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j70sm18473995pfd.208.2020.07.20.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:50:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.9
Date:   Mon, 20 Jul 2020 21:48:48 -0700
Message-Id: <20200721044848.3429874-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.9

for you to fetch changes up to fe860ac25d12ce373db2779d43e0e58ce204228c:

  arm64: defconfig: Enable Qualcomm IPCC driver (2020-06-23 12:58:43 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.9

Enable the Qualcomm RPM power-domain, RTC and IPCC drivers, the SDM845
video clock controller driver and the SM8250 TLMM pinctrl driver.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: defconfig: Enable Qualcomm SM8250 pinctrl driver
      arm64: defconfig: Enable Qualcomm IPCC driver

Georgi Djakov (1):
      arm64: defconfig: Enable the PM8xxx RTC driver

Jeffrey Hugo (1):
      arm64: defconfig: Add CONFIG_QCOM_RPMPD

Stanimir Varbanov (1):
      arm64: defconfig: Enable SDM845 video clock controller

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
