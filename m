Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EAA6F35A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjEASDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbjEASD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:27 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821981FC3;
        Mon,  1 May 2023 11:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFUSWoiBRsX6qgrwibuqU9Ndoj73o5nM8Sfi7pT8THexwg1uiNW0TEtalHw/62m6VoNKOFKTdwOVg+YBjdC/oWd69rvspLtF40GhFw3b1Mp0pntakahIz11cl68y19+pl0rCdLmfFrDNRftkrr3sNi8AHIIqPg+EblW/zs1iZkUTRqIXZBCHZMd7Uj7Uk/t9J9qna8wzQk9qeUZ8Z3pN3Pg9EER2jHboalnm/2ngoepOhG47CDpH3MYOknv1lH5xHkzYWm9W10PrujUIyl/ZOcUqdtnp449ljo/4lgt4fQ15Rv17Vg+S1wefFjFZygAnxp0g7ZkTUYmJtpbAs6418w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcP8DQHgXbM6a7LL08KrIsleN5gYDTh0k9ASZVl/rnE=;
 b=Zt2j9AhlwE08BJImQ+fyt7r0ZRdQ8jBz79/YAhAA6Hzr832Evj4BjuN550Bj1fSfwta/0Y5KBk14RrsqT4RrYjp685ptdhrG6XhQ/JTqi9HnpPsWv/aqANaRjghzrOlYOLYOfNI5fnR9ZC36bSTBdoy+vwCtTbtkRUwmPMeZMQbxqcpmTIQh4aeww2n/83aZKRTyl/NpFHND6rniyIiCx5PqgWP3xnoLE380fT04JcwpkzFP+AHBb5UAhXbDbtUmKEyzYEQtss77ve6u8Ps1/0HzdAz3LIsfCd88NX1j8PTkw5nAbRRkUe4JiTUE/eCTzD+KjvDjs/8JaGHWHB7uNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcP8DQHgXbM6a7LL08KrIsleN5gYDTh0k9ASZVl/rnE=;
 b=pDXB6/RiqgPu43/3gQybNOwshw6VN1vCykATUwyMazXNftnvvRSyoS5WtdW+fOxN6NRkk1xIgZzjbwDsrl3r0s/cIZJ1oiBXK1GWmmeGiBjNIkvgEMHo+8g+w89FudBdefx02NlaMdyqqPkLdbiHixnPDAFr0hG0bxyMbNuwixSw15mCKC0+qSDQLX2HC7pcKt3p/KAS2p6noBeKAV6KauLN05IoBsDUKioEdPh52UPA5obqRMlcB+xQnb9Q4uxZ4Cr5wEBFJC9FxHwnhQt13qfbihFEwIFPRTgw1qaPWrdjLqWmXY/1yYWnH4UYT6PS8Kfqb8ipAfpaMDX0nDzIIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
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
Subject: [PATCH 01/20] iommu: Add IOMMU_DOMAIN_PLATFORM
Date:   Mon,  1 May 2023 15:02:45 -0300
Message-Id: <1-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:208:2d::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2deba80c-bad4-427c-8e08-08db4a6e51d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5j2riQiTaNUM3UlGHzviShO8D/ol6n+R3xtLRbKq3tJRUbSSeU3JAThwKseho64r8sKY6Cg8hWYFS7aby/g7H/UVv6ivQjh1eikK4R4Qi2kLMKRxY4dQR2I+ZSN8TepegGPNZJIGgj4MMAhCOvc8UuMDeeNboO/5fOEK0k0hNOd650E8O3hOKh+gytLLFi8G2yGCfR4xQ3dSm+Ev57X1rY9P8WO+ZvNiBvPt/OyVynr0NcBVnyJkIvGTEwQoa0nlDrxTA5a5cgKQA99lcxUyl2nkX4PX/BUYn+aOXhF8+sCLv01OBftY7GWrAek9Kn1CZxmFSNT+YQBZJLEYEWlgnfl4HcJFCC+A5xc5eYBc3TgGVhuYEp1pGK0mabRYDY7/df4WcCrez6UfxCbVba/+03CiZo8NN7tSWVDyMW/RcTXs2gtV+QKfToyyCAn04lIhOqNe8E4WxU1xBTBn16PQg/WDpw8Og6H6bkP0X9g9izeSJ+cs329Wieinm7bP6u61bhuqh5ps6OMY9OTMoP/P58D4OJIVTHNGDN/nJcGMKQZY09oECw8VZVJPHBBek0yHArFO+MjK0qBB6S4eGfx9fhSEeDe2tSyNy+SFZ4f7XzlIN9Foqnni0Uu7OdVzr4kw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hsRvXcj2FmGpHgEod8sLHwd7evkuKvn1U/BjFBJGkE8iuokcpTNJZ2D3c7eb?=
 =?us-ascii?Q?POAFgNJWCO0VN7j92/PVuoLnd8mjzhkLrBak9f0PYde+h9C/dfU/PsdGtCLf?=
 =?us-ascii?Q?N8ydBRhnUyYG4lxbn4IijVodxxjfE4lT5Mav8YlpffL9arkkrXYAWU4aVl2o?=
 =?us-ascii?Q?TCV2NX6dNfDTP2Wlt/WJDxNDvCLhe83KcuhScO+DZFjARv4L1c7tDLAIsWOR?=
 =?us-ascii?Q?KeUajhpx+oM11CUb2pgUUin6XPRDKxa6ezwrISl6lwXjtLl7tfUPB/9HEXEc?=
 =?us-ascii?Q?lJePtZLh3RP012n6IEX1suU/7tscwPUWKXMkCDnROIwDProm1MdGZBB88e9h?=
 =?us-ascii?Q?gAwTR/NgXP+pKW2ZkLNs28MuMRvgd9NJmgeBxzeZsf2iC5XhNhzCTKHbclW5?=
 =?us-ascii?Q?LYb9W8YjjXHwKEIrO7lDB3s81cXnhZy/c72bl2W+KjYsQn2tQmA6mHRu4vFP?=
 =?us-ascii?Q?1hBj4ctrjOBSc65PdNGexCG92M6MQZPdo3Luoq83g0bmR3mYbU/6A/+KwVgI?=
 =?us-ascii?Q?c+MwebHMHtkyjGfx6WirMhCTmzozIppEIoKmyRe2iYAUhlCpj7YqqINOsA/9?=
 =?us-ascii?Q?MrYioI+YiNOi6dvZFZS4Y8/dc+/doQ7uYKyFOiF7mfQJWOY5KUYHXrakdO6q?=
 =?us-ascii?Q?oEjtIfqSwLjtMTZQgfkieUL00iwEfMLZ46Cbx8UypsZjrlMR4GBY8QpCgyCx?=
 =?us-ascii?Q?SopBUcLN6i06oYOvZE3gevyRHW3c3gtKkEigstBj62imezvA/T1KOfTD8jRO?=
 =?us-ascii?Q?wreBy/H3x5E8eHcvKrdvM1Z+phzlqTP5rRmCIhvNv16VHPNbP7Qm3XR82xfL?=
 =?us-ascii?Q?LL+2QSegf03LRyyu7qioRvnvtEBlBto4f8vrE4fpa8peOpYCioja/PsiYCwc?=
 =?us-ascii?Q?1IHfakH1E5AEvyN5oyoF8LNTpCcXrIx+kp29jU58e0xHepg9pWmGOR79Bwga?=
 =?us-ascii?Q?IOMajySylsZ76sjiwbiwK76ZrIRBfu60F8sQYqeDmPynOY166Tgq3VsAw2GP?=
 =?us-ascii?Q?MdcmalQQq+2WqumTC/LapRUpdIGmU+peZoHbmO0HT1ZOgXzVXw5OYxvs+BP7?=
 =?us-ascii?Q?Uw9VBsIcTi856Uhyr3NbfwKLBlK+XEsDl3/ngKczx7mXJHqJ+OZbPsBFtBT5?=
 =?us-ascii?Q?sQeEoqeo8CbRc7Uw2kuiDrseqoOLQwyr6m5FrC1Capa7ZGVE3GYWgNI3rXTO?=
 =?us-ascii?Q?e5UYFXl/V3TZmVXiO2S0Cak6sDHgFecvzUmZJD/iM3tzXYOLW4PlOo3DkHK4?=
 =?us-ascii?Q?dD4lYvO6uCecXRsu8ZSfwcWfE4Zqjy385JrvQnYdezckNun3si1fevYj8FI7?=
 =?us-ascii?Q?yR/hwnYJxR+DM5TMA4ULO6KwlH+8T7KuQHVc2eLSbJSh9XC0VCWd5iAiLQ51?=
 =?us-ascii?Q?6TQHjyn4OYUdt4Tx66JTfoRc5Jo6tcqXZ3H5T8duIVbg+jg/GbxTigtQB+vy?=
 =?us-ascii?Q?PMAPqkZiROtA5Ev39Sj/nDvJzKLNJI3Nu1Xoh7QdIyzs2bkpJ5rQPssu7SEQ?=
 =?us-ascii?Q?SVESKRon8ZV/TZw6k/4Ui4qMpJ75h9kKsvtqN1OL7VZdO6rauN7fDhgkeDKw?=
 =?us-ascii?Q?XkW/vpx6OK9/3Dt/C1fHPO1JD710dSl0G8BuqsIr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deba80c-bad4-427c-8e08-08db4a6e51d4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:08.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGj5Vuy26RiGIwYPEL0vSW0MBrawwOVgheyvBr2aPrzTpqZRUXB6tdM5G/9BwLFc
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

