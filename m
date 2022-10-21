Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1203C607CFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiJUQ4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbiJUQ4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:08 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023E64D4E0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:47 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id c20so4514409ljj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jk8daWEyD5nu4Dd9fT1JL7p/naJGRuTZBUyhSyQw5GE=;
        b=i8qJUKu+ohbPuGZ3ueGYE532rsFQy0UvpF20vJ6x1ZcP4pljpUHVtDFJS8hErlkA8U
         n3cdWOFrbm+n/YSuJs7gXXw2uHwIGW09bzCssinCok/Zk656b9FmS5potj5R89kIY1L1
         6RP4Vu3V0q76AgDeBUd2Om9uur8+mg7UDKTyJHJKzRlDdG3yuVaDr69UEHe9KJpz4Y8b
         IgKGLQppn0cQL670sR7MBgbwilVHmqf67eBDtERYZKOqvZOWbbf+wL9jXQwCaa7BZd5N
         S55w4lPBJBfzFaVIvVk5u9IyJ8anTtFyctncDHDRk5hBXIKfgTCn8s+RgAe+ZCMDIYu0
         iubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jk8daWEyD5nu4Dd9fT1JL7p/naJGRuTZBUyhSyQw5GE=;
        b=x6QtK9VL4QRwOYjUUGsmzo/gl1KhbhR6rzXdpvrW+0nonT3QdNXcXT/sjdeUbKxh3A
         vdsAvR/L5EH7o/EmUtgdIWQJ5jrYyPI3eTxe409GwWRoCgJsyWDvl3WzJKWlGfi25vdk
         EkhdsZZ97EtMiLSuxmpwfMIRMcmP6+jV3BHY1VXWbZHQNDttVHJSFikBAExAxZETM/L9
         fg6eolR/DJhWxJfLerMHM4KAD9Z37uzzNENTFXwEqG/CnuxC8WvBtEPqi0L/zE9NuOuB
         wJChT5tVpZ5jl6UTVQACnWWH0A4LpiAjU3eg5eiWM3whmh+LdyNNIlXY+RMOV0Pb+lYH
         UkXA==
X-Gm-Message-State: ACrzQf1MlTBdSZiBpM8C636HbXd9GoTDoymPXmG6qQ/tpdaG2gJPmU7P
        zxHmFER6e/WamZCxhczM8w6TTg==
X-Google-Smtp-Source: AMsMyM5gzvmuycKPtMppRahs7qk58l2tQH694Ohve9uvydGuI/CeRQIFtvebGCbuMpptI85NC+R9zQ==
X-Received: by 2002:a2e:8347:0:b0:26d:e2be:b6e3 with SMTP id l7-20020a2e8347000000b0026de2beb6e3mr7227612ljh.247.1666371335374;
        Fri, 21 Oct 2022 09:55:35 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/9] iommy/arm-smmu-qcom: Rework Qualcomm SMMU bindings and implementation
Date:   Fri, 21 Oct 2022 19:55:25 +0300
Message-Id: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The main goal of this patchset is to define a generic qcom,smmu-500
binding to be used by newer Qualcomm platforms instead of defining each
and every SoC line with no actual differences between the compats.

While preparing this change it was required to cleanup the existing
bindings and to rework the way the arm-smmu-qcom implementation handles
binding to IOMMU devices.

Dmitry Baryshkov (9):
  dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
  dt-bindings: arm-smmu: fix clocks/clock-names schema
  dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
  iommu/arm-smmu-qcom: Move implementation data into match data
  iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into
    qcom_smmu_create
  iommu/arm-smmu-qcom: provide separate implementation for
    SDM845-smmu-500
  iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match
    data
  iommu/arm-smmu-qcom: Stop using mmu500 reset for v2 MMUs
  iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 168 +++++++++++++++++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  91 ----------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 156 +++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  21 ++-
 4 files changed, 288 insertions(+), 148 deletions(-)

-- 
2.35.1

