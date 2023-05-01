Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C73936F355D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjEASDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjEASDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:13 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84111715;
        Mon,  1 May 2023 11:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIxxVfLPt5FdFVoo9nxkxmevvEEo9K2hqSs0caPhPjSQu5GeDqqg9AoSQCfwC+UTduvvkmL1a3sK0TWhbpKi/Zc8fBf6VeupBg9sZ7LsgGBYoxLgOSngPumrDA/jZMNvuCF7M2BuA0Ge6s3ZmNf2C1iErvQ3vwJpcKeGbbu0nv0yyo//eBJ9BtFg0O62n3dynDIw6JcojYUIol6HL4447k3u6QjVVxb4SkCQOwUqovgPIod0zbZ7gDaElmleWq9TB6TyZMXitMwtFvS88XUxFp/1JA5OY244jEEBFwFT6NsZLkn0TXOoMfI9meyo56ymDRx1/FH5zuC3CnddTv1Chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL7Xq6P+NR2BaOlem7cJr7ovxETz24Y0L510Rr7u6SA=;
 b=KheQdHNT3awzidEULsKiIuho0gCWbzO7nOP8s3zbGaaGbJHiL3jftygJZhlHefcGReHOJt9VFSQ9FN4K9XF1Ozxw5/j3QZg1+HxvrIypNTNI/Z/oSHei/vcXtSZwRc0MIJBZDEOywn9Qt1IW2CtRb0lYDEP0UFRsEyfuJ3HKRDKxD/Or9JH4ZFxJgbdbukMNy6fqOgLsBYx2i1RACGgkoUMxhYF6sasOBKGnoCRLJIIFAVgFs53tA7v3KbD60bz2G95z+8tnR/gg4E/woCtyiSjHF1DnThz4aWAlA0jUPLB489y3PbXzg7D8iDeNx3i6rYw12E39GBZ0i4uq2jxDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL7Xq6P+NR2BaOlem7cJr7ovxETz24Y0L510Rr7u6SA=;
 b=INergqm4w6plO05YxpMFPMz0LDpKjPDQ/O7soH/agFpnxKvpRQwVqdYpiuSIL0IxITuCn40lWkHYTjrKEa7kWHQhhPIfjU1kGEg03qdlyljyyz25Qkslf3NhFgjTocWG5oFOPEyRwYvUrgJsdALCUT6+eID/kiGOrxUOfWrpaqJ3C1dkFr3IjL/tmCAJE5E3HG43Ei1kaRpydLhRu2TpmjwC/51kHISBxVjnfMZiQOnn4zOs6CUCCAkHkGrhMj3IeQJYqXGAfzjP2Yra7W76GZ+ZvhWJkbWQmR/JDb0BR+1ZAVXQWFRw4B1iekMe6pBtJdbGT2ESLfEctfUxovLpnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:07 +0000
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
Subject: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops() with IOMMU_DOMAIN_PLATFORM
Date:   Mon,  1 May 2023 15:02:46 -0300
Message-Id: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0005.namprd18.prod.outlook.com
 (2603:10b6:208:23c::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fe19df-7941-4375-3a31-08db4a6e506a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/CLg0k0hJP5q+4biVc8Jnr4iUDWHnDVGVvti4zJAeB85Gs+C8YwJK5b2Mcm1sDHJFfxlLmHcJI/skaj58EKxsXqAYjGMcZZLFjCGvg4v2P6EP2i7ddMT4+hE7PDePVSVucUxjNc72NtbhSPib9niKrohL0eEzZ0qYEyTT48OST+NfNn4/AvhuSF0YbMam+79bY9RL03mS6a3RtkWAVMMlZnsDR5AkQxmOdYQfr8Rt8mIyZlpyDHcxMZCpdlvby6Q+xDqeFoUREoOZBI4WvZayBN7ReZpDshwjGravFsRqPO38LM2F+RzDrRkGdu6v2IfVguRkNU1y+x659GW/L5LHkwxT3GYQghLOH87y5Qkl1gVUZKG1yWCeYE77cbc4NXSm60q0j+bdk+CiqIE+B4tkxY06lc+tGM3HNadnH1ehZk9QQuAYDveHpYZt9pZmtf4tvXR2zsjimCAFtxhI6CqJAojqg9epVGsCI936afR2U2RS2pjtSogIECG/z0qYmMuLVUBbb2bcFLWCEgQhHxvTltSBQGlx6vrMZgaL1W+R5be7lPzzMRGTPklGYgmMuQJIdO5pkYx+rl+UrmGeTXSxewcYKFkf+SDs3777ox3CSPImy/nmzdgy3+cDOJ49Lt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ujo4DNsnYHrGigEPt1pHNgGfqsbXsO7WJ7p1uD1DH12jn97ZFjA9rfEwQM17?=
 =?us-ascii?Q?UmSTPrtHuS/X9+FND1K9fMUmOHqW5LSVcs/kENu463itrVUpqjknDQUGvuzk?=
 =?us-ascii?Q?DtQIGLlSmmbUgco0EjcViXXaauI3smv14WsPEvpcxIWpJuuwriHfpTEGc+Wf?=
 =?us-ascii?Q?3wv1UARO8jCignUes30XrIiS9qtE+LmzxhLn9sLOn82A7+gGKyHbJsOO2f7y?=
 =?us-ascii?Q?46MI5HPeVIELrywNtUDTURA2viebpbqwgpgTrRFKzjhetUgwXJlPbBfykG7K?=
 =?us-ascii?Q?cgu0gkAvb/yzC28t7cA6A0VzYMXji/AnOpeiu4Vj195HefxN1aKi2p6mAG+f?=
 =?us-ascii?Q?Z1/QV0LfIhVSF9eIR5rjohIpaeuTJZZwCMone5yxpB1p1JZH94Me/k45H/Ms?=
 =?us-ascii?Q?y+r+N6pnXxTlEdwLU444EO0nFPm9SVyfFR2fa+jkGTfHrN/+Q4PvdzWOU4b8?=
 =?us-ascii?Q?TZz+HxbKQuN1+Qa1Zq2uZPaY8cwrwLCbuZDJHGUeMxLAXg7Thm4BLuvL2LDN?=
 =?us-ascii?Q?txI1zb62vRwq6Y7eHeKtZY1T0s1P3AQcj1KQmm+MPdfaJS8VHUj2SM2DVuid?=
 =?us-ascii?Q?ggDkA6fBqICjBweifIpfzooVAmHOkr6V5zNbFImrPZaj1S9+Gn5pDnET3T1R?=
 =?us-ascii?Q?8x4Ic7ED3udE/bQMMAFE59Riwe8w1+5wpPVxhOubKMTXu5OfjS37s0xOuGm6?=
 =?us-ascii?Q?eYL56z0NSQc2Tru6ChFul0ojYliRApj/Bub66ADEV82JWmgDMsKUPfl50QOL?=
 =?us-ascii?Q?lVagHrQjRac3jWSNkp9iBcEbNwXnuWxeXQape5mxDVK/Azl1WUfsGpzriDIW?=
 =?us-ascii?Q?jtvXlPNpNZ2bG6vTFEbHgn3QMytJiBADDp59IkUONkjtWXcWViiLmTsk/GDv?=
 =?us-ascii?Q?VqVZyK3rSrh92e9rcOj+g4FeJUPbVpJQ39c4Q6/SD7dFpVvBmPBvfmkY0Se4?=
 =?us-ascii?Q?0rBvkFtvWxRIkHeqtmckI4030psr6qtM+ipcOf8UVarzp9CmuOi4T9TrIa/J?=
 =?us-ascii?Q?vhov1f9avng6DQsk7PSPIrESQnY6meNdPyWkoYgKVOoczJ4iCx6KCNV50ex9?=
 =?us-ascii?Q?qrk7Zocn3DarnaqiFPhXdRLEpt9kEcDrrdT8R5pBK961PxZagbTIXGm3bi9a?=
 =?us-ascii?Q?yWa3/8vjtFowxcIUEbKxxWoiglnyQLCB6uVkJSsQ5NuvvlPI58sG8Kk/MQb2?=
 =?us-ascii?Q?Io24h0zUtcTTuiBbTRn42LvPjCgwA2ppH8kKK71nAj8ABICw7L0PMVrcHLLD?=
 =?us-ascii?Q?SKduIJmZFZhXQhUp7upghWvUlPRQBnVHPWxj/XqjSDjFFQiVjfyKWtSJAeLr?=
 =?us-ascii?Q?av7r8B3llldGP2m2IOj9kZNHe+5p2A4d1HlSpd2S1/Au0qI9J1fPN1Qp5RM/?=
 =?us-ascii?Q?ilxOd9G2ssDH7RTFQAqe4Lytn06O6cDCjZ2bA5wGqqvcQcxFgwvx8ISTrajP?=
 =?us-ascii?Q?gHehFDOtpfkyCt4UMY4dJaJh3u4rdCCmgQAGfA/HJMCbeuoxxhNYh6FAk5Pu?=
 =?us-ascii?Q?SA3wuskRwBZicdvXnKHq68AgplXPcQjV1WedN9v0MB/VKSZ4VnKBjWbBa6tA?=
 =?us-ascii?Q?kEdddKZetLD2XHjGNFofuhOwY+kgDf3U/5SL4p/W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fe19df-7941-4375-3a31-08db4a6e506a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXtYuIMnNeXpU4o16wbYtFcNL0OpBXoVjqFNoLdyLbHsZzhMtKv1ysOxlbZwH/I2
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

tegra-gart seems to be kind of wonky since from the start its 'detach_dev'
op doesn't actually touch hardware. It is supposed to empty the GART of
all translations loaded into it.

Call this weirdness PLATFORM which keeps the basic original
ops->detach_dev() semantic alive without needing much special core code
support. I'm guessing it really ends up in a BLOCKING configuration, but
without any forced cleanup it is unsafe.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-gart.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index a482ff838b5331..09865889ff2480 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -124,11 +124,27 @@ static int gart_iommu_attach_dev(struct iommu_domain *domain,
 	return ret;
 }
 
-static void gart_iommu_set_platform_dma(struct device *dev)
+/*
+ * FIXME: This weird function that doesn't touch the HW, but it is supposed to
+ * zap any current translation from the HW.
+ *
+ * Preserve whatever this was doing in 2011 as basically the same in the
+ * new API. The IOMMU_DOMAIN_PLATFORM's attach_dev function is called at almost
+ * the same times as the old detach_dev.
+ *
+ * I suspect the reality is that the UNMANAGED domain is never actually detached
+ * in real systems, or it is only detached once eveything is already unmapped,
+ * so this could get by this way.
+ */
+static int gart_iommu_platform_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct gart_device *gart = gart_handle;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
 	spin_lock(&gart->dom_lock);
 
 	if (dev_iommu_priv_get(dev) == domain) {
@@ -139,8 +155,18 @@ static void gart_iommu_set_platform_dma(struct device *dev)
 	}
 
 	spin_unlock(&gart->dom_lock);
+	return 0;
 }
 
+static struct iommu_domain_ops gart_iommu_platform_ops = {
+	.attach_dev = gart_iommu_platform_attach,
+};
+
+static struct iommu_domain gart_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &gart_iommu_platform_ops,
+};
+
 static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
 {
 	struct iommu_domain *domain;
@@ -267,10 +293,10 @@ static void gart_iommu_sync(struct iommu_domain *domain,
 }
 
 static const struct iommu_ops gart_iommu_ops = {
+	.default_domain = &gart_iommu_platform_domain,
 	.domain_alloc	= gart_iommu_domain_alloc,
 	.probe_device	= gart_iommu_probe_device,
 	.device_group	= generic_device_group,
-	.set_platform_dma_ops = gart_iommu_set_platform_dma,
 	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
 	.of_xlate	= gart_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.0

