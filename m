Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C258F6F3552
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjEASDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjEASDJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:09 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8D710F9;
        Mon,  1 May 2023 11:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bj7iNq1zF4TRA9dS3y+ZFQqTd4bb/SbIXKI0OcLsov+JlEoxu5eY1aaJ8A3YdtGP4ZvT9i6iTkUX2xMatf7FV58njjehpUPf2Eh2f7c2QYu3MJLwjRDEDCxKNVAh7nris6aSVAQ0J4ui9jRev3Cx8keWfExqxZ1IXTXp0R5N4PpjzncWk59fqHt2Cfxe7YTnt3ofVvqXlAi+hdmWFfEdzms9Rj4bQpWyqK0XMdp4S5m8FUAEvYkUvmLGFWQ5uz+bJqNtXsVvBHQbQGB3mZduOAlw62sqCdIhQLFczEHtHAt1Ve6NcNCsbtearbXP2eKqbCWy/PZa70diHyPdi9qiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDoVdY+Pc9qumyxpzzNFuOZNqlnuBuVFdJ69BZSqGVo=;
 b=Srhry845uo4rPZ0Ek+Q5k+SLJf/pLC5CX/pX7mCGT13Zf5znRXpJT9xTuERc91L1Vxnv+tvof2ffZ+R0NicK5eUZoZMkDhdXxfQO4YVT94GCqCBPB4mIrF/sKskQywcydTsvx/2Ogdf8xYERbFolI0Y4KWlzGFiOXiUdtjWy7+1TKSKI3/LTBcIZ8yAugtTKojKHSd15b+g5xErF0tbwLF8btR62YKxlmzf0RK4qqHtQ991xNTr1IK+FMl8pkazX1NCDFZFRRo4p1IzxBHhm2x+xTlLrQ+bLa079ne97r6YLA2XmPxXckH7+oRpL6o1B3p+FaArGhnirCd6johoR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDoVdY+Pc9qumyxpzzNFuOZNqlnuBuVFdJ69BZSqGVo=;
 b=LAoImtAb3uT8ZSaVzIDIZLmPRErEYwU8/vV2XVDw/o6Fud+TZB1BRNGy+FWXCCnDlVut54rauWLcIuVcudEzmnNLgiMg2FClQpoiReP/LAf+ProgDbDZfiOMrPxHCp7oCcPVRURKB2Pq482VUtPr8Fi7dQSWCScflq4lA72mtcKwBvw59ueF+tzAzhKr6v5FhBDEnNWzC7tA/9kvaFhOKwUDl4iOZ88MLcrB43GF0l2gPTLHmmqi+O111XV2txqFedj82AtKtGY/NdUt7/Gv24eKBdp1Cip/beaA66Fi3EUN31shLH/1tGIoaBhsJ7l1ByHRnbQR85FMADWIPyZMFQ==
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
 18:03:05 +0000
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
Subject: [PATCH 06/20] iommu/exynos: Implement an IDENTITY domain
Date:   Mon,  1 May 2023 15:02:50 -0300
Message-Id: <6-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:208:23d::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 4615b5b2-cb88-4ae9-7bc7-08db4a6e5027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJ/Osi5xuOZZEpntF1O6pH+LsLx3Aefnm3P2JgDQU+eBcQ9ru1mRTaWY6OfaN8ykNSJRZRzScrb9NMA888QzIwLa2+jiamnSEZrH1cRvYA4P2jmN7q3JdmrEs3hhzXq203h+Q2iV/z5INQCpY/Nc8aMNQQwFn0bHDVPt1I+LCYjOcXkpiJr8273oalKCkkpAUPVjaYCq+BwVefHfwJ+++GwcxDU30gVJxzeL7BH7q1k45A7NG1mEVsvbfaB0GA0gZ51QCftNSOgw4i8lMnEASiS7+vnjW9DaHlbyfjg7O1vHKZXG7/JppqILJpqCPLZ9vxWACDh7c52oNmA5Wu1xh4ukb0nO4GUbTTOTEkI9KLiHboaI1bW4zp5MstMT6UP0/UNPiabBZOruSUwocBqtlpZNKtAaSVtb4s6fymmDnOgYO+QIidWvlO1nCb4aEW8MIWkHHeX0KquUlZkNP8/jdCNSdUUMqNSbHHLlZLURsowYiiX72U9AlSSjf7POeZUlQ5f3cv2e7x1C89vtIhQO6POKfZp83Bh0ChVCSppvo0BijoAfCE4QPGtoT7K1RCH2w0sS3dbLL605csL/PNT/6US2KKz8kmKaE8dgd+9VaVMecLRMjV9nOGAJko3KLJXQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZUXCtwX/2iBuJ0V+BAJxISHlfwsdWMnhI5UA78r+RIDtN5cmMckqSfQqhfi?=
 =?us-ascii?Q?qvSF9RXvv4e8M/0vLvpTgmB2soX7LTrbYQXftFj+ytCW0NvOm9QGOhEhEcEd?=
 =?us-ascii?Q?rQylWFCd+U+BM1UGYnRXCb06pDGAL/P3Kb+1Ty8o8ICT2cwMz826nDnoc1in?=
 =?us-ascii?Q?XuU/bQhA4N0CX/OfqlglBBCbD/aBvKUXOHsT9wVZl1NgR5/B+AYOpca9vfNZ?=
 =?us-ascii?Q?epYnXM/G2K3atwXgYZPG1kVaOti4Vi0ezMnDmVwK+6e2HPtOeYzQMTnnf986?=
 =?us-ascii?Q?ZQHrT0lw7H6i9CKZaMFHOLozjdKEHjdHfX0V5RGpovw0Ff5PKhlcJ00L8T+O?=
 =?us-ascii?Q?wyM0BiAwzJY1/E0PFzqyRHFDgsOTAGKGQQPrlnrU5RINEmLlxVgd+NAQO/LJ?=
 =?us-ascii?Q?YMgmx6Ng1QbLN6Wl24Csl2FNDqdBsc+KLcctGLR7V47/Bafyo7OvtZxIqKXu?=
 =?us-ascii?Q?hVyftExYGHIAyg8/VZ6a/pvqJUp/AW/U4c26zCw7FGB5hySIorqHkf/oQwiq?=
 =?us-ascii?Q?XoXbENMcVem+dYLGlVRBxg76KCo+hOvV2rv0yrn7eBexi73ZK2r9qNL2Z034?=
 =?us-ascii?Q?+NMk6IklCBLRb80QiQf3vCabU5CtqXf7v5FHWb14MfmQuo99luguJbFAB528?=
 =?us-ascii?Q?nkm4xorRThPWpRbKO83t3o7tF+GP0pwG03FE232GK65Q15SKGEKeNaWZkuMb?=
 =?us-ascii?Q?kxG7USzpVRU0B8L/0BvIvU2dtgLxiObn70tSw/nfTGefIwf59UkpfDIpACyp?=
 =?us-ascii?Q?aDjqHvfqh+tsZ+6hkYJZJgOxBJHJXDFzh/1Nty8KLmbFdL0jzixyQ5Gb2V+d?=
 =?us-ascii?Q?hwRhk4BAUBhvbfYUkXkMLkhxaITg4SqIvTGSKXUK1XXI406z47yPjmwBQq+i?=
 =?us-ascii?Q?8ksBF7Bi8AWkxAUcqz/+2qDvQBzmZoErwhMdwew1g79Gwvj6wBjSCATP9eLi?=
 =?us-ascii?Q?k00FwDWEHhz2qLF2VaBqnrpalOxpjzmfFpV5GLozhLpj/8CBwoWm2l7tINDA?=
 =?us-ascii?Q?rMg8tkEc8s3lMHhWise0/901jcRb6Dau1eRJ+mJ7aZLzTYb2vnadjlsI+5BH?=
 =?us-ascii?Q?ZkI5c+WTLUCKuckprjfTmg5zJjKXPA12i3k7tz+93dEOFyHQnGqjb+4WXgL3?=
 =?us-ascii?Q?heoapUtg6sxPHKsOFZ9uOAKsGRBl6sHS/XJNuuokeI8gMidTdT9HCk7uMxaQ?=
 =?us-ascii?Q?JFydx6mASvgGyOL47rO5D0wbXF0zZaa7qCwCWCI5YvHPb8XefblRXEvf8o/2?=
 =?us-ascii?Q?16yoAqwiHrtpwjgcdMGJUng7Rm7fjUiyHmpI0FHkO8Hh9QU19nPzQy5spvOc?=
 =?us-ascii?Q?iQRLnm6QtddFL1Hb3psVogVNkErCoearoqVnkZli6mGZ8AfyVX4OZ6ZuKbXH?=
 =?us-ascii?Q?YSKyy/+y93qNSBBlQ1cs3RxeOj/nzNMimhYBhX42Z7LlBj/hueMaKUKJI+n8?=
 =?us-ascii?Q?WwQmydbrZ7BD868gu9f6UVjQCkCqVt6r8J/LRhsM5fBse1xjctnuG98F1ulR?=
 =?us-ascii?Q?k4aarwOT6SN66HWcCpzubQ5p5uHuTRl4aSitGt8fI6RyKxRhw7wkZYuCSsCE?=
 =?us-ascii?Q?PPHs4sDH5ztCovBC143CMnxZseTF5XoKjPAnD5pQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4615b5b2-cb88-4ae9-7bc7-08db4a6e5027
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:05.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLpIQerFkLDXEfBUcT+yR/O4njgalSuMAVHAw1eHK7iUSIu+rS1+ktjP6t28u1cn
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

