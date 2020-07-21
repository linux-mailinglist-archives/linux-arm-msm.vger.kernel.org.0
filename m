Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2652277BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 06:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgGUEw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 00:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgGUEw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 00:52:27 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A315C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:52:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x9so9725662plr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vzvrl+wt1m0yXtLEhwGEXJ4N+ovRYisGzY9SBUF0wzI=;
        b=hxAJykwyFwle0JHJ8J9QS4x+UZqVyPIqh2pvRegrFap1ZwFLyCaHch6JK8Zkuh/Dvh
         CIMUSy5vZ2Nf2KBhjtXYvqpgmdT2VwWunrV0+6jSYlvMAjZ1IsCEEisB6yuXvv/yhvzH
         ONjXoLADlasMHT6FoPp4wNkRB8S2Lvo7iDdI15cNT3RyBI9VuTmi+Ztgbw8jgK2QBJCy
         ECh/k6q1HWTlxA7V1GHUH3Xz86NaVMGTZaYUblk7rdrR3w8FQ9eO+2Miw333JJnIkCwK
         PYJLDSHOpOv/vM/WK7wiXGBgjuB6NEa/JQDxADVlXo1mW9jZ3LWscVncxzuWuQLr4MG2
         tVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vzvrl+wt1m0yXtLEhwGEXJ4N+ovRYisGzY9SBUF0wzI=;
        b=doCE5khdtMfVgdMnY45npK3MlAxLsaiYhOsKsfQ4DCixFJyW4fI/3AUy/0Ym1vA2zJ
         cOXU8R/zAL3rq+QFsFYuw7rln0pZBVtyCriFMOO684iyQQRQDcebR41vqVgIG8zGb/RP
         4TJojwtv/I0TbpVabZ++VD870mRPYhATLGnyMfvro2FDAmEbb86p/PhBGvygFbwS2MTl
         LfL8J4u7e/E60T5UkXlM5gL3qHKBJ8KgbsR1Shjw3vYyJESBvKDUAvryAGz4B2jL2r0D
         29G3zQfhHsr9slC/OR7m/ZZyOWHvOCY71dexMBkml+foEYq6azjFuDo0MA9Dni42iRnP
         /NHQ==
X-Gm-Message-State: AOAM530LNp7TOG9CGMDM4UFudd+Bou01/pvfR5I7WfvjwT+yORkGoPv3
        jTDxVNwvwVjbQq/iUYZr792++g==
X-Google-Smtp-Source: ABdhPJzaVlXQ3i63kkM+90btaxWDU5KVy23DttAzcwDa7g7OF5nnb1n8SMQaJJ0IjDBmfO7RKZuysw==
X-Received: by 2002:a17:90b:19cc:: with SMTP id nm12mr2873309pjb.144.1595307146814;
        Mon, 20 Jul 2020 21:52:26 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z8sm17107761pgz.7.2020.07.20.21.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:52:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jonathan McDowell <noodles@earth.li>
Subject: [GIT PULL] Qualcomm ARM dts updates for v5.9
Date:   Mon, 20 Jul 2020 21:50:32 -0700
Message-Id: <20200721045032.3430395-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit cd13c72c1853f219e1f5577a107f48b9f9c44fdd:

  ARM: dts: qcom: msm8974-klte: Add max77826 pmic node (2020-04-21 00:23:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.9

for you to fetch changes up to 5de47779cf7cf9584f3a2f45124014480eab950b:

  ARM: dts: qcom: add qfprom definition to ipq806x (2020-06-21 00:31:15 -0700)

----------------------------------------------------------------
Qualcomm ARM dts updates for v5.9

Add QFPROM and ethernet for ipq8064 and a new DTS for the MikroTik
RB3011 using the same platform.

----------------------------------------------------------------
Jonathan McDowell (3):
      ARM: dts: qcom: add ethernet definitions to ipq8064
      ARM: dts: qcom: Add MikroTik RB3011
      ARM: dts: qcom: add qfprom definition to ipq806x

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 308 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi       | 115 +++++++++++
 3 files changed, 424 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
