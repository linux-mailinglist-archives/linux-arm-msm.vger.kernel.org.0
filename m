Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7CD641832
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiLCR6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiLCR6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9950A10050
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:11 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id cf42so6449398lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GV6lStOUC0qtqhWbdKjqKtQ9zNSmxaDPHpqHNhhRf3w=;
        b=YK8W6WGD7l9l5vpBDYUtb/PE7En050lSbHBCnkpVg0DrGWOWIB8eps/f0pvkbWdmXU
         qouznzVH91p79rPkf73L2bEzQY2WGDVTDXoigBvdH69VnQuL5Y0B+TwV2Zm3LqEg8WPO
         nCHym4ZGg2wUFyIzeAw6M+lh9SaGw8omLOZnKxe4AfEcarL9yB6ZSj3jKXP+Hkz+33EM
         p3l1F5+RL1T6LjbRImat91LYd3JCLt/0BJYQNfMs7/wXC6ZHmhkQIWGI5tmcULHvdj18
         NWZdyP253ODJg+luTpu7E3VajP1nr0CEPJeiPaT1FXVkJXYwn0IntSUaWSq2t1QHuG7y
         8UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV6lStOUC0qtqhWbdKjqKtQ9zNSmxaDPHpqHNhhRf3w=;
        b=o/Ns3Oyd1as9sqiRlBVcplAZN5Ml4oh1Zsr6m4hnfs+YXEZa8rG0q+6s7rktrkqdUJ
         4oW8tFbnp52gvLFSU0OmxO04VD5oTcgS+mGQxrVqU1Hnip5EVR9z1jZNv2jgmzZJpT1N
         puxIiKDgryWWHM4CaJxKVSeihcdgOSe+I9hFnCUqFpzuRzIMypRci8op0k/bUHvTkGhJ
         u8HsLpDr/N971qnKurMbG89HYYs0s1iIMiVyIbOym7UeZArEhEc2ZiMnetEel51jcE0O
         5ePhcdVdPb4oUY9oeozg3R7FGqXcJNCcQugnpT1f0AbD+Dvj0gH8nn6uZ2pVAVpBC2e3
         BdWg==
X-Gm-Message-State: ANoB5pmDgP+JxfFKu1wgS3mLttUx2pFki2P01MPK83KAOJCJzDG9OopW
        kKnH/IvPRyTEygtXvlSsWjmXow==
X-Google-Smtp-Source: AA0mqf6J7xAkO0UMSFvsbvvxPAsA+fjiFHu76zH1o3iPMjFFHFlzSUXjYljNUnuWVBrHxMR6UCBW1g==
X-Received: by 2002:a19:8c06:0:b0:4b4:b63f:a69a with SMTP id o6-20020a198c06000000b004b4b63fa69amr25354872lfd.197.1670090289858;
        Sat, 03 Dec 2022 09:58:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 00/16] clk: qcom: smd-rpm: drop platform names
Date:   Sat,  3 Dec 2022 19:57:52 +0200
Message-Id: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov (16):
  clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125
    clocks
  clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
  clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290
    clocks
  clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
  clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
  clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
  clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL
    clock
  clk: qcom: smd-rpm: drop the rpm_status_id field
  clk: qcom: smd-rpm: move clock definitions together
  clk: qcom: smd-rpm: rename some msm8974 active-only clocks
  clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
  clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
  clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
  clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
  clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
  clk: qcom: smd-rpm: remove usage of platform name

 drivers/clk/qcom/clk-smd-rpm.c         | 1393 ++++++++++++------------
 include/dt-bindings/clock/qcom,rpmcc.h |    2 +
 include/linux/soc/qcom/smd-rpm.h       |    1 -
 3 files changed, 693 insertions(+), 703 deletions(-)

-- 
2.35.1

