Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB53E64F609
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbiLQAXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiLQAXB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:01 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A7B66C38
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:33 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m29so5658961lfo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAP7xKrXzRfGYQEI72uoi5A6nv1xtd0f4h0Tmx+ZhU8=;
        b=hz06l5DU/eHu4LIYMZz8BCcDYm2ukYedeb38xUrrX7hdW1hRglalJPiEtyxt1o59xd
         oq1yrMzD9+a22EdwmmDHljvbpRB+muam7WuHl+ktrMDCEl+5UJDGnNM+XcU7heeY8sbB
         yCfW/pU61ySUVCB0DgVIvmwI0aix63/2rvuxywlKx3BufOOzMSflEAG9uuuNRpyR+b6X
         2LxEqTra34Uy+qBmc9kH2dCJFA2PqTyPukYCVCHn6B3is/fZRPRCEn5f6HeIaosYRpIW
         hr1l0fKDVEGOOrBl5q7GG/jBHnGmk5e2yXfvuyQQAhKLRcDL4peeSzzgNaXoaZ3uEWn+
         jNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAP7xKrXzRfGYQEI72uoi5A6nv1xtd0f4h0Tmx+ZhU8=;
        b=QUENCUHAuTd39/v3AHSxK1nyeB5UFxiBj9w+AMN0sMR4gf/S2FrZpgIQoX9Ftw/zja
         LDplNxtbpe/ZGQd/ERBP8s7stngksQw0tpiDMkYKBv88TuM1+QIvNpkco9kxkUnDdOKx
         EpYiYPtywMnlhi8uXGRB9JnDgQJ1E4+3gbANEnpbcguv3MriG0zAnFnsx7P1gdtu4Pt/
         v6B7TmYK4A/62OEyvgxMYKpOkO3+XjXpPSwzZGw+tg790eiOnT5AkBbQin84OzIm3axw
         V9GFlcPDCxjoN6eC6hV490zrGuoX7t3P5wj8NDvoZn0JZJxRLmKLJY2QRED/PWKshZ4u
         ND6Q==
X-Gm-Message-State: ANoB5pkspdGQ4SXZj6EsFcoeTtNDQd4vhdeDTWr52UOAQP864jEY6D4s
        jF1FswEhtox34W4yXjGV+nwVtA==
X-Google-Smtp-Source: AA0mqf43/fW/n0ywR2wpB2WVWOPMS7Udrv8Wia6UydW+NS0927co6ylOEcnM6ejwIj4E7j0o59DB5Q==
X-Received: by 2002:a05:6512:b10:b0:4a6:c596:6ff7 with SMTP id w16-20020a0565120b1000b004a6c5966ff7mr11584874lfu.2.1671236251361;
        Fri, 16 Dec 2022 16:17:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:30 -0800 (PST)
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
Subject: [PATCH 00/15] clk: qcom: gcc-qcs404: convert to parent_data
Date:   Sat, 17 Dec 2022 02:17:15 +0200
Message-Id: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Dmitry Baryshkov (15):
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

 .../bindings/clock/qcom,gcc-qcs404.yaml       |  38 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  26 +-
 drivers/clk/qcom/gcc-qcs404.c                 | 848 +++++++++---------
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   4 +
 4 files changed, 466 insertions(+), 450 deletions(-)

-- 
2.35.1