What exynos calls exynos_iommu_detach_device is actually putting the iommu
into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/exynos-iommu.c | 64 ++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index c275fe71c4db32..6ff7901103948a 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -24,6 +24,7 @@
 
 typedef u32 sysmmu_iova_t;
 typedef u32 sysmmu_pte_t;
+static struct iommu_domain exynos_identity_domain;
 
 /* We do not consider super section mapping (16MB) */
 #define SECT_ORDER 20
@@ -829,7 +830,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
 		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
-		if (data->domain) {
+		if (&data->domain->domain != &exynos_identity_domain) {
 			dev_dbg(data->sysmmu, "saving state\n");
 			__sysmmu_disable(data);
 		}
@@ -847,7 +848,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
 		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
-		if (data->domain) {
+		if (&data->domain->domain != &exynos_identity_domain) {
 			dev_dbg(data->sysmmu, "restoring state\n");
 			__sysmmu_enable(data);
 		}
@@ -980,17 +981,22 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
-static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
-				    struct device *dev)
+static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
-	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
+	struct exynos_iommu_domain *domain;
+	phys_addr_t pagetable;
 	struct sysmmu_drvdata *data, *next;
 	unsigned long flags;
 
-	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
-		return;
+	if (!owner)
+		return -ENODEV;
+	if (owner->domain == identity_domain)
+		return 0;
+
+	domain = to_exynos_domain(owner->domain);
+	pagetable = virt_to_phys(domain->pgtable);
 
 	mutex_lock(&owner->rpm_lock);
 
@@ -1009,15 +1015,25 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
 		list_del_init(&data->domain_node);
 		spin_unlock(&data->lock);
 	}
