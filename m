Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1F13538E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 18:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhDDQst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 12:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDQst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 12:48:49 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E744FC061756
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 09:48:44 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id v25so9689391oic.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbpeT+Mek+XfamFPZmReFCDXJFtqrtaG9wtcXHbtspw=;
        b=m+Dn/sje6Lm6a8Ehtytn3lZkENyRULhfOhPDdgsZ5z5oYte0AnICLQSi4Bn5AdL58J
         +CoBQ9rs7KPatBG7fG7ZPx2mjLoSPG9Wu69hmQ4aHlNu/3WDiuA8GHZ9YlnnXqi03msD
         NJeibO4qVVZ9kILn5yHlBilZaKEr+nCuhC6VrRC2BBVgJNVLrto/F9ubLo71miMNh91a
         ZAnFBP6xLNBGfnC8iShC4eNZ7IM2XcAKsPTbhvjCkK52gO8PtlXhfmUTkXhZLdcyk1xW
         hNjOsUmFSN7nP1FTsI6Z5kJeHZ6pDR0PeF23x1Dhy77+eeZDK04njiNWvlu5F/r6bKXf
         Picg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbpeT+Mek+XfamFPZmReFCDXJFtqrtaG9wtcXHbtspw=;
        b=BOHf4ASwMCBS7qcyPB3YI0c6p98VjRO7Cni3NJk68WKo3dnc7mqcFOwngNtMESpWvo
         PuHuALRjiYkIAk71cv7LqDJiAqP9RxYoThOAWrkCFk5PfVu/YuNjlmVDeqmMVWJamJJp
         00wxlCtTzWjLveT0AaJRcJ3xF5H0Oi7ELxDyTdSI36n8c2H4Jc6knAPe+dztoCqr37gu
         /TmppJXC31Q+brx4Gfw2HHQNM3fu59GvDTr7kdzMsQzMgy7rlY+BK4YphCwYB1mWeP8J
         eWQVlGcG0raIgZZhhXxzDSyJO2O3KXgIhWMXSyi6i5hZSP52WQUdrQNKrYkFJ0sjoUan
         tPhw==
X-Gm-Message-State: AOAM530gpmyuLvaJNOWFTcKeof5zFB66ribeyovoibEIvTSA739jKluv
        HUE9DYXNYoo4p3YrzdPakcrM/LvAx1/ZNA==
X-Google-Smtp-Source: ABdhPJy3Mi64WupJ/Hgn5dxMjnN3uch64bKtgIU0ITOjLlU9jvRjq65mBzceXINQyD0eKQZUQgC1Pw==
X-Received: by 2002:aca:e0d4:: with SMTP id x203mr15938867oig.76.1617554923162;
        Sun, 04 Apr 2021 09:48:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j72sm2672556oih.46.2021.04.04.09.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 09:48:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig udpate for 5.13
Date:   Sun,  4 Apr 2021 11:48:41 -0500
Message-Id: <20210404164841.712845-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.13

for you to fetch changes up to 1a0252abb6ff8312f28d4d8bc2b115ffa9c5d6c6:

  arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC (2021-03-08 10:45:28 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig udpate for 5.13

This enables the SM8350 TLMM and GCC drivers, needed to boot the
platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
