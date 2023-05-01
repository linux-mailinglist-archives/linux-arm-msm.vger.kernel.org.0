Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502166F357F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjEASDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbjEASDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:18 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A391BF0;
        Mon,  1 May 2023 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hly19WrHU3mwT/p+e8G3NHpZwHjvoxc1y9tuum7fTXAcwk9F4yJSl3KcGFOcha33TuEsd86NkSa1gsochQ+4/IF40qG32Az9/YmXPZY2riv9WcNSgDRKyNLHICeJmLVqvgCxiQwJDy45CCvj02SnQXJSZVRHpFjGOSEg+RKx2DAK1HNVTY6IY6A/09aSkB29P4KwNfGLgYWOTA4/PEBYg53vK+HHmGOZGkw1H0Ae9L17YHqNtcFBT3eYCGLPxXLGiqe2Ss1qO60R2sKeqlOWtIBqCyXHwuKqDyINyoMKN7LP8T3x6KjPxa3PlYTd/2d1Xf1BtFiwDUFUv+hb1ol/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbkMEVVNR9t+BSUPNC+hdaSI387v0NJbJBxsOBv2tlk=;
 b=lbjlyTry7mi2O/PZL45CGY9j7njYojbFuyAhH1UAYRSAnhXaJb9qpKb+h+ETG0y5VBt8JsbnMFjX2UTLYMsI+pvj0F0mBWtr+qi4RKfTfU9fBAt7Yye4yKYKes8x1PyoLr9Pu/ANSgH8m+1tqk+MLOi7ArK1nnR5y0Xi/j1pS7P7HqLTSPUDEiNbIfci/pBl6M6oo10M9Lt3W4DbbFIf52MTodz6k7BghCbpz5i4CZUFVj4ZnJxwgxY9423hM/4J3xdarWoFrHAbklk3R0Gc9nB3Ex6NvZYxAm9nK4dqCNF35rYDYyo2+oz4+hSQja7K6nLYjW2LY9wcqdPRpC4koQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbkMEVVNR9t+BSUPNC+hdaSI387v0NJbJBxsOBv2tlk=;
 b=me+yZQi/nPhmMD9dkKixeR8Wa79czwW9ZIrTZm8NlDS/JSqqF5giXrr+eT3jxUSFol/shv8Z/OL5WzWhtnzCedKQNsauIY/UwWBlEHDf8wtJ5+yuVbnO9h1tGqBwMZFLDYyG4dJB6QMB0UcbgWLbiZrh6wJuKVqgmSJxEFvhBnSIhzQzqO+IKrGjJVcGh70k3fO86Zk8jf3Imm7RdDidDsnsqLwzeSsogcL5VcHLPag3OsLE21mN73FaiLi4AcYBOlor/+L5qyjB6ZnEoC6e+snzdJc17FliC65szVkTZraL5F3VwjuQDO/E6gLSeqF2uzW23Yn3TKxtt94siYznIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:15 +0000
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: [PATCH 00/20] iommu: Make default_domain's mandatory
Date:   Mon,  1 May 2023 15:02:44 -0300
Message-Id: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0015.namprd18.prod.outlook.com
 (2603:10b6:208:23c::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: e19cdf1c-de59-4487-9fe4-08db4a6e51e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VlU2TEGIPmM6jivGok1ijpV9nYm947Seat2AhPahVeC9sQNftwnKvVRm98SbxUyO2+vm1a/Dp4Yoh5RtnWDU+kwB5tXJQhRKA3YmonMRGyDsw4NFTI4ZX1KYzmlXmyzYaoomXiHme1SPZsotuUo8kmLmn2cDcrnkkBcGg/IJQ5B+gkw7iT1EL3irNpPC1Rjq4CvvPI+EIAQHAvPu0UQj5bCBOCq3CWmz44QKuMQpHswhMvKnkOGwi+h2ugHdPX3J7iJSyA/M0XD9wpfRwuLWttFnbXZzn4LZndAXY52aTo4zLcLohgJFIdXrDqHXvGTGZs5ts0nAkEW+2h+NX6cbNAY60Iuwy+43kHOIR0fVGhGauVvCagBsnK8gKB+4S7O2ehW7dcKf8vjmmVwEwHHlU8FhGVYetcjSf3QD/zRl4WIHA329FuLSY/g9rMHMim/+MiE7kEl+dckR+8xTmQn3cdIaWLH9zYH6Cw23FhjEsu1pgeuMFT1XK3/5d0d1ham+87TYx8hwVrhTyE/srk3FaE5wAuqskxvd9OVQADEoEKxvnCmfvlA1r6tTr54ovv29K0rzx1jxR2MlfqPaGHMbFWvllPv+f8LVsqO04owcjmLzksD0kHkldX/vVXj8RFtlcK1qj/AHyJ13gkZdpzkpFeFCg82iAK6HmSXR53x+7IKQnPhaVrSA1iY0prtj+UkNG3MODIwtZ2V+RMD9XDPoHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(7416002)(7406005)(83380400001)(2906002)(5660300002)(41300700001)(86362001)(316002)(8936002)(36756003)(2616005)(8676002)(921005)(38100700002)(6666004)(6486002)(110136005)(26005)(186003)(6506007)(6512007)(4326008)(54906003)(66476007)(66556008)(478600001)(966005)(66946007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I1cWrUrxEdWUv2u5vftjaKOCEMCZD+8ynpjWN2GfSIYBtKS3msZD8IM2A5iv?=
 =?us-ascii?Q?2C13p3OmclynIinTT4x6+QHfEiwYhTf9yy20W7wEVj/+BtFckkUtTedo6dFh?=
 =?us-ascii?Q?igouPXKBrRGpJEUlWOFV06T9rZNfkU2iimQhSaOYPtpmNSNxyScLejZqE9r0?=
 =?us-ascii?Q?zOfF7KX7Og3XVc7dkGB2oCgsdtAT/vkd4lQlALqYgdw2wp3ux/X35XTS6d5D?=
 =?us-ascii?Q?8TBI4mZwPzAQBnoxOnYiMSNZGhpK6kTLmCkMfUoXHXakxXtTVWAuItYOUrGx?=
 =?us-ascii?Q?TjOTU0/IioyKQkO/ppjhqQfHqllBGc0vhzfOtxrlZusp1XACiCdcrauVHFFV?=
 =?us-ascii?Q?5sTlzgCYTHqI2EwSDSygHSWFREJPu1qvpAfZyJzhrFtgdNQ3D7UQ45trQMhO?=
 =?us-ascii?Q?9pVFtGaR4G8scba9bhbU9ixXE8zFn+3L7171NYsAV8qOb4Vw2o5EkdS8OYZK?=
 =?us-ascii?Q?Zt7emZ93c2DoN7DKH9e4AThHXnRTQhO71K3+hTiPYYAe5zyaLwfpBtx+XMLG?=
 =?us-ascii?Q?m+yHZNkqVy4JuJsH2VEcObJJE6z9eGv4D80Rghhjtf0T64pm+MMCPkLBkBpw?=
 =?us-ascii?Q?6slUgB+JRW/IL4rcqbChvK8yOzqqlQxOhzw1IwGRQHqtb+fJfD+bk0mmvUed?=
 =?us-ascii?Q?R4somvoAv8J/umRFN8aNvcv0TkEjHSmbnQtU4wKiUygId2ya481bu/q2qOQe?=
 =?us-ascii?Q?4mVmneGjml+cUSMe56Gr4vlWPWvEzOxQtaqQ2UkQHGIuO+GAuck7VozTsrn1?=
 =?us-ascii?Q?yMt9FlpCCtN6h8eHBEzl6RjIM4lRjhejGbxHruqdF+5QnQgUTmdoR7Nu5e1p?=
 =?us-ascii?Q?dwlNtXICRTMg8o6+3HP/jgajtlBikl6TzwrdrCqX3MIe61tO7iIvD9IgzXCW?=
 =?us-ascii?Q?KSlrdE5h75JgqIwRs1r449SjogCTbz8DX3EXk1etbRWscGMaBwQw5cJV3Nro?=
 =?us-ascii?Q?8EyRYpN8EXrGhYBkpp0lnYXTmp/shLaR6r9F7BIQjNn+gaH2ESdvTPlQS5a+?=
 =?us-ascii?Q?HMc7YmPUJnoHiFGYd6wXbig8pjhMNm/UdvFI6Ik+EudIR4z9R2nYnoxntGQQ?=
 =?us-ascii?Q?7k3CTOdOy0DAUMGaOtDcwFNHP7XltdFQ7Ix+yiqxxsj1A729G1EwZu8jF/5R?=
 =?us-ascii?Q?U4rHHpUAmOlwQpcvP0YrjC6zGDvoY8VwkFEkdROh9PDsY+B7WAW5X15tOrN5?=
 =?us-ascii?Q?gyPPhB+9y8zXF03SKFJKagmzAJB7fwxYHdSi0/pHpvHrlT6kCPkAfJ1jSF90?=
 =?us-ascii?Q?om9aIrlLLFqZrZH6JQRkhtfcie2DeWaR+NcQyI4oviQstHtlxHC8MS1OfL1E?=
 =?us-ascii?Q?JUUDr0yBBh8z/QDRTYH/zwZfUfgaUmsDV5v2AXbE7MZq2ldlOkc5Eu2YHmqi?=
 =?us-ascii?Q?u0CJN1400w5hd8cV7MPJd5+T3sDgBZDkMMuGuhkxaR6RAmA/wko8AtGdwDfP?=
 =?us-ascii?Q?8k+PJuTvqaxu4vrMxxZmD/cDuu47oWFneZ2ptJ4GmRQFCq/NViSnOM4tPqQv?=
 =?us-ascii?Q?Shs+DhSUcYchdXUrhRGOUDDrR3YToD27Dk2skDGR3cZ/xONOE7re2u/Xd2PB?=
 =?us-ascii?Q?hpcdxrkaGsTWuDgt5P79phad0A5o+EyphuHpNuXw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19cdf1c-de59-4487-9fe4-08db4a6e51e7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:08.6279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr2/+TH21ZI943/M2P5cWxc73azsvCfdL/V2Gw5k/4oCwAdJxlSDbcM+tURaiVri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It has been a long time coming, this series completes the default_domain
transition and makes it so that the core IOMMU code will always have a
non-NULL default_domain for every driver on every
platform. set_platform_dma_ops() turned out to be a bad idea, and so
completely remove it.

This is achieved by changing each driver to either:

1 - Convert the existing (or deleted) ops->detach_dev() into an
    op->attach_dev() of an IDENTITY domain.

    This is based on the theory that the ARM32 HW is able to function when
    the iommu is turned off as so the turned off state is an IDENTITY
    translation.

2 - Use a new PLATFORM domain type. This is a hack to accommodate drivers
    that we don't really know WTF they do. S390 is legitimately using this
    to switch to it's platform dma_ops implementation, which is where the
    name comes from.

3 - Do #1 and force the default domain to be IDENTITY, this corrects
    the tegra-smmu case where even an ARM64 system would have a NULL
    default_domain.

Using this we can apply the rules:

a) ARM_DMA_USE_IOMMU mode always uses either the driver's
   ops->default_domain, ops->def_domain_type(), or an IDENTITY domain.
   All ARM32 drivers provide one of these three options.

b) dma-iommu.c mode uses either the driver's ops->default_domain,
   ops->def_domain_type or the usual DMA API policy logic based on the
   command line/etc to pick IDENTITY/DMA domain types

