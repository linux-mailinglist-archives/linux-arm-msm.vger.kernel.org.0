Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2E76F3562
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbjEASDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjEASDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:13 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965361701;
        Mon,  1 May 2023 11:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn5n5/uy8arpdCO/FCoTlr5nakBCnoBxc4vcAqDwCtW+GKKOcuIpiKHSezA6UEntiaCTVr6YH8jn7DfFJXyfxxZJXBC1nqNXH0brrJy3f7wFMia+sYn0cbvAcWs7XVh09o5TOAaZrMNS4/82ckj9uVrVeIb2p2BWSmv5kJlpjHLw6WyYB2zKGnRFVx8fwCyXaN625AGkyxBgFc4O5v++DI6PuFjSLy7WFN4qzgo7yvx6UgI/dZj5ZD0I47UV/ynOn1lyQ2ZkyFRwQkcuCD0nTvj/LLOsS9/xdI5haK/rEVW05XIcLRfyY7mommY6scZcUCm39C5OASWr9GQ7x6sTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OI2v11dq4OEx2gLDy2O7l71iByKKW+EhN7rOl8rezc=;
 b=Nxd9UnPxdpnMpVtq9XKwVjzUYO0Nrnry0L14EbLci5K29PkiCu6JMaK+hXSj9cZhKuAkcT7X86aMWV0WYp/Eenkb6zxewWa676zqErVCFpZCHBEo8eCe4xZgYP1JQWsI+vljmLDdMPbTNCHgszLCM7DoMjwP6qgqyht/iLQ/12GkY4i8BkLx2vWLUWU0LdfbL1MyCOav8u6m+KvmUMDvFxMxu33u5LVCdYB/lRtF8E79NjgBqiCCphyeg6UMBY6jhs1c9K1bWwM4lf/0cxYiqFSoSY7q8n3g+cPlZs0Re9M0+OAPozLGean5HuGmVkuviWjh9CKsRqvRCJc8opn1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OI2v11dq4OEx2gLDy2O7l71iByKKW+EhN7rOl8rezc=;
 b=jpgRHGQN8MqJKQpNmhd657Oo3XPQZ27+1jPZFRucbdDqE1z6jaGd4/Irou+VhJFE/exn5t2oI9/mt5Ah0r3otJCzLL/B9UA0lqrNmTGIng2rPTPXh9wKCfndUV0hkV8xdL71z2DpaxpHVXelr0pvWtHIsaLtzA4KIk1Dfs9qHFi8Jr48F1cMPkqot/7hmWYvff2b+agqp/V9Zcbq4QJigydF8IJRWbbv+Z/Q9qXg8yz4P3uYj05tGzpeR4LpVU2ttXmCUDaZQTNk1LZDF1PMyX6LsReVNoKtXOypOG1ufLcqLoQsnsffiWm5FE/Ih69/QvM9SsI0MEHmm/RtJam0mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:06 +0000
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
Subject: [PATCH 05/20] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date:   Mon,  1 May 2023 15:02:49 -0300
Message-Id: <5-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:2d::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: bff25f15-ab48-4979-66d2-08db4a6e5033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXqeizJXDjTVxileuRoW3TuIvsl+cPnsCsB4OhHiOhfg+zAtEYu9c7HDALt0UbUtxTqyvkyCzWL4muhik8qoVQdb2oOKoiXj8Wp9hwaOf72Mi0Re9jaDdBl6cTDqtEUnUK64fTRkdLvYZDA7R5YeY0ve6WqXy8HZg9f/WYDYEjMrFDfBrezH+7fjJ0Fk7YvW7fcz/gDnR0jrvfGYk8ya5aiiKESTqi71yTV+Az9nsngfupbVrR+ciTnajJQwBaoaQVvvN8Le6IEoTpi3qdSTHkFfOFDeZMeGShg7X8GxJhCAmE0XVy8OQBg5JrvVTsO1tcNWUAEMuGD1NYCKbpYXCRiYobJC8Sd81QfsFkd6rrb74A1nO5KD4PTe5AYt6wv8nmD/PPB01Du4cyA64smFeRR3JVc4m5mrRRKezkCmC99QjLZ10x97IDkWKJ+eJRp2bv8Kv0ETNBozu2IXmjYY4wiBAlYZASRXxUcZzkUcHh8r/NVHpJW2yUSg502VRXv6/3JCVzWKrXyM6OOzg9jzEhZNjtBz6YAy72nK12gcGeG+oOQu6Wo5J7KqC+Jf4eHqAu2fHK9qjuvmfxOXenGRiCW/fXuZrIBxZO0wdg4hOupyJr9LccR5e/64uBL4efDZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y2FBskTv9l9HICdtPjSM7LD5Mke7AJeWYgtsigrlSIcp0LDXavA6svuY8Rlg?=
 =?us-ascii?Q?kwgOfEmEgSeb5CYrF9FV9N0ZqEHxWQ6QDIVrN0bDnf6jJMJ9sfLrtm217Dzu?=
 =?us-ascii?Q?5nQRD5Dn2xzshg898cFF0Oa9N5+OL/9BRSYQFcYZOBlAlawAAelqvIo+Erwx?=
 =?us-ascii?Q?RInEZVtktPbCrUQvDTa1J4j+NIHRv85bGK99+ZOkGDLoJOq8azrXcgNOfwtS?=
 =?us-ascii?Q?tZeV6Y0yfDrUPcYs35qTniuiY5Y+qkolWC/j44cZsrR1MsYwrOW+t+gn6Sez?=
 =?us-ascii?Q?PP9hXv6+KaBDKt/f8Sr4MoWaUNYOT9bDGKpfR+7cCV3xc04wYAWvHQxquN3m?=
 =?us-ascii?Q?tVFpVqHxiROnnI3yWowTt0sxknYB9fXrW7HGxOv91vEcZABNfRWEzkBPZxhw?=
 =?us-ascii?Q?7QFMaOVmUlG8T/Qfm8HfWC0CT0ylgFsA4lANOz/xR/W6ODYvtxh+eNctnfQ+?=
 =?us-ascii?Q?gKwF8enmU6F+Oh4BTf8Rs5pRQ6iP62T0Ho0XxG1MDyS+RVkScSicNodSER+r?=
 =?us-ascii?Q?m4LwkVPHK/PmaqsHOsVrnWGwHbTsMjprz/eo+jif1gXjMOFDw0MkTQb6WPak?=
 =?us-ascii?Q?+lDOjfM54yQgFXrqSCbx/utrUVb2RyLFCieL0tg8or4LVI0UH2BfbBVNttqb?=
 =?us-ascii?Q?gN5Su9NFRzULAgVRQNvc3Q2hYCiPvyJH4LtbXEMwHPrir4eGBaD/obhRk3T0?=
 =?us-ascii?Q?UgWhBZb9RZg0TUtK1RP0d8kFcuUuq6E/3W+HEoVzk/tcauDlcyAGLvDmnbPK?=
 =?us-ascii?Q?yEHd78zn1hz+YahM0AfOZFVdijYOHHsy6WivivfOfUKfU/TVOxqOwYipaHta?=
 =?us-ascii?Q?mf7V0DDXf3z9mdPA9d0J+3WSSERJDoIfCHWdh4URBmh/vw6OxjHjzYIsdL2J?=
 =?us-ascii?Q?Vq6jz8JOksDU+dw6fifttedeLOO8W5ZxXDcDZo44WHl+Vrve5nRKK2FLBkhp?=
 =?us-ascii?Q?d7dSUI6iKO9bmyqazZ92N/5o4PbJFo9E0Sms8Jq39X7VzEMAlrPIPR6HfCUu?=
 =?us-ascii?Q?Ax5TssK7VTosmf/JF9nXfyhRyJE6yq9dSRE7/Paf8bhbCyJFIvYxcnDhoGgA?=
 =?us-ascii?Q?uX8GHG2RaO1TAOAx1UgQ0wIfQwB4T+wLi8kcio8EHnswi/3QzXDPLETkMq+t?=
 =?us-ascii?Q?X1vfnoGjiZm1u0vytbJV+utXHO+Z6YnrlHkqTjy9df+zuYU9a+xLHG85enAD?=
 =?us-ascii?Q?2hbQC9uH3Zqi0A4fiYC/6bQ/ce+tW2fa+h4sUYp8GVRTJwSXN0d+qkygYGpD?=
 =?us-ascii?Q?vcgZJnI6yg0xGIwglZwSSCLfd9LMZ+2waf6xT1BWmUNhKFtLqLjlPIVHYaSh?=
 =?us-ascii?Q?AGmfy68H6puy07sr3xwDMj4PkSSfQQdlMWpHOWyB+sRUISzFNmLw5DXOyehK?=
 =?us-ascii?Q?cKCHQILMBajI2LA8JjNg87rijj4R4SYwgXVcOwq501J/DXfaFiR9CgtU4fHg?=
 =?us-ascii?Q?HqYmkCDrG96nCdOHBJAVtzeKpz3VAcq/IAIw/tTQbZEHHzHEE4axSe6B7z10?=
 =?us-ascii?Q?5yHX0FA6Rb7oOr4J9/08QOH04qJVpAdhzZrFIE1ralEy7kFhAUbDgGOtkarP?=
 =?us-ascii?Q?4LJlA5ozRAmjOi98dlltecSxVY7/KasLKbhzrm6H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff25f15-ab48-4979-66d2-08db4a6e5033
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:05.7808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlAHCrj5CKYxsNaomLa5xqT+yDeg/WUK9mmL3PgNFAYF2Xt2sbzgTAyDaW0+C07P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6457
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
same stuff, the way they relate to the IOMMU core is quiet different.

dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
becomes the default_domain for the group.

ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
allocates an UNMANAGED domain and operates it just like an external
driver. In this case group->default_domain is NULL.

Allow iommu drivers to specify a global static identity_domain and, if
present, automatically use this domain as the default_domain when in
ARM_DMA_USE_IOMMU mode.

This allows drivers that implemented default_domain == NULL as an IDENTITY
translation to trivially get a properly labeled non-NULL default_domain on
ARM32 configs.

With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
device the normal detach_domain flow will restore the IDENTITY domain as
the default domain. Overall this makes attach_dev() of the IDENTITY domain
called in the same places as detach_dev().

This effectively migrates these drivers to default_domain mode. For
drivers that support ARM64 they will gain support for the IDENTITY
translation mode for the dma_api and behave in a uniform way.

Drivers use this by setting ops->identity_domain to a static singleton
iommu_domain that implements the identity attach. If the core detects
ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
during probe.

If the driver does not want to support dma_api with translation then it
always sets default_domain to the identity domain and even if IOMMU_DMA is
turned on it will not allow it to be used.

This allows removing the set_platform_dma_ops() from every remaining
driver.

Add the core support and convert rockchip to use it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 13 +++++++++++++
 drivers/iommu/rockchip-iommu.c | 19 +------------------
 include/linux/iommu.h          |  3 +++
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ba7f38630665b5..8b9af774de68f1 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1654,6 +1654,16 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	if (req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
+	/*
+	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
+	 * identity_domain and it becomes their default domain. Later on
+	 * ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+	    bus->iommu_ops->identity_domain)
+		return __iommu_group_alloc_default_domain(
+			bus, group, IOMMU_DOMAIN_IDENTITY);
+
 	/* The driver gave no guidance on what type to use, try the default */
 	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
 	if (dom)
@@ -1923,6 +1933,9 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(type);
 	if (!domain)
 		return NULL;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index ea5a3088bb7e8a..9e1296a856ac4c 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1017,13 +1017,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 	return 0;
 }
 
