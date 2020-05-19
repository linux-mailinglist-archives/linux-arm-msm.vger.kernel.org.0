Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959021D8F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 07:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgESF0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 01:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgESF0Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 01:26:24 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECB4C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 22:26:24 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n15so848049pjt.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 22:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQLTjFaHeHCtwJ90T40u9GJZ4EPCgGpPiHhC/OFX8TA=;
        b=R6pm4GXJTMMMY373PRSkQG8D4DwPQqGx7gkgp7evfK2GysjnKx55h80ucmWzRZahYc
         pINugt/U+FRyboicAskf87byfkkuhs6FuubeZML2IBojIsPl9DhKoX2VN+Q2xiZF5jPE
         h+OaRAnlkhKFP9NWBST3+iE4y9T2ngZWz3Kpav1e0j1MmH2eW4kM2Xjb/7ZO+OXFvznP
         mCG9Qin7nXV8uf36YL1DqWwyJ+bSkR6otaMH9Ohk+heujTKcqflwUSvT2WKGVdRjYd/C
         VVoWbRzbuqQtK5k9cvsxwpFFdHtSM3mW2YBBTlTA+Aqy6hHcm6KMNtD/pnT1NUoR71Al
         QsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQLTjFaHeHCtwJ90T40u9GJZ4EPCgGpPiHhC/OFX8TA=;
        b=NejSQmKjWnCg1tk6imT0Ro12XqVeJfIv4tNs9eGnml5TrwyXEC/cK/KH0nNw0L4bGl
         +9Yq5aKtRWbgGgVnt9JBL+1aLdCGoGaT4wWiBtC/sYPKSqskCy3qmgH0UCFucUNJNjuh
         YngjkaHvyDiKUh+EShEVOROR+wrYMJuaEjHnVhyfSvmMJBkOPeNhTAlb7Oy9gU6klxU4
         CTZg+jdKTGaR7HdjmO6udVvBX2FW3Frkwv5MW8nzwZu0s39E0442RF/jkw8T80J5Zxet
         cH5cEBxD9wseQygyo4zjsVsPumuQVJgOHBR26oH8VilmTUioPXJOVE9F0CtjpdQuNezN
         qMsg==
X-Gm-Message-State: AOAM531bIo+viU/wVO6SM235CYLSRm2Gm71q7oAgyo+vMSOj6Q2FrU/o
        cjJz2hKXps6h5ehfCWAX6dr8zwla1h8=
X-Google-Smtp-Source: ABdhPJyeCl5NFJNw/zwS7zHiNN+lAe/tMkiC2BicVCQdQPF/qoZgNRkInWg5NJNF1XETXKHAW5GS7A==
X-Received: by 2002:a17:90a:a111:: with SMTP id s17mr3124143pjp.39.1589865983783;
        Mon, 18 May 2020 22:26:23 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v127sm10211683pfb.91.2020.05.18.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 22:26:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.8
Date:   Mon, 18 May 2020 22:25:02 -0700
Message-Id: <20200519052502.1249888-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.8

for you to fetch changes up to 5ef3c35809ec74ab41a5cf93a5b6d60167661113:

  arm64: defconfig: enable Qualcomm IPA and RMNet modules (2020-05-18 16:36:30 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.8

This enables SM8250 GCC clock driver, SC7180 GCC clock driver and SC7180
TLMM pinctrl driver, the IPA and RMNET drivers, CCI, camera subsystem
and camera clock drivers and removes the now depricated GLINK_SSR entry.

----------------------------------------------------------------
Alex Elder (1):
      arm64: defconfig: enable Qualcomm IPA and RMNet modules

Bjorn Andersson (2):
      arm64: defconfig: Remove QCOM_GLINK_SSR
      arm64: defconfig: Enable Qualcomm SC7180 pinctrl and gcc

Robert Foss (1):
      arm64: defconfig: Enable Qualcomm CAMCC, CAMSS and CCI drivers

Vinod Koul (1):
      arm64: defconfig: Enable SM8250 GCC driver

 arch/arm64/configs/defconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
