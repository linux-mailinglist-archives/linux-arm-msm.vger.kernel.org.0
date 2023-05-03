Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4FA6F5C3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 18:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjECQt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 12:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjECQta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 12:49:30 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47D265BD;
        Wed,  3 May 2023 09:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip+h/TdUG6D3Ivqp4EbLH92ORPDAszOuL4DM6xyJXWTqwORfVpfKdhTRgi0eAlK8p/JrBoQKUsWje21RywgC8mnT0oBYmz2VA9QmsKvNCd7KuQVN1EhI31/fZ78Ute1JeUg03jwhnYZc6Fh4smaAaV+W40TkBXqDCa40QyPd0sgrHIrc02szqQY58p2vn29Un7RAhMOuYEtyHLJxWZ4lNSKc8qxz4msKZG7dr1XVM3AxhocVvo8CZdFvkLYmyBf5JvQC30YslncBjkWFypx/mitXGN8qcbkSCjoyUWZFD46o08PONote8tU9dJpa2bKz0IwrzOlFzjlYxSlO+JpeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06YZqPwZh9w/sxPTWqiyu4T81+pqU91SX+dNxgVEE+Q=;
 b=MpDCRFfr1wwguKbeK/0vSvsfGXtJ5YDJDta3ufq+UCExldbu3Iue53h3FCNiEF1K9zGKVxgqLgHP17iYuDjSz6ziybS/kOJ0FNUdWT1yWpujOLk3bF23ayczITlLehihVqZ+WT7s9Dx+sr6GgR36J+fYt7GKFywkUtGHzhPesiilRmnC4ipc4tzTO6pd1oBUoJAxq1k5DctiHeJgtVBBmUmHuILqYpyGX3gNRw/wx61LAB4JdUqR33xLPB17Cu0a4URKkg7mTaryEo8sv6xv77MrCkAZzqJsaHrCLcVcG3hfaYPmIDWTWCBSB3gmCDYhvabcVClK9Hq11pZwMR08+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06YZqPwZh9w/sxPTWqiyu4T81+pqU91SX+dNxgVEE+Q=;
 b=mkQaRNYMXTlOkuLQcUZB5+DnbKfyZSq+CYF9TbZM9HHEJWHihJ4iQNuMvd9fPU4a/KgmRRWksTgwkfXy1hbIt9/OUPk7B6Ha0J4RVe4L1QybPGoHy+F9bVFtAAdhnNSmKxISCnAt1ul3ndIQ94scIkgcIuyvcnTyOtzzRJVqPALIeQm0bw2TGKFPBqHYQAzryTPkccWpiAgAB7zh0u9CFyXR9fbSNKnhdMp8fOVJGueyhms07T1VmN8R/3W/351m3SHOANw5QeWzqEISKctVQaQ1NwKZj0HRtb71/aK8QiaC9Lbj43AT0gbHdHeEV9lDcfbRHkTyQEV4dW1aHfFJog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5283.namprd12.prod.outlook.com (2603:10b6:610:d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 16:49:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 16:49:24 +0000
Date:   Wed, 3 May 2023 13:49:17 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Andy Gross <agross@kernel.org>,
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
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 16/20] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ZFKQjcvUv96qQAVQ@nvidia.com>
References: <16-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <e73c6192-8fd5-042d-ce03-095b336270ee@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e73c6192-8fd5-042d-ce03-095b336270ee@arm.com>
X-ClientProxiedBy: BLAPR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:208:32e::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: c14fd38d-07cf-4cc8-e78a-08db4bf659af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQKiRvz3fkdNwCDJYD0SB8eonEMqfUUdfRQ5hQnLBk2NPFPvZFuUAZ5mviNA13CqNgGw2yARRbuf5723PNfZ0Hy4o4XceTDjgDVCCOJ39yKgjfDFRXOq1a+zRiFCtlIxW6tPVJrYXwoBHo++MuFnaUajDtB/22C8f9jF94TyvOdTO8y3aA/od5mBmq+8OwV06frz8n0+UnQbERCP/wMgpK2DBT1QhKfUEqXrVqyKSsHhG909ddWD41rANB/XtXJ7599WYZ8kNgGFrkjj/XQpzCOT8FbGgwIcNsi6aREx8pSu5cZNzXoM3v2UhFtnOZG3ieHg/xEmy/P61YhuMfiAKS+uzghqlHiLFvjS059kBADmRTOaMnj2S/nL0lh3L4x9gPPYBoXoJ5+MShmcMxtUFl619Lx2oPG+rA4kNq0X8s/+xvgkQ64fMZNCnGZ2oBD9/MEMBZiu1AtdnLxjjFF9+PM+W+4L/H2vstinPAfkpZvGV3K32QhzaSkzeLMBqmaK+zfZbaj5sxKMlzQJQRcAYP2FrBUnep9vaHecdGb2CfpPmFknPRsCHH/Yzpa7hOUh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(2906002)(38100700002)(83380400001)(2616005)(26005)(6506007)(6512007)(53546011)(186003)(36756003)(8676002)(8936002)(5660300002)(7406005)(7416002)(6666004)(478600001)(316002)(4326008)(6916009)(54906003)(6486002)(86362001)(41300700001)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OM4FfATwOgCSFRTU2R7crcbgcKtZPp/gnq/vPH3OpAg6M3iaY6bbbxkTZRAC?=
 =?us-ascii?Q?yA9ZO1ra1r0w4LbDnvbNnHyirrT3k6+4vZmTjpnyxCoz+kcqJlXOa4KDIACj?=
 =?us-ascii?Q?wL6Md8QTivpcIBH/iMSby6hdwW2vj/RV7lnVCIZOr+l76KBh5/KiyWW7fAz6?=
 =?us-ascii?Q?8ifBHZITBqalWpHQrHxaDguKbur6iXB5l3OxlSlpUi7ZWsdKNJfkUkXaB0B9?=
 =?us-ascii?Q?Rfs6hErkkPVyHg0UHoENo2f5ZT5v3ieIjCCKPkLGASl1fKC1XA5JAhvU2oRm?=
 =?us-ascii?Q?gxYVLaKtR9/hEeEpWFEkvp+RLQrcDwX1Rg4/SXhvOkV7kpAs+yp5u8v1yEhO?=
 =?us-ascii?Q?c6mDBFxunKQlweomAQudLW0WqjYPGzed+sCSumoxRVcCfsXbttEoUli1HsKG?=
 =?us-ascii?Q?EHWfX/6swq3XEk2h7fvbBA3ftb6oMbCt3ib9CzVeTd2/ZfNk1GZt/YwK8flg?=
 =?us-ascii?Q?ih1kFkyb/Eos9giagfe2Bjhon6OQHyMC3ByyTUFiRbFFjk0paSAsC8kqFmYJ?=
 =?us-ascii?Q?ZIx6jp3yBF4wOJlZyJc6nFYuXB6XwfeONBThZVe4Kxguj1dQawOUUjri0Kuu?=
 =?us-ascii?Q?kvKl49AwJomSvNyX6HfpuyfPoGhGapm1uAQT3d9o/sin5h490qSbLbA61OSy?=
 =?us-ascii?Q?tNk93xwt+ZY69Lb/oXOEosiFJY5zKr8SlY8txMi1RYry2snXT28yKdi27qvj?=
 =?us-ascii?Q?4hr3eIgkETzvvrZNYSN4ubl0jG6YjBXhOHgUKxqSYMDzHVw40BE3OvOANaeJ?=
 =?us-ascii?Q?nQKgAieGXdm4r3U+wajLSnxfYID/CR475ZfN6Rx6Sg7f2FOTEOKxWqkZrhNe?=
 =?us-ascii?Q?rSicZbJh6LW3hIwIfyR5X39zlneqDD2yUbj6GdAv0ysuVDFIjPGQaVka0B8W?=
 =?us-ascii?Q?bVNVZFBdwWw3FvmEay8MF6Ob+BY5yBqhyzoBFKSwESuZ0NkwjRKzC0jFalbj?=
 =?us-ascii?Q?zNsqo6Av+v4oPWX/xOx1NxotXkGfx/GQvSBJbB0DsOKE4/PEGyVF3EYjV9dz?=
 =?us-ascii?Q?rd9Ff04Nr8UX0QJjFlRSOimFCb34K6HUUQ4DgqrF/ihVwzHc8g6h8dosaqTb?=
 =?us-ascii?Q?t5UBBS8kJpiJTYABjBAZ8BN3OFS0qCY5pOnwc5Re578WO/Vu9UqLyNfiRjzo?=
 =?us-ascii?Q?YoOUleYErTz73X5mNrmFbZH9HXUXKnMgglkn2QFlbC3rpioDgVmGqODd1aC+?=
 =?us-ascii?Q?niEXtg25eRbyUqo08/FFi8fzlBc9GNInscedZVSH39jCRJCf7x+6lVq3NSbB?=
 =?us-ascii?Q?kcgtJ9t1uCNIqHuslBjAZ+2sesGCHE0PnR8Narcpjp8Z4/XP1/nkk3U+Jl21?=
 =?us-ascii?Q?Wy7Mx/lwZy58ZZyGppc3qILtEhrH42tfbowiw0L0iaHgI03kppOGIkYcY7Ut?=
 =?us-ascii?Q?HWT/7lMUdqwFIfQ5o5rALxnXoGwCZDcQhN3kp/x6wc8NMbdMDn+wObki7pEf?=
 =?us-ascii?Q?dsr6ZRxPAjHcxwTpJvTn9qX8LIQU2fUoAq1zmHLjAdneZvKEfoU8+sAg27QK?=
 =?us-ascii?Q?kgcsGLbx5gdzqXUIAVLJRXYND4Q+BK2n55iwPUNM6ZClJbvfKrqbl3sxlhAg?=
 =?us-ascii?Q?pGF87j0qhOqXYfx+yjrZBHFR16dMo2+8lUnneGGF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14fd38d-07cf-4cc8-e78a-08db4bf659af
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 16:49:24.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5Awei0QxYT9i6oBCAz6o8dyrBDUCZPBlPFyI5TH4zjqGZwIX9HrGqI8pC0qc6qD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5283
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 03, 2023 at 04:54:28PM +0100, Robin Murphy wrote:
> 
> On 2023-05-01 19:03, Jason Gunthorpe wrote:
> > This brings back the ops->detach_dev() code that commit
> > 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> > into an IDENTITY domain.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   drivers/iommu/sun50i-iommu.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> > index 74c5cb93e90027..15fd62d360778f 100644
> > --- a/drivers/iommu/sun50i-iommu.c
> > +++ b/drivers/iommu/sun50i-iommu.c
> > @@ -772,6 +772,26 @@ static void sun50i_iommu_detach_device(struct iommu_domain *domain,
> >   		sun50i_iommu_detach_domain(iommu, sun50i_domain);
> >   }
> > +static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
> > +					struct device *dev)
> > +{
> > +	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
> > +
> > +	if (iommu->domain == identity_domain || !iommu->domain)
> 
> I don't think that first condition could ever be true.

Oh yes, this needs more work.. I folded sun50i_iommu_detach_device()
into sun50i_iommu_identity_attach() and made iommu->domain be set to
identity immediately after allocation. Now it can't be NULL

Thanks
Jason
