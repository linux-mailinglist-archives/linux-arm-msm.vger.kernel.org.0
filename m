Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75BBB0594
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 00:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbfIKWck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 18:32:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38749 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbfIKWck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 18:32:40 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so14610534pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 15:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/bQw1cLtYl3A/83AJDVmJyoX1dKxkgmG5lvK3TLTKfU=;
        b=rfyz/8Y6c+xb9OzI5IP+lQyuY/4jk4SjFzwznzoKviS07fYRPcefDwgbO0/tpZoK6I
         Hr6j5zaXTQm8DKWwX7b+psY4sqYKmp13roe4mQ41hWiTxdOBxuQszZcYhn5O5lVNsdHD
         mF14GkPo2gMFttOdBFO17sLlkUOL48NDIiRooX1wnmYufhbTOE61Z2aSp+0ADr6Txoui
         ZGGcY16dhu3nAQyOPZCkPyQJXOH6YhZMnIXnCXNKx7aG7Rm051hRhPvIIdZb5HMfS2KC
         H2ZnpCSgPwFnSm8UwL9hpjvS83u8sgKB2JeVQOqBy3Br5fWywUXmmKmfK9iVuLw22wdI
         b+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/bQw1cLtYl3A/83AJDVmJyoX1dKxkgmG5lvK3TLTKfU=;
        b=MjquBqkStHUZcBNH+/Zhqrqh7YNx70l1tUC7XwF6l3bINzy1xkfHZnLxCa2KAZb+XW
         WPa2lTCVcbTaJRVgM+P2dUb+9Lo9Sb5DJIo2uGtj32a0v5dIct3ff32wJfx9K6E28O6g
         zndiEk07f5jI0Ygsb1Pgqdm1j1ekQc2ECL1iMbodFGDYcVbGZmOBlEesncpb9GxNp75W
         P2LFmbMQ0wcJDxpbiBjW2LCdhZ7TY89P9Pd9v9jCkqert1fetpaSvKCbRbb8tbck0TOw
         yg5CHs8+rwPkAddMcVcpHxvXPI+Xobwpfpc+vKlfoTVgvhFEJjMpicF1S7GRmjh1XQj7
         hOlA==
X-Gm-Message-State: APjAAAU1k24UJKtRy+R0wS9Z9nIWOSsmci3C8e5K15Wq+sEYup3gVqJM
        XXWjiOaWW7mhs0ds31YSnvk2Gw==
X-Google-Smtp-Source: APXvYqzUEXKAsnlMNfnDwvV9kBcQAdBfFiGL46JnjJS/6c6L7kK23lwN0m3iztut8dHj03BGHhCU4A==
X-Received: by 2002:a17:90b:308:: with SMTP id ay8mr8100469pjb.7.1568241159900;
        Wed, 11 Sep 2019 15:32:39 -0700 (PDT)
Received: from localhost ([49.248.179.160])
        by smtp.gmail.com with ESMTPSA id 20sm27074002pfh.72.2019.09.11.15.32.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 15:32:39 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/5] Initialise thermal framework earlier during boot
Date:   Thu, 12 Sep 2019 04:02:29 +0530
Message-Id: <cover.1568240476.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device boot needs to be as fast as possible while keeping under the thermal
envelope. Now that thermal framework is built-in to the kernel, we can
initialize it earlier to enable thermal mitigation during boot.

We also need the cpufreq HW drivers to be initialised earlier to act as the
cooling devices. This series only converts over the qcom-hw driver to
initialize earlier but can be extended to other platforms as well.


Amit Kucheria (4):
  cpufreq: Initialise the governors in core_initcall
  cpufreq: Initialize cpufreq-dt driver earlier
  clk: qcom: Initialise clock drivers earlier
  cpufreq: qcom-hw: Move driver initialisation earlier

Lina Iyer (1):
  thermal: Initialize thermal subsystem earlier

 drivers/clk/qcom/clk-rpmh.c            |  2 +-
 drivers/clk/qcom/gcc-qcs404.c          |  2 +-
 drivers/clk/qcom/gcc-sdm845.c          |  2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c   |  2 +-
 drivers/cpufreq/cpufreq_conservative.c |  2 +-
 drivers/cpufreq/cpufreq_ondemand.c     |  2 +-
 drivers/cpufreq/cpufreq_performance.c  |  2 +-
 drivers/cpufreq/cpufreq_powersave.c    |  2 +-
 drivers/cpufreq/cpufreq_userspace.c    |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |  2 +-
 drivers/thermal/thermal_core.c         | 41 +++++++++++++++-----------
 11 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.17.1

