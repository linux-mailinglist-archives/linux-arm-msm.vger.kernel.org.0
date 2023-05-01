Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE876F356E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbjEASDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjEASDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:15 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7BF1984;
        Mon,  1 May 2023 11:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfA2qqLNc1bYnBqWKTO97hYY+kXGZkiaPyk74OBvEPYi8iTLdm329e/Em3JpPYxH/hVC3rHqQ/78GaChG8x27me7XGh/UIUCeBKbejMrI1AZgN27pqzvAt4kTOnfRuYOwx4Fh4vY/NUJZ+QBDgk1RibuUT1tBPuulBMHv6tq/Ki2tjvCg2pDiixzP5iY5VoLnqwj2GUcBkKRJbdepAgpmY3Z19KzlSCqMt5V/nEiC0eYqtfydAJ+mmg0RRLqMwND8x1J2FCpC01ILwmvrWTIE9moXiSHzZasAnN2W1beL3DIQiUbb3xwFoAixKnLiCPYratYY1y1QiMULDq2zxI2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsaMmeYOBy4TJ1Ln9OIw+WcBFXbBsigFcVyY4axhIQk=;
 b=MwjZ02D0FS1afd+1S1+DNhq1B1BlcF/BLSIuV+81c2a2c1J+X9pv83Mo4dVh1PCCErTSWdXpD26pOFo14YApVl557EfGrag7XytyW4MNMOHTaI+BTXRKzG47w/OC1ors90RjAE7tLb3SV+Q6TEDeqOmAhk7fAyoRGNRevB4BBOrKJhNIkMli/QbTHQtt5mnAlnnKqWsYp5cSUE44gYzmrjcb8R13UmDpI83EQZzUa282bylEeHWhu1qW/Gcn60wcA7ucDMWrQl7gpg5/oo0kAspYl0ZR6bnc7pgUaW/E1t3h0rYtLnIqJF2mlN3q35Vy2JjeNiwOZI7HYIxNVgNtkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsaMmeYOBy4TJ1Ln9OIw+WcBFXbBsigFcVyY4axhIQk=;
 b=WMxQedzxlMdGG5kRdnLg/jfws9nah/DCTcrESGxUBCECANHiIzwpXjPNuhDYGMKNELbPqwHP81Q6ZppJcPBzTImFVLDXNEDQZ4WgUh9RVQTscn1quPD3xUY1cfA5WAs2/B1+jIOXM1Zoab4A28+1hhiHqXjTsEfnmC7sWjKrwGrsUq0GpHvPV0jqTq9JvkJp/Mxsy7amKjEdIy+Sm5cyKheYQVS8+nJuC9j49Ekt38784xyf5BkmSO3qha9dJYkiNIiJIZnunQtfJrRa3ancYU7h7B+M8DlGXcjqEfd/1DES4O4dJS6m0wVOHWoWB4U3omYqE4SHIY4wUTFbrCt6uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:08 +0000
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
Subject: [PATCH 11/20] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date:   Mon,  1 May 2023 15:02:55 -0300
Message-Id: <11-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:208:23d::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 68106567-da74-44df-e6ee-08db4a6e5099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdVTLwPHUMt4pB+j4KbKlc6DUUVCIc7U2nenGIZFfPElCbsx3KQoRY57nksmJrmBo/6Pl+3+rYy8TJL22R3INFYCsrcxWYNHc7zDDJ6Jb6Ctm+zcA/4JRXct+CoMEHL3/6foeJbcOIS5yEVFxRSZvVo2+2mVpkXPVMTpicUfqID3c4iNOHfamVVBNjuC/1Moan6CF09cazBlrSZsb6yiv4mqXLDoT6ctxdsm+G4qi5EwPYbrA/ayI5gErepSo5e9ud420AFHBXTSpMO07d9iZduK7v9U7DJ6NTNR/Vddf4dmroetVkEvsfbN8CnuocV0bK+Sq6NEfpqJKpthb/n789A5rpoZ1+IgndMj8+JzmvczAm6kJwC3YDE4ptT+yBUFpZFQBQrkZiFJAcHlB2xW3zgyPO+sdwtOWP10FMRqsY1gg9C+E3PC7a0QA0WDB6p8OpB1gVGbzOpIVKlM8bj5xtbxcbO3OLWcs4L1QynMkmevX/vBXCJOJ7eksLDuiHU3hLyj7FaG/c5SjTuGlpPCkRyNjOTl6ZYzZD/IEwW6IOUenG/Jy2oeyQWaeR0ri+TDL9AaOD0h88l9uFlDo9JhBvl0MVrNJLqAYtya59VGVX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uRFDvNR8y/PieFFIPKBztZRI2Dr+RtDnfPNy4KwiFbPyJRDY3BgPKSAG0JEz?=
 =?us-ascii?Q?JvberGczuRc/12cfTXSYMaEJPuZ4JQG8vuOU/6+7AmobsLgNcxJY38TWpGi8?=
 =?us-ascii?Q?7XfU8NxmO8+pXtkuM8g+LggR7ks7hPjH7E8eUm/xA+53QD8EvhksGjkNlq1M?=
 =?us-ascii?Q?6p4BV/9T/araExVGRflmJNh5j1854JR5/31MnAGS3auFfHrStIp6UKffRUu/?=
 =?us-ascii?Q?ZL7xhiAMA1wcD2sx7fhqiye+EUoV3/8Vp6L/Sk2PvXmi4Eh6jQ9U/fct68M3?=
 =?us-ascii?Q?z4hywtTYCy0yOCCF1Ro2844uJ+ZICsaB5cYc9+29VfPGRls3pozOnDuiEnvI?=
 =?us-ascii?Q?vAdytVJlSwpCYpQp13YidwJSCHAC3lgWNu5aWV7/Hn3KkWsTNY5sxchCn+Bi?=
 =?us-ascii?Q?BIACWIqGA+V2yHmrgx/WO7YkKc77UllVlmct7R17eva5roVcIARPGERSqvdg?=
 =?us-ascii?Q?RZsqhoNP8mQkNjlE+iXw2sm3goa0yXrS0a2l9n8sjPX9j2z2bRrgE6ry6ZKf?=
 =?us-ascii?Q?u+3Uc3FZFNXhRGmWaNf22wRZ3Jl+473iEVPtcNaaglMZ55T/UKKBDdPSquz+?=
 =?us-ascii?Q?hr9t9H0gDW/2XDtfsq7SveXxs3ESSQWpgLQzTqjy6KPu6bhzZuKFHnG4fkkh?=
 =?us-ascii?Q?W44giK8U2vj1RFdeqbl3T7cp44evM2dd9WyVhSI7UO3O29GqjVtCWsNxu9In?=
 =?us-ascii?Q?5BCc+BRQmbYlrXRpZDpxP+Z5MmbrKuiE2AHzrGCektQMGmLejYWwldxy3MSo?=
 =?us-ascii?Q?quIR8XODJNPvNDQNwlL5qlW+fjNChXrY5TJI5Y5miYHvH65DLG297gva+bMj?=
 =?us-ascii?Q?2WxbEOgVJJJpXdqpLAfwgZlG4ivBpdGzd9UTBDMEd+fOyNbH0u4DgoSYrN8A?=
 =?us-ascii?Q?ZgdZZDzLNYkavrzIWsDKkKfRvLfaQoq0b1kf68LhwA0/Si6PtKAcEvbDnGhB?=
 =?us-ascii?Q?5ghm84P/U9Tpld28Yv86ZCpdg1ouUlbmwZBu8ph2cvCqLR0Sf0vgYOQBVLyo?=
 =?us-ascii?Q?e4RgX0jxP26+qEIMTl5vHi8kBGcVgqVO1uQEjbESQ1uwlHeCwOftX8frVfN2?=
 =?us-ascii?Q?8/8HTEzUT3IZio0Q06KhwOawM1TuEZaOq0g7NYAF/yO8QKz/v+y5E5Bx0PXG?=
 =?us-ascii?Q?MF/NXJauRvDaYCU95gYZztI+y1X8b4bL0jA7NE0rNhQl4nZ7Thz72bMqLFNs?=
 =?us-ascii?Q?dUBh0NrJAPWkXUXrb0MpEk2nbXowGqAHSWrjKxS/ymchnDZDNSWlJGC/N9BU?=
 =?us-ascii?Q?4G52Z6M2K/O7RMu9pU1zPQrETJCuItQtdxsOhxLoyytQ7PboMd4AiswB8kLV?=
 =?us-ascii?Q?LpRWbzMvty/2VS/1DZGdmRCL0nILBdGJnGqZufX+Fkdr1mNb/XBTREiTAX/d?=
 =?us-ascii?Q?gBJQgC8zrYxFRYl2yjRI2/CPeE86PCOZXq46maxgm6xmB+dKubhWxZD4IHlS?=
 =?us-ascii?Q?1lDcWix275WaLzcpWlnmbJchnyj+Q5C0rxd4oqaEn16JIrg6Zc5j35chYdSa?=
 =?us-ascii?Q?dy0/okHXgzmvXExwyVkkaNDXhIFDK4R8ZM5xoN71NIB0H1qxaH+mQpDnUoux?=
 =?us-ascii?Q?QJ20pUsQDXzvY0xEVti/Nymkv0BhBF93GdFVjfIU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68106567-da74-44df-e6ee-08db4a6e5099
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.4239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpPVw/Hgm008N4FfTXbQRQg3nHbgrpCqOdEwTJX2pBndTeoKmrW+PUGFHZFH2zeB
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

