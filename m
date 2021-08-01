Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FBC3DCB29
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Aug 2021 12:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhHAKfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Aug 2021 06:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbhHAKfK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Aug 2021 06:35:10 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4DFC0613CF;
        Sun,  1 Aug 2021 03:35:02 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id o5so25966643ejy.2;
        Sun, 01 Aug 2021 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dW9enhfJrllCelpsKYJGBNZiqnu2wZkLbVkcvB/C17s=;
        b=Hhfn0YDBmJJwRgNS5s2VyXZr8YgPjQQNAxYU65yM0gFbVh3EuDpFhB0zJ8bRmC5YKB
         ypU13WQRpxXP4CaiU0VI21VSCTuUPXw/u0z1k2wGWU5RpkLO6CZmsvRgYutBGVf0EAxm
         eanKjo3RgpaMEN1oxDL32WkJA+SgSRx3qQkpfy7Nn8WJWYMh/fLp/9iVK+yCTjkRbdAq
         2m3mw2ASeL4xeZPOSgASEBiGOYhIIKVxdJEomHYHZMVEup3CuvMtS0PC8jxuGoerASrm
         7LC0TssJeqsnDEa7KTzZbpGc2qFQA8utcQ3sQUb/4sdAZ90rlrcsGCQQ/2iNNbN3rT9U
         hSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dW9enhfJrllCelpsKYJGBNZiqnu2wZkLbVkcvB/C17s=;
        b=oUuq7AdPeAe+NjoDb/BO6v/JefID6LBAnCiJwigCfIY3SkjZnTYyqp3uW6IZ3iu/V3
         IMsX7ISbhI4z1Dz8SU7lq3EsVDmKtS+zOXh0oA7TcrbdYVYeOwK6CzOIrX/R4MKbNIHv
         K1NufNPci5t0sNY1/FVlbebETFrapU0HYr9a+136qdzGUt2Kkq8ewjTbelSJ2scovcGa
         PrCnwJKwDdEdc1sD/SSvrr3/T/1R6PH23FHoSz26rl6y2pIQ8fOKcsYE9viEg+NWMM4o
         neIbYKhk9lFrBa1ENIKDhHArFYbbVDPjigj157yibsAFExekYWCT1skOCe8S/9Iw9JAt
         mbCg==
X-Gm-Message-State: AOAM530DVDa+09OVK2rLBpMEO9J35aHzvGrE2FbhCqf2nUeBiHdXmoH4
        i/QhEGwHnu3ZYt/zIqjhHjHoXi7ItPM07Q==
X-Google-Smtp-Source: ABdhPJy0SKgrEXetlOisF4GWqB2BGBMhWco35AWKpSH5pEZx9O12tPLqVL2xT6SmCYNUBY+GiD7icg==
X-Received: by 2002:a17:906:4784:: with SMTP id cw4mr10641567ejc.160.1627814101415;
        Sun, 01 Aug 2021 03:35:01 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id x13sm2892573ejv.64.2021.08.01.03.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 03:35:00 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 0/2] Add GCC for SM4250/6115
Date:   Sun,  1 Aug 2021 13:34:46 +0300
Message-Id: <20210801103448.3329333-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the Global Clock Controller on QCom SM4250 and
SM6115, codename bengal. The code is taken from OnePlus repo [1]. The two
platforms are identical so there is only one compat string.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

v1: https://lkml.org/lkml/2021/6/22/1131
v2: https://lkml.org/lkml/2021/6/27/157

Changes from v2:
- Suggested by Stephen Boyd
  - switch to parent_data in place of parent_names
- other
  - drop parent refs to invalid clocks
  - use pll-alpha regs when possible
  - drop unused parent defs
  - add pll test clock to bindings

Changes from v1:
- remove sm4250 compat, there will be a single sm6115.dtsi for both platforms

Iskren Chernev (2):
  dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
  clk: qcom: Add Global Clock controller (GCC) driver for SM6115

 .../bindings/clock/qcom,gcc-sm6115.yaml       |   74 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm6115.c                 | 3582 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm6115.h   |  201 +
 5 files changed, 3865 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h


base-commit: 8d4b477da1a807199ca60e0829357ce7aa6758d5
-- 
2.32.0

