Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFBE2906EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408663AbgJPOM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 10:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408656AbgJPOM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 10:12:57 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9599DC0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:12:55 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i1so3133132wro.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5OWg3ftk4N++cGTvtidW1nQcYwkBYUJIWAKoaAJoUU=;
        b=JB0ZR3FoUlW/JFBSJAimzbR9cTGbrAYD/+9uf2EoIqoJ/hRqQ1n3E8EfhHxfs8m3WL
         ycOGcMyutOnOYV8TG+udGFQep5jMCWMcsrw1tEeWiQX7ztGyvW/Fab3ECYyjEFerBa0O
         LP3CA5ItQsVYelucyJ7V4BneROyrhjIp2J6HokXuPtEw815t2I9TRxQZF6wkPzEfea87
         l6oNJGfs5EIRZBnDXu5Eim/z8rtxCP0SeQy4nU0qNPEZpDbTWlX1b6CTlDUDyttdjff/
         lkAl84CxVKuYFid5XUFVuVw8v0S8w1/yZjPvdcgEonFYC4K6nstJPdMfwkC1kJVm61+Q
         GmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5OWg3ftk4N++cGTvtidW1nQcYwkBYUJIWAKoaAJoUU=;
        b=S4Lr22uaKeEf1mkURnT5GQ/6gEeb/dGYqDup/EkBxgODiaNxwpresoV3Nt7LkenJKw
         7FEUYluT4khNos7ZmT6Hi2EmTkJT1gBPs9UHrE4y+A6LS6tOEDjPwwmYZNXmMKQmuAkX
         QAI+sZIigaISskGIcUxvtaEFpAWHWZyfWeZwgH49VpxLC8Pgqdjck8Y+aj3jzXk+68kA
         21WD4D5WwobDRFS+mFmDTZgfabFQ2i77FPdaxK/WwkR7G5IpQzTWvOie16CqOCOT3MKH
         qiWSjHLAL/QF1eGMFUT6zKZlr9tEc99QeSNtHtj9rdHTuYyjPP25/vbG/QghSNR9cs+m
         OHDg==
X-Gm-Message-State: AOAM533fUAYo2B5cVaqPdK7bolcI6WvwsSMHe8ZJjuYz9qDui/U5BAQW
        p2ntvzo0Q1ckvqeO9lHtzil4AA==
X-Google-Smtp-Source: ABdhPJw+syrWSIvIbwdzERHBMz7PuK0C0aRY/cQbmq/KeUEvG0vIAO0FlZzAWNzvuHTOUVhIHXJFEQ==
X-Received: by 2002:a5d:5090:: with SMTP id a16mr4005862wrt.281.1602857574137;
        Fri, 16 Oct 2020 07:12:54 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id p9sm2982284wma.12.2020.10.16.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:12:53 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/4] clk: qcom : add sm8250 LPASS GFM drivers
Date:   Fri, 16 Oct 2020 15:12:37 +0100
Message-Id: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds support for GFM Muxes found in LPASS
(Low Power Audio SubSystem) IP in Audio Clock Controller
and Always ON clock controller.

Clocks derived from these muxes are consumed by LPASS Digital Codec.
Currently the driver for Audio and Always ON clock controller only
supports GFM Muxes, however it should be easy to add more clock
support when required

Changes since v2:
- updated Kconfig text and help as suggested by Stephen
- removed unnecessary header file include
- use fw_name instead of name for parents
- use devm_platform_ioremap_resource

verified dt_binding_check to pass on linux master,

Srinivas Kandagatla (4):
  dt-bindings: clock: Add support for LPASS Audio Clock Controller
  dt-bindings: clock: Add support for LPASS Always ON Controller
  clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
  clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks

 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  58 ++++
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  58 ++++
 drivers/clk/qcom/Kconfig                      |   6 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 320 ++++++++++++++++++
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 +
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 +
 7 files changed, 467 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

-- 
2.21.0

