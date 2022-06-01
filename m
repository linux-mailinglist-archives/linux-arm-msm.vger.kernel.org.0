Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17DB53A540
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 14:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241431AbiFAMn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 08:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352464AbiFAMn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 08:43:27 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6354477F
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 05:43:25 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h19so2046670edj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOr1mc2wtnN7xTcQeWM7ExQn22NUQL8aCOuv/gBNDzY=;
        b=BZPS9jdNO8M29ZrszYb1KwuSxTKKM2sD4iSdOVG2rDiqP/QLxg1LUwv41H6mmlzh7x
         eDsdeWI5JizqB7I9B4HmUDU+b7yuirPQ5mgeOjT7PfiFFGOTRj1d/+0DXjSAJmpHvcvA
         r3HIiFQBvlOmobA+Qu8/ts0sEnYjmRL/zrraLBiM2iYfY/qRFdxWPA57YZAP1FH7halc
         95syLGFBZsGih1rGfTLYpR3leVuofMqPITM54Lrsmh7E24JS1jk3CdYNZdq3MdhpM5c2
         RXwYDrJrNp8GG8l6VS+Qoxa4yp6o7Tw44Bgor7RUnZCimbHasHxLr6M1RXJTwp+WJtXC
         hsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOr1mc2wtnN7xTcQeWM7ExQn22NUQL8aCOuv/gBNDzY=;
        b=YZel3uD8uSEId08d9ztGhiNEUFDXQmwemfdwta/k1+5xmIQdfvy3ZSod248ZkUhFqy
         giRgZnL1opOUHInk7nGCWTODb/7Q/IalOc80qCfBbWiXcnjzXMUolb9EYUeQZFl0Bvl4
         +jWyX1MbvP/D4ml2Z6NPmLDl033NROMXkcxFWczKW6h5s+w+N9ptv+7VxdRiZRc2s3I5
         yZexXz0zQeKE+o+OvIxKf6WG9k8QZC02TFIXZPIaoFAzSULZ17HDtJAbu4INvWV1wtHJ
         Vto5phhFSRcj82L5aFBeNcoG4snSxNebbW2Jb4shkqcP8NkuQNgGA229SgHVdzx+XB3s
         PMgg==
X-Gm-Message-State: AOAM531OFJ/v+SKnvDE5YW7R7/vJNGdveKw8D8JE7YNwFP22XlPl7PDJ
        QLyV+ffWcy8xRMkfNF/jaTdJ1Q==
X-Google-Smtp-Source: ABdhPJwzx4cJldFhYWNuo3cOmkLABCgmLrpvyBMowYw/LuPz33RVK818VGwAyrX3kCJThSWAyOsUMw==
X-Received: by 2002:a05:6402:400b:b0:42d:c902:6c75 with SMTP id d11-20020a056402400b00b0042dc9026c75mr20725079eda.32.1654087404136;
        Wed, 01 Jun 2022 05:43:24 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b006f3ef214dc0sm682055ejx.38.2022.06.01.05.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:43:23 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 0/6] SM8350 Display/GPU clock enablement
Date:   Wed,  1 Jun 2022 14:42:44 +0200
Message-Id: <20220601124250.60968-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Changes since v2
 - Dropped "clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED"
 - Dropped "clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable"
 - Dropped "clk: qcom: rcg2: Cache rate changes for parked RCGs"

Changes sinsce v3:
 - Dropped RBs & SoBs for bigger changes
 - Changed author to me for patches with big changes


Robert Foss (6):
  arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
  clk: qcom: add support for SM8350 GPUCC
  dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
  clk: qcom: add support for SM8350 DISPCC
  dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
  arm64: dts: qcom: sm8350: Add DISPCC node

 .../bindings/clock/qcom,dispcc-sm8350.yaml    |  104 ++
 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |    4 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml     |   72 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   41 +-
 drivers/clk/qcom/Kconfig                      |   17 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/dispcc-sm8350.c              | 1330 +++++++++++++++++
 drivers/clk/qcom/gpucc-sm8350.c               |  637 ++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    |    1 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h |   52 +
 10 files changed, 2250 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8350.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8350.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

-- 
2.34.1