-static void rk_iommu_identity_free(struct iommu_domain *domain)
-{
-}
-
 static struct iommu_domain_ops rk_identity_ops = {
 	.attach_dev = rk_iommu_identity_attach,
-	.free = rk_iommu_identity_free,
 };
 
 static struct iommu_domain rk_identity_domain = {
@@ -1031,13 +1026,6 @@ static struct iommu_domain rk_identity_domain = {
 	.ops = &rk_identity_ops,
 };
 
-#ifdef CONFIG_ARM
-static void rk_iommu_set_platform_dma(struct device *dev)
-{
-	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
-}
-#endif
-
 static int rk_iommu_attach_device(struct iommu_domain *domain,
 		struct device *dev)
 {
@@ -1087,9 +1075,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY)
-		return &rk_identity_domain;
-
 	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
@@ -1214,13 +1199,11 @@ static int rk_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops rk_iommu_ops = {
+	.identity_domain = &rk_identity_domain,
 	.domain_alloc = rk_iommu_domain_alloc,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = rk_iommu_set_platform_dma,
-#endif
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ddcad3597c177b..427490b5736d40 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -253,6 +253,8 @@ struct iommu_iotlb_gather {
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
  * @default_domain: If not NULL this will always be set as the default domain.
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -287,6 +289,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *default_domain;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.40.0

