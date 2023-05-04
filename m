Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF926F6D9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 16:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjEDOTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 10:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjEDOTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 10:19:51 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBF926A4;
        Thu,  4 May 2023 07:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ4dtbjp9SZMpgM7AItz3O3Hn9E+h+8gWKE52u3ZgnR+p4Y6spOZCxw+MAUFZe8YGPtSHT3y8hXLV9EoK5afRuw1AI/IT+Eb9Wceo0JG5iE1ks4WZCt0LbLpgyMn1WjhCvzOLekW+E2X38UWhO1DZf7wKWgqfSWcRX81whdK1TXMbehYd7X/rq28oMpoQS8HemykX3QT1cB8Kfvt3jrFjAxNGMywVjhxq40UEQ8rdmwWyO4LwAN4Pbq3EwGLD3slnTrzNEghegcluXiq92m+wootFsXjrzI81+Gq88fJqClbVwtdExpoe2QWULI1yR2zLeidJtuzgEQdJ5IToDpBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yifWR4BcyPcWmjMxpdmwSSrlpxtmcQWiABeUkzQ/KhI=;
 b=BQM2kXG5r8ssR/85MihlChotOacxbgDQJ7RC1/12yXyDmHYKoOuSmAhzO28PA7qoGOpcw4D9v3R2s9JFIpbB/agshaIYk2mvyqf/1gj5qDXmhZ0TNP8UMXAPccW4sZyS32MAPIyvULgTKL6npAdp3OhDwbbqd6DgcDWXe5g8dAWWlUGz2suR/eZCLu7TmLSqylTpb1tLJyyCSlEcLmANHzjUWrNHKbq84anEp3+PDHvjiYiiqpUKEV1NlVjtC6AT/TwcD5nD7zNwahIt0A9gUycfBZokeD2TeoCA7NK611MzxpZ2PWaICUf45aDHU2rnPi3jnjfbe9gNNqRDlOuIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yifWR4BcyPcWmjMxpdmwSSrlpxtmcQWiABeUkzQ/KhI=;
 b=ZIOPQT+B+4R84mdQVTy5bJslD645UNba1GtD/Gdq4xSZj/9sj5m4NgWwuaCoDI6z9qHfFeCR0rjkIRzHvOWp/B69n5KV30aSp2du5R8X1kqkS/tuvQ0kajHXIsgq1T2he9I7PGN03ssPSZTXppbpv5B01FU/95KpIN5Y2j5ARJpVeFp5kN8eBkQIppR9WOrLhwguG0C7sq08CM3R2g6BAE2Lz9hmEXWp5zRYrdRmtHcdiCSxtadX631J2A4qPFxewWajFAMxdR3aNZm6qru/AuD5SXV90XpFbAx2p9sxTcYevQh62wI2m7lgRgh2S7qpBjx+/zYa7ZzmiqOrS+uQgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM8PR12MB5398.namprd12.prod.outlook.com (2603:10b6:8:3f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 14:19:46 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 14:19:46 +0000
Date:   Thu, 4 May 2023 11:19:45 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
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
Subject: Re: [PATCH 06/20] iommu/exynos: Implement an IDENTITY domain
Message-ID: <ZFO/AcHaWNZbL8p3@nvidia.com>
References: <6-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <aaddd64b-6935-f84a-5fda-28011c717051@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaddd64b-6935-f84a-5fda-28011c717051@arm.com>
X-ClientProxiedBy: BL1PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM8PR12MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: 507053a2-0fa9-4dcf-b020-08db4caa9cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDR4q83fQAUDrpAQzKoPZYMqht/wRefAQue/Y0qBTyQbbx4wupBgszkMR8nS2Yt9kA0lhSTRK5DOBgiTqIEfjUvYwE78etFrHkbCTk+o/57rVGrB1Vo4p88hWsI0zmkMLcDWs6aXCqw38SpfzNECEIwLLr/9CwZEVB73UIohVTOPTbSbAbbDsIXXy6Wfs4YhKRRtFC5AXHt8qY2w3OWsfx/HBxwxeJwzMAeCJtb7of603Sdu9BamwxZKLCX0cJNjriWqlkPcr2IG3Y7iCSu1vC1Y6YQ2ldkiTXk73Fczi4auOcSnyczrYs4E0Nb+kXXMpZq+kkHo9IX4OVH+Uh9wjQWnlkAU2Th8YKxlsbzICL4qrXfT/mSzoXqPxVR2MO6hlgQhYuIlMtuBQDHmlojsjM+8dzQsvd/6DkDBxE3KUMgElY4VEg7dG/awd3S8mxb2foBMf3rKF81VAoUIjJLzHzFm+MUCGAgOXHP8vNcjZUHLhae3pxDWpyEsUpsWLdq/psUWw9XSuS1c3dTxo8Naox5/UtwQZGk1J+h4ADKVxyC5aDKmjbUhMPSLlL7A7AB4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199021)(7406005)(7416002)(478600001)(38100700002)(8676002)(5660300002)(8936002)(2616005)(110136005)(26005)(86362001)(66476007)(66946007)(66556008)(4326008)(6486002)(6512007)(83380400001)(6506007)(316002)(2906002)(186003)(41300700001)(36756003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JzmpYKAD0/OyqxZwnRQisLShhWv94HhwCq7lRMC9rV/tm7vTN1IPBvkaKaA?=
 =?us-ascii?Q?QEfX850v3ckFUzpgORUzXJ5DKfXOZekZD0Lu18pSvaAlqXuYfjTLQQ6mBYbY?=
 =?us-ascii?Q?nfq4PgjEr2YvWsvlGrjibUxeZbHC/FFel5yreeCc85Sz3pbwJGx+3O5kt+J+?=
 =?us-ascii?Q?Xn46U48kFoCZFHvGgr5+X29ssjW+Y0pxHyWn3/EmQFnJmC83KoyNsPnlHISI?=
 =?us-ascii?Q?Tcs3A3BIdPR1W8jCZ9ccc0dF2pFvztDfCuL5OFNGTeEkrYmVx7JjxJS7epCb?=
 =?us-ascii?Q?B3w+yNcHhCSzoC7KAOV5Wfpza52WyyA1jpinUFqtM4uqOumibaQIIxTIJUls?=
 =?us-ascii?Q?fS3B4T5Pgxmqh2WpR3Bbi6M1jLZBY8OrnjvEVwz/3tqImIri7bhRkKX5e2E4?=
 =?us-ascii?Q?4mElF0q1/AaYYFY7ZgHa6xXWccG/Ie7GnmmhUu83BsnkYdSs75455xw4E7QA?=
 =?us-ascii?Q?tRSytNG0st1jd7WXGZc044khlX8+RgolR+5uzXl/vZ20k4avGlWpxOHeTFaB?=
 =?us-ascii?Q?wc4g2yoY4G/ypn00Py/MdFNkoa9Awc0gsyTHZQ89fbA2GZ2icmDMPteFoo53?=
 =?us-ascii?Q?wdi2Cg6ehR8phnCJirCQo2XcpqDyw4BdxAFuocwtyuH4bsbX1gITTnaCXG/8?=
 =?us-ascii?Q?ruFsZREVSmB9a73/926ku20C0wZwyr+s5aKR4nAM2dIoRWp1CEXYphGpXfJi?=
 =?us-ascii?Q?VP7XdeY6mj3qaWRxfGhkBt7NGRweutn3JpOHRnIXQ/IfWi1JSsI2Hn57/eLD?=
 =?us-ascii?Q?7Xes/QPcy/UNwc+Yaa1lQabPbWOJIOiZbO2WMq4W56rIxqcakmfQNpwkUNOY?=
 =?us-ascii?Q?iPXHQ1JLJ2SfuUPNfWRDs6DMP/OmNZecIbqu6h3mtOywIg3I7W22whpuIQP8?=
 =?us-ascii?Q?CFD7C4BMYQJa9W6f3g/qfAZrYBtny10b10TR+4AbyvC3m3gCUXNkyBIAk1K6?=
 =?us-ascii?Q?sqEg1pr+csG6he8nkLUd7k3ShaL7rAr9ljXeuR1Z1T/Pw3R8+wBZsDFCmB7J?=
 =?us-ascii?Q?QWiQ1Yw9iPdeULb7AgBX2wyvsvIFwdHiP9flod9u/ljJjYl2SNH9DxI1gex7?=
 =?us-ascii?Q?LiJVgklxZIr5orM2rJCXQ0syWZMwkrtxKhz1GWK5l24757/JEuKdXpHk8xMZ?=
 =?us-ascii?Q?Nx3E2MkbjNd34raCOjF53CNCo//bGCzAELa4q/MVPdoyAq9AeTL7LeeYlW8o?=
 =?us-ascii?Q?XsPlFjNcKoX1Ls//etGsvuQanLuOiF4M5hUtuogL6bCyF9n4SXYAbygiVp1h?=
 =?us-ascii?Q?aUYf0cJVkz9D4uTgtyAZvzUBRlpV+VdB/haTGMTTYAPDbopT4h6G5JLuJKbb?=
 =?us-ascii?Q?k2r+EEabvQncdktF5DzQXpWSd+adK+gcqtaxYNbpJJIUL7qN17pk/S95mTJX?=
 =?us-ascii?Q?h7ocB31NVx9XQzDLPsVSV0pEiJTR+JrjJ4wO7HdN6ILs3UhhlE/pQF48ycgk?=
 =?us-ascii?Q?ZKwuyARzIiTwAEcp1wiFE6tQQl1S876bbv4Id70fV3wep7V2bbeRQAvYR174?=
 =?us-ascii?Q?zX6MAwf9extHoZHZBE4mNciWKKJhSu4ckyXccX6Gh5vUnSEskGnjbz3GSV+s?=
 =?us-ascii?Q?2HbIkeCUXrLdpiMwD6NMK/9kiyOpPELECkDW5UFD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507053a2-0fa9-4dcf-b020-08db4caa9cd5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:19:46.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbSciKV/S1pS7T3CqqXv4U5DoutqAtRz5NmzkxJMqoN8q06aWH95hiNlXjYpE0NE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5398
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

On Wed, May 03, 2023 at 04:31:39PM +0100, Robin Murphy wrote:
> > -				    struct device *dev)
> > +static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
> > +					struct device *dev)
> >   {
> > -	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
> >   	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> > -	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
> > +	struct exynos_iommu_domain *domain;
> > +	phys_addr_t pagetable;
> >   	struct sysmmu_drvdata *data, *next;
> >   	unsigned long flags;
> > -	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
> > -		return;
> > +	if (!owner)
> > +		return -ENODEV;
> 
> That can't be true - devices can't be attached without having already
> dereferenced their group, which means they've been through probe_device
> successfully.

Yes, the current code is wrong to check has_sysmmu(), I removed it

> > +	if (owner->domain == identity_domain)
> > +		return 0;
> > +
> > +	domain = to_exynos_domain(owner->domain);
> > +	pagetable = virt_to_phys(domain->pgtable);
> 
> Identity domains by definition shouldn't have a pagetable? I don't think
> virt_to_phys(NULL) can be assumed to be valid or safe in general.

Read again, the first if excludes that owner->domain is identity so
it must be paging. Thus pgtable mst be valid.

More broadly the struct exynos_iommu_domain is now always a paging
domain.

> >   	mutex_lock(&owner->rpm_lock);
> > @@ -1009,15 +1015,25 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
> >   		list_del_init(&data->domain_node);
> >   		spin_unlock(&data->lock);
> >   	}
> 
> This iterates the whole domain->clients list, which may include other
> devices from other groups belonging to other IOMMU instances. I think that's
> technically an issue already given that we support cross-instance domain
> attach here, which the DRM drivers rely on. I can't quite work out off-hand
> if this is liable to make it any worse or not :/

