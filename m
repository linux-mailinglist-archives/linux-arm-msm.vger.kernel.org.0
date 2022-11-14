Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D7F628970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 20:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbiKNTev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 14:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235592AbiKNTeu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 14:34:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB405F97;
        Mon, 14 Nov 2022 11:34:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52E6DB81205;
        Mon, 14 Nov 2022 19:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA63DC43470;
        Mon, 14 Nov 2022 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668454487;
        bh=CuwMs99TjE78c+mlY/tZXo+Tx3njBz0189Z4KS2uvJM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WfsPRb5Nlg3BFIKxuwy3xXMIzTFF02DLRVEs54IDuI0lh22oI0K2eABmORJuYksHa
         SH8gT8hLULyh54ZLT1hYq2k0mEhJ3khuDhcY0zM6kb2gVU2OhC/xpaFvt1ge9BDLie
         N4Pg0akBOS34NMSgFzzXaHayPzEI+TCKwr/BuesxWEVVHLw8s8PKBZxfu2ig5D4Usf
         e7Yoee2QQIS5HGaFsK8zLbEH7Z01gFWM3dCh7JjuuNPI8fFHNrQl75OXaSZzddLG5O
         VRzZxOINDA6ppmHWiK44xmWu5b7FiH0Tp2GjenBofw9hZOYdTNMaI8rfLxo/DaZSKQ
         lyLrfpceNUH+g==
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework Qualcomm SMMU bindings and implementation
Date:   Mon, 14 Nov 2022 19:34:31 +0000
Message-Id: <166844937986.3420632.1434919868977710080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Nov 2022 20:06:25 +0300, Dmitry Baryshkov wrote:
> The main goal of this patchset is to define a generic qcom,smmu-500
> binding to be used by newer Qualcomm platforms instead of defining each
> and every SoC line with no actual differences between the compats.
> 
> While preparing this change it was required to cleanup the existing
> bindings and to rework the way the arm-smmu-qcom implementation handles
> binding to IOMMU devices.
> 
> [...]

Applied to arm64 (for-joerg/arm-smmu/bindings), thanks!

Note that I removed the 'qcom_smmu_data' structure completely as it was
no longer referenced after patch 9.

[01/10] dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
        https://git.kernel.org/arm64/c/dbf88f743583
[02/10] dt-bindings: arm-smmu: fix clocks/clock-names schema
        https://git.kernel.org/arm64/c/982295bfe369
[03/10] dt-bindings: arm-smmu: add special case for Google Cheza platform
        https://git.kernel.org/arm64/c/3a12e8c06536
[04/10] dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
        https://git.kernel.org/arm64/c/6c84bbd103d8
[05/10] iommu/arm-smmu-qcom: Move implementation data into match data
        https://git.kernel.org/arm64/c/4c1d0ad153f8
[06/10] iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create
        https://git.kernel.org/arm64/c/30b912a03d91
[07/10] iommu/arm-smmu-qcom: provide separate implementation for SDM845-smmu-500
        https://git.kernel.org/arm64/c/417b76adcf1d
[08/10] iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match data
        https://git.kernel.org/arm64/c/4172dda2b30a
[09/10] iommu/arm-smmu-qcom: Stop using mmu500 reset for v2 MMUs
        https://git.kernel.org/arm64/c/b4c6ee515c42
[10/10] iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry
        https://git.kernel.org/arm64/c/80b71080720e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
