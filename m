Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940896F3583
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbjEASDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjEASDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:03:19 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2141BE3;
        Mon,  1 May 2023 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEo0OB0he1ETYEb1bQd16OkQxeL9OlDNSb9bCtuWHB1osk4Zz7uXX3jth6Bc9l4/GG6X9qkogCRr7mc1VzA9qSTg7fvib1JwfqmryKn4RsR+mrV5akm+kKym6qKCIobbh64eFchhK36BWVqVBqK/5A11GY5fW/Y7YHkJiKr8WoTtXU47hCQW/VqGtYeIt57po9JoSrbeGG7LpV5CwcU7MAnZkRBXAdWPfcVLN47qgiGrnf7vW6QJRVOt/TxVuE0yBG9uadjjay5z7IG9S3nUgcmsdvC27pxh/frylCilovga5k7dwU1D3y+W0DCsWXfr05daGBokTW54c1SeFdf6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGypGBabalW9nFrJFZoQiXRGUbAOy7h3CLL5Ocilbew=;
 b=m/g8hZzC9JU8fwjmREiyLbqU7+nB6yeN4bpwSrRZg617pu5j1kOEDC58USoAlPv3U5k9aqJo8teidHmZVriY7HKX1WgkmgfPcWOmxNYedpRyWD/onUgWNx0NugaN62rvIJLPfakBLWnhxJvnD7Nqr4p59OMH/g9ic4MSwMUCZOn9CnzO8Flnh6U6kUojMRW5BZKYKVvF1zZy2PYre3d55mqQXNSXMXcUVBGR1ZdryPohEH/TbmGZlcrFACkbvEE5FZ5Eu1vKMCqhl8tmiXS4FhzdgRpStuBaH8oOfsEIbH1mY5XMlYxqiyKBgzcNJCUda2Z60dpQ0KmS+nr12dbLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGypGBabalW9nFrJFZoQiXRGUbAOy7h3CLL5Ocilbew=;
 b=Xs0ckCXXPD7wTEjwaz97LBAeAOkWOYuJxszmt7XtJNU66PXXYaLVIbltTgD6loCaW+tHIYPYnzErMxpZvt8FoRzIa64NWv3lrD6fdPawIfWc47m4FPpiFuQOKKSeiTUW0k0l5joIKeh6pedC2oGmIm/gMrv1NKIRIAudkiDfZmgkvCQilEXHwZaB6sdbvwbvWD0eHJPOReqyKlUwfykwcEyeUp4nn/E2FagWsNXhSeDGtLJQqGqiHZhsbAIpVpH22gGV/4vBF8GMXqIIHq8AbaxSnujmDMTgfjQDAgQ4LR9QrqMjdqFXvRssg5AE/FljRtCQHnSkMHyL26CDD139ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 18:03:11 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 18:03:11 +0000
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
Subject: [PATCH 03/20] iommu/s390: Replace set_platform_dma_ops() with IOMMU_DOMAIN_PLATFORM
Date:   Mon,  1 May 2023 15:02:47 -0300
Message-Id: <3-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: e3313699-3c9b-470b-6714-08db4a6e5100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HF+y+5zmrdEY+Povf2SAkSrdA/VOk38F2+DNog0jLRdCku2g4m7R8788GJ0dUukahTPHI4WURGQd2UHW0bUAe0dI8tZyWO9P4Jkf6qDtQDZWm8UMnJjW0esEq/sN8Plux7bMldWC+fKNdtfJ7OK3aoNFgm5GIjzAjymDiIRHvdHAdwY/5qMwrBGPedmPIBiUiJNVm5Dt54GW7MDYMs49B+Qe9zedDIC77tPzpH36o4GIo5VAOM/4fj4FjYg6IkqfdEcHDkj++ryASn/IaV4BttSlUn3gYIvDrwkXWUarE31gh1dMny5YfSESPGOCtdaLV6dD9SIoBtIUWrYgxMSTkFytJ5BVuE1T5UfQFQBXBNdaSkwmvvINlzChygVO8P/o7Um4VAXiQ+NUDKK2xyc+ePGRwWkWtGkXoAC4HTGF3XjW/A2/0znvN2zO0KUcfJCY4v9ZmZSQ1KC0w8dDN2uWSSyVTx1KA7+xkHnB3VALG/J0oDsJhoV1fTr+GOfbywOcNTXVCvTchaG1yc9D8RzFCN1rvo/6SZAb+XV8lTfWpYcB1ZaD+doQKUa4s3hfqHaK3pYgMu+lb499CcioHfVgHpohRhKuvkAdnPjuDEqZkBIAwvVOl6DRQwwEJrKbCmtR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6506007)(186003)(6486002)(26005)(83380400001)(2616005)(4326008)(5660300002)(316002)(66476007)(66556008)(66946007)(6512007)(41300700001)(8676002)(8936002)(7406005)(54906003)(478600001)(6666004)(2906002)(110136005)(36756003)(7416002)(86362001)(38100700002)(921005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/jPfL8RYF0ErXm3y+HcWRPqJl/lvU4/+k75s4Uj9v02yjGolT4xGBqV+FsO?=
 =?us-ascii?Q?q1jn/OlHqS/RLv0K6bX9T0awyyhBuoAF5Q59aG0L5vS9TsIHIUSiGCrBSaxQ?=
 =?us-ascii?Q?D/ziHM8lcoefbXy5+oXWAGuinSHe1TIVf9On0pgNBe5LhOfYJPhrDbFXFpi5?=
 =?us-ascii?Q?F9BIVONv5iKFdZJkQnLffYOWvkuZo2lJhZRX8VhsebvU4mkYMmsFbmunhvVl?=
 =?us-ascii?Q?Vd4zHo1BjTZIKmZzVA2nwpOtd8PmUdGB4IZ6Qef+PQsM0t6hXfYsoiCXuWYb?=
 =?us-ascii?Q?Wzy+9ujcpAhObZT8DGlKab6cQH96HyNjo0J1JYFTFZFrwmopZnM4TySfxC/M?=
 =?us-ascii?Q?/fVt+yc7X/hA7juuIjdGX021BBNO3sZTaCpPikgzsD0PL02jJ7A9jGkejdOJ?=
 =?us-ascii?Q?Coe6OxVPx/U0LXD0P1PfzJ4X1SYmSATvDQemj49zgtYtPgbqfmoQmEN+rSAH?=
 =?us-ascii?Q?5L08Edy9j6SzCD3nfsT0osklaH/HNWeONcPKBjgZw0J5M5aX/WCfKRUEfpC0?=
 =?us-ascii?Q?pKwtt215ImOq5x3XfsuiukEPMGYSw3hP5ZoJb/ca8jbxqMK44KARwW6mhECa?=
 =?us-ascii?Q?Wal6Bqiqs94GEOcFb6UpSYYupooBmNgQCqPYNrZcZODhXK5edwexNOuOPNPp?=
 =?us-ascii?Q?Y/XjKb/bId7k3tN20YwA3asWXcWIzsT5XKavuZP6POFDV5T+9tvF7gBsfuEw?=
 =?us-ascii?Q?kMVbTeb2jR11PTHxTY6Bbwuz2HVsfrg48mu2v1BpUQJOcgrqhDr1pG90j6oE?=
 =?us-ascii?Q?OViaRpAnHDshXVF03oKXGcIKHCUQZhmNYtQRmkHu7io6lYgXM8prOk56Mrp8?=
 =?us-ascii?Q?/wMrytoGnp8rq/Vj9CUhGylXKREbSEmoeOOMbPyv99CO29paYnmfboyTFoky?=
 =?us-ascii?Q?RtTE/jjgUyIhhWuLpitGIa0RxxkrS/xtThpi//K8WHfgjvi1rYI32hhz6xLD?=
 =?us-ascii?Q?o1I9kJk9vNxwjCbd3ycHAiD7C7vS/qX824KmeUcaCxyhjMpFgsCKn1324D6L?=
 =?us-ascii?Q?xa26jdWxUkUwS6hJ1lHYsYof7BdBvd7/PwdkLP2TS4VP0KOfe4/BFzRxAsnQ?=
 =?us-ascii?Q?8Q1duI5IsSHmisQZh7s+WNbcR3LfNisuVtRVK9UGd2vk9ebEz+f+QXR0OGOH?=
 =?us-ascii?Q?WuUUQ6JIsXeT8i8KPhvzf0JR1ABvKZ7UQLrt6ycgU+bBD4cimVmL/B2XTKsk?=
 =?us-ascii?Q?aATqGHFGLtsZmjc+E0lTW+PTynYx+aqoj3D9RGzIXi22UqWVoi4ouLQ1y+tL?=
 =?us-ascii?Q?0u5J+OpeWmZd4f9KObYN2RqsPuo2RNEkDVwLjZ4oObssCgZegzm0BXlkxoMF?=
 =?us-ascii?Q?IetZISqrFdsHI1Rwphm6tCoWxipJAysKu3GL2cQ25LKa7/26YYOCofHA8UOx?=
 =?us-ascii?Q?B7RzsHNi+YFhRqTE0mWYk9gEFkS0giC5s7YBPM+3uj3mhLGir3LVWEthLmYj?=
 =?us-ascii?Q?oJCsupYKlG2KLJsZwe7lDH6LzgY5nC3rLbVvfV7pwMcMl+PCD5WejTGQiclC?=
 =?us-ascii?Q?XwC6zSQPY8FyKuZqrw31fWLpGTShQqKltbx731mu+GHTxHHYfW7P3vCRbLQu?=
 =?us-ascii?Q?md387/WmnMUABkpgYizG9ktfEnDopU7d2R3VburU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3313699-3c9b-470b-6714-08db4a6e5100
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 18:03:07.0626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOGqNzpnX6uMN5jqWHADGQu8v4D1o3wPLBanlFr2QHDcgOSPJAt4BHfCxDgiTljZ
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

This is temporary until the S390 dma-iommu.c conversion is merged.

s390 is actually moving the dma_ops over to platform control.

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
2.40.0