Yeah, that looks wrong today - it should be a strict pairing with
exynos_iommu_attach_device() so it needs to check if each
client's sysmmu_drvdata is in the exynos_iommu_owner->controller list.
Marek?

At least this transformation shouldn't make it worse as we will still
call this code in all the same places as we always did. The identity
domain is also not threaded on this list.

> > -	owner->domain = NULL;
> > +	owner->domain = identity_domain;
> >   	spin_unlock_irqrestore(&domain->lock, flags);
> >   	mutex_unlock(&owner->rpm_lock);
> >   	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
> 
> This no longer makes much sense.

	dev_dbg(dev, "%s: Restored IOMMU to IDENTITY from pgtable %pa\n",
		__func__, &pagetable);

Better?

> > @@ -1457,6 +1458,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
> >   		INIT_LIST_HEAD(&owner->controllers);
> >   		mutex_init(&owner->rpm_lock);
> > +		owner->domain = &exynos_identity_domain;
> 
> I think strictly this would be more of a probe_device thing than an of_xlate
> thing, but it's not super-important.

The full code block is this:

		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
		if (!owner) {
			put_device(&sysmmu->dev);
			return -ENOMEM;
		}

		INIT_LIST_HEAD(&owner->controllers);
		mutex_init(&owner->rpm_lock);
		owner->domain = &exynos_identity_domain;
		dev_iommu_priv_set(dev, owner);

So we set the domain at the same time we allocate and initialize the
owner struct.

Why this is allocated in of_xlate is beyond me, but it is the right
place to put this initialization, we never want NULL to be stored
here.

Thanks,
Jason
