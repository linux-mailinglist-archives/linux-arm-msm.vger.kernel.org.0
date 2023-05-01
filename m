Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328C96F3573
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbjEASDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbjEASDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:16 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEED31BE3;
        Mon,  1 May 2023 11:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqjhm4HsuugUHh6JOe8SS5B2jBwmj3UOTqGSuCgHxnDWEel604unH+CC+Cvq26K2CzCXw+F1gVrmRH3wXOBh47jpdOO5QeLZVzlKX6nvTUT71Lx7VS7EruI6tEpBfH2S1CJ041m+Vxk5GTveUWrZaLyWj20k6Fy740R7QCxw4Pw+gpvkzuvpGrQ5RVzDsTWr7xSm19vwydmOI1m6PzwRZfb2eJN4Odqu/rjoqRONCoIouAJhSjTONInj4lvswlJp2BG7xof3FGZRnwYSE8Ueu8yFTFtVrNK526ex58I1UyaZX6i+0HEeFGNWhhrxMvncfLYJesgG3cxmMzjK4HruNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnqbXULXDkUekclXPK12wVkMvMx5s7sEMCBlgaNSyd4=;
 b=Bctb+rn+mQH1bO7ZPPhMXQXkAmP4qxEA6nXdZSlZ54HA+Gd/E3g6MH+q80gHJJMgxuGeNASH+NZ6jyuBTIIYzrmwkDb4bCZ7X5jSWoX3lISCjDMDIfGpr0s0KrqCxVRly0MgyeBJRH6Ybx8LwpBFVwAGmaiEXltr2fAtcMrc/O8FqtKNVkTwmjK9FrCWxK8ckvgC31PH+akYV8oomVi25Gt4dQdxRQ2ECGh/x8XwVa0QU1bMb9IAS1+1bPRxYnyRCJUoZk84H0Lu10A7hvqqP3cZ3Uxmy85dGzs19+bbS/mrvbqm7A7XeOYLOMZBhjIMUbTx5tADmTqoXAcaOwF+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnqbXULXDkUekclXPK12wVkMvMx5s7sEMCBlgaNSyd4=;
 b=MnXRHP6eupl670eezi61zwOMIe6N88n3ACKzl45ski22efJrAOry0lnHSHUxeylH6V+HQml0PXUaMNR6fdy2PX3Jjq8bm1uuhr0ypOgGWTzgvuTY03g9LgNyilinvwFmlFVysYMZt1Uj0vWHb8uhovPPc19NBoRxrqk32fjRouaIsriOicfPudrT36GF0MVeFJ02czhdsphIVDzWbOK3niVJXm4xJt/eDlc2O29M6SdtYzIlVa+eZb6nur5Bj5ZB0WhqPN6WCIjJa8G6kmr4tBNn9gKahvCmzHE3SNCpiY9RQ9i0GGLPH+zfW7pR39uOlUEhpkc/GnG3oAildkdofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:09 +0000
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
Subject: [PATCH 12/20] iommu: Remove ops->set_platform_dma_ops()
Date:   Mon,  1 May 2023 15:02:56 -0300
Message-Id: <12-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:208:23c::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0330491c-24e7-4606-f8c7-08db4a6e50ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jyQLFOxFfW0FszhqkbRALs+54pgNS4LpjreiMQYd+ibgedR8whYkve/zqrv192chScJEIQ+K+kCCtJ5fwQ9a1T2/2by1tcXg8Xe36lhyceWWonuxMpwK0WfL8hlkzVKOhrBvIAnZKuxgd4Y2GkpkurbXe6L0REDs0IBNdAaO2XcvagEFC0Y7e2II85uNXBDvMZaw/jz2pAWoY+Nne5bLZ0MBkmZGKtXTOta1BtsmJVR6mbz7cBBB75PIfWbAVXQcP7sdrRtmLIYpNzwau9qdx8nUUK1a5k5pv8PigopshxCQy5NurlV47/dGwfEpLx7/9XxKOz8DJYvfLRzwiU/MXXg8396SfE/EHCP2NNxEACZiSS5id4ni90bwnQK2vM8vtZeg5/yuDDusG5k/EZbnSjg8/+BxN1vlX2NxxaWUXmS/nU7C8MZM6vBJdmEctqShLhn8ZlIFzewMEaFO2WcUf4VWhBQYI8qT3g1VybMTCUShkZbMTqg2tSkLB5TFmwzhNzJNz2SgRjkFzQaeG25M+TOk2HdP9rfNS8a3/AEVkWveEQ2i504XCeu9i9l/+XxKvv7GUrm2QdVzS6NfgsEyxgI0HsOhnqR07AIQyyJvzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WwY7KW3VyQPEyTxePSl5gzejCoVliLqzFD35fJIcrakZKmJslTAqyKYfzD9?=
 =?us-ascii?Q?PXrJ1BRNUqc38GaeHaLMuZ6t2CTJh5prnUkPxbQTm1+FSynzWDrUwDSE4Cf3?=
 =?us-ascii?Q?x0iqHVXiHIwStmR26Y+m+uWMdsx1RYbTejxpuf83HRHRvEWzgaszxXYxduHw?=
 =?us-ascii?Q?5m88oIi+k6J2qTBdnFNJKko5C40BVk5udddruJi7B8o2EtVaAD/L9xDizFSA?=
 =?us-ascii?Q?2do7vcL3wmgp4L9dr+f0XlatcgVnYlsVwMD9esCoFsPwE4CwsdkmFL9Ev25A?=
 =?us-ascii?Q?Vx2JDKtjQ88toCVS/v+RBkOCcdb9TiTkMXOruf4SOyMyozERnxNy3JV6by6t?=
 =?us-ascii?Q?5y8lBp2tVdXEqX3xc9jV5U4gV7tln0+Zlculqs607wRAdN19oAA11SwoK8eg?=
 =?us-ascii?Q?M+3JXQhryv4APZ3ztgMtKI+e/nOiNYHqL2QMB3RmHQG9vcHEBiJ+6TbWIHZj?=
 =?us-ascii?Q?D4mr2Y3+R9NMTyhDoZVXNXRvND/InMYB2R6fhPvLkrwEhYXhErDy6M5w9+k0?=
 =?us-ascii?Q?BS2eM1RiNFdLGb4an3ObIeUvido/HWe/W/imdfndMXho/23q++YHoKY3R1M0?=
 =?us-ascii?Q?OigvXLwIiiWz0fTm4BpTFJibmhzJW9DKH6CYRUPlnsvXAuKApB7HAA9MtkPA?=
 =?us-ascii?Q?+nYEyvD40YzdvCaGX2hkoqtw7zycpITyk4kXrzHKk68sNwlqokVkT0Flh5jB?=
 =?us-ascii?Q?WTErQtQQz/G8zxRcnHwzHe6dDz/0iXCn+fGskkOT5Zabr/J7l1cOL4kpKADu?=
 =?us-ascii?Q?PgNx80Ftv8hT3D9A8McEwZP7oCepG4D5gCh4V69l5dd03AhnmanRZZSnGjnK?=
 =?us-ascii?Q?eNgb2sIlr/KVzWoB2dxnxkaByyNDF7UzA39Ld/v7PuviNkgRPqxDBhwrnZUK?=
 =?us-ascii?Q?AHsMvGQpiv6mnM0W0IDWw6Y97EcFcF7LVKLgssGxmES/MmNc24d4+9+cphpY?=
 =?us-ascii?Q?XK3l2tefnObdBV3P2M8bQxmE837uMJ9xmkNcNf1HTqbuCyGFGbSeqsJLu6ly?=
 =?us-ascii?Q?MIG2tdvkE8cunqm/CYqEctzMDOX+S47fNxc1GiUOJAXlvpoH/w5Tp+/SmpEU?=
 =?us-ascii?Q?MLqzeND60w7qD6Z9DQvGhcXIvnkll+e4Wea7sDJ0MQW2eSeBXG+nl7MEvt9B?=
 =?us-ascii?Q?q9PBWtzA4Tkwq2Ruw9m8w5qqUCrPyh8uBdrsXwPSfbS47e+WRW1Mor1OZQrf?=
 =?us-ascii?Q?NCj2BCpj0nqANQpTxHvgUnaKLKP0UR3CN8moFzcSva413yUtx/F6ZHV4c64Y?=
 =?us-ascii?Q?luwy/KDuAgCdTtDAHZcRXZexP4Mm3GrS6fKD5DXxTMz+QGYlQ2flx0A3N7ha?=
 =?us-ascii?Q?22qFd/7l0kjExs0TnOhmYYHypkqVxkasRAMxPJvdSlr2NILOL09x+YHukYcH?=
 =?us-ascii?Q?IcmriKfUTvjFCrceKayaH2FFro53p8l3l2FnQitoudC4Vcofku5sZ8ja7MT7?=
 =?us-ascii?Q?1do6vVPPioAN1mF7unFtIx/cwLw9oHiAAu59p/dpyLnlEJ+P53x24/9SlHrT?=
 =?us-ascii?Q?HjBeHlelyqS5yUEpO5JN4KqmfckMNgxAHC859IDkbR8wfrvTWAlkCApnfKyi?=
 =?us-ascii?Q?MTf8l+mABI6rrdwzHSRqO/HID6PvSggK6DIUepJR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0330491c-24e7-4606-f8c7-08db4a6e50ac
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.5986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqJTt/RS2dCX0CvQsUhv2AQwRJuN5JzXnvMITii6Q2w3m2c76Vh4+3Q4Koi4hKCz
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

