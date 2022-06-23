Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0A95579C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiFWMEZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiFWMEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:24 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B0F49686
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id j22so16418589ljg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7et27IRUk2k+HUEgIcsFLwxxHmQwI7l6JUUzLDBsDc=;
        b=KcpHCRcWvm/ulz+wpkoaC/geinThaUQRFjuod5igkXPGrK8EqLXaIaDn4me6JA26ec
         I9BqJdWShqXlH8RaZuZ+7kfVpYVw9Rip/gbacrfiueJ0yfCsNvqZN4yzGfh4WpxSTNZX
         WJpAwlIQC38Jv+kCNbgkFFVIm1IlB0QPlfOd0/C+uOcw50tlIKJetryRq6ytqy+ibaCd
         +tp38l1d/0DllEF6aHPzxai11+sVT8qs+5kJLSRjObewxGr6fjiVh04zjQwm3lXbb3Xz
         zfuyw7+iR7X8qZuV5Bhy1CubvRbNsYfYYLkOKZt0r2x21CZFb1tyEhLc3Myop9CSFIDM
         Gx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7et27IRUk2k+HUEgIcsFLwxxHmQwI7l6JUUzLDBsDc=;
        b=q/s2dtjiq9hvsrss5jUkibVmpOM1wHI7gJ4SthKmVCf14kDjsP7k6bxoI8jWUXcXPI
         BCvdn/ITnOJf7ZLCBHBjJ5OSEdAu1o344uGZ+NFmVQ74QwMALveQlt3jTJdLVmGQPlpC
         DnROc85Pr6G3mO4X3eLePtJhdxWsR0v/kzWhVqqivXBh02HeOyc4MiJA8qhrTeFTe6Bx
         SaR/6VERc00pANn1HmrBXjmSj+MlxLPqPgXo91C3gBkWSSKkNUwlAWHE1NvdQL/UkPG8
         N7iC4DW9LcTKXaqQ9jonUvwxAKOVdXv3342ZRImXs560rODB5TcoVITeY5pXAOcaq/OL
         eELA==
X-Gm-Message-State: AJIora+Vae6G6/DnvoD1hyJRuM7fhlMnIwtgPtQvlpNU0z/GMzFn7ME7
        umN8Bd2WFItEzMDebFqy/9XOPQ==
X-Google-Smtp-Source: AGRyM1uvNJlETkOr1+KEwsow/xxOEGDhK1iETUdJqRGLPjMPSi5IzK7uPBF7PG0aVymgUDK0AvWf8g==
X-Received: by 2002:a05:651c:510:b0:255:9d3a:b0c3 with SMTP id o16-20020a05651c051000b002559d3ab0c3mr4535350ljp.18.1655985859386;
        Thu, 23 Jun 2022 05:04:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 00/15] clk: qcom: use parent_hws/_data for APQ8064 clocks
Date:   Thu, 23 Jun 2022 15:04:03 +0300
Message-Id: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series converts the APQ8064/MSM8960 clock drivers, bindings and DTs
to use parent_hws/_data and excplicit clock binding in DT.

Dependencies: [1] (whole series), [2], [3]

[1] https://lore.kernel.org/linux-arm-msm/20220521151437.1489111-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-2-dmitry.baryshkov@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-3-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (15):
  dt-bindings: clocks: qcom,gcc-apq8064: define clocks/-names properties
  dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8960
  clk: qcom: gcc-msm8960: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8960: use parent_hws/_data instead of parent_names
  clk: qcom: lcc-msm8960: use macros to implement mi2s clocks
  clk: qcom: lcc-msm8960: use parent_hws/_data instead of parent_names
  clk: qcom: mmcc-msm8960: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-msm8960: move clock parent tables down
  clk: qcom: mmcc-msm8960: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: apq8064: add clocks to the LCC device node
  ARM: dts: qcom: msm8960: add clocks to the LCC device node
  ARM: dts: qcom: apq8064: add clocks to the GCC device node
  ARM: dts: qcom: msm8960: add clocks to the GCC device node
  ARM: dts: qcom: apq8064: add clocks to the MMCC device node
  ARM: dts: qcom: msm8960: add clocks to the MMCC device node

 .../bindings/clock/qcom,gcc-apq8064.yaml      |   9 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  31 ++
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  35 ++
 arch/arm/boot/dts/qcom-msm8960.dtsi           |  39 +-
 drivers/clk/qcom/gcc-msm8960.c                | 436 ++++++++++-------
 drivers/clk/qcom/lcc-msm8960.c                | 211 +++-----
 drivers/clk/qcom/mmcc-msm8960.c               | 454 +++++++++++-------
 7 files changed, 713 insertions(+), 502 deletions(-)

-- 
2.35.1

