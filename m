Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EAE211755
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 02:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgGBApe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 20:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgGBApd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 20:45:33 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBF2C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 17:45:33 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f2so10574361plr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PF6PVg6Qk3aczs+/e1HWRyzHNDndSGQClfFztHhcrJA=;
        b=IRRN360yDKEMQxG9gT3EO16qJfg/TcpVShQcjRB9jTaTvchyHFTq4oTBH0DuMRu0L/
         DxZN8IBFt5WiQaBOohCA3SM0pCeDKhTQvwGElidlfN1JBrTftIKRZ2qvUbF7dSX31Ovl
         unSwAWVPVUgZe91Kk8wFDpHNz8uN3oouD+ZyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PF6PVg6Qk3aczs+/e1HWRyzHNDndSGQClfFztHhcrJA=;
        b=XtUMxB8ZuyYUOzsyoMqYspa6OimpQWu94u0x81AdSXrtaZIuxutl38kQlcINUefXRp
         viH67MMR/sIlEqdM0SxRqjf4YWpckTbeaq51AFfENWUGB5Slh924lwS9q31CLswHl0cB
         5Q5uclTSsds7iIt1Ei0wbZINb2jGwYwE+A9rJIogumR+bG1y+r+DQO5mf2012e/eMm2F
         v13VDOtya/sTz5tvQGhJpdnggMZuMyzayG3q6DCC0d8B+oehFfDWMTCxxNINCrN16tR4
         3J7wIBOcNvxjGS7zl99e6OhEVW1Zyi2JRwB7477lP21MRFvjcjrMa/JGo988rfydzI7Y
         bxug==
X-Gm-Message-State: AOAM532tUpbNXwnxAmSUXvYJc7E2KfC8gWaGBleNpUbmKm33Y6vo6ckw
        uH8MRkSBthTEA4GDjtd80i3WzA==
X-Google-Smtp-Source: ABdhPJzPPKTtbw7LrsBUf0ic/Ijm1Yz9qx+hzC3WuV8qdS19siqcooPzbKzryXVcyy89dAYTRcTVbg==
X-Received: by 2002:a17:902:7896:: with SMTP id q22mr25007062pll.237.1593650732668;
        Wed, 01 Jul 2020 17:45:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id w4sm6966212pfd.39.2020.07.01.17.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 17:45:32 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     akashast@codeaurora.org, linux-arm-msm@vger.kernel.org,
        mkshah@codeaurora.org, swboyd@chromium.org,
        georgi.djakov@linaro.org, ctheegal@codeaurora.org,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 0/3] spi: spi-geni-qcom: Avoid a bunch of per-transfer overhead
Date:   Wed,  1 Jul 2020 17:45:06 -0700
Message-Id: <20200702004509.2333554-1-dianders@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series tries to reduce a whole bunch of overhead in each SPI
transfer.  Much of this overhead is new with the recent interconnect
changes, but even without those changes we still had some overhead
that we could avoid.  Let's avoid all of it.

These changes are atop the Qualcomm tree to avoid merge conflicts.  If
they look good, the most expedient way to land them is probably to get
Ack's from Mark and land then via the Qualcomm tree.

Most testing was done on the Chrome OS 5.4 tree, but sanity check was
done on mainline.


Douglas Anderson (3):
  spi: spi-geni-qcom: Avoid clock setting if not needed
  spi: spi-geni-qcom: Set an autosuspend delay of 250 ms
  spi: spi-geni-qcom: Get rid of most overhead in prepare_message()

 drivers/spi/spi-geni-qcom.c | 67 ++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

