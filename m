Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9657338DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 21:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345766AbjFPTDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 15:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345458AbjFPTD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 15:03:27 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE37B3C20;
        Fri, 16 Jun 2023 12:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz6f1AJdSUntP6dPGhixSdtOnktkj/cK+AO9mhe42+Nwl9JOsQtuep8SoNYvftg+Uk130/7haOYcVykZCwqbMmQYL3HA4ePIo5W/x6WghB7442nKprt/v3aXElj0R34SdMsTmysX+7JJWJGDM/YHX06TY2kiheqabHRzUJ267UyjZpU9Kp9mlf15OvASONLLgdl4azxttC4bdKHayY1qtwoAuSorLSbFKHGVD6ggbFbd4C+7OvCNgP8uoiF/o2lPZ3iNIZUZSBUy0E27ag1a5bVZ09FebfC+JFRjxdQISWCCnuKNhGQDGiqI9QIxbHcyCLMQ/CudUM59MZd6Q1Rdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWXa5iPUsdOK6aga88CkdY8DnvSE5VOlKfKrBPcpAvo=;
 b=ErRIzEDjNgMElSDntUJ/ix4mIzGphd2ZGdxEGawfJFmavll0k2Xl4Z6/qM2PsjtJ8nb79gUZF51+bVGjczSizSrtQrNeiAzUpnhTSqjUxDUD/7ADOYnHCkp5R7zVb+bkk954EIkel17feNN7har3v+mnIxH4Oa6F5wpewoO4AZy+UFqR97M22vBQ8NyLmqx/cW7V8U8mAjk1ytD1qCoqMxJp0IAS2YictOuHrFHIf/acufHzp2y7raOnShqd7P+gy+4EDbghe31o5bfY7l4Z+DdkrGItBJFH4Uf6JESdWOOuBpnEFZPEVEpcfcaASmJiM4CkDdcYrWGevZPWiRO4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWXa5iPUsdOK6aga88CkdY8DnvSE5VOlKfKrBPcpAvo=;
 b=nbeAzcr+PHtBQNjQ8kJCPAba9CKd/LSQeblYLl9icXyAw5W+Jt5opkxxksoLCACmYW8dzmCTrx0zN+DCqKJfC1kIdTHoJgfk1IkFrcbXwSpQ/e1Tj87sCY53d8Zcxt+KyMl8s1PcqQKJME7Ab7FygdubOtd1iQlKbJ/HmkS5vPDjsCC9FAohoEL5LveKcRvkLx1eZDF0TM3OAHlgHQ8T+ExdkgaN53cv2JLuLOCDGQIHuBijUXkmZo8uwkf/1U2B68tf873cxt2v2ywKrlTOTesQ58YnhVaRbKU9x5pb8cp4K4DPephIsg2Z3lNardjfJLlKd22V7eKdmgnnGbKlag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:02:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:02:56 +0000
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Andy Gross <agross@kernel.org>,
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
        Joerg Roedel <joro@8bytes.org>,
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
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date:   Fri, 16 Jun 2023 16:02:33 -0300
Message-Id: <4-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0058.prod.exchangelabs.com
 (2603:10b6:208:25::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ba866a-6dd2-4ba6-4256-08db6e9c4ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbROQo7QWxy1gUHWkTL11kfLQi80Ynex0gWa8cZoyNwpk5I4XzlDK8LhjxxAW4VYQ8yDbu2mVQg8j2x5iUyqdt/E64hQ+t9tHbylCPF9QwCAc6EYG4tJ09imIRzcHqcUITZeWtam3aUVcbE7abUSkePbWTq+FL2N/nM06GA8T/5ymAZZ93iX4ioEyTSgP4/PyeZ9jB3uOvm+G8NvS3I3Pznq3HZ5DGYD2KwZJ7wo1HY3569fbcTpscKO41mqLCuDRXw7iBLXLUd3+suyuYdPKsc8pSaKgy/KJhU99nb1uZZCdURiHDX2D+uS4VUz6AIoUHYpjty5DgFuFRvlASUMK512FaoaB1rqca4AoKBbvH6wxze2U5/VcTYDcMTi90FbVcfdYDlnrnJPD9Lpv28SmZuepAIq51CnThNOua2TXcs4kmWBrsD/1J+2EMdomoT9esEL0VF/TvAYRoNhMKBF51C6lcjG1inuHddCQi87CjOf96x5i+GDtlijDhg4ZX2xBnYpWODbPJh4CZxPVbjScwOnv0DBr3cwYjviSG0+ay1lR1Oes0szBBPtDD6ZfJLNc5mSS6rq5BKFtaTLaAOV+ooLU4R2Z0UoPzq52mMvO4zH4IMrQVJUGrP3n4f74o7v
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmQ/gBSSDTawJlt8poDqgezB7qJC9zBaUui07d5ep/u6y/LkDaRGU51gUM9C?=
 =?us-ascii?Q?mcLFqoQCx8Ttu73rX+1nhIpZ72nHiQP9ppeFEin/K0oiSF8M5AkBfaZqoHBJ?=
 =?us-ascii?Q?vD27Uig/Dz7ICEKUy8fs2DPiDZ2niKh4r1ySgCxn/cEkKFR9hAOMkRWPhRIj?=
 =?us-ascii?Q?24qUU5WbQAmQeit0Iu1pthPaGZQqclsOH7tDcZnKW2QxqSNM7HxKNBS4K/Yz?=
 =?us-ascii?Q?0THimUI1PTGnqZPOw9VMCuUu3amMMGj4cppGH7cQZ9Iqg3yyR7TKCkbpZlWn?=
 =?us-ascii?Q?n7MXaMJKEl6fiVQynHhZllGIrFdNAWafalCO2KkgSu2hd3+/RUwlPYKc+qzm?=
 =?us-ascii?Q?lEEPxRhXfGh+/BQDb30fhsKRwy4lsVu+UFCfeql5DEqofCWRpJkzJhIX7T4O?=
 =?us-ascii?Q?0PdVCk9G2SQcSPQjiX2+U8WFcSN5geubcboZhVZkLLWeo6NuZyZVbwd8fQei?=
 =?us-ascii?Q?dd8zoJ8v8kuMtYi1ANZ/Cd4k81SWvGKkYqA18ZhXdaUha38TGUe9E4lKCaH0?=
 =?us-ascii?Q?bSW5qTJdyp8Ytf6OlLuxUXphq4E9aoO2znownWksqiTB4kkkQLsCaGXd2kw6?=
 =?us-ascii?Q?d3RpZi4FPwdXHZ7XlY5A31Ix7BUeC+YdtGV7RqkiTrQpm+a10nZsKBPxNqwF?=
 =?us-ascii?Q?zdsWMQI68T1DrEfidmG8yHGdNExJr83j24IovACnEQ1U60w4fSmy7bhscmwe?=
 =?us-ascii?Q?h24oNWcquoqHDcm2ctbRb8U4VtQCKyPU4VsxbNZffVciitGaSKhADbMTnfpg?=
 =?us-ascii?Q?/z+6L/mnQBakv1jOhylhraEKtudBQ8uTwQghxK5DbmCyAq3aZL0eShxo/iPO?=
 =?us-ascii?Q?t2y+JXqcD8nINHKHkB/ZDUaGXTr+OMVvfo1IrhCtXuIz3z3i3PyG3+IrUhDg?=
 =?us-ascii?Q?+7UGPtIDmzwfkGweR9qZH75413moo6uQeZxlYR5SCHYDZVuqvT1L65xkwDsU?=
 =?us-ascii?Q?KTUQq9UGJto4zM01eN9NaYjOLDunse1+lnHHASVrtS+ySOJ7FsCcdwXKKH20?=
 =?us-ascii?Q?R12NB4cY39BoAbI0hKqVP+UHLJdFabgYnpgEhiBdXRWwPU2m36XQU4YNLimu?=
 =?us-ascii?Q?MMYm25yK5cicBS9q12qMxjg8E4cd/Fm0U7gxw9Fre4l0cutxJZunK0x1j9qv?=
 =?us-ascii?Q?ZkvJ90NXSemHPmvjByEzUv2PCCw1nXR/m4h644RZGAn0OZCiuf2FCYXDEq29?=
 =?us-ascii?Q?hrVHf3UVpQmabUqfsU7+NIR9HPNiuwVr0xfJznIGIvyOCP1siOE44ebrORPt?=
 =?us-ascii?Q?mK3KziINGPVXqGkmI/RgGsNEr0nuWezHOkUvrWE2B0BUOKKBZm8LB48iGui5?=
 =?us-ascii?Q?LOhoCy71YcZ0TXEtBFaVii0QQtsvboHAxmKfJqn+0/TWNQ6osgkP8XgALXzi?=
 =?us-ascii?Q?GMJXivDMyqsscZQPLPjO+DNV/6CwL6u46xZ5Na7ALgv/adw1JfvMapJ2sIkX?=
 =?us-ascii?Q?XpYKYSCsqia7mNMhThfBsl5O2p6Vmlg0sz0YKwlQeP6ZiqukGzbgj4ed0SDR?=
 =?us-ascii?Q?I/Gb8hthG5pw1pARXsv140tp67y3aUP4sNBYuDnEaTWBZJBrMH5Uwi16upEa?=
 =?us-ascii?Q?SMZfsIF20rFrpAWEbw0+g9qgLzJ2HG1AmDB2YGs8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ba866a-6dd2-4ba6-4256-08db6e9c4ad0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XBQA9TpbLHFEzlKKVlC/nnhXhzSbOc/5tbf4xv1KdFFFlB4kBPq68AbjE/SVrU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

