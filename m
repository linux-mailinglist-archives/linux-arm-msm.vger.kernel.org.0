Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4843630EBCF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 06:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhBDFUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 00:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhBDFUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 00:20:38 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2C6C061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 21:19:58 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id n7so2497910oic.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 21:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJzCjy0nMms07nuaWu9NrrP4hmPYEqwniCQtXa1rukQ=;
        b=KQ2AhCWW56C5JV7cqUzGBtT+Jp2isIlTZStXIUFAhpb088QKrxZ241ncAwPABWuv1f
         j/HuikFvkj90ccJsW5w7cFva4BuCyUYrC/WcIsel6hzAtAo2NqjhldrxEKKTjMxAmq5Z
         zg/BA9QxcJ9tTw2ttPIHTBw4FHWaDagFoMZ2Hi3viO633+rzFz7xb9jcs9f39hYL+Bqb
         Ms724vHHecjzGL+D5ucmMkK1A35F6OC5DGzepiTOVicblOOn3mJa0YfHMdHhAulUjCna
         zSqfY/aX6rACUGnhFbax4GGbkXmOf1+fwbEAq3Lx3fWHcdPGAJGlqf3oYMWE3ICFX5cY
         HqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJzCjy0nMms07nuaWu9NrrP4hmPYEqwniCQtXa1rukQ=;
        b=L23x0pLGhsGyi1Dudz4WuhdbyPChFvXAz4/By3dDEnSkD1ImNphlTn1QPOEAEB8G/p
         OTZNs+L4Z7ce4arYFaNOyrBsxao5rmEXG8umL6eYBCnz5tMc3hZQsw7zygcpRiFKQGtu
         Knzsyv++9Tm5nrO9mEv3w8dNsQqct7U2l9U1xlDrr2enzBK4phdD9xuzlamWuK5FjlEp
         Ho25y2DmJY2hWEi6fcmQm2qlUDQJHk3odhZks2an2b//Hn+nyhjAJWndu80U9aMRXmti
         PhSdygdiruualXa9j4RyY+793qRoZJa3AafYZdU8AV7zhGohoEt/ywaEqTnlPH5eYCwK
         0zwQ==
X-Gm-Message-State: AOAM531cUvUtG+LEadghUaJVs0aACQcSqbk0/j5Gqj3NAtEvpDIAafR/
        XRfeWr7qBClV3AkMO69qzjPQWQ==
X-Google-Smtp-Source: ABdhPJzrkdaH7GRTiA5I5fleV+9Wgd1JQvQZ/aAfIsJO7Hji0lsIOEzjo1HSu7B6SES+76GMosBXTg==
X-Received: by 2002:a05:6808:6d2:: with SMTP id m18mr3064386oih.32.1612415997898;
        Wed, 03 Feb 2021 21:19:57 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l3sm945276ooa.12.2021.02.03.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:19:57 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for 5.12
Date:   Wed,  3 Feb 2021 23:19:56 -0600
Message-Id: <20210204051956.388355-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.12

for you to fetch changes up to e6c88b8e434f1a856b330a7c07e4ed338e41a92e:

  arm64: defconfig: Enable Qualcomm SM8250 audio config (2021-01-15 10:20:00 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for 5.12

This enables HID multitouch and TMPFS Posix ACL, for off-the-shelf
distro support on the Snapdragon laptops. It also enables display
clocks, audio configs and the LT9611UXC HDMI bridge for used on the
SM8250 and specifically RB5 board.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: defconfig: Enable HID multitouch
      arm64: defconfig: Enable TMPFS Posix ACL

Dmitry Baryshkov (3):
      arm64: defconfig: enable display clock controller on sm8250
      arm64: defconfig: enable Lontium LT9611UXC bridge driver
      arm64: defconfig: Enable Qualcomm SM8250 audio config

 arch/arm64/configs/defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