What mtk does during omap_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Remove the mtk_iommu_v1_def_domain_type() hack,
commit 8bbe13f52cb7 ("iommu/mediatek-v1: Add def_domain_type")
explains this was needed to allow probe_finalize() to be called, but
now the IDENTITY domain will do the same job.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu_v1.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 8a0a5e5d049f4a..7c0c1d50df5f75 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -319,13 +319,24 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
 	return 0;
 }
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
+static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
 	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
 
 	mtk_iommu_v1_config(data, dev, false);
+	return 0;
 }
 
+static struct iommu_domain_ops mtk_iommu_v1_identity_ops = {
+	.attach_dev = mtk_iommu_v1_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_v1_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_v1_identity_ops,
+};
+
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
 			    phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			    int prot, gfp_t gfp, size_t *mapped)
@@ -441,11 +452,6 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 	return 0;
 }
 
-static int mtk_iommu_v1_def_domain_type(struct device *dev)
-{
-	return IOMMU_DOMAIN_UNMANAGED;
-}
-
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -578,14 +584,13 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 }
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
+	.identity_domain = &mtk_iommu_v1_identity_domain,
 	.domain_alloc	= mtk_iommu_v1_domain_alloc,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
-	.def_domain_type = mtk_iommu_v1_def_domain_type,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
-	.set_platform_dma_ops = mtk_iommu_v1_set_platform_dma,
 	.owner          = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_v1_attach_device,
-- 
2.40.0

