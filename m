Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39142736FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 02:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgIVAF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 20:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgIVAF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 20:05:26 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF97C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 17:05:26 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x14so19037519oic.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 17:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5uk18AYQBLELPl6q/asgU0XH/uIPc5sM10ACZPWdWf8=;
        b=ZvWq29QalMwbO2wUvDNjjENhcC7h1gyP/CllN8TX1LLSB6Z1/eaOm1vWcXpOZ1O7/7
         Ja8DAL24hbcq17nviUlpftLj+rIMGe/N8XCArg/RlNkSOof1viAJgoY0Eh+iOXyamRcU
         YwMJTZI+IYxmNBMfECA51pzuO+SrbwRX4NhbKDR8wK53RxRT9CfNImdtrTLgFJfx5t3D
         usH8K1foICRzArHK5UP5kDdi1W0vnbNTUFfUW+cubpI1bEuFY6DrzbxhPODW8gQ/CinJ
         NgE3xPWTfG0mAeAyfodKx4WBKukM2Bj/+MtU3rFYowdCmuM4BIp7tRIsOOodYPmqpsJI
         r9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5uk18AYQBLELPl6q/asgU0XH/uIPc5sM10ACZPWdWf8=;
        b=CQ6ZDsx8XBS0s/rwEyhIMWsfj8CYxC/jsfZ8F56q2/M4Ug2hVEBpJgRUMS8+B8lZbR
         ZU8fVWEjQI0/8xE76d/0a4u6Ob0zCioWrGkOaP0GQNFcq51WZ8nEY6092eXK5crtpS8j
         gpLlugds8cIIMaVyYdhfPE/fODuiwAjlgaJu+A08FJJmYngTFv3lwCrgQ5PKbLbeOovp
         ESD+gqJpfmlXMapHV1xzKTuhZYTh5WA8vk/hK7V2afExoBV0mSKSIrxi181O4RKwebM9
         F1ejdVjniHkIhIDNOGnM/fc1R4z4KD+5CJ6m/egWl77EE6a47gs20Luk4c6k9Xy5aqjW
         5NYQ==
X-Gm-Message-State: AOAM532ll9aAbWrRnYmxGz//gCy8OFaE65MTN6ED18/JUqk7rVfj7ic8
        7i1tBCH4POZhGX2p3jAQNjIZYQ==
X-Google-Smtp-Source: ABdhPJwsVubQBHzmVALMLbQfy8I6xDpiEbhys39h+7asNMuKz1LigMtGzl/oEXQRtwrx0AWDeYf/Yg==
X-Received: by 2002:a54:4189:: with SMTP id 9mr1075970oiy.66.1600733125933;
        Mon, 21 Sep 2020 17:05:25 -0700 (PDT)
Received: from localhost.localdomain (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id k16sm7151619oij.56.2020.09.21.17.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:05:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>
Subject: [GIT PULL] Qualcomm ARM64 DT fixes for v5.9
Date:   Mon, 21 Sep 2020 19:05:21 -0500
Message-Id: <20200922000521.39621-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.9

for you to fetch changes up to 22f5adc75a8d60080e489b0f90f0a55104488464:

  arm64: dts: qcom: pm660: Fix missing pound sign in interrupt-cells (2020-09-14 23:32:18 +0000)

----------------------------------------------------------------
Qualcomm ARM64 DT fixes for v5.9

This fixes the OPP table for SDM845 QUP devices to bring back
Bluetooth support, disables SMMU on SDM630 to make the devices boot
again, disables the eMMC controller on Kitakami to prevent permanent
damage and fixes a typo in the pm660.

----------------------------------------------------------------
Konrad Dybcio (2):
      arm64: dts: sdm630: Temporarily disable SMMUs by default
      arm64: dts: qcom: kitakami: Temporarily disable SDHCI1

Rajendra Nayak (1):
      arm64: dts: sdm845: Fixup OPP table for all qup devices

Łukasz Patron (1):
      arm64: dts: qcom: pm660: Fix missing pound sign in interrupt-cells

 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 7 ++++++-
 arch/arm64/boot/dts/qcom/pm660.dtsi                        | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi                       | 8 ++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                       | 9 +++++++--
 4 files changed, 22 insertions(+), 4 deletions(-)
