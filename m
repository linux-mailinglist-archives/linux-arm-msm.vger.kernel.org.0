Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA76A43A81A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 01:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbhJYX1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 19:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbhJYX1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 19:27:36 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0130C061348
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 16:25:13 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w16so350157plg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 16:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BCxRPsSBo8R0jXRDbha92kpcMi7WqIaXL64kHlxgtM=;
        b=MgD/EnndEWPOuol0R3MjGsSXiZA88aSW/6PB++3IIkp/se7TI+seoHpw8euen4fq37
         PxUI8rRnp8WHyvweJ4+tWP/IFhyLARQvuL9v5UL3SPm56HkkwN2K4l97zS2KkxT5udnG
         UD3ZAartUjvEn8BuTvvgJo+O7NXHWz8WciQ+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BCxRPsSBo8R0jXRDbha92kpcMi7WqIaXL64kHlxgtM=;
        b=hCwcQ5gSLJwxNQgeHRkeWmrl+HJ+jGd7op3wgU+L1rYs9ZO/FrzPrpBgakALg2Z4DP
         dsAOKiIvnuvbbWkttQRxfpC+rlifV5pUHXXVlmOH9sW5L+HQHNwR651aP2pzFaoXng7/
         nPSBR5VX4joxKfY982xBBR7oJbvFEpxsCdQYlowKWrk8pZJkwz2rD/j6kKWwn7zDB71W
         m2udhqJjzRgOhxmw4pA/mh2RIMAA45Jc4ivVZPbLdAFAhwIggza+2hfy+U8OXoqMq4yt
         pg2HVf0Kvf0yAJWcFgJi/UAaLWROVNmGQ5fQvSki0ZzD+upTaLhiqdRmKnMDn6O5oBAl
         8gaA==
X-Gm-Message-State: AOAM532Kg7QkdJTequWD2dK1ADu7L+vIyqKNRvC7sNvEQ69GNWqdG+2/
        OV/AlAhLKfnXAvfgVXSXdEWw/A==
X-Google-Smtp-Source: ABdhPJwk7Lw6+8vuOgOb6DAh55PLDllEn0ZIlLVSIRPNwc6Rhlwx1EdCFwcqLlQbKc4gsdT4HU5s5w==
X-Received: by 2002:a17:902:e5c6:b0:140:7e1:fa12 with SMTP id u6-20020a170902e5c600b0014007e1fa12mr19237152plf.35.1635204312783;
        Mon, 25 Oct 2021 16:25:12 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:eac2:13a5:2214:747b])
        by smtp.gmail.com with ESMTPSA id ob5sm20891535pjb.30.2021.10.25.16.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:25:12 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/2] Fix two kernel warnings in glink driver
Date:   Mon, 25 Oct 2021 16:24:58 -0700
Message-Id: <20211025232500.1775231-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


These changes addresses kernel warnings which shows up after enabling
debug kernel. First one fixes use-after-free warning and second fixes
warning by updating cdev APIs



Sujit Kautkar (2):
  rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
  rpmsg: glink: Update cdev add/del API in
    rpmsg_ctrldev_release_device()

 drivers/rpmsg/qcom_glink_native.c | 5 ++++-
 drivers/rpmsg/rpmsg_char.c        | 5 ++---
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.31.0

