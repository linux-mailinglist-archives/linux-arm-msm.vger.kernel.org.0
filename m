Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3F562867C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbiKNRGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbiKNRGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:39 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384B8F59C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:38 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d3so14075591ljl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6guTtDkA1ReGKdqMu1CmE/t+c1qdwq/DIe8B70Maw4=;
        b=lXt9G05aMbjIX8SyJJmKxQQbhZbT47qR3PDriRUC/rwgstPI+MLj2IFqwqUnpZ5tU3
         ayjVTb6PpWhS+A2bV67A6/YDG2ql+DBZdtCwwlg62vZCFRODHCAhjZhgjgpGa98zlYua
         pL4KZFtycsD2vkES+aMG8bJdCT7dTW0auwFq82bVlk19ckcJuRjI6UU/glPoHnmz6cxY
         NfXglJ+Do9C4CJB0/BTKUhGIexhuMIfUFhFq03SoKV+AvchXxYvb9NdZmYk9WJ0sWRtW
         7OugrtBlrqzWa9ZLPsxTLLo2jyE5UOP05RpTJR8nfJQYf/Qe6TAG+tddDgln383CNe5N
         7GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6guTtDkA1ReGKdqMu1CmE/t+c1qdwq/DIe8B70Maw4=;
        b=BTKzUhOTe19F6pLgYIsVy5tD7UBeX5IqIVk44rAPghrXP4DCYq0v+LG0+owRi4H8f4
         LLWjsszCLNwVARbUegNxAdsznGxqDfhb3BJGUqoEkDkhncDOweFmPdbzsZ64Iypp/mVt
         LK6tIOkJcB2heg2m/VtSyMV3sCq1XgrGHmz6Xn2UOhIQoi15HFUYxnlXFbVMa2VvrEOZ
         SqReAiBR03gvYhSVnrcApxki5NkWGm4yM8gk/ckbaTPM+5K+uZh/ikeuODzhQWGjXkLQ
         VVMYplnbkRHBcm1v2y0RMJ6BWOwXlu7rFu3ROowcnYJInbEe0YN7JbFCxP+9j32Y9DO1
         Cr3w==
X-Gm-Message-State: ANoB5pk8OYz6A58cOeS1NkVKNCXeAD8ydTsMq4rpdDHwhXNXV0HY+OXg
        RY+xTPvg9RaF1yKxGNqQiAPF2g==
X-Google-Smtp-Source: AA0mqf7mzNaaz3n1mkr6Lj1F4uek+u1lXPv2BxwOoadDwOtOhQ+ybNFAsCQDUPJniHl3xDGMrg1xYw==
X-Received: by 2002:a05:651c:194a:b0:277:9e5:6cc9 with SMTP id bs10-20020a05651c194a00b0027709e56cc9mr4916409ljb.165.1668445596544;
        Mon, 14 Nov 2022 09:06:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:36 -0800 (PST)
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
Subject: [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework Qualcomm SMMU bindings and implementation
Date:   Mon, 14 Nov 2022 20:06:25 +0300
Message-Id: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
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

Changes since RFC v2:
 - Dropped the dts patch, picked up by Bjorn
 - Fixed minor nits in commit messages and in-file comments (noted by
   Krzysztof and Richard Acayan)

Changes since RFC v1:
 - Added the dts patch fixing order of clocks in msm8996.dtsi
 - Fixed the DT bot errors
 - Added separate clause for Google Cheza devices

Dmitry Baryshkov (10):
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

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 173 +++++++++++++++++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  91 ---------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 163 ++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  21 ++-
 4 files changed, 298 insertions(+), 150 deletions(-)

-- 
2.35.1

