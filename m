Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E105B77BD3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 17:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjHNPjo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 11:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjHNPj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 11:39:26 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9651E1715;
        Mon, 14 Aug 2023 08:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6B0jcdoJ5v4OAVRuin8iCIEYsSiqM+j5qnu/gNAHQp4rW6WoKD2Oak/Ihhk8U8JD3LI0AULinSJOI7AFoKALiiGAIw3pOQGzxyFga1L/0wV2odvDJBSOes/xqbPFo/hZcMWxFbadQvg6umnZedk7QpzqDk63CuEW3N/sEKAvfFS5mwwS9jkUUJGXeKFlnU8AXG8w8kqUqq99bVzyFU1jIAHGZwAqPm0IATaVv8lg6hPDOihR5ELWGPbn1s90xrgg+qxjbdsDZcIyI/0xvD2oDPCqP1q0zp1RITkTexqj5YaIRd0ao/ltgBFDJZeFM9v8Tuz9G8ne7soTwQx5UvYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yW3iSA+oxcR8qgUAKw+KUPl1DkDu0OEhNsKPGZgHqE=;
 b=gDC1XONoIDSu/6QpK+akAWhmLnFhha9cwkNgjkxUAZRq0w/8RyjJo4oQp9AmU2TgS1+cCl2X2NG5NfuYGTX9/PNd2oEOYM4qu+sailmKgzfgrat/HWThhD3WdvCcr1TXI4duo1EyrQGHGujjPngpnSLUwyCLT3s63LZikMZVD+/TfLNHujnkvxTCC9reyFXk4HQ8fdjnkzgYtc3AYfmvMdT098bCrYiT5lQ/Mw2ojWs9a41VSN/M6oekWs/U45hJSI5A8y50gP2usLGFkLtnVxlb+C0yxiPVjeog/w+9y6nyk7haTGnloqjDL0czkQXu3bj1DrSypv8K7Bp7A0os9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yW3iSA+oxcR8qgUAKw+KUPl1DkDu0OEhNsKPGZgHqE=;
 b=hlb82ZQY5dvPoU+r7pivRXHb4KfuKt82kfVwJAjgVgCxZh5JzJEr5zumTqmVzxi7FxI/UgbauhmW4pBBG90YGegTdEAI2Ivlw5Yzxy1UjAHt2UQii2L9qnyyQ87wtPUUOSvlWAtnoI2AjHEMukavx94HHCxjFiF9K2BCtyfAOHapuz29RZ7kRHcU8D46Hqyad+c5G81dRo3E/MjDSZ5cy3b0NafFOLfACbFNErunviO5GnG3ge5z3lS6VWOBbK9UJHMHGPweJtARt8c3K0KM/GZf2bJPHH6buqT+94/qDgpbTxap+3v20Q7vrhbwxm+lHnCHovQFWHXi2+sOnizlWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:39:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:39:20 +0000
