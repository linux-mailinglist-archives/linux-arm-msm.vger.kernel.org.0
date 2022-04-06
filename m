Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BAB4F5603
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243263AbiDFFio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1582252AbiDFEQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 00:16:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1232B44B4
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 17:26:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so1303731lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWsEvD55MkSgPt/PW3YvzfqgUnAHkT214mKs5UGjYz4=;
        b=dMWHpVdQ005sI4XU1e5nFitPDm5Z3cmPOxruAZ16PlNwzh7HFSNA01JyNAi7Na29bG
         Vt7gxl5UI5K04ssnMNwmfX1cfGgzAty7Pz6K5WXl/fEpxZP8sI1A41p7AkdgnDqdZjST
         iCK6/O2hD3h7WLf3LoAqVlh/yut15gXVlevk6lUhEHwW0Rsqy9XDqjDLChT07w0dU5MV
         NE9iMxWjUa9qwXkkf8KPZR3rRh3LR6mKr/DQaECPK0qPWt9anwd/MqgMcd7iRdFh7mA9
         foflWczm7HkdMZ3BHSLrvNzNuYYxIp/JAV7UoHX5N6NKF0DJ6U3cLS81oea0GWo413WH
         Sf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWsEvD55MkSgPt/PW3YvzfqgUnAHkT214mKs5UGjYz4=;
        b=GiWZtGaEBk/9InxMHuJbCFDpYj3hTe2o4f+fHp9BTf7t6Vgvi+sai8DE4Jcd/PM6H5
         zUubL+yEtgvEuqmgEFjKZ5dOWOVycfp99vXfo/YcgIlWU499nXQMD9pR5X19G4GCSBeS
         zpg+W0uYxDigylecnl1/aoEEFJIEteG0ccUCUplzrJl6goNoVCKmzL4Z1dP4a0e65iGL
         4aoQKQA2Z4SJ0KTjluu0Ys8EUE5wERfHxbLweoMpViv+VnqXUzflr6rxGNvePMNkubBQ
         ot/sylfl36kviaJyExhu0KOsKL7Mdt0J9WuS06RNxXbmve6l6kJji4S8HpnV/oPJf++W
         vkgA==
X-Gm-Message-State: AOAM533IzZ7Dc8XxY3do/SgSSDQRXu+ZHBasf6I3MgSgysTRCtbkDzmD
        0+0ljleYaXg61sOODTs3MSJdbA==
X-Google-Smtp-Source: ABdhPJwdTKEaaj1bfpQk7YyIeEr9Rzt+ZEqImN9ce08usAO1IqH6ck7wJsWycvIRyd9sQKyb8ODTng==
X-Received: by 2002:a05:6512:b11:b0:44a:2ead:daf2 with SMTP id w17-20020a0565120b1100b0044a2eaddaf2mr4294784lfu.642.1649204810445;
        Tue, 05 Apr 2022 17:26:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512239500b0044aa21dadeasm1660270lfv.60.2022.04.05.17.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 17:26:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Wed,  6 Apr 2022 03:26:44 +0300
Message-Id: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
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
the device using DT node instead. This follow the IPQ8064 device tree
schema.

Compatibility with the previous devices trees is kept intact.

Changes since v1:

- populate child devices in gcc-msm8960
- add syscon to the gcc device tree node

Dmitry Baryshkov (4):
  dt-bindings: thermal: qcom-tsens.yaml: add msm8960 compat string
  thermal/drivers/tsens: add compat string for the qcom,msm8960
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node

 .../bindings/thermal/qcom-tsens.yaml          |  4 ++-
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 25 +++++++++++++------
 drivers/clk/qcom/gcc-msm8960.c                |  6 ++++-
 drivers/thermal/qcom/tsens.c                  |  3 +++
 4 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.35.1

