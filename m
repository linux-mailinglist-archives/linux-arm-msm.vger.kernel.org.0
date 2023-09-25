Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CF27AD4B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 11:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjIYJlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 05:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjIYJlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 05:41:49 -0400
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB2C39C;
        Mon, 25 Sep 2023 02:41:42 -0700 (PDT)
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 77E231A21FF;
        Mon, 25 Sep 2023 11:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1695634900;
        bh=NxrKhr6WG806XBJKBm2IQBKy1pD2rNt9qo9c3PhenPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GA2roFK14T/HQ96iZoC9nQCcCo2VMXnhAiD8ufn22sBjj4nGQjiI9eN19UQ841ll3
         tvmwuAznroYnlkDSX8YTdeSVvZ5KpTzjXvuSOcVi3oi86ErBR5VUYuyHP/MA5BOWAU
         2wX/3AeQvi06bRFniHUSbxMlOYWJVwrevTN+8G/rCRuZXK0/Oah1SMzErVPnQM/e2T
         NUJCJaJ6P7HXKFeguW86oDlRl/R1XGiBrT/L/fsslL6xPva/C12AXKWxwIS06iDf1G
         mjJRMv3x6qjDMx6PAdu3wlyXUnjfaKVtb3KqzO0YfjGfzBDGWx9Kyiat+OEkROq8qK
         VOyZFET5SBvfw==
Date:   Mon, 25 Sep 2023 11:41:38 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v8 00/24] iommu: Make default_domain's mandatory
Message-ID: <ZRFV0vxoexLu-CWJ@8bytes.org>
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 13, 2023 at 10:43:33AM -0300, Jason Gunthorpe wrote:
> Jason Gunthorpe (24):
>   iommu: Add iommu_ops->identity_domain
>   iommu: Add IOMMU_DOMAIN_PLATFORM
>   powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
>   iommu: Add IOMMU_DOMAIN_PLATFORM for S390
>   iommu/fsl_pamu: Implement a PLATFORM domain
>   iommu/tegra-gart: Remove tegra-gart
>   iommu/mtk_iommu_v1: Implement an IDENTITY domain
>   iommu: Reorganize iommu_get_default_domain_type() to respect
>     def_domain_type()
>   iommu: Allow an IDENTITY domain as the default_domain in ARM32
>   iommu/exynos: Implement an IDENTITY domain
>   iommu/tegra-smmu: Implement an IDENTITY domain
>   iommu/tegra-smmu: Support DMA domains in tegra
>   iommu/omap: Implement an IDENTITY domain
>   iommu/msm: Implement an IDENTITY domain
>   iommu: Remove ops->set_platform_dma_ops()
>   iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu: Require a default_domain for all iommu drivers
>   iommu: Add __iommu_group_domain_alloc()
>   iommu: Add ops->domain_alloc_paging()
>   iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
>   iommu: Convert remaining simple drivers to domain_alloc_paging()

Applied, thanks.
