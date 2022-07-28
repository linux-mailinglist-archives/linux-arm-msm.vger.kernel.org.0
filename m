Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053D9583D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 13:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236049AbiG1Lh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 07:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235946AbiG1Lh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 07:37:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0278B52DEB
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:37:55 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p10so2400701lfd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DDXwy09v5kzKGSrtSfqtSiy1i98PELQE2ktj6kzOluw=;
        b=hGzHTvEkVez1BnQLLcWNc9PRGnf8eblmhwFNLAhTAxKItS4UsxHX/1I4FceQRbPq9o
         145lgb3pMgV7OmbFcqcNEmHCIYBp8g7Z+e52Fjg8tPprY3GNGFq61WT9Tf4neCxjNu/+
         GV95yZmunE9dzg6h0jPXmzGjKhEu3IUSBHU9tChhlb4jBgRyczMqX0HZUD41lwM2IkCZ
         7FHreixOLlTuQ/HfQQpo3vqhzk0IS3rrI61xdloYiceq6FvETefUFeKPRwh9g6AhPqqH
         KKoXxVrLtK0Pnk6VGQ1daC9u6dGOxTEXQ6cKD+LMSNEbGpplvB3gsPlOTK3vmbFWC7NR
         ciKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DDXwy09v5kzKGSrtSfqtSiy1i98PELQE2ktj6kzOluw=;
        b=ItgknC0xYxxpXazprW6c5mCBwiBPdwQa6dad7EviC+f4ezghj4nvIjvw//v1Y/9yt6
         iIJ68R3wW7XzK/Led8un7fBy93q8+5rKHMTCvfZvP3wUGHD7OvvZ/nxlpKpRorKIeiP0
         G3NAEOLn/aKK+LG0Tu7vSrqxaA1vgQZYov1aEtpCC1NkD8RJhqT8yGydfQsd63yDqwH0
         8c2Ht4v208tHroX1HNNKya0TYrAJLbyBd5q4x1d4+gqjShfPAzhod1quhh/K/pj0Yp90
         dT4xR22iPkIhcQt+dhW/+mXr8Y6KyrSrxrTO6He7kgQPgdbJ0ht92y8uKqy+XWhzRVjv
         qAcg==
X-Gm-Message-State: AJIora+vexNQ6XisGSuiyd/7DjISZBopHeQ4gm3rOVwxjyFEKAJOoeIz
        N6VVyvvZOPNnmzrnoDf9LIa1DQ==
X-Google-Smtp-Source: AGRyM1sPCDaukKfCDTYez0xGEZrgkJ/tVyoOHk1t8WUGeH1+uZGLbFvBi9h88tQHwauRo0IhCtkoWw==
X-Received: by 2002:a05:6512:2821:b0:48a:6a01:3d29 with SMTP id cf33-20020a056512282100b0048a6a013d29mr10219021lfb.649.1659008273103;
        Thu, 28 Jul 2022 04:37:53 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id l12-20020a2ea80c000000b0025e0396786dsm98192ljq.93.2022.07.28.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:37:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH v2 00/11] soc/arm64: qcom: Add LLCC BWMON on SDM845
Date:   Thu, 28 Jul 2022 13:37:37 +0200
Message-Id: <20220728113748.170548-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Changes since v1
================
1. Patch #2: Drop also BWMON_GLOBAL_IRQ_STATUS (Sibi).
2. Minor rebasings because of above drop.
3. Patch #4: typo in subject (Sibi).
4. New patch: arm64: dts: qcom: sdm845: narrow LLCC address space (Sibi).
5. Add Rb tags.

Description
===========
BWMON is a data bandwidth monitor providing throughput/bandwidth over certain
interconnect links in a SoC.  It might be used to gather current bus usage and
vote for interconnect bandwidth, thus adjusting the bus speed based on actual
usage.

Qualcomm SoCs might several BWMON instances.  Extend existing support for CPU
BWMON (called v4) to LLCC BWMON (called v5).

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  dt-bindings: interconnect: qcom,msm8998-bwmon: add support for SDM845
    LLCC BWMON
  soc: qcom: icc-bwmon: re-use IRQ enable/clear define
  soc: qcom: icc-bwmon: drop unused registers
  soc: qcom: icc-bwmon: store reference to variant data in container
  soc: qcom: icc-bwmon: clear all registers on init
  soc: qcom: icc-bwmon: store count unit per variant
  soc: qcom: icc-bwmon: use regmap and prepare for BWMON v5
  soc: qcom: icc-bwmon: add per-variant quirks
  soc: qcom: icc-bwmon: add support for SDM845 LLCC BWMON
  arm64: dts: qcom: sdm845: narrow LLCC address space
  arm64: dts: qcom: sdm845: add LLCC BWMON

 .../interconnect/qcom,msm8998-bwmon.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  39 +-
 drivers/soc/qcom/icc-bwmon.c                  | 460 ++++++++++++++----
 3 files changed, 401 insertions(+), 99 deletions(-)

-- 
2.34.1