Date:   Mon, 14 Aug 2023 12:39:18 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Baolu Lu <baolu.lu@linux.intel.com>
Cc:     Andy Gross <agross@kernel.org>,
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
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ZNpKpmeXo1h6tbUN@nvidia.com>
References: <20-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <be5ce6ed-f078-a466-1d03-867e3cc4d6ee@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5ce6ed-f078-a466-1d03-867e3cc4d6ee@linux.intel.com>
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ada6dd9-8a95-4929-fe5f-08db9cdca08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLJt0l1rxwFw+5SSTPoR6ZkYRIaH9gpyXXLtMW2tLlaqzsVqvXfaQTAKntNyqhf3FtE8CqHD/YUknHbTrF4Zh0KSfUi8S40+JisVBpuHydP/Avvwimtw1knJ3zgH93UlK5KosDLBXKsfcyue+JSs7nbLQaHZqFjHdM/G9OB62Lwju6IHMWIXWd9hO6w5wjcaybfQQFgsn3nsVlJuPUHdo2gQdDRphyBjBrADbaol6MZ4ZRLuYvgi8W9GCvCQvtvfmZCGsPooOQkAIfj2gl1V8bwgAkCRrrRizKrZi4BQb8o1H0eQ7/bKq4lnzSPSAPdn6WM36tSi3BakcrKMoev6/J9g19eMM7r/Q7NXH4LNBtZ+G1+pioLW8Irg6ArZgdP5ATzyzCvr+uFa1Te/XgvxjHJHU8CvqiMmXYtwlzY581bo34+C8S1bQxH4z+WAo4BQ1aHKv+EeZVPd6TR98VIrxgBqcJEZSlKct0+YNwOLYpg+TU6Q7wqDtzq845YNnJyMFdnqBrcSJGAu2/GJQVzx9L2hUW16dWASIZOqNQsk9HnWhOkPio7BngHd9dDkhUGxdQY5SQ4N9MWvjVY4FC86r9TcuuDw3HAaevs/YUjnW1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(186006)(1800799006)(6486002)(6506007)(478600001)(83380400001)(36756003)(86362001)(2906002)(7406005)(7416002)(6512007)(26005)(107886003)(66946007)(2616005)(53546011)(38100700002)(316002)(4326008)(8676002)(66476007)(6916009)(66556008)(54906003)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jCZKZPH4j6Dg0/Er0+x8R/YNLE1cFFLOqTstMQYjEVIvxH1+mFWcrvXlHSBo?=
 =?us-ascii?Q?TljVWzueJrjpAu7Q+pfbdAcLNmzQ9my3FZ+CRQqDZiXUhdc29tfTjjybMJm0?=
 =?us-ascii?Q?j5s6i7BJcmEChrooJB20bkM433p6yifct5VhBgszy+Mh+qGF7XjHSgg8cHhr?=
 =?us-ascii?Q?BaqZo0/3yRwsCIl2Zek8ega8/qDORjMAk+GxyQjpRhRPRd3AOLiiRslfLOEE?=
 =?us-ascii?Q?iEh+ukq1B0dE34HcNdArq+e8C/wDXIBkso4c6Y7n8A5pets6vUUG2Y5kq8LT?=
 =?us-ascii?Q?FEYcH+VDXMN/F7GCC4tgbYdhhCpttzHocO8AtlWYnKQBq36CEb0mYyrC8Fer?=
 =?us-ascii?Q?3Dmbyg04QQdiKvl87aowSqiCTv2qLmjyRrB5bgKq/+q4Z4y57waTkTKL62yC?=
 =?us-ascii?Q?MybxbVtF4ccG38uXHldUl7j3FFQlO9JGYhKtAXvK5EmxEV/0WzVRx7eU2hUb?=
 =?us-ascii?Q?W4InshKPMg+VuaXZKpM7/dw54UfQ8w1pEGysTIsgINiGKC9A7IhP9CaakvKG?=
 =?us-ascii?Q?SBQ0uPWISDMvq2UBAfw3i0GXaDdaRqqjaDoexmhhgqI+slubM6pW4KE6vbR+?=
 =?us-ascii?Q?ubGsRRinPkOpevEbh4dWzEX1eioQFJzUAMTPQUOXx8TJ8zS6cyg2nukzv9H6?=
 =?us-ascii?Q?SNifiTAmKsYvPin6t37wk/IiPf/tl79KvdhyAQseCORl4P2hqotDYU/9uGrY?=
 =?us-ascii?Q?NdY9NLyFp03x9TQsrjHGr3C4yWoHBK4ArkoOlyuCVni8CQNiIOr6trvv7VbT?=
 =?us-ascii?Q?95Uat5GTQ29FOjh66bRTOzPBnjnchqY/3sfqTuXgIJqEVhJGObV4uBL53dJA?=
 =?us-ascii?Q?yq8zMYQfLUA4AUVkJx1ppUf5LAt2OSJMU4YjbOm2QP/cTEHvQrBpQSVv9Kg8?=
 =?us-ascii?Q?ysXY92zXk0IBJHdhEF1qeFE971g825R9cB2gmuKoaLxr1LeCDS9fmIqR/q/v?=
 =?us-ascii?Q?CmNNcIXGQi95S8MGfbkXXUpWN1I+DwTInnqdjRZae+fhIJ8w4GJRGUROHkHW?=
 =?us-ascii?Q?ZsoTO+wgTO/fSmcSxhtllAj4T8vk+WUzWe4Arns9QNuGDnsY/MqKLP9AG1tP?=
 =?us-ascii?Q?5A4UuT3wux1SSSesGNLp/SmHyYIUo7C+qOwGf3tk7ZuLh6tmbmwo04kqk+VI?=
 =?us-ascii?Q?PIdiBDKSeLYjsRMTlZx6dflzNELxHc+SiJvP66LZGTtPoUcRC4kGTvNcswEO?=
 =?us-ascii?Q?IX5oA6W23WB+CxWzeFTKarNWLMUtUr51SRlBveTT+t1sqQyyduMy5KnOS+l1?=
 =?us-ascii?Q?9GrIvgdmjvfURMF7VPqjVlj/Q0ve0e5h7gV1rmob58YhQ0702dVKLGKYMiQl?=
 =?us-ascii?Q?qNKTbaSlsngJkyXdhL8d+m15mvADNYfpgiRera76hTAU73k1y4ITkKa2XgMf?=
 =?us-ascii?Q?bW59SryoeroDyWvpy671tpLqTat+t1siDv7eRj/cutsHK6INJCzfYxbhtaxT?=
 =?us-ascii?Q?ktn0r0URKaYe85L762Nbj7DjKKojnx3C8bKPgrNaEq7ZZ+Ylc1UulaBZG3Ny?=
 =?us-ascii?Q?Dx6/T6Z9mS717KUR6dbeqOHTRLJk1sM9PkvWq3VGmXgLrzEIEY7ihAuV3OF5?=
 =?us-ascii?Q?HZ/aPkvX97cHGN8lxqb/6+Xaq2k70tJH3IQVMj6s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ada6dd9-8a95-4929-fe5f-08db9cdca08a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:39:20.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+CxEonjO2C1FH0P+T3D7BfUO4Ov6hao16qsjNA1hPtYVsPFIhpF2eS5Yc6Ad4su
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 14, 2023 at 02:44:50PM +0800, Baolu Lu wrote:
> On 2023/8/3 8:08, Jason Gunthorpe wrote:
> > Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
> > sun50i_iommu_detach_device() function was being called by
> > ops->detach_dev().
> > 
> > This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
> > sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
> > back up the same was as the old ops->detach_dev().
> > 
> > Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> > ---
> >   drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
> >   1 file changed, 19 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> > index 74c5cb93e90027..0bf08b120cf105 100644
> > --- a/drivers/iommu/sun50i-iommu.c
> > +++ b/drivers/iommu/sun50i-iommu.c
> > @@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
> >   	iommu->domain = NULL;
> >   }
> > -static void sun50i_iommu_detach_device(struct iommu_domain *domain,
> > -				       struct device *dev)
> > +static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
> > +					struct device *dev)
> >   {
> > -	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
> >   	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
> > +	struct sun50i_iommu_domain *sun50i_domain;
> >   	dev_dbg(dev, "Detaching from IOMMU domain\n");
> > -	if (iommu->domain != domain)
> > -		return;
> > +	if (iommu->domain == identity_domain)
> > +		return 0;
> > +	sun50i_domain = to_sun50i_domain(iommu->domain);
> >   	if (refcount_dec_and_test(&sun50i_domain->refcnt))
> >   		sun50i_iommu_detach_domain(iommu, sun50i_domain);
> > +	return 0;
> >   }
> 
> Does iommu->domain need to be set to identity_domain before returning?

sun50i_iommu_detach_domain() does it.

This driver is confused because it uses generic_single_device_group
but also has this weird refcounting stuff. It should just make the
first attach alter the HW and have the remaining ones (eg new domain
== current domani) be NOPs. It should not refcount.

Jason
