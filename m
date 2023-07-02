Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D840744F51
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjGBRuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjGBRuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:50:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46821E61
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:50:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so5827953e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688320246; x=1690912246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7QLIcJhGf6roTEV5uHjocZCiVQtMN4WpmTTSqh8Iu8=;
        b=IutP9H0Sl0plLlVVtqrMV2uur1iEdtzwdcHgeEwjPOZA93yfivwNa7PnYmEgVZ5zq/
         bULbRNBr9UG1Xz1uDbBLrEk8oSHXOKusr4gintsV6013Zt2DGwtwL3eA7c4/B3cUQeEd
         l8xCrEiK3AL9MiOgMZpCZzbod9Jq7Ty5YFHiJG7vYhlOI80DLiuMiYDqUpMBZQxU/m9g
         KV6XmgON6zvKZsuHPeUQo2u5VOSjVfEe7HEBO11ElnRjnGBYizrI+nTmUMrSsuaEGTdk
         A28ylp67+Rb0SHXIWuGbdayFIQbjS3yVuQ+U4Ual6EUtJRJh4DhHE9ooKLRwJiXJ2VHq
         RlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688320246; x=1690912246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7QLIcJhGf6roTEV5uHjocZCiVQtMN4WpmTTSqh8Iu8=;
        b=Z1necx4wRmNrCWejElYFYRs2SvTAhVjdzvz+U7uEe4CpYhAK8KOZjHKUnDdLSctfOX
         yhvcwx7b2CVBfM7ePfTdSesYUUwjqOt18PbPtasWpGyVkfpMUb6MT4Xko/gaxq6Om8my
         QXBqOyk6x36XaOjy3zXDiXPqjFdog2Zu35ybLsYwmBoSJlr3rrpE8kgAeG1X5BUiaPlJ
         NymY2gLj+wQ9VBpNauzDbnuZzBlbBIJ81J0iySLSPrQJh23sglbI3KqBiePGBOp0Uo4U
         KfknofZOy2Hs1km17KL3yHHUJ4Dx7V305q+LURTk3OYH/rDmvpf5kttuepvCZbQ5iik9
         u5tQ==
X-Gm-Message-State: ABy/qLahOAwTeEm7ER1w0ff8AlE0Im4EpiQHiAYr6DP875/2DZRPy1s/
        yqs5i+teJqLGosc63+if9v0zxQ==
X-Google-Smtp-Source: APBJJlEEGJ19yefzJjPgvbVD3Vwt8o0hpwITPKpxhrZ6qfTncXtXmPc/2czBK22ojn0BWVp4pHLe1g==
X-Received: by 2002:ac2:4a66:0:b0:4fa:9817:c1da with SMTP id q6-20020ac24a66000000b004fa9817c1damr4180775lfp.21.1688320246289;
        Sun, 02 Jul 2023 10:50:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b004fb759964a9sm3354130lfl.168.2023.07.02.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:50:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH 0/8] ARM: qcom: msm8960: support CPU frequency scaling
Date:   Sun,  2 Jul 2023 20:50:37 +0300
Message-Id: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

This is an RFC (or maybe it should be RFT), as I did not test this on
the actual hardware. The actual core and L2 setup is mostly the same as
APQ8064, so this is just a port of APQ8064 code and adaptation for small
MSM8960 peculiarities.

Note, msm-3.4 had separate optional AVS code for MSM8960, but as I don't
have the actual hardware, it is left untouched for now.

Dependencies: [1].

[1] https://lore.kernel.org/linux-arm-msm/20230702174246.121656-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (8):
  dt-bindings: nvmem: qfprom: add compatible for MSM8960
  cpufreq: qcom-nvmem: enable core voltage scaling for MSM8960
  cpufreq: qcom-nvmem: provide vmin constraint for early Kraits
  ARM: dts: qcom: msm8960-cdp: constraint cpufreq regulators
  ARM: dts: qcom: msm8960-samsung-expressatt: constraint cpufreq
    regulators
  ARM: dts: qcom: msm8960: add Krait clock controller
  ARM: dts: qcom: msm8960: add L2 cache scaling
  ARM: dts: qcom: apq8064: add simple CPUFreq support

 .../bindings/nvmem/qcom,qfprom.yaml           |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |   9 +-
 .../qcom/qcom-msm8960-samsung-expressatt.dts  |   9 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 289 +++++++++++++++++-
 drivers/cpufreq/qcom-cpufreq-nvmem.c          |  69 ++++-
 5 files changed, 370 insertions(+), 7 deletions(-)

-- 
2.39.2

