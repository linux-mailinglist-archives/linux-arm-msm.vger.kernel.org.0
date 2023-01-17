Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D9166E63A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 19:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbjAQSiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 13:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjAQScy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 13:32:54 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA31D53F90
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 10:04:40 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id q8so11136206wmo.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 10:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KBPtb5kB7phRN2HyeU727IaxXRKzBI0qHI+gXLYhw7Y=;
        b=ClpPpXyniScMXOMCRlplFUjOlwCjRSmBW9rMYR/cAmLHnmHaa2ASXhhoYZgW5AMz7D
         7/1/E7MwBpNSPAdz+Ye155/YRdxU1XL9V8955MblAQGUlVaQDiQE1oJki8WsfKbeRgX5
         i7fC3zAKp7KSgy3LzCJLRVcuTSt9kXDIrbO6+aQvd+7boGg00pItttB/7qGWlt6nWUCW
         O4H6RZtoGXg4WaSmkzd47EdA6WKM60SZDu00opIRR/cLXk55aLC416kpQ0jwBtEfVyRW
         4sSJGUSt+zyiHsCPIkmmpn974Oa83ih3eltGA3CrnfItJF+cBhVfbyzPJ66F8IH6Jzd2
         IDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBPtb5kB7phRN2HyeU727IaxXRKzBI0qHI+gXLYhw7Y=;
        b=BSQHikS9EI87a8Q4ZOr0aS4v7jV6m3059glT3NvDwcrx1BNx2hiTZ+9wZXPM4Y0x89
         nW5GYCB/RvAJaN0oPTNanO5Usf3fjNCSIm/9T5/W7guvt+0dc6irK+twXovYTDzhhnST
         lljAcBYiO2ry6+aqc8A2g4B6o9msuwWLw8o8YmFB1JUXwmXHrgyvzkWighYdI50D3tDE
         KHVirm7Yz4GYJEqSRjDNm/UXO8GrHlOJwOwfWzGvUfP7pTukPG6JIvsmsRSbXB1IvzJX
         CK9cEJrIzRvshAzCRgR5Lsv3HGr2lOs2L3nXi6wt4ZVzsJ3WwN3cipNXkk0P6KZ7nxj/
         skBQ==
X-Gm-Message-State: AFqh2koimTzf6KyPIM1k3Z+zPIiS66IyKNggJw+g5Eh4EKRg93bVd9gq
        eqycjGR0+GE84UEGMgwfVMaTeqTP3cfIu02C
X-Google-Smtp-Source: AMrXdXu3unw8WBLHAeJhgOLo9n3+ap345utf67uMWZmJFzFH8SfgPHxxfhGIk2SYm9ufTb+ARBg4gw==
X-Received: by 2002:a05:600c:3b1e:b0:3cf:497c:c4f5 with SMTP id m30-20020a05600c3b1e00b003cf497cc4f5mr4116868wms.13.1673978679194;
        Tue, 17 Jan 2023 10:04:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9236:abcb:4905:a64e])
        by smtp.gmail.com with ESMTPSA id bp28-20020a5d5a9c000000b00273cd321a1bsm29356681wrb.107.2023.01.17.10.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:04:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] qcom: sa8775p: add the GCC clock driver for Qualcomm SA8775P platforms
Date:   Tue, 17 Jan 2023 19:04:27 +0100
Message-Id: <20230117180429.305266-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the DT bindings and driver for the GCC clock on the sa8775p platform
from Qualcomm.

v1 -> v2:
- fix examples in DT bindings and make sure they pass tests
- use lowercase letters in hex numbers
- fix the name of DT compatible and headers (gcc-sa8775p -> sa8775p-gcc)
- fix licensing of DT bindings
- fix the regmap's max_register property
- use clk_regmap_phy_mux_ops where applicable
- other minor tweaks and improvements

Bartosz Golaszewski (1):
  dt-bindings: clock: qcom: document the GCC clock on Qualcomm sa8775p

Shazad Hussain (1):
  clk: qcom: add the GCC driver for sa8775p

 .../bindings/clock/qcom,sa8775p-gcc.yaml      |   79 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sa8775p.c                | 4805 +++++++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-gcc.h  |  320 ++
 5 files changed, 5214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-sa8775p.c
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-gcc.h

-- 
2.37.2