c) All other arch's (PPC/S390) use ops->default_domain always.

See the patch "Require a default_domain for all iommu drivers" for a
per-driver breakdown.

The conversion broadly teaches a bunch of ARM32 drivers that they can do
IDENTITY domains. There is some educated guessing involved that these are
actual IDENTITY domains. If this turns out to be wrong the driver can be
trivially changed to use a BLOCKING domain type instead. Further, the
domain type only matters for drivers using ARM64's dma-iommu.c mode as it
will select IDENTITY based on the command line and expect IDENTITY to
work. For ARM32 and other arch cases it is purely documentation.

Finally, based on all the analysis in this series, we can purge
IOMMU_DOMAIN_UNMANAGED/DMA constants from most of the drivers. This
greatly simplifies understanding the driver contract to the core
code. IOMMU drivers should not be involved in policy for how the DMA API
works, that should be a core core decision.

The main gain from this work is to remove alot of ARM_DMA_USE_IOMMU
specific code and behaviors from drivers. All that remains in iommu
drivers after this series is the calls to arm_iommu_create_mapping().

This is a step toward removing ARM_DMA_USE_IOMMU.

The IDENTITY domains added to the ARM64 supporting drivers can be tested
by booting in ARM64 mode and enabling CONFIG_IOMMU_DEFAULT_PASSTHROUGH. If
the system still boots then most likely the implementation is an IDENTITY
domain. If not we can trivially change it to BLOCKING or at worst PLATFORM
if there is no detail what is going on in the HW.

