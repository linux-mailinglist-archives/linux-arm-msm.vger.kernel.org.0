Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B187F66968D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240751AbjAMMMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240865AbjAMMLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:11:41 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982D578258
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:05 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so32812681lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/4eRHojkDz/W1PqGW3L+6StYgWEoOhMr1+9HnHapgo=;
        b=qVyn8mm09ffo+2jE/5CN6FKrSmG+GpJBFAqKwOdtdetKXctK6z+CYsRISVQ/jlwLg+
         ag4+j8kctpd9y4jmpj+r9bP+z2b7C57cpApmp1x++i+fZ1ZB5aZ4LUWOyCOwx3dnF5en
         4xeCmwTAFj9+MEjCc1AckqNISTLL6zV7GgFBp+aAZYAf0ffK23ZFhtcncABr/ezdtRUZ
         2BAjSDxEkq2dL5BU+gaEYwPByw9O58Fjna6FNZtb76/tYnMiu9UT7NInMm9OulrZOwx2
         P+kZ7z9RhWE+WtH+1ntiYUPW2dCQ9O3epNTT7XoSKiRymU5h2+pBx1ALnKDtYgKp+cUr
         K2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/4eRHojkDz/W1PqGW3L+6StYgWEoOhMr1+9HnHapgo=;
        b=vYLncDwMy8hL/uO80/RJCrUA1l03mUMDesXprU7BGLfXQzw22aDGHULyK13fElU2QQ
         RH1zzO9yy8ZUiDxds04HiBsW+gk6a8AQQnA7jsrxRpxKp/CjxiZodxjTrWnuemx9G4ve
         vzx7Mr4YgPeFWFez964C4oXa7yWLV5/X03zw7WjTXcEF4a8k7AoRFW3dPa3yyEQZym6F
         foSNq5r/mv8FAfXQGVXibayj1xi5J4nO2qWnEH3/n5ak6hXGoW8VLekpOo+KQe7ZJcew
         7SGhF4YVgQNGPtgFMWA6TZfzwk8hvTw9SzOKkd7PyMD+hYw1sMlRbjQg/2rYhQsTRWKS
         2w2Q==
X-Gm-Message-State: AFqh2kpuVMfbbqgPLFRYbEDVYcAax6CJnYhttz/KQKeaBs8NG05MZGWq
        B5QsCtgO1useCK3AAn6zETvgMw==
X-Google-Smtp-Source: AMrXdXsRAAoAUVlTVPzqF3mLhm8Mv72VdPudcTGDOJxdPsDpUzz/aUK1ix2uSqe8hocTph2M1gnEEw==
X-Received: by 2002:a05:6512:3d94:b0:4a4:68b8:f4f4 with SMTP id k20-20020a0565123d9400b004a468b8f4f4mr28520638lfv.58.1673611563931;
        Fri, 13 Jan 2023 04:06:03 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:03 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v3 00/14] clk: qcom: cpu-8996: stability fixes
Date:   Fri, 13 Jan 2023 14:05:30 +0200
Message-Id: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

This series provides stability fixes for the MSM8996 boot process. It
changes the order of calls during the CPU PLL setup, makes it use GPLL0
(through sys_apcs_aux) during PLL init, finetunes the ACD, etc.

Dependency: [1]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/

Changes since v2:
- Expanded commit message for the PLL frequency setup (Konrad)
- Removed the extra 'the' from the comment (Korad)
- Fixed indentation of the udelay in the PLL config sequence patch
  (Konrad)

Changes since v1:
 - Included bindings update (Stephen)

Dmitry Baryshkov (14):
  dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
  clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
  clk: qcom: cpu-8996: correct PLL programming
  clk: qcom: cpu-8996: fix the init clock rate
  clk: qcom: cpu-8996: support using GPLL0 as SMUX input
  clk: qcom: cpu-8996: skip ACD init if the setup is valid
  clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
  clk: qcom: cpu-8996: setup PLLs before registering clocks
  clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
  clk: qcom: cpu-8996: fix PLL configuration sequence
  clk: qcom: cpu-8996: fix ACD initialization
  clk: qcom: cpu-8996: fix PLL clock ops
  clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
  arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input

 .../bindings/clock/qcom,msm8996-apcc.yaml     |   6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
 drivers/clk/qcom/clk-alpha-pll.c              |   5 +
 drivers/clk/qcom/clk-cpu-8996.c               | 145 +++++++++++++-----
 4 files changed, 115 insertions(+), 45 deletions(-)

-- 
2.39.0

