Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425F6303002
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 00:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732833AbhAYXVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 18:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732758AbhAYXVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 18:21:22 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6202FC061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 15:20:41 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id w124so16651904oia.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 15:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o4y3TSxNQdi+jql86zSjoCm2QszJJK7xRnAAsAbT1tw=;
        b=rmFEPXugDo5gY7Rv2TY34qw6TFNSw6s0EgRcXS5pB9t7vCMTKSfWbozn5F2qgyhAlD
         tfJCfjOeTxnH3lgOn8I7qAmOibraSltZ8WrpC2At80Qe71tJ9J6gK+DUnVrX9CxyRwY6
         372/rzPh48hqu32zTCotwoxBFjtr+ZC3+0ADWqcERz8ZEwX4c9wDdcJv4ieuQrq+YSjf
         fInTO94rVzxVSAPzdtgEgpRUGtImHj8/fs/riPjgvhdiGgn3QNQPI3i4iehttzd57nXF
         AGOt/iwUkMChhnszrrd8aN2qA9djp6g3WD4Scq6XtUHbTpRgDAUuAPQb2oAw8ooRv0s0
         N9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o4y3TSxNQdi+jql86zSjoCm2QszJJK7xRnAAsAbT1tw=;
        b=GCJMiGhm4MXmNTkHIZciNcxX685z3jlswAWpPf/D2nJUX/wfO8VAmVosl1D1icVhk4
         t3j9bjfzBapzRGqNNhU0I8JDHvfp+8Ik87ESwyxa2AOnJl1sxGIWKXLyNVun1GvYpqkm
         V9EYjEbL1qq7LiX2pBZugNSUAN+Rwe8zagjq1k01DagSZCnM1SxSMGHInDM9ro7ng62s
         1qbK8836RImX2wuEvjpkea9eFQ78cdw0FaeD3q7NZfqqpdaDaaQBTJBwDvUhsu25/Ed8
         Ag2/XFJlgtBO4KeMIvU7nVkxceJYq6U5/CzbnSjpwdMxItX3XoSauxPUFGOPMecU1zHs
         Rqfw==
X-Gm-Message-State: AOAM530EgbsdJ3f8/t3sooHvQmZKqXpRBGwd2o34X6Ej32vV9wnZfwfj
        GpBF6oaSl+mQzWALpjI4uRR4JJuOSDH0hg==
X-Google-Smtp-Source: ABdhPJxnC2Q8HaMXHJaw7jk0dINvH8qTCMJCZD6BUXqe03VmXL/q+lfxtulZyZJZaRtH5kUn8Au8ng==
X-Received: by 2002:aca:49d0:: with SMTP id w199mr1614981oia.61.1611616840830;
        Mon, 25 Jan 2021 15:20:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x141sm1807046oia.3.2021.01.25.15.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:20:40 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 fixes for 5.11
Date:   Mon, 25 Jan 2021 17:20:39 -0600
Message-Id: <20210125232039.642565-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.11

for you to fetch changes up to 93f2a11580a9732c1d90f9e01a7e9facc825658f:

  arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc (2021-01-13 00:20:13 -0600)

----------------------------------------------------------------
Qualcomm ARM64 fixes for 5.11

This fixes a regression in Lenovo Yoga C630, where the touchpad in some
units stopped working, by re-enabling the "tsc2" device.

It also marks the LPASS related clocks as protected to allow DB845c and
the Lenovo Yoga C630 to boot even if CONFIG_SDM_LPASSCC_845 is enabled.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc

Shawn Guo (1):
      arm64: dts: qcom: c630: keep both touchpad devices enabled

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           |  4 +++-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 14 +++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)
