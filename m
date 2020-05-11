Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8581CD997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 14:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgEKMZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 08:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729343AbgEKMZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 08:25:32 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DA7C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:32 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q24so7705751pjd.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBbC+ezL0KWKqu+8vW0N3H42ESoBL1sfIZ3GqpH00rY=;
        b=bGYeTY6uUMYmDC8/JS2RcivTZxIUqiyAoYDMsewOLeVVKPx9RukMNkacaRde9KhMm9
         RF/ZHiwNHykgJedc/Ui4kZK9lJnx2FTBwgxBTppuXAQjaMGETOigUthGyJhxx1+MIY1t
         uML41c8mcwJiGpJ4Zg2ZQUzLdAv0VPk0N2v9777dfnHtUplRqX3+lyysRoQhD5oGT6GL
         XiJhMOIU6VSAb8PYfli5OAM0Y0AUPHDM4C9r+wgHxonXO5JGuSnhKslCQya9PSaDnsJm
         jdRklIPGjGt2w+eH2inBUUVMAykkCJGhL7pRya8JLTtQOjuIUMCAtxbXJzuADVBYEh4B
         RiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBbC+ezL0KWKqu+8vW0N3H42ESoBL1sfIZ3GqpH00rY=;
        b=Li5J+XGtxQTsHXg/SsoryfH32HgCBpFIR/jzsSeX40qYHxq9MJH5TlNsOZAzSsiuc8
         ZNqltgaoZ+h2t8pPhMJIXb/V76awbJr7ayqF8QFD6LBU7N6LYTQVSkbOe/n6NEl50tcy
         caZAZXnGBPEabGBuGFvZIPpnzn4KrwNMVXCf/xrdwpAHEcE0f/mb7S9sz9KVq8SnmswS
         HEH0FhfYTEzGtpVbPXzK2+9acvcO2lJXkd2MldNXpo++3yikO+KDqjX2OURBNYty1z8H
         anIAu2Rg4W/xInHEKV95U03Ij4E+3/1qDfKgh85pRY8jP7VZAKjyEHJFhukRGmCuikb4
         zhTg==
X-Gm-Message-State: AOAM5302czg04D8kMxcqHgGMnXwkvR4YCykoZdxMHMat1bqhuYGEuyxa
        E8AOaCXyC1IH/6gA3MJbhmsqSA==
X-Google-Smtp-Source: ABdhPJwRr4fdTX/Wgq4ithBxo6eAWgiaP0eWLWIqJboRv0uavun/vOVh59bDfEcIMKEZwrNxcnFW+g==
X-Received: by 2002:a17:902:8c8f:: with SMTP id t15mr1202490plo.183.1589199931586;
        Mon, 11 May 2020 05:25:31 -0700 (PDT)
Received: from localhost ([45.127.45.102])
        by smtp.gmail.com with ESMTPSA id e135sm9195880pfh.37.2020.05.11.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:25:30 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 00/14] thermal core include cleanups
Date:   Mon, 11 May 2020 17:54:48 +0530
Message-Id: <cover.1589199124.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I noticed some remnants from when thermal core could be modular. While
cleaning that up, I fixed up the includes to be sorted alphabetically and
included export.h in files that were using EXPORT_SYMBOL* or THIS_MODULE
while at the same time removing inclusion of module.h from core files.

Finally, the names of the source files for the governors and core have some
inconsistencies and the last couple of patches rename them.

Build and boot tested on some ARM boards.

Amit Kucheria (14):
  thermal/core: Get rid of MODULE_* tags
  thermal/core: Replace module.h with export.h
  thermal/drivers/thermal_helpers: Sort headers alphabetically
  thermal/drivers/thermal_helpers: Include export.h
  thermal/drivers/thermal_hwmon: Sort headers alphabetically
  thermal/drivers/thermal_hwmon: Include export.h
  thermal/drivers/clock_cooling: Sort headers alphabetically
  thermal/drivers/clock_cooling: Include export.h
  thermal/drivers/cpufreq_cooling: Sort headers alphabetically
  thermal/drivers/cpufreq_cooling: Replace module.h with export.h
  thermal/drivers/of-thermal: Sort headers alphabetically
  thermal/drivers/user_space: Sort headers alphabetically
  thermal/governors: Prefix all source files with gov_
  thermal/of: Rename of-thermal.c

 drivers/thermal/Makefile                               | 10 +++++-----
 drivers/thermal/clock_cooling.c                        |  3 ++-
 drivers/thermal/cpufreq_cooling.c                      | 10 +++++-----
 drivers/thermal/{fair_share.c => gov_fair_share.c}     |  0
 .../{power_allocator.c => gov_power_allocator.c}       |  0
 drivers/thermal/{step_wise.c => gov_step_wise.c}       |  0
 drivers/thermal/{user_space.c => gov_user_space.c}     |  2 +-
 drivers/thermal/thermal_core.c                         |  6 +-----
 drivers/thermal/thermal_helpers.c                      |  3 ++-
 drivers/thermal/thermal_hwmon.c                        |  6 ++++--
 drivers/thermal/{of-thermal.c => thermal_of.c}         | 10 +++++-----
 11 files changed, 25 insertions(+), 25 deletions(-)
 rename drivers/thermal/{fair_share.c => gov_fair_share.c} (100%)
 rename drivers/thermal/{power_allocator.c => gov_power_allocator.c} (100%)
 rename drivers/thermal/{step_wise.c => gov_step_wise.c} (100%)
 rename drivers/thermal/{user_space.c => gov_user_space.c} (100%)
 rename drivers/thermal/{of-thermal.c => thermal_of.c} (100%)

-- 
2.20.1

