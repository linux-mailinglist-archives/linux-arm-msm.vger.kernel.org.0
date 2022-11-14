Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F84062824F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbiKNOVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237018AbiKNOVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:21:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13EC264AF;
        Mon, 14 Nov 2022 06:21:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9BC5AB8103F;
        Mon, 14 Nov 2022 14:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D1EC43470;
        Mon, 14 Nov 2022 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668435664;
        bh=V1BNY7UIADyWHVs3HzCQ76oze1s73lFOwOpF0l/m0+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hEnqaPP0clO/WXBeBVERbKedz+e5OFsRqR9WSsGcIdYOfJUKs6bIlHhjLgjYFaDNM
         tf5nwpF23QQD9dBfcCQfLdFdvPZK8RYl7XarVMKLsm1KDZG5yCLGWevHMuUV4mu5M8
         bOMg3GCf1WufxAWfy6gAP1n4+oGSQMQTqLrHV+Oex+Y5BOx26UbyeoA2eH5Xvu7G0a
         7P973J32q6oOJDGAOR76jkc0kDI05OEfBKgacb7iTvxnHlyN0qZExD9IGvTJ1JJdbJ
         74lrT1RSqnC4O8ob3pNbIlvKJzR9d7lH+9gp4Q7LKsVlLhRhsEte7LZwGX29OuYL4G
         EWBAsG9hGUjyw==
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>, iommu@lists.linux.dev,
        Joerg Roedel <joro@8bytes.org>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/1] iommu: SMMU for SDM670
Date:   Mon, 14 Nov 2022 14:20:54 +0000
Message-Id: <166843520961.2455954.5690901880353961653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221111003606.126795-1-mailingradian@gmail.com>
References: <20221111003606.126795-1-mailingradian@gmail.com>
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

On Thu, 10 Nov 2022 19:36:05 -0500, Richard Acayan wrote:
> Changes since v4:
>  - version bump to fix double v3 (0-1/1)
> 
> Changes since v3:
>  - drop driver patch (2/2)
> 
> Changes since v2:
>  - rewrite driver patch (2/2)
>  - rebase on (1/2):
>    https://lore.kernel.org/linux-iommu/20221102184420.534094-1-dmitry.baryshkov@linaro.org/
>  - reset review process (1-2/2)
> 
> [...]

Applied to arm64 (for-joerg/arm-smmu/bindings), thanks!

[1/1] dt-bindings: iommu: arm-smmu: add sdm670 compatible
      https://git.kernel.org/arm64/c/8d3a9ec6ae28

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