All drivers are now using IDENTITY or PLATFORM domains for what this did,
we can remove it now. It is no longer possible to attach to a NULL domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 30 +++++-------------------------
 include/linux/iommu.h |  4 ----
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8b9af774de68f1..fb646765a87f47 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2192,21 +2192,8 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	if (group->domain == new_domain)
 		return 0;
 
-	/*
-	 * New drivers should support default domains, so set_platform_dma()
-	 * op will never be called. Otherwise the NULL domain represents some
-	 * platform specific behavior.
-	 */
-	if (!new_domain) {
-		for_each_group_device(group, gdev) {
-			const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
-			if (!WARN_ON(!ops->set_platform_dma_ops))
-				ops->set_platform_dma_ops(gdev->dev);
-		}
-		group->domain = NULL;
-		return 0;
-	}
+	if (WARN_ON(!new_domain))
+		return -EINVAL;
 
 	/*
 	 * Changing the domain is done by calling attach_dev() on the new
@@ -2242,19 +2229,15 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	 */
 	last_gdev = gdev;
 	for_each_group_device(group, gdev) {
-		const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
 		/*
-		 * If set_platform_dma_ops is not present a NULL domain can
-		 * happen only for first probe, in which case we leave
-		 * group->domain as NULL and let release clean everything up.
+		 * A NULL domain can happen only for first probe, in which case
+		 * we leave group->domain as NULL and let release clean
+		 * everything up.
 		 */
 		if (group->domain)
 			WARN_ON(__iommu_device_set_domain(
 				group, gdev->dev, group->domain,
 				IOMMU_SET_DOMAIN_MUST_SUCCEED));
-		else if (ops->set_platform_dma_ops)
-			ops->set_platform_dma_ops(gdev->dev);
 		if (gdev == last_gdev)
 			break;
 	}
@@ -2868,9 +2851,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	/*
 	 * There are still some drivers which don't support default domains, so
 	 * we ignore the failure and leave group->default_domain NULL.
-	 *
-	 * We assume that the iommu driver starts up the device in
-	 * 'set_platform_dma_ops' mode if it does not support default domains.
 	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
 	if (!dom) {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 427490b5736d40..f6a28ab78e607e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -231,9 +231,6 @@ struct iommu_iotlb_gather {
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
- * @set_platform_dma_ops: Returning control back to the platform DMA ops. This op
- *                        is to support old IOMMU drivers, new drivers should use
- *                        default domains, and the common IOMMU DMA ops.
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -265,7 +262,6 @@ struct iommu_ops {
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
-	void (*set_platform_dma_ops)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 
 	/* Request/Free a list of reserved regions for a device */
-- 
2.40.0

