Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F485BA6A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 08:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiIPGRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 02:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIPGRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 02:17:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177664CA25
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f14so32986856lfg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IGJdO2o9W+EN9QbSgrXXc87YNjS5Imv5FNNu7TSke8M=;
        b=ediOniOvKQsnu4ipXEdJ5RnQ3r0QzOmyZDnEkpC1CrOtZBCl7KfHzXi/AJWbcHuyHT
         h7fxsdnHxyR3pCtQ7s528qKw7XPVRrcdvDelAzB2BSh7GeIz9uXcRKXfPwN70Tml48ox
         sutHHaZ0NRAMc0ki5J9OTB2T2fGMWEJqhqOfVkhLR2uFYo2NIflwPYXPhB/RZxQkkpNK
         IKvUUgV9ZerqwxG4Yrte23h+YgFcK96eY6+4z3lsAJf3rrgE280RgZKDmaD9UNsV6NzL
         eAu5G/jVG6cEwCaBB5lToVx09WqXDnhnFt8TOg5/skwTyW4N10wRkDosSlEmYqwYz5rt
         nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IGJdO2o9W+EN9QbSgrXXc87YNjS5Imv5FNNu7TSke8M=;
        b=V+X7/Xire4ov5dPX32sfv/ZUejrQufXeMfBW82F9Oai/GVNifBLZqjm7ql/ya/KkFG
         6+XLWMgTWzx8sqUCGHq7zwiLRsrc1moJJbeMnL38ol2qtkBHWgRRNqjpI/MujS4HFaWU
         4IuPFWbMyP8M6aCmCpx8N1LQoDvaGYnqXgr37BrJB+UD9saB6CQS7oCJMIeP1+F54jxR
         L9fTd036lUGQ7kRmMdnRVvE13ghjMfCci0BY0D5TI0btnCKwvXfmR1RFxm/4elrX3WBS
         6tLJzqLNElgxd966pd2FY0lSLpcjo9E0oea9ijBNJsr5tpcCuP8VDf9MTNpq1CddX2ur
         WevA==
X-Gm-Message-State: ACrzQf3nTwJ8/rYcww509HQgPvdy70QSyz8pbp/01zMEHwufRJYPHq1J
        modqHYpmSCfKI6YbNxw1JzsiXw==
X-Google-Smtp-Source: AMsMyM6PIkWlCjzFPaXY8+6RRN4/pzBptHKoG2rk9EfbxoDRJtBRoHvHNGcRABuG92wKdtplYTFrrQ==
X-Received: by 2002:a05:6512:3da1:b0:49f:1b3d:88b9 with SMTP id k33-20020a0565123da100b0049f1b3d88b9mr1057157lfv.67.1663309061446;
        Thu, 15 Sep 2022 23:17:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b15-20020a2eb90f000000b00261eaa819b7sm3529383ljb.30.2022.09.15.23.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 23:17:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: [PATCH v4 0/3] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Fri, 16 Sep 2022 09:17:37 +0300
Message-Id: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
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

Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
be used as GCC clock parents).

Changes since v3:
- Rewrote asm9260 clk driver to fix the TODO item by using parent index
  rather than calling of_clk_get_parent_name().

Changes since v2:
- Added error handling to phy_symbols_clk_register() (requested by
  Johan).

Changes since v1:
- Added a macro used by clk-asm9260, so that the clk-fixed-rate changes
  do not affect the driver
- Changed registered clock names to be unique (as e.g. SC8280XP will
  have two UFS PHYs).

Dmitry Baryshkov (3):
  clk: asm9260: use parent index to link the reference clock
  clk: fixed-rate: add devm_clk_hw_register_fixed_rate
  phy: qcom-qmp-ufs: provide symbol clocks

 drivers/clk/clk-asm9260.c               | 29 +++++-------
 drivers/clk/clk-fixed-rate.c            | 28 ++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++++++++++++++
 include/linux/clk-provider.h            | 48 +++++++++++++++++---
 4 files changed, 136 insertions(+), 28 deletions(-)

-- 
2.35.1

