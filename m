Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C321D8F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 07:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgESF1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 01:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgESF1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 01:27:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8740CC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 22:27:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id l73so781833pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 22:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2vog2Ri9IlYWlm16x+nWE4J9X1Hn0Mx2FQVvFcJuHk=;
        b=FT4SKc2ToN/s8tkRnP+yLFiYtCWtUqBarM8+cWRx8BQ8UCvrDq+w6KD6qPZCtS/Fjy
         sJzek8MBmQPdo6/B+Zb2aM1vdOoXeM/b+epi+H4OZZRwrf/ZsNpGAMEgF/F4s4iLniMF
         5VFAHju27XsW7im3sxHSOptozVRVB3W5qTdC/NVR5dHUBxhFp4Qqr348GRv3NeQrGIPR
         tR5jKbOsOmOwa2Qdg4UE1D8FWzZYACIbgjhWgKtuuz9m4vgZh+j8gz4AR8EfHiHcQ9FM
         0tz4na/4jRLHVe5fxxMsYQ7XXYrW1lNrK3MX++qs4ujZ3Ttlq8uGV0bVvBGK7HpukP0n
         6nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2vog2Ri9IlYWlm16x+nWE4J9X1Hn0Mx2FQVvFcJuHk=;
        b=WKv+oJYSOQQgeMatQh69oJgBtJXSG+0InhNEz0vYyBRCArXmBnkXS3urCi8rhz3MUO
         cf3LbVA/yB7mNsBX9eZThaObztmgWoE4ZG0GVWCYRtBGW5+L6mFzGRCxNahGl5zLJxLV
         thZ4SZ0u83CudNb9cPIb55PYLPD8DDMHPcyQkAzQ6G+LgxRr+RPipAgzxqxxZ8YIY7eE
         8NquE6PqT2m6SXkGEapFhjtJOl/uwazbQbftO83tfbyJaATo5zUQzqnyAsw3085j45le
         3BtBsR1X8x2mEnkagGzUU+Z2T0/n6SkoOdYYJbcusfLTWr7g73YDLZyQ1yfohE2x08dR
         JLOw==
X-Gm-Message-State: AOAM532E2VdypNa5Xf8lDP/ml3f+uBlga61b5RhfFrBbSalFtySaEiYe
        EL6GFdU8R6kxnvzCaEWNHvjILw==
X-Google-Smtp-Source: ABdhPJwMuyEr5qpyZilygNDQcs8MRuHwtC4LblBDYasXBuyhM8nMs4L6z5w2Ju5o13iWIu4WIK/6hA==
X-Received: by 2002:a17:902:ff09:: with SMTP id f9mr20398811plj.322.1589866019941;
        Mon, 18 May 2020 22:26:59 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z25sm9983081pfa.213.2020.05.18.22.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 22:26:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Daniele Debernardi <drebrez@gmail.com>,
        Abhishek Sahu <absahu@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [GIT PULL] Qualcomm ARM dts updates for v5.8
Date:   Mon, 18 May 2020 22:25:38 -0700
Message-Id: <20200519052538.1250076-1-bjorn.andersson@linaro.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.8

for you to fetch changes up to cd13c72c1853f219e1f5577a107f48b9f9c44fdd:

  ARM: dts: qcom: msm8974-klte: Add max77826 pmic node (2020-04-21 00:23:27 -0700)

----------------------------------------------------------------
Qualcomm ARM dts updates for v5.8

This adds SCM firmware node for IPQ806x and fixes the high resolution
timer for IPQ4019. Samsung Galaxy S5 gains regulators, eMMC and USB
support.

----------------------------------------------------------------
Abhishek Sahu (1):
      ARM: dts: qcom: ipq4019: fix high resolution timer

Ansuel Smith (1):
      ARM: dts: qcom: add scm definition to ipq806x

Daniele Debernardi (5):
      ARM: dts: qcom: msm8974-klte: Add pma8084 regulator nodes
      ARM: dts: qcom: msm8974-klte: Remove inherited vreg_boost node
      ARM: dts: qcom: msm8974-klte: Add gpio-keys nodes
      ARM: dts: qcom: msm8974-klte: Add sdhci1 node
      ARM: dts: qcom: msm8974-klte: Add USB node

Iskren Chernev (1):
      ARM: dts: qcom: msm8974-klte: Add max77826 pmic node

 arch/arm/boot/dts/qcom-ipq4019.dtsi             |   1 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi             |   6 +
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 405 +++++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi             |  11 +
 4 files changed, 421 insertions(+), 2 deletions(-)
