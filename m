Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCAAD43B35F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 15:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhJZNwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 09:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbhJZNwS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 09:52:18 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A868C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 06:49:55 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so19840839ote.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PgcgUi0aKzGvNSZ/upN2vDxathxvZMJpdDJTs+D3GFg=;
        b=ilH9IDaXEJChoPlap7VE1xIGKJT0kcBhQv8CLpxuK6nnI5KmOgZOH8vfMubcxAc4vy
         y6p5NmEjcZQOhXrSwuyuL25IP8XOh/rogu4+pdJiTacRwqkNxfNtMK3Dox8IiJYrSnBc
         vfa8YwreJu6Mr2LFioJX61AJjoUwseK3akxaU7CylDvEyH2IJ5hTfQnwMAFzJI5Tuvig
         O0sbm3X90FYZR9JhZN1deD5rZgIMvPqdC1KRCvD0rhSa9VviJH+w79L8HOn6ctQtj0Kw
         eu08NB+CabcApEHrR57Rn3MGOrRmcxmsWKC6hEBfkqyWYQN9pTlcjVVcFzo1vLcSG0PT
         8a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PgcgUi0aKzGvNSZ/upN2vDxathxvZMJpdDJTs+D3GFg=;
        b=02qz30SDDWer195xslfL3bQNwNnfOYQ9VuhECbqJi87uqcv0WDTCSTzkoM4KCPUhi/
         7MQSYZ/5cpMZD/ZDMdCDYDJ3pWVRLL5DSzLKii7iGOBlE6+sH2kybQOxE1WpffY8cdT6
         hFbsjw/kTqAZE9flYDYiXmWxcbe+XLQYhlJkodvEbcJViWCDHVNcQD2sZUnIpusEJeO0
         PfkCeY+rPPcRuNOh1WtgO60WIiO+FPpzDhCO2JVcoLyVPYPykVSO1OXYrKZXJRaH4U3k
         UmrhySsHC6WxLyFwOlaQvYXuNBBJnJSHFhrHwrQgEvwdC6CQkgHInyaLpWe1RBpPsK+M
         n0Iw==
X-Gm-Message-State: AOAM533RMTEke/Trm2i33eFI3gmCtFOL+WFgEjodVCky1nOaB01KGgMt
        JajthSeNO/trukXD6tvISZH2VA==
X-Google-Smtp-Source: ABdhPJx0vq6FZnYNI9ja1HEk+yhqXMevPwQk6aw7o0kPhZ56uvsWFUomcnLFC9klJi5kKxyFnFGRcQ==
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr18797941otf.103.1635256194482;
        Tue, 26 Oct 2021 06:49:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c17sm4767607ots.35.2021.10.26.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 06:49:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.16
Date:   Tue, 26 Oct 2021 08:49:53 -0500
Message-Id: <20211026134953.1204327-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.16

for you to fetch changes up to 2da521272ad3bba2019dd1a610261d99d62401fd:

  arm64: defconfig: Enable Qualcomm LMH driver (2021-10-21 09:41:00 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.16

The major change here is the disabling of the firmware loades user space
fallback, this is done as arm64 is the only platform with this flag
enabled and as a result doesn't play nice with standard distributions.

It then enables the new limits driver, which controls the hardware based
thermal mitigation on a range of Qualcomm platforms. The prima/pronto
WiFi and Bluetooth drivers are enabled to ensure these features works
out of the box, now that the last details in the dts are landed.

The new driver for acquiring sleep stats is enabled to facilitate the
various efforts on getting these platforms into low power mode.

Lastly the base SC7280 drivers needed to simply boot this platform are
enabled.

----------------------------------------------------------------
Bjorn Andersson (3):
      arm64: defconfig: Disable firmware sysfs fallback
      arm64: defconfig: Enable Qualcomm prima/pronto drivers
      arm64: defconfig: Enable Qualcomm LMH driver

Maulik Shah (1):
      arm64: defconfig: Enable Sleep stats driver

Sai Prakash Ranjan (1):
      arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect

 arch/arm64/configs/defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
