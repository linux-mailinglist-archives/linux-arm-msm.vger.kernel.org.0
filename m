Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0291A443A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 00:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhKBXy7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 19:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhKBXyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 19:54:54 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160C4C061205
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Nov 2021 16:52:19 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id s5so552975pfg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Nov 2021 16:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6UQroqUYGrr3QJudzaw6yU4iYpr07JScEfScZXkT+UQ=;
        b=IPdFYP2AyCzzjQhudRVvUZQ+/SAentjIBNjA1o9mRfK1gt1G3CYaffPElFKNIIfcl/
         WaDUhR0f+idyQvzNgKaDM+QkWZNGcos34w/J3BBL5DLNMsLwzdjd0f9DFeS0RPWokcDb
         1lDYAS3J/VohAT7jV+WaZQa6rHmB52JgEVkqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6UQroqUYGrr3QJudzaw6yU4iYpr07JScEfScZXkT+UQ=;
        b=sBNGs1xyBWJYwZSfIS54jIrylH1liddk/5TYPLZYT00k5EZQTnilRr/lQ0HDBG70N0
         SLuOESo/hJi59EY/rERDwiv9OrZhJPRhgdFfAU1kSREDaSCvYs96lYdAROXS/xa1fQVF
         5++4z35RWMDVRQmXzGNOzTHT+zE6gF1q61JxtuvE1Z3iY7MGZLhNFzk80rtGtagSy1MQ
         j2jgcAXntl5fVWhYYCW3F+wMh33FOCSPeeGNmKdJbCVf9KOzHCYpxUnMspE4ba3nRjmO
         rwOJLrtpBf27njOEqZYSyVbH5/1GBGXs/d9LAPjj7qijS6JhvXMJt3c+p27g3WXZSvk6
         YmjA==
X-Gm-Message-State: AOAM532kCNELHUD8yREN118gPphb98mEjNJ0xqtdG4WMzDqA9BFKS0FS
        IZ6tdWrUZWpH5jO7K1QLxNNAdQ==
X-Google-Smtp-Source: ABdhPJxyMhVeuKF42P9cfTErk6OuOI4qow1gw/KJl6Tb6Ve2xhsLm2wmaY+gee6fTO32o9lMf8bsHA==
X-Received: by 2002:a05:6a00:8c7:b0:44c:a7f9:d8d1 with SMTP id s7-20020a056a0008c700b0044ca7f9d8d1mr39918248pfu.49.1635897138571;
        Tue, 02 Nov 2021 16:52:18 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:c31d:1b47:2691:7a67])
        by smtp.gmail.com with ESMTPSA id z73sm176381pgz.23.2021.11.02.16.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 16:52:18 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 0/2] Fix two kernel warnings in glink driver
Date:   Tue,  2 Nov 2021 16:51:47 -0700
Message-Id: <20211102235147.872921-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These changes addresses kernel warnings which shows up after enabling
debug kernel. First one fixes use-after-free warning and second fixes
warning by updating cdev APIs

Changes in v3:
- Clear ept pointers in patch 1
- Remove error check in patch 2

Changes in v2:
- Fix typo in commit message

Sujit Kautkar (2):
  rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
  rpmsg: glink: Update cdev add/del API in
    rpmsg_ctrldev_release_device()

 drivers/rpmsg/qcom_glink_native.c | 12 ++++++++++--
 drivers/rpmsg/rpmsg_char.c        | 10 ++--------
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.31.0

