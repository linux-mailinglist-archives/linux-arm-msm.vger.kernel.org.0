Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A563EDEC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 22:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbhHPUvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 16:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhHPUvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 16:51:04 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7CDC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 13:50:32 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id bj40so28653356oib.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kmoyu7jA1eM6PaqAOcqPLI/aOuRdV7qLJPPT17KbiDI=;
        b=q2X7wvK9pcvNaogEd8Ar6JEEEeqLAc7E6w0HPK+t067zJfM+lR5RYCvNa0ufdOm9U7
         lrT7RUoj5+bRra73kvYEhHmdFZJ7NsaQaHiIMG4SyAjhY67XFWowwcAawb/oCc1YlaTe
         0UP4uJvpykvX6JiKfjDlg1SZ4GvUgmCvwme1qvw8TJ2hGGdqDuLgYs3upXZbqXhdoJpt
         XcVDWBsqiQqFhP3L7LJpI+4jOYImeR+1voO9JgefRjio3F4YWty+Ke5j6MLugTZakMuT
         Va2reXB+2++OEZ7mB6WScN7RZyuiGbFID1UkDDvIiQT2YPatmpecleqFYqoWuwfbCjPy
         J6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kmoyu7jA1eM6PaqAOcqPLI/aOuRdV7qLJPPT17KbiDI=;
        b=hUIGKQNUDmM9Uwz18K86raW7qrXhzV6qx5MGO7gkrjB3AgDtgWa2KP2ZiTWi+jMLcB
         /6kgI6ZGY13+BfJPG8YN+nY3tyYhZeF3IeirEILR5jIfUSC5rUKmfuHp0lRa6zQA2rar
         CigKmh+ivFZbzxgOe+VB2NUm10cUATO7Mj4Nt2U/a6E0eIVGOq87r8PpYGDGjLrTbopQ
         5NasIZGW2TvdAhRPvwFVyJNDwuGEKqKaMJITer0UATuHsmxjcMe/EVjSahTOXmrkj+Xe
         jl8O1ew8aadunnZGDebT7eDkwMZgfVFo5OrZVxPksVY4M5VsyLkJYS7WM7ZI15q//e+I
         lzTg==
X-Gm-Message-State: AOAM532km17Rntxklea47mfMLGyswhCOharBkWN2hfbwCsXmwwBxLjnD
        3URUiPeO/g2U8a3wCz1zh4PIhg==
X-Google-Smtp-Source: ABdhPJz10oI7Rxo2X6IakrDLahBN9gbmx3EWQdxvFF72jJraf0Rg5G3BCec9uWhOKhrnWsYakPvOFg==
X-Received: by 2002:a05:6808:56:: with SMTP id v22mr570895oic.49.1629147031966;
        Mon, 16 Aug 2021 13:50:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i19sm26244ooe.44.2021.08.16.13.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 13:50:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Sibi Sankar <sibis@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 fixes for v5.14
Date:   Mon, 16 Aug 2021 15:50:30 -0500
Message-Id: <20210816205030.576348-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.14

for you to fetch changes up to d77c95bf9a64d8620662151b2b10efd8221f4bcc:

  arm64: dts: qcom: sdm845-oneplus: fix reserved-mem (2021-08-05 10:36:04 -0500)

----------------------------------------------------------------
Qualcomm ARM64 fixes for v5.14

This fixes three regressions across Angler and Bullhead, introduced by
advancements in the platform definition. It then corrects the powerdown
GPIOs for the speaker amps on C630 and lastly fixes a typo that assigned
CPU7 in SC7280 to the wrong CPUfreq domain.

----------------------------------------------------------------
Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: fix reserved-mem

Petr Vorel (3):
      arm64: dts: qcom: msm8992-bullhead: Remove PSCI
      arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping
      arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Fixup cpufreq domain info for cpu7

Srinivas Kandagatla (1):
      arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x

 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts  |  4 ++--
 5 files changed, 21 insertions(+), 5 deletions(-)
