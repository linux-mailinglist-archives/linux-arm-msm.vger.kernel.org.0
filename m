Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5026333517
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhCJFZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbhCJFZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:25:24 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31CC061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 21:25:24 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so6581719pjc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmRk4W9psPWHB+/Q1B7Q6YGKf/tXK67nMAE63UGJDWU=;
        b=HmOgRJjIG7OX0jjpBPFCcoNkZGVp9FjfUwR4gDs5cpJzHgHyQqkNjqE0q+5vj2gZsS
         xIumY9RzZ1zZlRXqP6McPi2HXAu1tVO6Xq/DfxMyAIofnQVm0L0qMgjMD744Sw8Ds1w8
         gCRUBY6d43wawzhoccso9X5MNTO3vutxcjzkH96MziYlSU2MLnBI+Gxnx8EEf5CDdz+Q
         3lqgTCsMHmoIotfQjaFu6+q30yU86HXDVblHD8iB26pm2btY5ejtRfVtdAnNaSKZMwdC
         96x1dpmFIthR4PShQrUCXo34CYDkeD6vsiqEBs152t4Hy95P86fsrTjb7D9RoKBUDm20
         /Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmRk4W9psPWHB+/Q1B7Q6YGKf/tXK67nMAE63UGJDWU=;
        b=HBuAYfXj/Gx0uI2TQb2XdRwe006lO9HJnOq71m4bE+vgJ3jduesPzqzUroDUI6k8pz
         4Cs47fN6XtBxBmDGVJ7KXZtrD8d3OHbotM9s8Z5LSFOk27mqwGVOIhjy6vkrSEfVaihz
         RIfbDebF8avtTQuj2SKQTqTI7+Kj0yVLyD9bOehwtDgDilY/Jgn5MhUStMp+eiwb0dSU
         CJY1TsfeObMVGZ7cOgqK/VjuecPcfIx2ONWfqgOrDwW8q5aevPGkHUl2X/CyPMn3Fy+3
         ETN/jOuMILTdYIVx3wcjA2ZI8wjncAGRktgjeRwXGqr2YT2PP1KIjwXp9zXoPlwz6CUy
         h78g==
X-Gm-Message-State: AOAM532Yms37ec53fltQOoXaCbhmh0jRkZM6Yw78lGFOMnnlvJTnP9px
        qKaO/VQJrIo4LVyH5FUQV3Bvh4mOf4N7gE1XkY4=
X-Google-Smtp-Source: ABdhPJyPBZ8rYvr2UCW1gOkvSX4hRlcWea4qu2bNh7MA1mhWDB3UAODRk9IL8RPxRR16pSQuHPo7vw==
X-Received: by 2002:a17:90a:c257:: with SMTP id d23mr1734557pjx.102.1615353924025;
        Tue, 09 Mar 2021 21:25:24 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:25:23 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 0/8] Enable Qualcomm Crypto Engine on sm8250
Date:   Wed, 10 Mar 2021 10:54:55 +0530
Message-Id: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm crypto engine is also available on sm8250 SoC.
It supports hardware accelerated algorithms for encryption
and authentication. It also provides support for aes, des, 3des
encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
authentication algorithms.

While at it, also make a minor fix in 'sdm845.dtsi', to make
sure it confirms with the other .dtsi files which expose
crypto nodes on qcom SoCs.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com

Bhupesh Sharma (8):
  dt-bindings: qcom-qce: Add 'iommus' to required properties
  dt-bindings: crypto : Add new compatible strings for qcom-qce
  arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
  dt-bindings/clock: qcom: sm8250: Add gcc clocks for sm8250 crypto
    block
  clk: qcom: clk-rpmh: Add CE clock on sm8250
  clk: qcom: Add gcc clocks for crypto block on sm8250
  drivers: crypto: qce: Enable support for crypto engine on sm8250.
  arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.

 .../devicetree/bindings/crypto/qcom-qce.txt   |  7 ++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 36 +++++++++++++++
 drivers/clk/qcom/clk-rpmh.c                   |  1 +
 drivers/clk/qcom/gcc-sm8250.c                 | 44 +++++++++++++++++++
 drivers/crypto/qce/core.c                     |  1 +
 include/dt-bindings/clock/qcom,gcc-sm8250.h   |  3 ++
 7 files changed, 93 insertions(+), 3 deletions(-)

-- 
2.29.2

