Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE613646EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 17:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240871AbhDSPRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 11:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240908AbhDSPRK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 11:17:10 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EF1C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 08:16:39 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 35-20020a9d05260000b029029c82502d7bso1468689otw.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=;
        b=qK8ZVxyb1cccHQVc9o2z+qY7KHg0bcdEBOIfJh6IVdSgxKOiEU2kqIyTjdbE5SB1+g
         1lmzUiWqAD3t614GUtXyLoNnpXfPD8BJo1xAlvh77ialpsIJkzEzFw37QDaU6DsqWgd2
         pG2HExBwN1RO1ehEAw3gywro8qPl5gcr+MWNE/SVjdE7rAxBCnFmRbDvUBWuAusr4YXE
         LggGQ49k9/jtUmkItfjr8qmRyjEpuQ/dFZLUcmY9QpqlWr53SYki+JPgsxich089VHP8
         OgGupZnKFT/mxZ24myOUFqiUa8nRC4ulH3IbimiRnzNZKYc7HKNqwHCOweH395hJqDAA
         jR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=;
        b=HCZYUavN2Yj+WnMcKnJQIaU7z/AKJtxFKwwr6fVPE2i97fkvjvEj/20GwO+Cqb5uOU
         Mvaf3zPyUwxEqCEm5MBOk/P3FE2yLJICHa6NHkoGd2ec4GUgvVfa+KFCUfedcbI1fdDB
         zfmE18TGUYEegIi707t4RksZXHxU5dSr/8j2jgFHfYhUJzMLQU5n2gL/k+q8Nhpz2jYI
         G0TA5+n5BaoICvyUW2kCPzWK9RA+mL1b0Ji5JjLcgbRuR2HVgk95uScB3iX4OrlTI5kO
         4LL7LbDxfxbPechf+VSXSDBuX0QsoCSsCuPlTGLDMQgKkZw7zfGj49gSqkbpB1WpzAst
         GrFQ==
X-Gm-Message-State: AOAM530Xk6bOiPgRJBNgACSloTNbVJCwxu3kMSZ7tMwaL8+gbd2soJRW
        uTT+7kQ5pfvWjHkIdObk7A2+ZxECdrzV5Q==
X-Google-Smtp-Source: ABdhPJzuOipDCJfrbVe//1UzrkYBYdbiB7EsZv1E5ZmnOoKZR56/O11HaIo0Z7WFKLdEhXGyJhGeMA==
X-Received: by 2002:a9d:5a10:: with SMTP id v16mr15145401oth.187.1618845398855;
        Mon, 19 Apr 2021 08:16:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u18sm3008660oor.15.2021.04.19.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:16:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [GIT PULL] Even more Qualcomm ARM64 updates for v5.13
Date:   Mon, 19 Apr 2021 10:16:37 -0500
Message-Id: <20210419151637.861409-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 7178d4cc0702bfe6a7e0f21e37d6e3dfe8e40f11:

  arm64: dts: qcom: update usb qmp phy clock-cells property (2021-04-08 10:23:25 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-3

for you to fetch changes up to 1b86cc7330895b11df0a7dc15fbbbef60be9f7bb:

  arm64: dts: qcom: sc7180: Update iommu property for simultaneous playback (2021-04-19 10:13:30 -0500)

----------------------------------------------------------------
Even more Qualcomm ARM64 updates for v5.13

This contains three audio related fixes for the sc7180 Trogdor devices.

----------------------------------------------------------------
Douglas Anderson (2):
      arm64: dts: qcom: sc7180: coachz: Add "dmic_clk_en"
      arm64: dts: qcom: sc7180: pompom: Add "dmic_clk_en" + sound model

V Sujith Kumar Reddy (1):
      arm64: dts: qcom: sc7180: Update iommu property for simultaneous playback

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 13 -------------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi   |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                  |  3 ++-
 4 files changed, 25 insertions(+), 14 deletions(-)
