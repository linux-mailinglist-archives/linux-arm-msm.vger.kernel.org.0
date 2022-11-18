Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982D862FE1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 20:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbiKRTld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 14:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbiKRTlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 14:41:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541CB8FE72
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 11:41:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0D0F62761
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 19:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EDEC433D7;
        Fri, 18 Nov 2022 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668800470;
        bh=posWlieo1HSkWlOFf28tzyqA6SJP9dICLx1Oja9VN1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uxfkf96ws4hTQIOMAxWB6fSW1AeGR3M+tedJmd+hLs8YbZTVwPyD5mQRk3ddhshjN
         wtL4jTt8dywv14Zn3U89haALOPgLt99cRQZKDmu4+lVi7knSgVfM1z3lcx5dSp4yqT
         NNdhKGrRqwxkG1ZEqkuMwHE84KCyyq6LD5DAokUvThXTyoGzfjJM9+zLVrd8O0zSEy
         xSXX3bRrcfqLef6Aj8Y8CXrfmP6zhwuhJEkbjcJ3BXfht5yOmYfUj8eVmt/LrYV0xs
         Z1sGW+mzWAqDy5Bbei2bbn85h5inKbzOk7R2krBENhvCpjNXrkQCHooM94vZpGEaIN
         QRZtpHAz1B2OQ==
From:   Will Deacon <will@kernel.org>
To:     agross@kernel.org, andersson@kernel.org,
        krzysztof.kozlowski@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, patches@linaro.org
Subject: Re: [PATCH 0/2] SM6350 SMMUv2
Date:   Fri, 18 Nov 2022 19:40:44 +0000
Message-Id: <166878100009.1783378.10278950075023196223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221117094422.11000-1-konrad.dybcio@linaro.org>
References: <20221117094422.11000-1-konrad.dybcio@linaro.org>
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

On Thu, 17 Nov 2022 10:44:20 +0100, Konrad Dybcio wrote:
> SM6350 has a SMMUv2-compatible(-ish, obviously) instance that
> is responsible for working with Adreno and its GMU.
> 
> Recently, it was decided that there is no point in adding more
> mmu-500 compatibles to the driver, however after chatting with
> Dmitry on IRC, it was concluded that it's okay to add that for v2, as
> these older implementations can vary so much from SoC to SoC that
> having a common compatible is really not feasible..
> 
> [...]

Applied to will (for-joerg/arm-smmu/bindings), thanks!

[1/2] dt-bindings: arm-smmu: Add SM6350 GPU SMMUv2
      https://git.kernel.org/will/c/5a47cb4df38b
[2/2] iommu/arm-smmu-qcom: Add SM6350 SMMUv2
      https://git.kernel.org/will/c/3811a7283a0a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
