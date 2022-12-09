Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8786486C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiLIQtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiLIQs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:48:59 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E467993A40
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:48:57 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id d6so7907361lfs.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J30FnQ0XiYOkHjVMLeIVpKVykgV1Qs0n+YPAOVIOpV4=;
        b=b2D2uGJ8VV2as0TF1iNkhi3Q/zjaAfpIkf9XcqE8w9rpm8q7up3YA5WxPVwjsrahZH
         LHPxphF3tauv7GfBtCx+k7iMQmR85VR0jbOAIeBBoUcwSOmp9B+v964HnrIFQJArDsqs
         sGiW2VREDwkxJoz2iJc8qnCR9BRfNJinyYlyQY4MJEz/BfloTsvI3mrYoskO+YqGu5Mr
         TmWQ0PTlYqC7yDdA2q52PuVvXo+uCcuvkRfsjQGZDLs5MDk8vpMAL8KVOGNds6lQ0X4P
         qLaJfe0mHDoe22frX4AznQG/cuqryHPti8ECBfTmrDcQFWQynDLUT5IxoTafTHsvikGe
         s77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J30FnQ0XiYOkHjVMLeIVpKVykgV1Qs0n+YPAOVIOpV4=;
        b=0LdkxKQqVdNtI0VE4xhBMGzrVsGJbj2Saza8S0GZTdsBzxEMBwgH/tFIXwHLoLbA0M
         4AZjZMBod+HK8ZUUxjsEHJnMqT9ULJyafB/SkhOs0uYzXChGfNfAkTMRce4J5OXpAsqt
         SZ1qWV5CZNnx6GiUI+u1RAZE4Di9VlGZAUIhdivPrb3J+NididNo7EFlz9w22ls5qoPf
         UE67rJSG7qNnj7xMsL5aMtGEm8x+U7rBm7oHpV1fWcte0fTrW3At7q17vyrzy6qRN0wL
         8pmmo4nlkec65M72hcCmWm07SkCGIAlviRsqjIbrd9FXQHHbOHCB9GJFnSzgmEMVsS+d
         0Y1w==
X-Gm-Message-State: ANoB5plTue8qPvAXPFynPw7kMDc5azjiCWol8SvumndaCVbWqiZ5fNZy
        +PPmoelK5ok6Qia+j0lF4pQMWYmH/TJ/u+ee8w8=
X-Google-Smtp-Source: AA0mqf6QHZX7sydljwe+pLb3NkfHGfOKw8Be2gecYqlnlnkhxnyLI7iY4fQjrJ3kufXVJrNts406fQ==
X-Received: by 2002:ac2:4c4f:0:b0:4a4:68b8:f4f4 with SMTP id o15-20020ac24c4f000000b004a468b8f4f4mr3021215lfk.58.1670604536319;
        Fri, 09 Dec 2022 08:48:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:48:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 00/19] clk: qcom: smd-rpm: drop platform names
Date:   Fri,  9 Dec 2022 18:48:36 +0200
Message-Id: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series concludes the previous work on Qualcomm RPM and RPMH clock
drivers. It reworks the clk-smd-rpm driver to drop the SoC name from the
clock symbol name, as the clock definitions are shared between different
SoCs (platforms). Having an SoC name in the clock definition can lead to
all sources of confusion and/or errors.

Changes since v2:
 - Split bindings into a separate patch

Changes since v1:
 - Split the MMXI/MMAXI and sm6375 vs sm6125 changes into two different
   patches
 - Reworked macro definitions and usage to remove empty arguments
 - Dropped qcm2290_bimc_gpu_clk definition in the corresponding patch
 - Alignment fixes


Dmitry Baryshkov (19):
  dt-bindings: clocks: qcom: rpmcc: add LN_BB_CLK_PIN clocks
  clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
  clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
  clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290
    clocks
  clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
  clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
  clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
  clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125
    clocks
  clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL
    clock
  clk: qcom: smd-rpm: drop the rpm_status_id field
  clk: qcom: smd-rpm: fix alignment of line breaking backslashes
  clk: qcom: smd-rpm: move clock definitions together
  clk: qcom: smd-rpm: rename some msm8974 active-only clocks
  clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
  clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
  clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
  clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
  clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
  clk: qcom: smd-rpm: remove usage of platform name

 drivers/clk/qcom/clk-smd-rpm.c         | 1441 ++++++++++++------------
 include/dt-bindings/clock/qcom,rpmcc.h |    2 +
 include/linux/soc/qcom/smd-rpm.h       |    1 -
 3 files changed, 723 insertions(+), 721 deletions(-)

-- 
2.35.1

