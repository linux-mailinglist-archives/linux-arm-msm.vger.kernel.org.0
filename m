Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F2A3BAAE6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 04:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhGDCnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 22:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhGDCnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 22:43:20 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE45C061764
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jul 2021 19:40:45 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id f17so1739780pfj.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jul 2021 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uU2NpTsvF59o2UDF/rj+QinI8SocqNRod9hipss6dI8=;
        b=pbp6maqFDT5zuP/ZrL5tV9rHjvjUduTwnLhwaeC8P1nZQU+quf2RBzPUpl4YI1jjvx
         54dnlZzo+VTylHTUWvm329o0x/FXj+42aEOBN8Hfqpn5YO1E+7DMxvwCI61SqcMzjStT
         w0amGTB4ovAxCGANkd5GAFhsW+j0IQKn/XOhj/tKySjxH9TNfNWM0QNBGxHtEYuaOInB
         u3pAcdQ2CM8XLgwIrPnGtiYxLnrxV7jazFsAzPzF82UeduVO7nxcOp+QRYD1AWpDjGMx
         5yfFo+H++WIZGxV0FHEKuDuFXMGTV7tMr/g0xSm3M/6VKLaRM4H/VT2GcZHFW9FyYvCK
         AtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uU2NpTsvF59o2UDF/rj+QinI8SocqNRod9hipss6dI8=;
        b=dbsnYuoOzxwGY8ZBT23CJLiDEQzpDgBFFsMyFRunphaMg3M0oJ8yBkPAJk7x7fcV3Q
         sHng/5ZRtNKrKDG4dTgPUEgKMTLHBJvjix/NQ6XaJqBk/0p9HfdKIbc9A+FXG/SvJlzk
         w/RJOe26y0zY14zcnstYSxAyRpuGnnqxkkqzDuBFbLuKB7GsYNUswOIrlWaSUDJILsA+
         4TziPBBS9xsRPVSYbXpd/RzG/KreVloiJn4JMPqnsQcm0uHXhi6M1MdfqpGJbpfiONd8
         syP7ciuPwsJt72nr0Fvj94SKSAb6uonyOYQXGY2HNhlKx0bxQwA5syx6UYNGMKnwfA6c
         QfAA==
X-Gm-Message-State: AOAM533/yBO9sScsAJZL6yHx5qAiTQNOl5FEseSVZDrzU0BJsoaUzp4l
        YXejTuVFymlq4Gs/cqIGClm3FA==
X-Google-Smtp-Source: ABdhPJwemRyLkkvqTWv+WSoRHmb6LSFLzTrS3NzI2cS3xpY4VQrMzxWJYFxyhduWhnwLwYm75XvF0w==
X-Received: by 2002:a05:6a00:1c45:b029:31c:5106:e354 with SMTP id s5-20020a056a001c45b029031c5106e354mr1865849pfw.15.1625366444025;
        Sat, 03 Jul 2021 19:40:44 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g17sm9394624pgh.61.2021.07.03.19.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 19:40:43 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/4] Add MSM8939 APCS/A53PLL clock support
Date:   Sun,  4 Jul 2021 10:40:28 +0800
Message-Id: <20210704024032.11559-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
(little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
respectively.

Changes for v2:
- Reword the commit log of first patch as suggested by Stephen.
- Drop 'clock-output-names' bindings and use @unit-address to get unique
  a53pll/mux clock names.
- Use 'operating-points-v2' bindings to pass frequency table via OPP, so
  that we can use one single compatible for all 3 MSM8939 a53pll.

Shawn Guo (4):
  clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
  clk: qcom: a53pll/mux: Use unique clock name
  dt-bindings: clock: Update qcom,a53pll bindings for MSM8939 support
  clk: qcom: a53-pll: Add MSM8939 a53pll support

 .../bindings/clock/qcom,a53pll.yaml           |  3 +
 drivers/clk/qcom/a53-pll.c                    | 68 ++++++++++++++++++-
 drivers/clk/qcom/apcs-msm8916.c               | 10 ++-
 3 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.17.1

