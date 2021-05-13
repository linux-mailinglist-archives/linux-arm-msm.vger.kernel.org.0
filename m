Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E600437FCE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhEMRyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 13:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhEMRys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 13:54:48 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5CAC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:53:37 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id o59so986627qva.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLwTH/gQ19iEKMaz/qV61PTvp9y5sz4omGkvP7gez50=;
        b=s7lE0IO6lpihoUDmwGy9e6oqhnUDiidDF/UDwHWx1ULn+cYfAmqkJVWQa9Rett/Knk
         Pwp6T2aWnF117p1dok1CfB83GtHqRrnJt0yJXjTBi60rPrlUqWsv1tWU8BXnPiNg1bbq
         McNwhVGiFSqxfzQDd7Gm0vW57H9+pOMcqZ6z4mQ9Dm8DFNoX0k/RixvPLb8k6dkcCjcY
         pRzjg1VN1vFP+RHGQ96GjZX1aPVtFaEyxMbAWD4Sn3ODzEhi8G2lYxXbO/gus/dRznOM
         4fzDHglojuNcUrpVALsLh5fhcHMUj/P6TG1/SjB2HLz05fAZ63RfLRA7Nh0bPMlryZ15
         9NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLwTH/gQ19iEKMaz/qV61PTvp9y5sz4omGkvP7gez50=;
        b=D9p+lRarJtHKbsqIeMLxhhGnsewd+gw2k1U36n+Cqv7fgUjlS74D2dRDGyBWercPPN
         Q+HQLc3D0GY/EcsxYsrQLesC3OjQKxGO3fxN2HxHJMGDLMyLEh6JxrV5hp7pXu4nOoWt
         c2RudgzD7+Jue3wvYanGmc99PzO/x3mkSJIzGWkN8ArgiYnPghi64cbgaoNjqDkA0cXX
         USM/JsYsq3DLak1fHLxH74i0TzooZL4CGMIR36KGLSnCINwVkdJZDG2iUF0v6jIx9Bu8
         ZyUBQOb8ckBieMmoBv9Ci7f8aJM9R0cjLqN/LI2ZKrHhtXQP0qDg4P/TL017y8iA40CN
         DvVQ==
X-Gm-Message-State: AOAM531alMxakVdSN1jw5+oRs/8jZkGwRxPiV5q9j5qqpjLkzFZXGnHh
        bWd7Rp9hxZ4ISYptNwwP0mo6/iO3Dll8jmvQ4H8=
X-Google-Smtp-Source: ABdhPJy2680bpB24Wz9PUzNflK/5YmhpzCdwvjxM47ns5X1f6pEG6ks4oLS7/Ft4I7szLGpdSszYmQ==
X-Received: by 2002:ad4:4f2c:: with SMTP id fc12mr15523470qvb.49.1620928416053;
        Thu, 13 May 2021 10:53:36 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m67sm2778736qkd.108.2021.05.13.10.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:53:35 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/3] clk: qcom: Add camera clock controller driver for SM8250
Date:   Thu, 13 May 2021 13:52:52 -0400
Message-Id: <20210513175258.5842-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the camera clock controller found on SM8250.

Jonathan Marek (3):
  clk: qcom: clk-alpha-pll: add support for zonda pll
  dt-bindings: clock: add QCOM SM8250 camera clock bindings
  clk: qcom: Add camera clock controller driver for SM8250

 .../bindings/clock/qcom,camcc-sm8250.yaml     |   73 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8250.c               | 2456 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  245 ++
 drivers/clk/qcom/clk-alpha-pll.h              |    6 +
 include/dt-bindings/clock/qcom,camcc-sm8250.h |  138 +
 7 files changed, 2926 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8250.h

-- 
2.26.1

