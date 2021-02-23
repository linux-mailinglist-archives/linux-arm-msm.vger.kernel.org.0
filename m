Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32340323361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 22:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhBWVqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 16:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhBWVqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 16:46:22 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B26C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:41 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o10so56613pgg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jpEg8Delz5r/vSG/x3nH6tryNQYdmb+Hx+h2HjRiDRI=;
        b=Q/VZ67Fyvb95Mc8W53yyyIQhkVdqe6KoCgoNcXvUo+qY58ZsF5fJYIATNXE2CWuydk
         egl0BttIbPTYPFh7q1p24WPet2EeYtoNGhIGU+gv4G5Cw1wcWVM0xyrxxxJZxDgdRHU4
         KvQjPPqt8UunK2j/4vhGVr3fSvz7m1g9BRnh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jpEg8Delz5r/vSG/x3nH6tryNQYdmb+Hx+h2HjRiDRI=;
        b=Mx3fDwb3OmGeH7sk1nPJGBwT0Au4pMyHMWQDfh1najLM3HrJ59Ctkrah9zTVVfQ1eA
         1zsb0YweyyPd+3juYmQndeCw1WdSqhW0KODnBG/ocBwCnzthOQeFUzc3LW6D2MWjLDSg
         fTNrbUS0vRl6bJAptfOXIpxaEOv4JcRfWiSb8WfLahnuZgSVylRV4fpmxpLFbnWnWYfl
         SnHJ8Fdgdr1KFdATX3nxqkseN5oELxnpoNyqPWsNNCi42nbWNjkYM0K1uX/a1iJv++AN
         +WkyzuqsjoqL9axB74lBEWM6ShWbfh/Mjpr2pilQTJefwlsXgYSIzneTb/mvan3IpyMV
         qisw==
X-Gm-Message-State: AOAM533YR1s1LryCCGalUJJi6kHGtSco9FzbhPbEksib7qABPJha0Jfn
        NAfvM4KYBhFzOarr9YrcyWzlRw==
X-Google-Smtp-Source: ABdhPJzSAp1acaOYcKPm6hChdnsbeeaQyyU8l/c2HVTJpGJzJa+bijgMIsrc3lfvK7Adbmg/xJQIQw==
X-Received: by 2002:a05:6a00:16c7:b029:1b6:68a6:985a with SMTP id l7-20020a056a0016c7b02901b668a6985amr4091243pfc.44.1614116741449;
        Tue, 23 Feb 2021 13:45:41 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id r68sm137951pfc.49.2021.02.23.13.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 13:45:41 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/6] firmware: qcom_scm: Fix SMCCC detection on sc7180
Date:   Tue, 23 Feb 2021 13:45:33 -0800
Message-Id: <20210223214539.1336155-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The firmware that ships on sc7180 devices doesn't implement the smc call
that tells the kernel what calling convention is available. Instead, the
firmware returns an error code indicating the call isn't implemented
(that makes my head spin). To smooth things out here let's implement a
small workaround that checks the scm compatible string so we can force
the arm64 calling convention. This series also includes some fixes for
the "is call available" API because it doesn't seem to be used properly,
a documentation fix noticed while reading through the code, and
suppression of sysfs bind attributes to save us from rouge driver
removal.

Finally, the last patch is sort of an RFC, but I'd like to merge that
too so we can kick out the legacy API entirely on arm64 kernels. As far
as I know it isn't used so we can save some bytes by not compiling it or
using it unless the architecture is ARM. Let me know what you think.

Cc: Elliot Berman <eberman@codeaurora.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>

Stephen Boyd (6):
  firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
  firmware: qcom_scm: Reduce locking section for __get_convention()
  firmware: qcom_scm: Workaround lack of "is available" call on SC7180
  firmware: qcom_scm: Suppress sysfs bind attributes
  firmware: qcom_scm: Fix kernel-doc function names to match
  firmware: qcom_scm: Only compile legacy calls on ARM

 drivers/firmware/Makefile          |   4 +-
 drivers/firmware/qcom_scm-legacy.c | 137 ++++++++++++++++-
 drivers/firmware/qcom_scm-smc.c    |  12 +-
 drivers/firmware/qcom_scm.c        | 234 +++++++----------------------
 drivers/firmware/qcom_scm.h        |  40 ++++-
 include/linux/qcom_scm.h           |  21 ++-
 6 files changed, 247 insertions(+), 201 deletions(-)


base-commit: 3b9cdafb5358eb9f3790de2f728f765fef100731
-- 
https://chromeos.dev

