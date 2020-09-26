Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FB527995F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgIZNAN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgIZNAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6E8C0613CE;
        Sat, 26 Sep 2020 06:00:09 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z4so6893360wrr.4;
        Sat, 26 Sep 2020 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAcoT4e7//N0L9a2DDThzgnZpyqBXzsg7G0B+Oty6tc=;
        b=YEFZLk3cJa28x/a0LzCSWhYC+2UQHeOq5V07AWVziptgbTzNHTFXbNJujyKUitFRQw
         tMUnEn6ro0Z5D7Vl1PBzFlrs34BSqmhXVpdh1AgXNV4WYlXjXtHE3lDeovrqhMF9J9sx
         sUn83NtWSG56E4dG41BaWRujxLWSG2vYCpnVzi/axvbCaA8SqGMiZDgL2FZCEQFaRq6t
         guKkcbrJC0Fryy3ifKpb5TZjW/TaP4Irb3HAhiZXqVXxX8KYdM3ZSVR2qTRBygRW1UcS
         qMxGwADOtTHsIDZCIB9vkk16glPQmPJSa1iMbQEaXr7faabgHDwHrBqu/gBN61GVFJ1P
         O9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAcoT4e7//N0L9a2DDThzgnZpyqBXzsg7G0B+Oty6tc=;
        b=Te1/yuyhUMBY3q64/eCP+6ocPOW0VBuSWJDl7lFrslQflBhfOhz8M6hAPdHmisKXRt
         B2stc32LOf2xFbAubZ5soHMrn1QQUZMvSiNuOAVYvwqD17Wg1UDzbUXerz31PZg536Z8
         44RaFcJvtogyHVNUTIOIXzkTfHwGjje3ssymfObGCwzpUuq/8QFYlWr/GsnKA3zH2e+A
         WPTy2qGXgGBy2tibYRISLB7A6TNGt9dlblL6b7DGAqq/ogMJkR0oxWcokBNg2ERhhzAz
         bhIz/+gsbBFYfIZwiK/qls0vy1D7wf88s3wa/86PoVrD3mas5CPNAGugMZLnovUAWrzo
         KmDA==
X-Gm-Message-State: AOAM5314yHrhM1rhssBNQIo1W2n3E59k8shyR79AfoJxULRQyqZQ6FsC
        KTECUuRbsyPxY5u1Vz5HEQI=
X-Google-Smtp-Source: ABdhPJxOT7l7/Elc5zO2CHh/l9y3x4rzuvfL4itTCERHNUCo2rwzkXL7LybRxm2uIWBRmBxy51M64A==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr9349083wrq.365.1601125208258;
        Sat, 26 Sep 2020 06:00:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:07 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Implement firmware quirks for Qualcomm ARM-SMMUv2
Date:   Sat, 26 Sep 2020 14:59:56 +0200
Message-Id: <20200926130004.13528-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

In this patch series, I'm implementing some quirks for firmware issues
happening on various Qualcomm SoCs, including SDM630, SDM636, SDM660,
their SDA variants and, most probably, other MSM/APQs.

In the specific case of the 630/660 family of SoCs, failing to apply
all of these quirks means complete havoc when enabling the IOMMUs,
as the firmware that is running on (almost?) all of the commercial
boards (smartphones) is set to give us a "nice" hypervisor fault,
resulting in either a system hang or a reboot.

The actual implementation of these quirks in downstream kernels is
done through reading some DT property and varying code paths, while
here it's done through the implementation details for ARM-SMMU instead.

In short, the quirks that are proposed in this patch series are the
ones relative to the following downstream properties:
 - qcom,use-3-lvl-tables (39-bit VA size)
 - qcom,skip-init        (avoid stream mapping reset for secure CBs)
 - qcom,no-smr-check     (manually set correct streamid/smr masks)

This patch series has been tested on the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

AngeloGioacchino Del Regno (8):
  iommu/arm-smmu-qcom: Rename qcom_smmu_impl to qcom_smmu500_impl
  iommu/arm-smmu-qcom: Add QC SMMUv2 VA Size quirk for SDM660
  dt-bindings: arm-smmu: add binding for SMMUv2 on Qualcomm SDM660
  iommu/arm-smmu: Support test_smr_masks implementation detail deviation
  iommu/arm-smmu-qcom: Add test_smr_masks detail to QCOM SMMUv2
  iommu/arm-smmu: Move stream mapping reset to separate function
  iommu/arm-smmu: Support stream_mapping_reset implementation detail
  iommu/arm-smmu-qcom: Add stream_mapping_reset detail to QCOM SMMUv2

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |  3 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 59 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 28 +++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |  2 +
 5 files changed, 85 insertions(+), 8 deletions(-)

-- 
2.28.0

