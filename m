Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F69655FB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiLZEV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:21:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiLZEV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:21:58 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A31AE93
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:21:57 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so14689237lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3SEVXCpqtMQ7g1JXR22/XO6zUi+AE7nM2fHDOiRODo=;
        b=xsINPV2IWkJHhVZvcG4Xea2uI16QV1FXkcXDJrc45h4mPuQxbsvlbrmQBc7Q9u992z
         M2whfyxRnsO2LhhIzURRkPUdROLDNPIb7k8fdW65l3t82I9HYZQWwsDN7ZV35QIndMX3
         2qro9LWR7C9YbZi/nPMJD7BD8mPJWeoTRpOP9cib8Cwsj6NJ+P4Xo4rqTndVBvFIz2NS
         YbrGgB8HXNr9kh6MDdm3KqKMff1JNQ+KZKx2CXT1X7oCbDbWH3nuVjGap3Y+WNE9TbyZ
         Bi1eDYNPDwghjub+RDxP2sKjLaIPBCthsSTGpbj4XX5Qj394PMkKOjbybigJqwGGIL3X
         2Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3SEVXCpqtMQ7g1JXR22/XO6zUi+AE7nM2fHDOiRODo=;
        b=2DnfWcOrwDjz11pYdY/teRH22v9qEvoF1hKWRjR75qy4ET6+0pG893amZkEXgtPH6d
         BAiCuA7fd/Ic3+513rboxQtIoVYCBWoX/MEZpJ+udDvUQC8GGfnUJD9O6PdP7vLYJkvU
         qmHRjXqFxiWn2rOFFM+I2jqkWOidHQnALDrTFY5g+Vf1mWiTuqfnDzMJdRyCNLhC1qh9
         AyeS4theis22OwIC1SyuY1zFfYyGBZlu4W3v+0RRIu46M3cq3+CJRRS2vanDcPJx52D5
         dekPX3MPQpRK1LyeBb0fAd8NSAf+YLXOEF5LlsTY10t0V0MvIzsbwTNu3E6z+U0z/Lig
         c7Jw==
X-Gm-Message-State: AFqh2kpxwx7cXW4ZwAnsuumVJXlURzfeTERadyyhzeEYWsLePHLhPFwL
        EwnPdwaVCR5+aDo/s2sWiPg7ig==
X-Google-Smtp-Source: AMrXdXtEyxcUu4KSqzIWG86PCTaQVWmuwiR94Vitd+SGffEoqiqVJMRnodhEC3A62MvlRWU6ZS+Fiw==
X-Received: by 2002:a05:6512:1688:b0:4ca:fa75:a64a with SMTP id bu8-20020a056512168800b004cafa75a64amr2651323lfb.0.1672028515566;
        Sun, 25 Dec 2022 20:21:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:21:55 -0800 (PST)
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
Subject: [PATCH v2 00/16] clk: qcom: gcc-qcs404: convert to parent_data
Date:   Mon, 26 Dec 2022 06:21:38 +0200
Message-Id: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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

This patchset reworks and improves the Qualcomm QCS404 global clock
controller driver and it's platform usage.

It fixes some omissions (MDSS and oxili GDSCs, incorrect clock names,
direct number usage in the qcs404.dtsi). Then it converts the gcc driver
to use parent_data/parent_hws where prefereable and finally applies
these features and fixes to the qcs404.dtsi.

Dependency: [1] (for the qcs404.dtsi changes only)

[1] https://lore.kernel.org/linux-arm-msm/20221226031059.2563165-1-dmitry.baryshkov@linaro.org

Changes since v1:
- Reworked the patchset to use indices for the clocks rather than fw
  names (suggested by Konrad)
- Added a patch to add the xo clock to the rpmcc node.

Dmitry Baryshkov (16):
  dt-bindings: clock: qcom: gcc-qcs404: add two GDSC entries
  dt-bindings: clock: qcom: gcc-qcs404: switch to gcc.yaml
  dt-bindings: clock: qcom: gcc-qcs404: define clocks/clock-names for
    QCS404
  clk: qcom: gcc-qcs404: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
  clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
  clk: qcom: gcc-qcs404: fix the name of the HDMI PLL clock
  clk: qcom: gcc-qcs404: get rid of the test clock
  clk: qcom: gcc-qcs404: move PLL clocks up
  clk: qcom: gcc-qcs404: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-qcs404: sort out the cxo clock
  clk: qcom: gcc-qcs404: add support for GDSCs
  arm64: dts: qcom: qcs404: use symbol names for PCIe resets
  arm64: dts: qcom: qcs404: add power-domains-cells to gcc node
  arm64: dts: qcom: qcs404: add clocks to the gcc node
  arm64: dts: qcom: qcs404: add xo clock to rpm clock controller

 .../bindings/clock/qcom,gcc-qcs404.yaml       |  38 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  22 +-
 drivers/clk/qcom/gcc-qcs404.c                 | 841 +++++++++---------
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   4 +
 4 files changed, 455 insertions(+), 450 deletions(-)

-- 
2.35.1

