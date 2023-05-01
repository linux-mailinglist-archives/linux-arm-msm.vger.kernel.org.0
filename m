Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F886F359C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjEASDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjEASDZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:25 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D091BFF;
        Mon,  1 May 2023 11:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4kJ1ny2djTkxHVjtV84D3Y39+ZWdbaIeZcDwarmYC/lwe0+jSTwLYSYWGfJLbXURcSqbEEVAmeu+zeEwvRpdoMgFOmLw4ftoTq5MvyTNRFRV827YPLfCRwjh5neZZYdCERhdVS6diH9vedtwOPxvIKbJ1h/98k+gCmYwtWD9YKGxyTQW0lOY3YBJrUgNQqdrUgW5jon5etHNqtHFuuU1JPKqGUg8MnqriMKEdA9HUtUAWd/9tEQkY3NX6oaaPvC80VPx+WE3TE8Fxr2GwQ8Dcb1gE+k/Qs+IUwdMXyER9xz8wzK1MbcWA87bwfNeaXAYPInmSDuqjWJF8cwbrDn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgUtlzVB64vzz5dFUiLzBK9X1Ek6GrIr60NieuGCU/A=;
 b=NpFvCcVlV4ZNstuf03x5IVtAiJdSeYYmUJgTgnW0bJ/Dp9yCFeelovwM2UVPHfY6xe48PZBlhfbEqNr20S1R78mUfVHZZQ6buHqR9xPAELKJimYd2OgPMx4eUMvgH/lQJNKr0iGDmfBaqNaJk4+oPwVjH5Tp6S/Hi70x+qTUsctJfl+e0n1cTc8UCKCRFGW5PWW30EaklIDi2o/q5WdrMUaj0zWiHuv6/qLWylxHGDYjWLKR5yKFYqYcoUyY+7wuNJ9JG9bdoa5OZPA2GbUYi7loJAcpQYinLDKXhmYKiv3HkeELdq1XTMYq3wdzjj+1bGzBR4eSi01ibQ4In9d3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgUtlzVB64vzz5dFUiLzBK9X1Ek6GrIr60NieuGCU/A=;
 b=BWXUr5DXyFVHUr1NN7UuD/vRIjCpW4nL4c5Re+f+ORDBzGJk4spS6CrAqSQ/i71NjQXUGAj6eBbbOXE4A6/V/84qqmYu9YLiFkHULqQhV9wr3qKE/TltaOUxh2UWlc0Acup48mNCbxs1QXeVtzTVy1fEOZgNd47WgVHISG3gvgDZcCvWQ8XQJkF+26k5QiMEQkqyIcrCpo0lbgtOjVkOP7l3DJUr2vU2GzSVsgMbs9V6tsuQt13iS4a/T5I+YERELuTAsT5MmI/ZK0NrwYWpjFmhPc+5ip2XlGHryKNVHugP8n7i+HkIAT1kdW0P4ULbDK6YjyQDyR1GMoLsDUM00g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:14 +0000
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
Subject: [PATCH 10/20] iommu/msm: Implement an IDENTITY domain
Date:   Mon,  1 May 2023 15:02:54 -0300
Message-Id: <10-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:2d::41) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0776e807-fdf6-4860-90eb-08db4a6e51b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aD9YeBKzlej/1aIWAnO13HAwu1SMGnGhvO/c4FTKMEidquUfYPuCiwpiSGi0Ns6OaKEvjqkm+8Tv6TrGhpHzVz0lJHCjkmDqDn677OseYGd221tSh2+C0h7t2uXQyQN14me9StlV3k/BfVTw867/ywa9wt/SriDohPcTYCUZG689s4EELUOQHgm1jtSCMSPvDt8fGWQv1rvoDuX/ac/i/HDxAUgbHBxrPkcGWV05Z1PKceNCaIPU2bchNNdA7xNEotC7PYhyayDYTx5pzlCEJ++cnwW5fP4u3jst8uuAwEgZDC1GpI7Phd3Am9EhxvYZQ+bPJklgO51BxTUdAmRWRCO7WzwWYvtxYFG4xp4jyHEMVVIHCajmpeP2Nc+xD+1dgCjIbPBQgR/0cOqWsywAY6B2t7IGJLep6Je9MmkQ4Hid8vDjGXdGYW7rqtheP8w3sfGFxUEeIPIovuzUBAc742Uc6lHa2rDkMV8gcsk0jvEzZlTD00Dkcf9ls850AFOu2TySyDcIO9Uwj10Rpq8AgbJJbiGvVIR3cX4G5n2jj/A35pz3RzlR6ff7e8PkfxjYLN9IJgkCoxQQ3tuhB3+1/kx7tvRl2INBd5r9GsQsfoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQNmff7oegrYmGhtZQDxqlJN98giwvvrsHR/6nIJ6+8F3YUJyUkiGCGYvxBm?=
 =?us-ascii?Q?pVzYfLCKDLjL6n7ZQiQcOA336OCUTJWTJBtSXWXAH3az3A/h7ZoKrp/4IA2R?=
 =?us-ascii?Q?IlwC/eOfPuRHnHLXH13tOe/R4LBRMFr/gwavY7r3Jsq5QZV6BKh/tZR1xPu8?=
 =?us-ascii?Q?A1GRnyfne6BvkMzSrH6TrG+5PcaalcpQQyaohDpwrgdMDl6kkT07JpAuFlg+?=
 =?us-ascii?Q?IGYoV9SYUwdLSjsmWRpO/QP6ntvkjJYZZIKya5+KYcMsScf+qAufPY/3PLzR?=
 =?us-ascii?Q?7uxSRICT+BshbrGUhfhNXuMwwb8EbYI+xn4aBSV5vgGqjt4dIbilz10eBsXS?=
 =?us-ascii?Q?2iZSu4WT6zaLuvwI/4OqDMjsyl/MFRvcS9m5Pu2InYkhPbEC08ZFWAW7ZKu0?=
 =?us-ascii?Q?sMHci9u4+kzBOq23ruwweOTaIqH30UdeSKotWoSN5yIu1yoBgrMDhfXiZdRC?=
 =?us-ascii?Q?OXY8lY3nDWTkZ5k/TYVABI6hrndRj+9y8tbb0cGoPk3av6KtcvVFAZArvk7n?=
 =?us-ascii?Q?xT/A3xEKpDYmWOf7mG+eRjd4vGLvsuZWvFfqPHZTe0yYt3azynJUsczFo4Oa?=
 =?us-ascii?Q?Q5LHAylZPWFnfhjcNZTkrBAZBe3VV7cBboViv3eHdzbddapaNVW+3qpIYbco?=
 =?us-ascii?Q?C9l2ZD0YdzH7kPoFyl0KQKgVl0iQqSV8XHh5hr6HENAQbh1v4H2XN3oa73K5?=
 =?us-ascii?Q?344bOuiTY4NeWez2RZkcG44ngQ25r+mxTr+sEypeNlTCN0CcG/K5YwNDI5m1?=
 =?us-ascii?Q?h/QWFSSkQ2BbT7IFfOYkuBAO35TLtTugf+5wmP+XhuJehQkWV/m7rBymm3Wl?=
 =?us-ascii?Q?aXDRBOg0GWspTKUMdyTseG4/nggpdGXTCuKfHIRKUau6241EgfGqhT9FMkKC?=
 =?us-ascii?Q?JtVqqZiYvsD3VIjgeQi3qAa74jVs/CoNMqUdp0YQVpVJzCnN2YrxvAyWuBzJ?=
 =?us-ascii?Q?RClgG6IUC7Xx39AZtQJgJjygmx7HO1vYTvV7/o1FLWvarjOgqe9C9VXV9N+Y?=
 =?us-ascii?Q?v529uQYEV+2wBwUkxOLdsEgOa+QuPgWPimJtGkoXQertwMpV30V7eTiHWD5L?=
 =?us-ascii?Q?evw5KNBuY0Qk3wFTooRzWrR+Ts2JpZEQ3rrHLEPy0N4LQd6DpJMlLFKUtCtG?=
 =?us-ascii?Q?Y+LutwhEmTiztiad3LUOJlby0o3vz74JuNJ5xdbZF/3N9iz+M3R2eEBsXPbp?=
 =?us-ascii?Q?kIjJ1VwStroulCaQvcTe9SU8n6Vy+4d+SUQmfPvFmXA1g3gukwnS2LVBxUgd?=
 =?us-ascii?Q?e2BkBhbtUCc/deFsjaoU8MkoWfA9m/j3zyAS7mmMtkzdJSbBV+rokiBSxzeD?=
 =?us-ascii?Q?mb0Dool1Cx16lecUYUCeIuaGX3Yif98H4GESvlhMlmS+42zYK3it3GQhwzXK?=
 =?us-ascii?Q?YVqwYrm7QliQKJmO2X3qNQrElwrvB4N0WPnAqxWFlS8u/iqekzgqva5aWpV/?=
 =?us-ascii?Q?wjKjdJHXo0leKkuz70Q8/OMieJe86rtk8Bc5g2L1yKoY+ibFv/1Mnw70CnEl?=
 =?us-ascii?Q?1qP0x3tqWLuw5B1NkySxFC8jJzMLYjScWWnmB6ix1dQzzs75nRYLoqczz6Hp?=
 =?us-ascii?Q?aol0S0ccomGR2H2Dk9egzlXZRT5geQw9VbpeSvF4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0776e807-fdf6-4860-90eb-08db4a6e51b5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:08.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmnF2sshWowAAokRi4Z10m6zbZaDdeicdqlEndGwSksZN1HnQbIn5+05WvDRyRxr
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

What msm does during omap_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 79d89bad5132b7..26ed81cfeee897 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -443,15 +443,20 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return ret;
 }
 
-static void msm_iommu_set_platform_dma(struct device *dev)
+static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct msm_priv *priv = to_msm_priv(domain);
+	struct msm_priv *priv;
 	unsigned long flags;
 	struct msm_iommu_dev *iommu;
 	struct msm_iommu_ctx_dev *master;
-	int ret;
+	int ret = 0;
+
+	if (domain == identity_domain || !domain)
+		return 0;
 
+	priv = to_msm_priv(domain);
 	free_io_pgtable_ops(priv->iop);
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
@@ -468,8 +473,18 @@ static void msm_iommu_set_platform_dma(struct device *dev)
 	}
 fail:
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
+	return ret;
 }
 
+static struct iommu_domain_ops msm_iommu_identity_ops = {
+	.attach_dev = msm_iommu_identity_attach,
+};
+
+static struct iommu_domain msm_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &msm_iommu_identity_ops,
+};
+
 static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t pa, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -675,10 +690,10 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 }
 
 static struct iommu_ops msm_iommu_ops = {
+	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc = msm_iommu_domain_alloc,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = msm_iommu_set_platform_dma,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.0

