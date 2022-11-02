Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966B4616CB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiKBSo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiKBSoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB492D1CC
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g7so29704739lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9I1z4AXsJK+25P06vSnuu3hIZEjku7ef8TqnyD4Aqg=;
        b=kTDv3XtmSj8ZzEhElD+tS6kV/E5rjqnEgwJn+7OtiDgaoylq7zpGu0O8MsV6YUggqZ
         tpoR7YynzbGW8BD0B0/UuAIE45M6gqQ/QoVDCinax2fD7nl54xrTH6lMwTC9ZlxNIYUr
         +/gLjkbwGIac99WXTE1xsNir/QYRDCCahPRSLYhR2Q1fYoksslmTLMH+ImFxUYv5e1x7
         uA4RKNM482d0SL/u3Sakay2t8ryF0pezayc0lb/ZgxbkAyz3TvYU3X0yEI6tWgpNQZ7H
         uQdFIYxdSZL4Bfy60szDSIzNerJ7fz/TUlwQN46zBj/z2yK5gbEXKEKdNj0Ag3Fw8LyB
         u9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9I1z4AXsJK+25P06vSnuu3hIZEjku7ef8TqnyD4Aqg=;
        b=GVTQd7cFruwNoqvKUPkSwSTLNz4JqoBpMtHxrT8F5UzlGYMqhHF6P3HPjOR197kmQk
         IOcKFSGu1lda0d+FauQ+CM/dGiE/V1vwJRoMW2a+dL1SQlB7ZHHXxgI2dHrAC+TJ48Dx
         eEd71RcLF3UEPUsuhhBtufhH3CZNHw4YsFiUS9qfJ0zZaI5+qteR+oeP0GUKVHFEbgO5
         omx+/7PIU7BeW8m/GuRDdeeGFvKosdYgm9l2cyKS0J2zeU4+mTPO9cra70as2G2loYfw
         Q4wtI0qWhIvDcJ4lsXL5AFPt/7YLbh4g7JYBddfPxzk2W8oXAbJ3yOM+j/NP1a3t0fdb
         3U9w==
X-Gm-Message-State: ACrzQf1RQgNQhQDwo3MIuugHoSseCX0cBw0jgRAGTpHSdBhAH3+FTFUm
        AylyPyaM/6YnurEPUSMctbevWA==
X-Google-Smtp-Source: AMsMyM5KhE+waYR30gx/0w7uAuJpT6jJfFha4iriDSYOuqxv78t3C1EPaBfdCNkuA9y8K6jwgl3ddQ==
X-Received: by 2002:ac2:4d2e:0:b0:4a4:7ed0:76c0 with SMTP id h14-20020ac24d2e000000b004a47ed076c0mr9309861lfk.240.1667414661707;
        Wed, 02 Nov 2022 11:44:21 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:21 -0700 (PDT)
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
Subject: [RFC PATCH v2 00/11] iommu/arm-smmu-qcom: Rework Qualcomm SMMU bindings and implementation
Date:   Wed,  2 Nov 2022 21:44:09 +0300
Message-Id: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
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

The main goal of this patchset is to define a generic qcom,smmu-500
binding to be used by newer Qualcomm platforms instead of defining each
and every SoC line with no actual differences between the compats.

While preparing this change it was required to cleanup the existing
bindings and to rework the way the arm-smmu-qcom implementation handles
binding to IOMMU devices.

Changes since RFC v1:
 - Added the dts patch fixing order of clocks in msm8996.dtsi
 - Fixed the DT bot errors
 - Added separate clause for Google Cheza devices

Dmitry Baryshkov (11):
  arm64: dts: qcom: msm8996: change order of SMMU clocks on this
    platform
  dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
  dt-bindings: arm-smmu: fix clocks/clock-names schema
  dt-bindings: arm-smmu: add special case for Google Cheza platform
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

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 172 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  31 ++--
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  91 ---------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 156 +++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  21 ++-
 5 files changed, 307 insertions(+), 164 deletions(-)

-- 
2.35.1

