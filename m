Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A0928DD05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgJNJV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731132AbgJNJVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:21:55 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C284C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:26:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so507975pgb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoAVR9AHVrF5AmfQOiW6xvU4LK/5cY35UObNq6NT9XE=;
        b=EQTxzxUuIKTcB+XY70IZK53ZA9IwEFA63ysUwVxyS6E2XHi8jvNKV1KDaWxPQOMZwa
         DpWi781oIYquJ8RoAVv9BkQ8pmtZdjPU+u2OYk/cOqkvKpFXOplZdLqRCARtqWwa6WM8
         M7r+0Nwo0XKiYriJXGI2rMUfGAmFqR3fW0Wl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoAVR9AHVrF5AmfQOiW6xvU4LK/5cY35UObNq6NT9XE=;
        b=gplF4yELAMQqTr+w0P1VA4QwcI7bl3q91ObmfRC9HcHf4SjqEdOkMlJKMiH3DX/Doy
         5UZxmdml4ct2ycy5tBR1/Dq/LWdvQ/cfJY4lEVJdUnQ2PQpEGCXUg/iHzkAUbHJFkrfa
         +1bNbncNzyQyvfRZqxZgfRQIxYig7EsNgB0XgoxzV5y/94+n01cQvh4EYBf4JLBqauBD
         MogmPAIs6rC6uWPhI3a9tIZ3GbbhxzsGTZTV5DR3JAgSckNNxdF7Jf2/IuepzV4oy5SO
         2SIOOtK241tWU3r6Nqw8bK7c4okbCkLKgAGER9eqW49m+QgCbP01bFnKThuslfVd4ofR
         2PqQ==
X-Gm-Message-State: AOAM533dLd2o3b6oJFARDIgMPGBkI/dszyvWL9X8JPSyjty/13hOEBUN
        RWXGf4kgs825XwercQrCQAYYoQ==
X-Google-Smtp-Source: ABdhPJxjpE+t6tSF6IoGOjD0t+fTHO4qbXOhNCwIJqg8rHVYSn4dWpiqWHiGitjlRTuGvKhaxa/vBA==
X-Received: by 2002:a63:fe49:: with SMTP id x9mr1177056pgj.192.1602624381982;
        Tue, 13 Oct 2020 14:26:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id b15sm167713pju.16.2020.10.13.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 14:26:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i2c: i2c-qcom-geni: More properly fix the DMA race
Date:   Tue, 13 Oct 2020 14:25:27 -0700
Message-Id: <20201013212531.428538-1-dianders@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Previously I landed commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA
transfer race") to fix a race we were seeing.  While that most
definitely fixed the race we were seeing, it looks like it causes
problems in the TX path, which we didn't stress test until we started
trying to update firmware on devices.

Let's revert that patch and try another way: fix the original problem
by disabling the interrupts that aren't relevant to DMA transfers.
Now we can stress both TX and RX cases and see no problems.  I also
can't find any place to put an msleep() that causes problems anymore.

Since this problem only affects i2c, I'm hoping for an Ack from Bjorn
and then all these patches can go through the i2c tree.  However, if
maintainers want to work a different way out to land that's OK too.

NOTE: the 3rd patch in the series could certianly be squashed with
patch #1 or I could re-order / rejigger.  To me it seemed like a good
idea to first fix the probelm (and make the two functions as much of
an inverse as possible) and later try to clean things up.  Yell if you
want something different.

Changes in v2:
- Consistently use "val_old" to keep track of old value.
- Add comments about why UART is special.

Douglas Anderson (3):
  soc: qcom: geni: More properly switch to DMA mode
  Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
  soc: qcom: geni: Optimize/comment select fifo/dma mode

 drivers/i2c/busses/i2c-qcom-geni.c |  6 ++--
 drivers/soc/qcom/qcom-geni-se.c    | 55 ++++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 18 deletions(-)

-- 
2.28.0.1011.ga647a8990f-goog