-	owner->domain = NULL;
+	owner->domain = identity_domain;
 	spin_unlock_irqrestore(&domain->lock, flags);
 
 	mutex_unlock(&owner->rpm_lock);
 
 	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
 		&pagetable);
+	return 0;
 }
 
+static struct iommu_domain_ops exynos_identity_ops = {
+	.attach_dev = exynos_iommu_identity_attach,
+};
+
+static struct iommu_domain exynos_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &exynos_identity_ops,
+};
+
 static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 				   struct device *dev)
 {
@@ -1026,12 +1042,11 @@ static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 	struct sysmmu_drvdata *data;
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
 	unsigned long flags;
+	int err;
 
-	if (!has_sysmmu(dev))
-		return -ENODEV;
-
-	if (owner->domain)
-		exynos_iommu_detach_device(owner->domain, dev);
+	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
+	if (err)
+		return err;
 
 	mutex_lock(&owner->rpm_lock);
 
@@ -1407,26 +1422,12 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 	return &data->iommu;
 }
 
-static void exynos_iommu_set_platform_dma(struct device *dev)
-{
-	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
-
-	if (owner->domain) {
-		struct iommu_group *group = iommu_group_get(dev);
-
-		if (group) {
-			exynos_iommu_detach_device(owner->domain, dev);
-			iommu_group_put(group);
-		}
-	}
-}
-
 static void exynos_iommu_release_device(struct device *dev)
 {
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	exynos_iommu_set_platform_dma(dev);
+	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
@@ -1457,6 +1458,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 		INIT_LIST_HEAD(&owner->controllers);
 		mutex_init(&owner->rpm_lock);
+		owner->domain = &exynos_identity_domain;
 		dev_iommu_priv_set(dev, owner);
 	}
 
@@ -1471,11 +1473,9 @@ static int exynos_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops exynos_iommu_ops = {
+	.identity_domain = &exynos_identity_domain,
 	.domain_alloc = exynos_iommu_domain_alloc,
 	.device_group = generic_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = exynos_iommu_set_platform_dma,
-#endif
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
-- 
2.40.0

