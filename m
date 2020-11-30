Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066E62C8DA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgK3TCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729797AbgK3TCg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:02:36 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92796C0617A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 11:01:50 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id h3so15324494oie.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFP3MCLy2EXZUBJtiDcAGWbpBsgwcvmKdFz2JF0dZBo=;
        b=TFDs0G0dDo8pJvrVvUZgEZ6YWnppxEFXN1bNY3taZwE/f6cs12KRXZP5OM2KSMSQYB
         kf6uXtYJmWM69CACQCv0+vzpgsKzGrwJBYRWeztj8CETIrCJ7ET7wjIZof+SsggZ0IoE
         R1sSPqLf2lWSn5QWrPLKDRKInJdIT+3eY1kFQXNcPTmZr0enG8qUKSAiU6RN/n/jGvO+
         vlrUKTIICxiNhkcZftLAgFPxx8T4uuKaHNwBvU6N+1hp21c5uBzCoJqRh2LnKv3fTgCi
         aiXu2lppvwXFlHtTU+Br9Rz+bk5d+hRAPqHJNi5VSqlTrJQBe5SFI2Oy2pzYsb6UK5vg
         iJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFP3MCLy2EXZUBJtiDcAGWbpBsgwcvmKdFz2JF0dZBo=;
        b=bL9M78Gg1Ns3j+vJMgleOXLERzzJ34b2UIZMKxcJeNvXxPpDWEGo/X8BteGq1bAfNV
         27jUJLUVr63tp2xVndcRIcLWsc/ie6a+gwLiGkJHdyJTvPgBqvK6vKA6eefq0aaKVY1H
         XKMcEzzaTeMnz8XYV/gP/88TBit9/SDyDcMVnOTiZx3UP+JCYuidZdwcInlmjcKWVQhi
         x2rxpBfbpXTFH68Ma08DBcbMIKjJC4tYqRWnhnBkVQ2nS6F1x0Qcpe/I5xmdnMW8NDB2
         rk6hEE4W+X38uP3udf3vYCTbYU4ddEzGAGXTAAO1Xx8K6+zVDdCxHmS3cwXEvJ4csr2A
         UCeA==
X-Gm-Message-State: AOAM533ir/tWHpBqwhAM4PVxM2iYdpmMgYxvInPKJv7h15P9AfmTFUxs
        pOZ+FGwOICBSHAxNj/GC4iZK5w==
X-Google-Smtp-Source: ABdhPJzBrobmA5HZtxJaMUTaf8v8ARuqGjgOc7Dn7ZiIprGRmFJesvN/bfb+4ePcxWJc1r+u6UsK6A==
X-Received: by 2002:a05:6808:a87:: with SMTP id q7mr205963oij.81.1606762909698;
        Mon, 30 Nov 2020 11:01:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p12sm9098717oti.35.2020.11.30.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:01:49 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kathiravan T <kathirav@codeaurora.org>
Subject: [GIT PULL] Qualcomm DT updates for 5.11
Date:   Mon, 30 Nov 2020 13:01:48 -0600
Message-Id: <20201130190148.345302-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.11

for you to fetch changes up to 74ab8ccfb8f3133acf8b2a2a7bcfba9c1710960d:

  arm64: dts: ipq6018: Add the QPIC peripheral nodes (2020-11-30 10:46:28 -0600)

----------------------------------------------------------------
Qualcomm DT updates for 5.11

This adds support for SD card, WiFi, LED, touchscreeni, touchkey and
fuel gauge to the Samsung Galaxy S5. Nexus 5 also gains fuel gauge
support.

Finally IPQ6016 gains support for the QPIC NAND controller.

----------------------------------------------------------------
Iskren Chernev (9):
      ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
      ARM: dts: qcom: msm8974-klte: Add support for touchkey
      ARM: dts: qcom: msm8974-klte: Add support for touchscreen
      ARM: dts: qcom: msm8974-klte: Add support for led
      ARM: dts: qcom: msm8974-klte: Add gpio expander chip
      ARM: dts: qcom: msm8974-klte: Add support for wifi
      ARM: dts: qcom: msm8974-klte: Add support for SD card
      ARM: dts: qcom: msm8974-klte: Add fuel gauge
      ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge

Jonathan Cameron (1):
      ARM: dts: qcom-pma8084: Drop incorrect use of io-channel-ranges

Kathiravan T (1):
      arm64: dts: ipq6018: Add the QPIC peripheral nodes

 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  25 ++
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 340 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |   1 -
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |  16 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  41 +++
 5 files changed, 413 insertions(+), 10 deletions(-)
