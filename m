Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0B75643A1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiGCDCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiGCDCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:02:13 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF258658F
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:02:11 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10bda9c4b58so2538466fac.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lSw9mgHmjRSkAahmySS+PKcK9MN0rRkjUfmzDPwwh8=;
        b=mV7bpm9k/KZFnu73n/GBZbCbmEJ6fA9MXkwyoXVMCsa6B1EPvToNvZOMMExgaU7k1N
         AD7Mq3Tpq9d+GrRNXiScC3UOCTR6u9ZcmXOVVico7eEOVF4/zqulWg5JhK2d9W0OpV4F
         2Qf+ibpLP0T4kTt0JNTq3jhe3a2TzqHFG0GdRR7bbBVZPGmjWVC9QPlWJHmxvPXSgmBt
         wIYY44rSJnW2KaM9NeZ8QAUHrX2WL+psLFkpSuF7EdASZALpnWY95Dl0TJQx9CV8GFUV
         xfWg6nch9vZkU7KAaQXImvxEJwWR5/IHGMjMjOAmxPqs+zjOEApvMRM1KqZmBDRIMylt
         qwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lSw9mgHmjRSkAahmySS+PKcK9MN0rRkjUfmzDPwwh8=;
        b=o1YNyxwr1EcxPMdztGZTbwyCqdRHtrh0061KMinFQEuqd1Lj3lFFAw8u4DhiOk66vZ
         prPFGZh+ri7ZY0Vq2Kk7mGu3d3jar+KkQEQOSLIAm5hQcbOuPLe7dGm7p9ihHl3HA1wF
         UCwE7ZNr9U0YONadTWam11MaZQsgHk2j6QrYsuYmZ02D0x1DpYbPuLCvneQbMPhDbd5I
         n7MQwjst/CtQw001jAl/muK7WDnFPxxyq4CHGE20sRoXGJ9TKaRDe3T6XkwqZ9Mb+5fV
         RbKduWo1M1OLvNYmXPu0kp8L/QVWrIvPXu3ZfV6jZYUfC1Bc8JDelYscoWDVp6tSBjx+
         P9Ng==
X-Gm-Message-State: AJIora9jt1nv75k2+XgySkNM/tJoWvQLhXqsVVnt4Dl8SZfbWpPNeBon
        3S9msE7GchadqsOkdg8vsiW3+Q==
X-Google-Smtp-Source: AGRyM1tg2rW5BLgaSXk2zuvsm05y4qROrAGXD70Go5MLwvOGM2Bltu1sGhZNU9CpPDyjFVX9Gu6GPg==
X-Received: by 2002:a05:6870:9a28:b0:fe:4636:98aa with SMTP id fo40-20020a0568709a2800b000fe463698aamr13186547oab.21.1656817330498;
        Sat, 02 Jul 2022 20:02:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r66-20020acada45000000b0032f7605d1a3sm13191955oig.31.2022.07.02.20.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:02:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DT fixes for v5.19
Date:   Sat,  2 Jul 2022 22:02:08 -0500
Message-Id: <20220703030208.408109-1-bjorn.andersson@linaro.org>
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

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.19

for you to fetch changes up to 5fb779558f1c97e2bf2794cb59553e569c38e2f9:

  arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo (2022-06-27 15:09:32 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT fixes for v5.19

This removes duplicate includes in the sc7180-trogdor files, which
accidentally ended up disabling nodes intended to be enabled.

It corrects identifiers for CPU6/7 on MSM8994. On SM8450 the UFS node's
interconnects property is updated to match the #interconnect-cells,
avoiding sync_state issues and the GIC ITS is defined, to correct the
references from the PCIe nodes. On SDM845 the display subsystem's AHB
clock is corrected and on msm8992 devices, the supplies for lvs 1 and 2
are correctly specified.

Lastly, a welcome addition of Konrad as reviewer for the Qualcomm SoC.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8450 add ITS device tree node
      arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node

Konrad Dybcio (2):
      arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
      MAINTAINERS: Add myself as a reviewer for Qualcomm ARM/64 support

Stephan Gerhold (1):
      arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo

Stephen Boyd (1):
      arm64: dts: qcom: Remove duplicate sc7180-trogdor include on lazor/homestar

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: fix interconnects property of UFS node

 MAINTAINERS                                           |  1 +
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts     |  2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                  | 14 ++++++++++++--
 8 files changed, 20 insertions(+), 9 deletions(-)
