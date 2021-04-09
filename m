Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0500635A312
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 18:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhDIQYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 12:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbhDIQYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 12:24:14 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CE2C061761
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 09:24:01 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id t23-20020a0568301e37b02901b65ab30024so6231552otr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=;
        b=hZgYtwqOtVrF1pzF5T7/4V/VIp2inE0KuoTdLnWgd4iRf/mGWlTnb1O+/de+6KxLs/
         3j8V6Zs8GGDzqDieeP04oA3ok9P5T3Hg2iPyDezkPUSe7BdkpvHjp1gIJSi7w1jn/qb0
         T1tUwRVkTlgOAcv6fnY3PeDxKJLskGg/8a0iQ6Fzdb3cTDuVhs+a/yNNhLxuIQk+jfcH
         oZpgIYZGHFCHK71fWTxNSuLo7aASY0zJ8P3/8FcgdP/QeAqiZ4fWeyfhko+cEM1rdrcd
         x1GgAmtBrNH3r/AsQPGmpw1krdptjojrNWSCvnuSI8sGcplmyHVSsNPtoLtAHdGv5uKu
         fBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=;
        b=nYlunR/J1fRlQfK+dN8dKsNf62wuGga+vdWndA73/D9zT4eNZV1SvLBLsGZjf5lq/2
         aWUVXBwKXwCbGgdc3PpsoeEcuVaV7R0ts43BxXTP3wFQ/QwYYND7suzqql/zpv6B5rY0
         hqvTRNhSj720jahxbRkK3Iy8D2ojpaBfB/72pT6eRVWfNx+JXlJ+1IXK6XRZQIxT+nAL
         MuMxuhkiHB95fNAxLEzHTRQ6ATfT1P+svUNnG3GR6dvubTfrHTsccZ09Wjtx+7ZC26e3
         2/d+jI/ceXK7nrASLKJbalqez6HLu8nMnmRzMxWSbxUE+ZrYc0uJ+feWmtv/h2kqzI4y
         Z5sg==
X-Gm-Message-State: AOAM530PVq+P4RI050TgbLuliVTX6vIBhpEMdlypgCFf7y+YtpY/ZOP8
        APxXkVyHAnETAZpVJU0VEwKQZC4BCPxPqQ==
X-Google-Smtp-Source: ABdhPJzQGYVHkW5E8c3uvfg8c4PpdRxpEzWwlO+LYuXEFyNGtD4lDGhOJhYs7GqhzECZsUTCwZivIA==
X-Received: by 2002:a9d:550f:: with SMTP id l15mr1059901oth.11.1617985440571;
        Fri, 09 Apr 2021 09:24:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g21sm715196oti.19.2021.04.09.09.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:24:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm dts updates for v5.13
Date:   Fri,  9 Apr 2021 11:23:59 -0500
Message-Id: <20210409162359.776076-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13

for you to fetch changes up to 885aae6860fae1eed38f5cc1ac09a40e4896a38c:

  ARM: dts: qcom: msm8974-klte: Add bluetooth support (2021-04-06 11:53:16 -0500)

----------------------------------------------------------------
Qualcomm dts updates for v5.13

This adds Bluetooth support on the Samsung Galaxy S5, corrects the mount
matrix for the IMU on Nexus 5 and corrects the fuel gauge irq trigger
for the two devices.

----------------------------------------------------------------
Alexey Minnekhanov (2):
      ARM: dts: qcom: msm8974: add blsp2_uart8
      ARM: dts: qcom: msm8974-klte: Add bluetooth support

Krzysztof Kozlowski (2):
      ARM: dts: qcom: msm8974-lge-nexus5: correct fuel gauge interrupt trigger level
      ARM: dts: qcom: msm8974-samsung-klte: correct fuel gauge interrupt trigger level

Luca Weiss (1):
      ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU

 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  6 ++-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 52 +++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  9 ++++
 3 files changed, 65 insertions(+), 2 deletions(-)