I think this is pretty safe for the ARM32 drivers as they don't really
change, the code that was in detach_dev continues to be called in the same
places it was called before.

This follows the prior series:

https://lore.kernel.org/r/0-v4-79d0c229580a+650-iommu_err_unwind_jgg@nvidia.com

This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

Jason Gunthorpe (20):
  iommu: Add IOMMU_DOMAIN_PLATFORM
  iommu/terga-gart: Replace set_platform_dma_ops() with
    IOMMU_DOMAIN_PLATFORM
  iommu/s390: Replace set_platform_dma_ops() with IOMMU_DOMAIN_PLATFORM
  iommu/fsl_pamu: Replace set_platform_dma_ops() with
    IOMMU_DOMAIN_PLATFORM
  iommu: Allow an IDENTITY domain as the default_domain in ARM32
  iommu/exynos: Implement an IDENTITY domain
  iommu/tegra-smmu: Implement an IDENTITY domain
  iommu/tegra-smmu: Support DMA domains in tegra
  iommu/omap: Implement an IDENTITY domain
  iommu/msm: Implement an IDENTITY domain
  iommu/mtk_iommu_v1: Implement an IDENTITY domain
  iommu: Remove ops->set_platform_dma_ops()
  iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
  iommu: Require a default_domain for all iommu drivers
  iommu: Add ops->domain_alloc_paging()
  iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
  iommu: Convert remaining simple drivers to domain_alloc_paging()

 drivers/iommu/arm/arm-smmu/qcom_iommu.c |  45 +++++++++-
 drivers/iommu/exynos-iommu.c            |  71 ++++++++--------
 drivers/iommu/fsl_pamu_domain.c         |  36 ++++++--
 drivers/iommu/iommu.c                   | 108 +++++++++++++-----------
 drivers/iommu/ipmmu-vmsa.c              |  50 +++++++++--
 drivers/iommu/msm_iommu.c               |  30 +++++--
 drivers/iommu/mtk_iommu.c               |  30 +++++--
 drivers/iommu/mtk_iommu_v1.c            |  28 +++---
 drivers/iommu/omap-iommu.c              |  28 ++++--
 drivers/iommu/rockchip-iommu.c          |  26 +-----
 drivers/iommu/s390-iommu.c              |  28 ++++--
 drivers/iommu/sprd-iommu.c              |   7 +-
 drivers/iommu/sun50i-iommu.c            |  30 +++++--
 drivers/iommu/tegra-gart.c              |  37 ++++++--
 drivers/iommu/tegra-smmu.c              |  39 ++++++---
 include/linux/iommu.h                   |  15 +++-
 16 files changed, 407 insertions(+), 201 deletions(-)


base-commit: 91d1e2076e3a796fbf3ec5ddcf5266febc7acb39
-- 
2.40.0

