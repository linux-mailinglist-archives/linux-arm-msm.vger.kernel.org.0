Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCF93BB54E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 04:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhGECxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 22:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhGECxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 22:53:32 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B934C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 19:50:53 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 21so15503470pfp.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 19:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kIw+0ZT6BfmhVv7NysPEplzl6N6jfg0tZsoiOsyPHrE=;
        b=QzB1sCLQQMeASoLsv1TWRn0BgjoByZkPM2cz2Lt3nIvZUeHusloVyWsmizU64ogEL4
         iNGcxXwLHVtz6kKWDFWLcJXa6LGcwBum0L9FGebA2A7k1XQfb7tDuMkIZfTz35gUGiax
         RKgSZ7xmbHDf6frABcewhE1CbtdUiOf9TCxCq4GLfxM5MLNBilw+6ADGPhEUB/ih/rTi
         wFJnh25Y2/ccvnVE9TLFxanuUfJtY0k4QDHFO8Bqajc4+11JKDWtJMVZ+X/jqIdVDHfI
         oYX1TiRhTPMEK7UrAP1iYvLEc7cS+sDrAAIpQjUFnY5pAanOy2g/CbzvwW5ycodORhGX
         n1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kIw+0ZT6BfmhVv7NysPEplzl6N6jfg0tZsoiOsyPHrE=;
        b=W0XyN03DzF8pKMhOXcHpdPKvxf9ZzkkBKdKOfuEdhPfoLSiF7zUEpS+q+0YJz+hOrX
         6XsYEjd7yS8bLix0EhXPnshRpXrVyzlGRwnsFoWHwCZ3bc9hBvdfyrU7iROzPXF+McRg
         RMS3+F4nk4La9Ih7y14iiK+QN/bwIVmduWe5RV+1LmuLhABX4us6oOqm8b6MMi5BvY49
         iBkR0vvODOlPS0EAZgXeW6fd/VSQ7BILldtPde3x++OBPb9u6AMixCpI78PkkxQ08ro4
         ipsLu696PDZgdIB7vrFokaCuRRHYJ4Q+Ut8ypNdCsZ/BQYlyakol9CtjL85/Fg+Gtb/b
         C3KQ==
X-Gm-Message-State: AOAM530E/7cL0H764SV6ewpQ1nmcgm3LaTJWtrehRQ283k5vZ/ATT/+h
        lcrlwx2Ul0ofs6zTMrPjlTj0QA==
X-Google-Smtp-Source: ABdhPJwPypFsYbfYAt4nC5uRGoqKzLZCxMIeG3NKiaHuv8mWfUZg0KLffZpuXMhHzeEQBjivI3UjyA==
X-Received: by 2002:a63:6e09:: with SMTP id j9mr13146021pgc.275.1625453451383;
        Sun, 04 Jul 2021 19:50:51 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i13sm11891041pgm.26.2021.07.04.19.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 19:50:50 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] Add 'qcom,pon-reboot-not-used' support in PON driver
Date:   Mon,  5 Jul 2021 10:50:29 +0800
Message-Id: <20210705025032.12804-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's not always the case that reboot mode value gets stored in PON
register.  For example, Sony Xperia M4 Aqua phone (MSM8939) uses a
different set of mode values and stores them in IMEM.  The series adds
an optional DT property 'qcom,pon-reboot-not-used', and have PON driver
skip reboot-mode setup if the property is present.

Shawn Guo (3):
  dt-bindings: power: reset: Convert qcom,pon to DT schema
  dt-bindings: qcom,pon: Add 'qcom,pon-reboot-not-used' property
  power: reset: qcom-pon: Add support for 'qcom,pon-reboot-not-used'

 .../bindings/power/reset/qcom,pon.txt         | 49 -----------------
 .../bindings/power/reset/qcom,pon.yaml        | 53 +++++++++++++++++++
 drivers/power/reset/qcom-pon.c                |  9 ++++
 3 files changed, 62 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml

-- 
2.17.1

