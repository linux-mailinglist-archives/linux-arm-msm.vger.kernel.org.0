Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313691DC6CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 08:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgEUGE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 02:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgEUGE2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 02:04:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AD5C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 23:04:28 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x10so2426198plr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 23:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nqZNNCwraQG3DufLiaAWTHDtBPB7vJAuN049dNeWG7w=;
        b=R4eqdMGjaw2EyVbaOywCgxYajMNw0NCD3I+k0OdIjoHib6dMg1W7vBSiP83p+cfBcV
         dJbHRF3eALRT+4pIEAUzf4ItpVkH0YL6bnjWsU6mYBeYY1lf4k5mIOy1I5mG3U8uWDRp
         vbgKMhcT17954+UB7LGl1OVtxVdxT/GMm43q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nqZNNCwraQG3DufLiaAWTHDtBPB7vJAuN049dNeWG7w=;
        b=Wfb6r2oJL1QIJEldOMXLIA++N290fpUL/fvvFa760bevqV/+xydLVyj2tG/tN0oqxp
         gp/tTk1FIH46RH0nomBeN33JPgoJ5nh6P1HxGo+2eATzZ1q+wUlG4HY+yJopgWakxJsk
         KtbmJpwH66OD88KNKmNwgG8LFA968+oweQ7u57SCWPAC0OxbNu5Hdeg0LWKPmQw/kCyM
         kbVSkK1QEb/pnnl42IqKBiJ030XDXLeEX2lOITk9JruW27e8yc4ToFNsqq1Ik7ZDIEce
         0ndNJT0GoSX0cr2PfvA3Pjc+f1G8gExky/hmt9o9RZJSmQtEFxCJqW1QwWFL4POG/gWn
         P1Yg==
X-Gm-Message-State: AOAM532X8YBHttvZh4GW+CA1J+2LjKJv3UQf8aET5kVkLq1lEqwxXvfw
        6eGTSlTN5BXcQBd8xMuAlmXZLg==
X-Google-Smtp-Source: ABdhPJxEAYeVa9n3nR+7QkogEGUYWOfoC8AAfmkafGH8EBG4lJMs7GwiSqdKleFsw6yoIR1mwzV4uw==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr8886374pjb.236.1590041068007;
        Wed, 20 May 2020 23:04:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k18sm3590146pfg.217.2020.05.20.23.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 23:04:27 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3/RESEND 0/3] Even moar rpmh cleanups
Date:   Wed, 20 May 2020 23:04:22 -0700
Message-Id: <20200521060425.24285-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(Resent with more Ccs and To lines)

We remove the tcs_is_free() API and then do super micro optimizations on
the irq handler. I haven't tested anything here so most likely there's a
bug (again again)!

Changes from v2:
 * Went back in time and used the v1 patch for the first patch with
   the fixes to make it not so complicated

Changes from v1:
 * First patch became even moar complicated because it combines
   find_free_tcs() with the check for a request in flight
 * Fixed subject in patch 2
 * Put back unsigned long for bitmap operation to silence compiler
   warning
 * Picked up review tags

Stephen Boyd (3):
  soc: qcom: rpmh-rsc: Remove tcs_is_free() API
  soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
  soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition

 drivers/soc/qcom/rpmh-rsc.c | 65 +++++++++++++------------------------
 1 file changed, 22 insertions(+), 43 deletions(-)

Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>

base-commit: 1f7a3eb785e4a4e196729cd3d5ec97bd5f9f2940
-- 
Sent by a computer, using git, on the internet

