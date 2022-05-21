Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0408E52FD9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244961AbiEUPOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244879AbiEUPOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:14:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC26456210
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y32so18776723lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVrVm4lSXqU5biEI9mdh0jre39IASlXjjmo6QOig9Tg=;
        b=SwTmFKXT+/5fPsDfWxS6xOsleNDsDZUYcGxqWB5+m2IiMPPvVJSxl8+NeJeue960sT
         7fusG/WujXGe5l3qNTROQu+D5AaPYqrzxEyRbl9NEj52/BIGjbiO5JGjOGDttT5qpQnL
         eUiVj1w+gbv7wWzhCE7aEnCz35y2OPYvcSRauHMv0OOTttkVbHo/JQ9WxH+/XjcF2hsU
         sBma0pWirzLqONUe23yxMNpMR8JP4NeftMuXC+UfC7NGUKamwClp1DJoko2J1fhxyy6m
         HEqqIBEvkAWyLEUckCIz+P0ohCYQCb24WpWDsvUDA0vmiXYMtYmp7i5Hd915cKVerxbz
         kvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVrVm4lSXqU5biEI9mdh0jre39IASlXjjmo6QOig9Tg=;
        b=DLJ9TJpwkAiUJbluxCakLaektjqqSNedTiSOkm/J01llG4aHhOQfIOvybvxuAdrbRF
         WnOCfvcyF2jJuPPAa7VIed7UV3XgUWriY3KzAyfOlvh0whrRqQSvAq8FJA+gE5GWknfh
         fQOtqleDevV39LRERxK6JEh3i7i+O79V6PSG6J66J1AAagqtGDcBiUlns1h9KbqeKkJJ
         yQQ3nyssMS+0jWI478DYbGfKrS+rE/oL4ctG7Na/7hGg2kNlCEV8h2vah+f4KtUN9qMd
         suKMFiDrdnQ6+Q/hKKcOeDh0NOE1bmPAcU1UX8CUUwGIWXQK6jsNpjuL/nx//nENaAML
         NYdQ==
X-Gm-Message-State: AOAM533RJcnpDSOWJb5ceRkXYYMiHg2Ajm+HN5UlaePRHp8Lt4Ep9a2g
        ERBnsPLY1xA5no7qIXD8o5NTrA==
X-Google-Smtp-Source: ABdhPJyxroTl2iSpRmG+DIWc3EEE2wlSHABfRDwZDTTP7JwHUOuhvZnNzsDi1ATHf4/MvY7fLFLv+w==
X-Received: by 2002:a05:6512:1321:b0:477:9f1a:a5dd with SMTP id x33-20020a056512132100b004779f1aa5ddmr10623558lfu.443.1653146080255;
        Sat, 21 May 2022 08:14:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 0/4] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Sat, 21 May 2022 18:14:33 +0300
Message-Id: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens device. Instantiate
the device using DT node instead. This makes the APQ8064 follow the
IPQ8064 device tree schema (which is also closer to the way tsens
devices are described on newer Qualcomm platforms).

Compatibility with the previous devices trees is kept intact.

Changes since v5:
- Inherited the gcc-msm8960 patch from another patchseries.
- Marked old nvmem/thermal sensor properties as deprecated (Krzyshtof).

Changes since v4:
- Added thermal-sensor description to the qcom,gcc-apq8064 schema

Changes since v3:
- Fix a typo qcom,gcc-msm8060 -> qcom,gcc-msm8960 (noted by Krzyshtof)
- Fixed indentation in the example (also noted by Krzyshtof)

Changes since v2:
- Remove patches merged by Daniel
- Rephrase commit messages to emphasize that these changes make apq8064
  follow ipq8064

Changes since v1:
- populate child devices in gcc-msm8960
- add syscon to the gcc device tree node

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom,gcc-apq8064: move msm8960 compat from
    gcc-other.yaml
  dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node

 .../bindings/clock/qcom,gcc-apq8064.yaml      | 40 ++++++++++++++-----
 .../bindings/clock/qcom,gcc-other.yaml        |  5 +--
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 25 ++++++++----
 drivers/clk/qcom/gcc-msm8960.c                |  6 ++-
 4 files changed, 55 insertions(+), 21 deletions(-)

-- 
2.35.1

