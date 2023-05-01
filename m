Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3156F3577
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbjEASDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbjEASDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:17 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17911986;
        Mon,  1 May 2023 11:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI+v1RmFl02ZJ8wyqZXg2hKCuPydt0u4RdNSEgDEwJQhV3bSTk3ihE1TWh28TFILPN7G36XTzssZwJemfj3DVIP5UUWFwbLV5vtspO8+l7UesFuQQct81IjVnKVTVt0sUW5C2GEBdssywXCXhT3DCIgjGnQAEdJadRSWU2AEPnJCaz2i/mDaD5QvANB4fj0s/9+9uZoq0mM5ghrHKMTGaeMptsq8tnh+h0s50ENPXhC7iIzRHfV3IhbK5c/hZoMpxuyJTr/gmjim13h61w2vZSNdGPudprZkgQMPyhY7syW2MLt7XUn4muwTh/hY0fQzg46hTDszXcIJr+Qx/rI6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzBVAMf5sGK0GaBtvrF81cXDydj/HWb03X+ZAZtzJnA=;
 b=Vk22tihnkyFW6OfBMheuLQi2JWMgUmqJdTcHsekCcvtPrQGZBCMijzphS4Um3onDZpJciLryRuHp66vJBqfeU4TpNBmXdCcPYvRNUylXsfuC/AoTJ7iTv6k3TGxX2rXiODvtAoJbEGbCO76ecoseJWxSihSHR0BAh3LFoThiByYSBIq90dZeD94IoiQ1/hCLqUuUoudddBCS1qCOTmtP7obXZBjsUnFDCgt7DmqI7W8o/k3YV/SXJb4B32txPAV2fiCVxi4qYsous89xWizSC/5TuIiHwQ/SnoVeaw3mtMP9rcnSB7nl2yOYn4SOqGe011R4vcX+z+3xGmHTLRYLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzBVAMf5sGK0GaBtvrF81cXDydj/HWb03X+ZAZtzJnA=;
 b=aE11JqULmRV+xRBnr+0OqBs5aMcW6vp2wYb1Yh55fcudegmYzF39hb0HH0xHOOtJg5OseDv9SbeJAJ9Pq8jQ3TF0qhXLSpC9AHxNNFV+hZoMO9QcmQ2NZVznL9tRA5sNKlg/HCH/K9MM6wlaT4iKRnlmFLyLk1/RyZ5on0zIMP68I++pCegAeUi/KT7cHwSyuoUDi9cZ1Y9zyajvJ6ba9h+eNau5x68K6TPj7v5ogJsI86TCeVLQqwtGWxQ4xyo+ShUzjbRp5ZlCIV7pXcGqSTsqQMOEVTQxDxlNYzqQQTX8VqbQX/zRFOm7oWJIEw7AVBClsXyKdLKGMeghH45Gzw==
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
Subject: [PATCH 16/20] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date:   Mon,  1 May 2023 15:03:00 -0300
Message-Id: <16-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4153af-b8d6-478f-7ebe-08db4a6e50d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLonrndzotFoOOizeu1wCQwiFSemaL7X56oWmabz2V7oYJRFQ9EHB3eSY9IfYY3J95jK2pgKjPN+G17M166PKwufzY13PHpGbZq8CiYhf1ZmRbuL45207jr8+2FWHvjuIcm63jLLMLVkqCrkMF2I/fm9qL3/ueY3+UV/hKmV6xzdzRXO+GsueK4X72jnulfKCwGOAiRyhc7tqc+1udo76QhizCoydrycaeOo4ImXsbVQGyQzyTi6HBdZ7gChODVby92rXjxwjvwMYkF4L+omRJg3F8rHkBG29FXxvZId3LmzaY3P0hbTjXyiDRS2Zw/KNP2dZoHQBxTMhG9zs3fz2hMiYU8jZeG9xy/v7JaTxs1PRb3o5q6RMbfaKcd9XUITl3UxgOG0E54HaY8O6ZIjOYt+QXLnBRfLKqPw1WNRQKbEWnR2gwE6PjEASmekmMg6iQedkpvVC0fCsGWKupVqEKb1VSiftu9/qNsCheCmNvOvhjOOaoQaz+pRe6Lof39WjfIGYcf0NYiPf2Te+U64aXpNcjoTyV+pGgnNMGQNX7SymxGcnvn4VwtKhUdLzG/98g2AWtggz2POO8MkOsSOhsgvYPt16sPFek7jWO5Ugq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tF5tcXscjLgH79dYnfpvwZgjdz8i5v9K7+yNa6DW5rAroFsyApssQuX7PhUq?=
 =?us-ascii?Q?riIKWzjiorodDoVaJOSO086lcAj5SNLeOdN+9h2nLxoLvOq5XQCbiEy/3aEB?=
 =?us-ascii?Q?p4iwH22IzkjBX586Pi6ocXiFTlzIaocs7wAghjmk++YRu7f6YjE/y4Bdygf2?=
 =?us-ascii?Q?7gW+DR2mYdFF88joJ1CvE8BffP3kC063Y2zh4m0beTLkATtK8POjcv2PnCgH?=
 =?us-ascii?Q?SpVil8Ubj2eXPwZPo5dL8F5JL6+2/I7g2ILhWrGDUv3zrXioUJ4TBRcAMpCq?=
 =?us-ascii?Q?uoxxilMNiFSCOQWNQSfLu8RJNGu1uOQI6huEEPFAB3QvSCWtzYa81Ur2j+8d?=
 =?us-ascii?Q?mtGQB3ISVBoxwKwzkH2VwL8DXuO5acpYWbbc3NOwrJz0MKvpLFuPAxkNrwAA?=
 =?us-ascii?Q?qeeT1I6ZaLgIcB59MV8ExWjW6XRG9P67rCHdysN411RCdQJjHfmFcYl9DzFs?=
 =?us-ascii?Q?A67cW9iWIid2y/sPTOTWS427w/OOC5eUxpwUoLAfsy5i+f0oK+zBLDaSPWm6?=
 =?us-ascii?Q?/7xkE34oTSUIQdAmFkL7Z1bbvtJrMb0L+9qwT4MyeeTf0IIQ6FB8qaRsdTBE?=
 =?us-ascii?Q?j0FgOo1axXowzyXUykvs4sFIjgOgO5ID8S41LQPDj1aNI9E1e/puMULzHAjt?=
 =?us-ascii?Q?y8YI7I/1I3dzgJhYuhWVYGM8+ZdVd8ATp2QtloqId+FbmkqKgiQmypq4wfe1?=
 =?us-ascii?Q?b+bGdjXdwAcG0d+7d1PfK2vSHBvhc14VWIYhgq2uAnk1f6VrR1uaYi38dAoP?=
 =?us-ascii?Q?kzGDXJDDy/MjzbWGuLSPU6l33pybjn0HA4cxNd7m3wJ6eFHLHpO1xOsiramY?=
 =?us-ascii?Q?EvdO3ZIYY3Kidb722EMqj15zSAyN7WeAuLJvKsvXt+utusXiCutoBoKztys9?=
 =?us-ascii?Q?21ru6rMNIK7dgwySsLigjkf1Qf/+yP4dcn8aH8G8nuVe0Npgl1wJidrBiNEw?=
 =?us-ascii?Q?1tE9bHcEosa4jem2krWZw55i44i1GBPHbvjczgBN3sX6JvsrLMVR5VFvlKlg?=
 =?us-ascii?Q?y3680CDyb4iLkzYft4qnWackgLIYUBM1NnM+XGYVm2ue7oq4jLxmJQfAK0+Z?=
 =?us-ascii?Q?dRwwxKYwZNIztnGgq76blT1/Cku33cCgZh33HXEk/BK74gEVejQMa3wFwxCj?=
 =?us-ascii?Q?dOibt2vN9KHRO9i9moJyCKNXPy3xk1KQuCKRA72dzJi+xjzsTL1kI29X61lM?=
 =?us-ascii?Q?lciabu73/jC+dcDsnYRKXe13IReCZs5yE2QGhRnNbQme5oBUJCEeY05/cLFs?=
 =?us-ascii?Q?bLC/YLvVDtDmlL7QJxBDmrEvhuMGJlO0V3EONCFe8yZU+sBKd8/32r68wXvX?=
 =?us-ascii?Q?Noa23U4GTjT88OPPn+X5Tu6pzn/PPw34sYV43iuHCUQA1jApgnkzEPJ3eCX2?=
 =?us-ascii?Q?2Fk7SepUkkhoQh9lRmm8fxaf+9Q9g1ieQzNJx3Cz0lzCs4mIisAi/2S58l8p?=
 =?us-ascii?Q?0p5gPVw4D7CIOF/91bUjc06tt3b6wGDkaQ/8gnd1NGrEMnPtfR17bMXU2RSl?=
 =?us-ascii?Q?hEASa7L9Xm5UQdN8jQzCpvOi4Qq2cXgCg2kNpKGFkQHioOmEsM7Yp3UgqbN0?=
 =?us-ascii?Q?XYramJGTxHAZ/J00VTtI/JjqMVvYi+Pbr4Hzreda?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4153af-b8d6-478f-7ebe-08db4a6e50d5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:06.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QdpPvODeB9lqC5SbDgoXdAphJ9eygw24UQ4DHBn3L7znTILaOb23+CSAzTiDxv/
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 74c5cb93e90027..15fd62d360778f 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -772,6 +772,26 @@ static void sun50i_iommu_detach_device(struct iommu_domain *domain,
 		sun50i_iommu_detach_domain(iommu, sun50i_domain);
 }
 
+static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
+{
+	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
+
+	if (iommu->domain == identity_domain || !iommu->domain)
+		return 0;
+	sun50i_iommu_detach_device(iommu->domain, dev);
+	return 0;
+}
+
+static struct iommu_domain_ops sun50i_iommu_identity_ops = {
+	.attach_dev = sun50i_iommu_identity_attach,
+};
+
+static struct iommu_domain sun50i_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &sun50i_iommu_identity_ops,
+};
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
@@ -827,6 +847,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops sun50i_iommu_ops = {
+	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
-- 
2.40.0

