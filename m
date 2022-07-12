Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1679B571AAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiGLM71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiGLM71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:59:27 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F26E1EC63
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id z12so11059594wrq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8VZ0clunUQBnjW7zf8qlAsvO8C64gVCnbbBGVGcFgM=;
        b=adoif1L1XNbykYk33LLvb+mM60dhPvmSPTDnTCV126MZgphD6iYn/L6Ii4+YDOqPxP
         JUVSllPZrOCAkRXSr4svr+6htFgZUUZ82NZtA304fvl8TDdguchQcGRvxYTsSsg0E3Mn
         auXf1pWBYCMwqYU8zkfxNZ7/CrNcGAQUkOuIbiXuKdY5264sH/yc5EbmpWRlcF8Ex6kz
         kF1OD6xRlbiBqDu660bD6DD0NfsnAC6NWSnnJihG0+s1poYgIP7fyjI5bxX1xWtMq+r3
         niTsXGrFgzORTDsI2aBwfmIzjrLz1uUFCLXI16wd7whjBUAZvVac0JleFRhX51Tj2Yb8
         WvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8VZ0clunUQBnjW7zf8qlAsvO8C64gVCnbbBGVGcFgM=;
        b=IygJRZ/LEohaEY+ayrkEOJhZXAwcAFNtbXUYK464/Q0sFVvU4DylzDWsxvH95W2caF
         9Xs2MvGf0Osfo6KnnFezE6bccjwcud6sxlwPkwlleP8Ncg8/+9gW6wZYG93EkuIOqXXS
         jVuB8IzQokgW2dSPULU+fu5umaeCgitlp0x1w8F0AFEg2juI6SrkXQN2BMhGJJ+/OX4z
         5zSBjOQMsjwyza6GKgYnOz4Jb1lBGUTBqUztwHb9TrrRTA5LHU7oM+6JdJItHfrs5zmA
         20w/hqVvqzRoD+ApT9ry/LCxyLTf/fSicIS5zzn++ULot2Gu77WvnGuxkOyPnHQpXKP5
         kq5w==
X-Gm-Message-State: AJIora/je50rmoXCm9Dr9pPyk+X7pL4dniloKRmm3rr1F46ebRLOT7cW
        5QBRo7dwOlARYhqoCzJalUA/pQthuLAMvw==
X-Google-Smtp-Source: AGRyM1s7EwNMlAWio5Kd772TWMYptjSJsAawCToYB/HjbL9ipwCIOivSTMTo516tbxYyGVQD1ns4Dg==
X-Received: by 2002:adf:f345:0:b0:21d:6927:ec8f with SMTP id e5-20020adff345000000b0021d6927ec8fmr22258111wrp.490.1657630764806;
        Tue, 12 Jul 2022 05:59:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/6] clk: qcom: gcc-msm8939: Align clock frequencies with downstream driver
Date:   Tue, 12 Jul 2022 13:59:16 +0100
Message-Id: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

The gcc-msm8939 driver is a copy/paste of the gcc-msm8916 for the good
reason that msm8936/msm8939 are an expanded version of msm8916. Reviewing
the qcom driver though there are some obvious missing/wrong frequencies
which a simple side-by-side comparison can show up.

This series captures that side-by-side and transmits into updated frequency
tables.

Bryan O'Donoghue (6):
  clk: qcom: gcc-msm8939: Fix weird field spacing in
    ftbl_gcc_camss_cci_clk
  clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
  clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk frequency definitions
  clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock frequencies
  clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
  clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies

 drivers/clk/qcom/gcc-msm8939.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.36.1

