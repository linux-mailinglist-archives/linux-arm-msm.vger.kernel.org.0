Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424B420D863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387477AbgF2Tio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387445AbgF2Tho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:37:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657E0C02F00D
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 07:49:54 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id h4so1102372plt.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3fJ/I2vrkAAH9uk1HJLLiDrTeXGuyoHjfgPt3ah327I=;
        b=d4diFAwTzEbvNUfhvNWOVwEWM20x4OcdAZvLAdiOG28POc2/pvFAoa26NNXDYoGmtW
         1vNgf3GzUR9/1BveoCBHSvSwJWNdySbVbOdR5iR7XjS5Gog2aAV4zU44ufw3VB6b0e2B
         4QRa692faod7fCbsWhB9DSsngT5NaNQNczgDLIbveqDO6/vvfSCcVh/6a+MBjQZdOBZR
         T4PpVwuc3b14tnRaBFFONMtNFHHDJ8qgjPqq0EG14cXdON6Si8fe7qXbzk3Qf2Tchwxf
         XyiEzyb/Cgvl2uLhGhhuxCFEYMfJ9i23YRlqzhllfIw43gr5MnLo2msSXiblgYKi1y3J
         J61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3fJ/I2vrkAAH9uk1HJLLiDrTeXGuyoHjfgPt3ah327I=;
        b=dW2upeLwr2c0NIgymeXFshZmkCf9i6z8M/KhvtBmAus2UHEXCbOkw7fADgP9lKN0R+
         RzCdVU2QayCDnoY2OZk7cDIS9qoHtDonUI5ywFXyrozI3jZonjPBl9dSYf9kRXaDHe/8
         tm0sr4m91NmB8MZRsXBcx/yTX6RtmF8vH7mES3k4Gb7i+iVpw8QC7MEZJ8TWNE4P/aVf
         UYifrmUDRHvwmDSj39539KiNRIbqJgSMtczQVY0Yc6GGfU9qPHBskJFdnbCzPZKKVJpS
         n9TGLZ/jPHQ4NXvoSrnS44MVjH2oGAquXW5F52B1Iki7fxoFQjKKhvUgRjmhX46+0ehS
         CLVg==
X-Gm-Message-State: AOAM533Au+hXpOBiVntWgwCmledaV+I4K/jj4DzAioTAZu5lGR2k4Dup
        TgYMk9iFliCNlkAPE4pEvelH4w==
X-Google-Smtp-Source: ABdhPJyVmXMlFn2sqQ1esx5+2qFmxdNNX194F8X/qNfUQE8MsgVXP+Ge7HqvRjodmmAWlfNH5oPk3w==
X-Received: by 2002:a17:90a:21ef:: with SMTP id q102mr18491759pjc.101.1593442193952;
        Mon, 29 Jun 2020 07:49:53 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id bg6sm191614pjb.51.2020.06.29.07.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 07:49:53 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add msm8939 tsens support
Date:   Mon, 29 Jun 2020 22:49:24 +0800
Message-Id: <20200629144926.665-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's my version of msm8939 tsens series that supersides Konrad's [1].
The bindings one is taken from Konrad though.

Shawn

[1] https://lkml.org/lkml/2020/5/1/1213

Konrad Dybcio (1):
  dt-bindings: tsens: qcom: Document MSM8939 compatible

Shawn Guo (1):
  thermal: qcom: tsens-v0_1: Add support for MSM8939

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 drivers/thermal/qcom/tsens-v0_1.c             | 144 +++++++++++++++++-
 drivers/thermal/qcom/tsens.c                  |   3 +
 drivers/thermal/qcom/tsens.h                  |   2 +-
 4 files changed, 148 insertions(+), 2 deletions(-)

-- 
2.17.1