This is an opaque domain type that is an escape hatch for tegra-gart and
fsl_pamu that we can't figure out how to convert into actual BLOCKING or
IDENTITY domains. It is designed to preserve the original
ops->detach_dev() semantic that these drivers were built around.

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The drivers will ignore the initial attach from a
NULL domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

Add an ops->default_domain member so drivers can trivially opt into this
mode.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 14 +++++++++++++-
 include/linux/iommu.h |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 532383e4e90f05..ba7f38630665b5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1640,6 +1640,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 
 	lockdep_assert_held(&group->mutex);
 
+	/*
+	 * Allow legacy drivers to specify the domain that will be the default
+	 * domain. This should always be either an IDENTITY or PLATFORM domain.
+	 * Do not use in new drivers.
+	 */
+	if (bus->iommu_ops->default_domain) {
+		if (req_type)
+			return ERR_PTR(-EINVAL);
+		return bus->iommu_ops->default_domain;
+	}
+
 	if (req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
@@ -1945,7 +1956,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7dbdd13d7ce046..ddcad3597c177b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -64,6 +64,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
+#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
 
 /*
  * This are the possible domain-types
@@ -80,6 +81,8 @@ struct iommu_domain_geometry {
  *				  invalidation.
  *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
  *				  represented by mm_struct's.
+ *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
+ *				  dma_api stuff. Do not use in new drivers.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
@@ -90,6 +93,7 @@ struct iommu_domain_geometry {
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
 #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
+#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
 
 struct iommu_domain {
 	unsigned type;
@@ -248,6 +252,7 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @default_domain: If not NULL this will always be set as the default domain.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -281,6 +286,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.40.0

