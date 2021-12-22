Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D50347D437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 16:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343699AbhLVPWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 10:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237912AbhLVPWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 10:22:22 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB71C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 07:22:22 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id a26-20020a9d6e9a000000b0058f37eeb861so713340otr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZQZCQL2KTVcoTnEoHgUYAElpskjF9jGurihBjq2Nbc=;
        b=qWrTaezWRHnp2Q4FBtcicyQVyIRXpbv8mHJuZ/snNJVa9UKlS05jUvzJ8DzJrEoqPl
         1qExBuU/enm6ryPz0z9RxZf6udKLUEsVmx64FhNcX9ZwTqDlqdKtBQR/fQPSmoRBOZlr
         +6rKiWpe629Vx2dHVDRzTCHirQl2mv3h5+TDhg6Gq616sZkGvwfi4m2MVxKnhno5t8lm
         RkZLmXD9DCJ4jwiNllThVqHsRHf8K0MsPVW7JXoYZ/yJMsmLwg+g60Kq9KpV3PvS+gSV
         BJNaA2Cmh+lIKSuAg7kg1MNM0AavHaoTsEFOlyDo2NBWrpbeNQebLibKh9y7xksmCbyr
         yWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZQZCQL2KTVcoTnEoHgUYAElpskjF9jGurihBjq2Nbc=;
        b=ndGtvyubWkqI0On7uocXmvhCRWL7py7nhA0gRp3h+IiDW9fMwDGN8RCLnuakBgpWp6
         GrZgJnSocJRvZbsRrKYo49qwtRJ6677MVigkOqj2ot/s1ORBRDgnMV3/VjipY7ry0wiZ
         wBoqff3XY3stGpvbKZQOJxwQ8pPHiGJaTI2A/GiCC4RhLnYu9d4ECFcpv2FUq7vetX+r
         a7O9N9J62OdP3vg5oh3/pqbH2QR/dWVyyz0oJx5SmJmJEUqiTdmzlAWZvZOZi5g2nbxn
         FZQlgOwkVADERjSy43B6X+k3h37QDHdfhPMk8QUEjaPv6PyvJfXYJxzCuzVw+3ndEdSl
         oorQ==
X-Gm-Message-State: AOAM533fb8gRmd5H7dl7liM88deR6cjc5OxdyrxIXhPu9cuBtLXfHiXy
        HlsjOS5dr+mq/ztkNPpBhmvTXw==
X-Google-Smtp-Source: ABdhPJxq0v4beO0POw4hsb3hCl0lQ8XD44fhrCq1TpIxbL0Q4mkNacAibHXrIuhCxqblQ8niGyA1UQ==
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr2328015otq.216.1640186541634;
        Wed, 22 Dec 2021 07:22:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id ay40sm419308oib.1.2021.12.22.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 07:22:21 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.17
Date:   Wed, 22 Dec 2021 09:22:19 -0600
Message-Id: <20211222152219.3752973-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.17

for you to fetch changes up to 156f91f1c49a5f2ccae8e4b2d882ca3a28e3f26f:

  arm64: defconfig: Add SM8450 icc configs (2021-12-20 23:14:00 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.17

This enables GCC, TLMM pinctrl and the main interconnect provider for
the SM8450 platform.

----------------------------------------------------------------
Vinod Koul (3):
      arm64: defconfig: Add SM8450 GCC config
      arm64: defconfig: Add SM8450 pinctrl config
      arm64: defconfig: Add SM8450 icc configs

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
