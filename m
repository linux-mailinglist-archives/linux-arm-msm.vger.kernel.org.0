Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2EDB6930D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 13:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjBKM1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 07:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKM1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 07:27:02 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8D51EFDB
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:01 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id sa10so21829479ejc.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yPqcRyhoY1EQoe2UzZc++bgjeBdRKYPTiAsiJEGmxIA=;
        b=ch9FnRj/1PDWmxkWqxf3uCzNJmed7x2tw67dBgcPgpq41E/wDVL3+qaWLBzX567R2u
         gLyhAQiDU/qnbBHXx+eawMsFpzMlPxRk4/elaTm8O/A016M6ShlNruM8RLwKSJNCjyhQ
         Iwe5GNBdArYVtCxa6S4cGDfrdPLboPBIKDoBNE9xXaEfrOKeDOCvkSaaWzTT+zJMY6rf
         GQjoVEdb5EY+QY/8s1RxHNp8rdyzvf5wTHqKZvVtuJ3QN868x+avbydvUyAn/DKTV3L3
         ajbVmApYyO5QGwFMELRg2m19IU15T3E/B6Rp74t3r8mDPhjkjLLg/3VW+H/WlCG79PcP
         Tk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPqcRyhoY1EQoe2UzZc++bgjeBdRKYPTiAsiJEGmxIA=;
        b=adqr5JL9OKPk9n/yd7FV7GFnhnYoW8ErDD90k28pkLWCSKIFwD9NMIwNFi0FrW9k8c
         yDYF2dskghLlb5kK304ic1sFXpds1kFGkA3PJYT/9G+Ay4XmT1GRcPoTKG9R28euU8Vl
         GEll0HeUyXLqSGhaMV1cB6LRB0TRq/QGifeBOiQptt5BYI/XKKVJApNBni0MekvM6z0x
         EJnH0To9kq+XJF4XXvLmO7Fy4a/OLgSLus6RZx6BFHKw9Zqu5gcwpRc+AbwzIUj60voW
         XbjUDXe3Jj+bzFadwG861ixozl2xa56f4W1Ga+bQSPE9j+YimJNVQTVByO+VwJEdobD0
         aDvg==
X-Gm-Message-State: AO0yUKVDA/K+acxNu2k2hzBzhy3+iTAaCWU990K9fCLdPuxgIjol9Kd1
        I9eLHKoToJfbR7hTStABRYbUmezZtA+rDhBR
X-Google-Smtp-Source: AK7set97kGNclWDPRtsKtTdKxMJetKbK069wUYTQFEo6l33Nq6bmNrUnzDbty4YsVrNzP+A8fG7vHw==
X-Received: by 2002:a17:906:4e96:b0:88d:3c85:4ccf with SMTP id v22-20020a1709064e9600b0088d3c854ccfmr19518094eju.25.1676118419335;
        Sat, 11 Feb 2023 04:26:59 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 04:26:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/10] SM63(50|75) DPU support
Date:   Sat, 11 Feb 2023 13:26:46 +0100
Message-Id: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

This very very very very long overdue series brings SM63(50|75)
support to the DPU1 driver.

Konrad Dybcio (10):
  dt-bindings: display/msm: dsi-controller-main: Add SM6350
  dt-bindings: display/msm: dsi-controller-main: Add SM6375
  dt-bindings: display/msm: Add SM6350 DPU & MDSS
  dt-bindings: display/msm: Add SM6375 DPU & MDSS
  drm/msm/dpu: Allow variable SSPP/INTF_BLK size
  drm/msm/dpu: Add SM6350 support
  drm/msm/dpu: Add SM6375 support
  iommu/arm-smmu-qcom: Add SM6375 DPU compatible
  iommu/arm-smmu-qcom: Add SM6350 DPU compatible
  iommu/arm-smmu-qcom: Sort the compatible list alphabetically

 .../display/msm/dsi-controller-main.yaml      |   4 +
 .../bindings/display/msm/qcom,sm6350-dpu.yaml |  94 +++
 .../display/msm/qcom,sm6350-mdss.yaml         | 213 +++++++
 .../bindings/display/msm/qcom,sm6375-dpu.yaml | 106 ++++
 .../display/msm/qcom,sm6375-mdss.yaml         | 216 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 549 ++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                |   3 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |   6 +-
 10 files changed, 1074 insertions(+), 123 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6375-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml

-- 
2.39.1

