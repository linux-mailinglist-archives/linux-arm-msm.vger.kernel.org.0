Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5055E65C13B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 14:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236950AbjACNyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 08:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbjACNyE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 08:54:04 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129BE2AF2
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 05:54:03 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso16423356wmb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 05:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMu7RcER/cl1kN+bllDzAcw7/9MhSmZW1knQnwZ259Y=;
        b=Tgvdd7yCnWuRFtDRLX4oEg5COTW1ol2m+jpNYiUBsrIisRKetOqhvK4h8Ad9vcgLlh
         z2/Ua1Arw3Gl4SnjwcL7pH029Ll1g7OF0LcnSvmUj+RWQ3TDj90uns4uKfKyijqckIAl
         i2UTCrJYaUpDtQP/UtWnb0q490nczJcBzf6Qy7Aro9Ll7yk0XyTdTBsngrK34rO0CxQn
         CxnK1XdYyU2C9kOdmYOT59X3I4rews83I/CxLdVpDM3OvjqnkigqXnS2lpdJFKw+8f7R
         y3UwHljmFlDvOteqhOmHyJ0+Llq2brRMP7suAYodzEkxqq78nc0y4j35XRnV2QawYe4T
         Tpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMu7RcER/cl1kN+bllDzAcw7/9MhSmZW1knQnwZ259Y=;
        b=CE8NwVvT4Ll1zDJ/gMUofpioTPzf/5cDTMSKQTIyi5M5vI6Vl4nIg9bbASuD5hWWTG
         QSuVNImeZ7nV5velPUP+2l/BN99mig1eJBqRjzk3nb86f6wVBGlfEqK1PmQAMMq1p/DO
         TcwxFkYxw2Fa4wKWp5l3BteLcQl9QZJeodkVjNPAVoi5LXgvLjJZpZW2mUUMLO28UVdP
         C/h/vH8CldZCkKgSfdDfIpx7g2RHhoeB/3f3SNiNXqljQHaHL7BISA2pph1a0PSfCCrC
         3IEihx1sL69HJCUIkYhCCNPiYI98JUok5MSGdRNbrzk/hBOsvLUgOmKdcGEFG68YjTD5
         ycLQ==
X-Gm-Message-State: AFqh2kokDDE3MttpPrllYaJIIy/hQchDNkjN6RSRmojLebO6w9aL3n5h
        Rvo8+FthZzmGgTNlEylb44nQBg==
X-Google-Smtp-Source: AMrXdXuJU86oke/l326mC1sgIqn+MgNJNNtZs+PhUT8abk5ByPXXZjZCOpBgN8Ktxkl/LA7X22QM4g==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id ay9-20020a05600c1e0900b003cfb73fbf8fmr30985728wmb.7.1672754041529;
        Tue, 03 Jan 2023 05:54:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ay39-20020a05600c1e2700b003cfa80443a0sm42138195wmb.35.2023.01.03.05.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 05:54:00 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] clk: qcom: Add DISPCC driver for SM8550
Date:   Tue, 03 Jan 2023 14:53:58 +0100
Message-Id: <20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHYztGMC/x2NQQqDMBBFryKz7kBilJZepXSRjKMOaAwZLQXx7
 h26+fD+4r0TlKuwwrM5ofJHVLZs4G8N0BzzxCiDMbSuDc67gPtWhFDXR987PIruleOKg2ghws77
 FDqycXcwRYrKmGrMNJskH8tiZ6k8yvfffL2v6wfgQGJTgwAAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Display Clock Controller controller based on
downstream and upstream SM8450 driver.

To: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (3):
      dt-bindings: clock: document SM8550 DISPCC clock controller
      clk: qcom: clk-alpha-pll: define alias of LUCID OLE reset ops to EVO reset ops
      clk: qcom: add SM8550 DISPCC driver

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  106 ++
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-sm8550.c                   | 1814 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-dispcc.h     |  101 ++
 6 files changed, 2032 insertions(+)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230103-topic-sm8550-upstream-dispcc-411b34c1b307

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
