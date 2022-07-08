Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC86256BA63
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238020AbiGHNNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbiGHNNi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:13:38 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCDB18B24
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:13:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 19so5028323ljz.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v6/PCW5WRbzPZN02phmsvBdyayCNpfl8Zb3T8MmgeGc=;
        b=iKiqZFrK3BS6sQC5nrTlmwt3NnZd4cUx/MBTVfs2e+got39YBiKpi9Qe4WDmC7ojyr
         CIrKaDPDo5heACWSoTVUmQnVTohdFk5P6qJ4S0o1DdJQoBFemCLle5S3VvBdh+yi7bpy
         EuVyrNAoQAqm2oooz6f973dzd37Kl5IrUHFGoqueydRWKAErukWU38ddvlnsCV+mQHtt
         y5jDb20yclSDKU8TLBfft0nuCWk1p1LdjIwfQbXaV64ywlAfY5IjQcKYP9AVuFDrH2cT
         12j33DCZC8jUOP1hbfZeSLT3EcqaMktR4A39oFT7maR6uqP4LB1OPATmZXBiRp6a+l5K
         bquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v6/PCW5WRbzPZN02phmsvBdyayCNpfl8Zb3T8MmgeGc=;
        b=VH1ywszJbOUdZCj/n/PEfBanV5AcaAfDHiynfpuinRBUoSMlaRL9M5QPBmrW8NiQzV
         KPg4c3vDZ7FwPAUcgJk6xfkKhOrdvXhpVdoeMj9rSllFimAM8U4bE9eTLSz+kbIU1mes
         SFNYq71GVXvU3Y7MfhB7SejrOHZO5U4xyYNVANIJO01leif1mOcuf4UlTMk45e+ssuQ5
         Ok9vHuk4+P72pKJqMN2bRK5P0+6feSRteZWg0WlK4NbAGwvYhdy8dbFUziAuvj/4Wsds
         PgqqMOEHA1j6LkIOEwpw1yFMbyGAxGJxXNxdNHsD30T+eOwgdHA9ZAdhE9LB0njQFwvR
         JRFg==
X-Gm-Message-State: AJIora8P0NYP8m9YDYLgkmbC2cfrwTeeMgl9fdFA0EKL+7b8pNC8GFjA
        PbZ6K6dRQHwdyqfbxGabaDoHSXarANpoZQ==
X-Google-Smtp-Source: AGRyM1vffmcfCTZuyPN85KWpI/SicQtx6Zz4UnQksr1NwxLiUcF19Wx7+PpLpTNeleYc6hVNsFiORQ==
X-Received: by 2002:a2e:b703:0:b0:25a:93d0:8a57 with SMTP id j3-20020a2eb703000000b0025a93d08a57mr1964890ljo.487.1657286014824;
        Fri, 08 Jul 2022 06:13:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu35-20020a05651216a300b0047255d211b9sm7410844lfb.232.2022.07.08.06.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:13:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/3] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Fri,  8 Jul 2022 16:13:30 +0300
Message-Id: <20220708131333.2836900-1-dmitry.baryshkov@linaro.org>
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

Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
be used as GCC clock parents).

Changes since v1:
- Added a macro used by clk-asm9260, so that the clk-fixed-rate changes
  do not affect the driver, requested by Stephen;

- Changed registered clock names to be unique (as e.g. SC8280XP will
  have two UFS PHYs), suggested by Johan.

Dmitry Baryshkov (3):
  clk: asm9260: use new helper for fixed rate clock creation
  clk: fixed-rate: add devm_clk_hw_register_fixed_rate
  phy: qcom-qmp-ufs: provide symbol clocks

 drivers/clk/clk-asm9260.c               |  6 +--
 drivers/clk/clk-fixed-rate.c            | 28 +++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 56 +++++++++++++++++++++++++
 include/linux/clk-provider.h            | 41 ++++++++++++++----
 4 files changed, 116 insertions(+), 15 deletions(-)

-- 
2.35.1

