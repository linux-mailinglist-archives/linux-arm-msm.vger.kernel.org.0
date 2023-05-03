Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963736F59E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 16:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjECOYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 10:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjECOYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 10:24:07 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D7C6A5F;
        Wed,  3 May 2023 07:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzAoejine1ESGHeZYNo83pywAMO5aRUny6hX98HlvXuhzmFhEkh87yRsxIyNNU1E+W97hgykhMOY91582aIYLSoYj7OmQEyMf/fw8kxevsEpmkL16Pp78hyXKpNVgOc3r+KV7/FbFTIZqXWvJx7co1AQNG3UG7P0pinBkoZuwCAvlJurAzCUEhsBuBkgel+CfSn2qyfVRKQh8cT4obCZnk8D48NiIADrOE+ixI2uJ3InoBQC199Syo+AYFZdWiAN0uzAArfCQ/kpaLI5VYGrrmVmYAa4F2GNdCStbP8a3g2g4Z6mkZOXLAt3xEvYHCfvgLz4nOj1WRZ/IB9P8YpA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBhuArwNWHJA4PJUFZVrtxTzHNDXoV0iuNMyYUe7Cjg=;
 b=HN7x3WFaRiQIkvaxGhBkd8M7CmoM/AuEoB3CDZNpaemw5A3dXnEFVhpi4t2gOWrbZMC0xOo7ZTWF9scIAvJxvwa/+UjDdnemQjAijNGi9Qa1ySpsvVujRKk2863j+SHqyxT2kzuSLIJsh0UxDtYB91VbYx1NUt7lwb7w55h2TGNZtFJO098nCumZNI+8AhxYNTkF8nypEWMWTFS6E/kgjZshWpjsDMzx5FwiNqRPiA0Sz9p07cgT497UD4KjsMAJhiBYp4Zs7SMn0dY7MW35jn9903SV1L/Cdmb32y3AhPhEwPXZ3XRIaOj20YhVvusYV2e6udnPlhQc6+sgayQjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBhuArwNWHJA4PJUFZVrtxTzHNDXoV0iuNMyYUe7Cjg=;
 b=YBmi692lVBX/hhgInp8uA57LiOALm6HCr8GDvHDVs+Fn2c2+7FdIHnKAf3uz3kmL8m/64EwUrQHdg8UOAvyjHaYlFt9W1ZPX8aKqm6+mqDVPPASe23d+t/wqjxzCCURVwnFUOBvAd4r5WaKnAcGDELtYP6K8E9IDQadZMJsoVY2GyspHURp9isHUA5gsFti2Sg0KoGxxjqrcY6rC4Q8ItXUp5l5Udc8ZMMYYbgsjz9Qq9FO5jrGm3298z9PZrfohwpepJGbUdMsdBuA4cFAvhs8qc7Ffbt9PU9bxSeRsI6ifYzEhVVeVPBzURhSFGKoX/QWdX04oSTHGrw8YoJMSkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 14:23:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 14:23:17 +0000
Date:   Wed, 3 May 2023 11:23:13 -0300
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
Subject: Re: [PATCH 05/20] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <ZFJuUZXnijZgGxtD@nvidia.com>
References: <5-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <54c28f6d-23e3-f1de-3e0d-fb0fae3040cd@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54c28f6d-23e3-f1de-3e0d-fb0fae3040cd@arm.com>
X-ClientProxiedBy: YQBP288CA0006.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c0d81c-1438-4d8b-3661-08db4be1efe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +d7WxLAjp6Jh9KSwTLAEBtSrb+sUKchV746dlvKXaE0G/DDf4q/i1y0ZBemPh6w62srB2QfGvbUvBUUF5EJHR2DGIVRRgE+uuSHasRfApLmcgU1HuNJvPRY6SbIBuYf7KThUk8s9CIdU9pJbATZQ7Iwnq2L5s/E+Hgv1AwJjQiCxXIAyHqmnZpXlXL/w1OrmCj483Jq+okjOOR9Z/1PFA3ZDkrKP9GNOkAqM+xhUKAZXuT3Ts5vQLKa3Jxibt9v9Fz1OYfg8ZwfhKFwzLIzgCGq5wsxIRjLUxhTcuQ183GKqhbK2RzsNVDGIjcFp2w8uBQhh/dD0zokdNhR45aK4APIKrxCV65tJjNsI3ldwOLp9LAMnht5ObGDnDcD58iI//Q+uhSRge5eTzcDiZ+P+riEZ1pYKN6yeJXH24Dlzbq7ssmiEuL67dS/KF5NohXEt+/JhCap2UQS9sMWdEGwVVW1+cxI88c3dz2bDtjZ+vQRHlc01qdM8EosjwJR6S3xuuuseEt9DUM3Adtq7a8P3Mgfcl2UAJ/+L6Err6mjg4RhO2zcZJILEGf17bMpvZ1gF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(2906002)(54906003)(2616005)(478600001)(6512007)(186003)(6506007)(26005)(7416002)(7406005)(66476007)(66556008)(66946007)(38100700002)(5660300002)(8936002)(8676002)(41300700001)(36756003)(6666004)(86362001)(6486002)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKZmF5FTrgWquo/kMdSNDhT1UjVKL5tNPj3n6TGzVwi3ZrK0uMKgr5CHJQHG?=
 =?us-ascii?Q?pL9yO68uS/3XJ/iIoNG0PkWEAD/PzlnVhn8krqt6Kp8tQ83+qPYOZVV6URnK?=
 =?us-ascii?Q?nLc8fNsvYMnbqigDQ41RXLZPLgndu0DtWcA7bPRTbbZSEXKNIWdVKMwSbXIl?=
 =?us-ascii?Q?FQvCSoCWxw8kVH2uwk8x8dNtamEZnTD+2hJ2w72JyD6iW6VzU3ARWuV8vh4Z?=
 =?us-ascii?Q?oo5FoB2mHVeyWZpMSoQWgtxHok0+gASQ93fIMipUX0nlAygGyJ+FO3faO/sR?=
 =?us-ascii?Q?jm/jf6rR/gRuYAd47hfhnstOJAIf06l2gqOYwROX/Is2e13hRTNLDJK6tLxs?=
 =?us-ascii?Q?RgaDKqx3braEys0JC3Pf3Wegkg9qxWgSO50yGErzHF+35Gh7HdNsJLTclzZn?=
 =?us-ascii?Q?6mLBaP7c5hvk8skw9ebP4LjE7cAFqb6WowhXdv8eJ2+TNQKqb48zTgaRo0aB?=
 =?us-ascii?Q?RfeuQkg4klIST5opzecfu7sML8IVcTLef+xaFZbhq6/ULMbOWzt38kaXAsM5?=
 =?us-ascii?Q?VpjcLezwgnsFLqcazzZvvxJF1qftaqLKJINipWNeCTVVhzTpm8ldrQEyEEej?=
 =?us-ascii?Q?Egv9YED2epEXOJ/f2QHcykSppFJqkO3GFRR2/Iqv/Iu6vWfMRpdVzOr3zCeZ?=
 =?us-ascii?Q?QK4DlKam4rTzbZltNdMYSqAHYq9n2RzrJZYmzQkCNqxIJC2uB5GwjcR/i+os?=
 =?us-ascii?Q?dBm8YziLW5VM6Vfzevzla+sK2usjjMdRU3RFj9ko7rVyJpbYfoP76l3sPNMz?=
 =?us-ascii?Q?Qjew98KfvDLX7X9NainBrYaMsA6NaIbT2i0dSHGDyakQw+Y0RWj+qtQ55JlJ?=
 =?us-ascii?Q?1KXKaelZ+EI0JP8TtbKlJgvT9MaULmNB7/0QsHoAzFnL4KpMix47uep5c+MR?=
 =?us-ascii?Q?dotGfL+0S7MF7gPfr39j5vXw1+1veXPxlkyul2neIOFu0MQHqBFT78hYjyGA?=
 =?us-ascii?Q?wnM9oBLkQY5rdocb9iR9kW+6FmkubmC/JWvyHXDUL0R9UmQlwGLwN6VFIPqn?=
 =?us-ascii?Q?EO3t9EbUcascclDGKLkKMIkGlnAONnXDT/xdhUlAciCVbAz+zDS+pwzjoBpO?=
 =?us-ascii?Q?WJ3iE5xgKijYmhclys7apg6EBvY/5LRqP4yEXbciZ6YANjxQ0krIeF2Hn7wG?=
 =?us-ascii?Q?UBc+zsZSNmpANcF3CveKY1lPFGxlTNwiUL//PeWy4jRpyvO7r68UCMye5EGR?=
 =?us-ascii?Q?fjKr3UWPTO8e2V+/0PSjvZXKYhlNm7waBdCTcg/1bH70K44ofrxjEB02GD/t?=
 =?us-ascii?Q?C3HHvpfVudsM7ANdhXb/ZXLfi2H0JZsYGETDoh1g4dPyYoZqNizqb/NMA7dv?=
 =?us-ascii?Q?EXfWwYjQ2uTZmfuMEivFrByiI67M3iUK4gGTDp7UDPxCatDqjTIkK/m2nd0A?=
 =?us-ascii?Q?y+Oj1Sb8X5Ah8Q6n90TH/JOmPTNzflIb6qx1qH92LX+NZRDeePO1Pm/WEG5a?=
 =?us-ascii?Q?OHqcmX6orMjDnmoi5QYsgiKHg2wcG5TDKamfxQ69FSg9fWR8oyHO1tI67eiu?=
 =?us-ascii?Q?pqdifY1dlQ0zT5y58L3fngKWC9ZolkVH8xQdswYkR2RFOCxCE2BzxNOa2SzL?=
 =?us-ascii?Q?qdreehO/oNgrKokA56Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c0d81c-1438-4d8b-3661-08db4be1efe4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 14:23:16.9966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IEBcSVMxAph5aacpS4sOW4eCoKlkH3fPMd56tJZIN6aBKTNTSTveSm+nZpo9qEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492
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

On Wed, May 03, 2023 at 02:50:02PM +0100, Robin Murphy wrote:

> > If the driver does not want to support dma_api with translation then it
> > always sets default_domain to the identity domain and even if IOMMU_DMA is
> > turned on it will not allow it to be used.
> 
> Could we not retain the use of .def_domain_type for this? I think if we can
> avoid the IOMMU_DOMAIN_PLATFORM thing altogether than that's the more
> appealing option.

We can, but given default_domain is already there this is the simpler
implementation.

If we can avoid platform then I would switch this too..

> > +	/*
> > +	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> > +	 * identity_domain and it becomes their default domain. Later on
> > +	 * ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> 
> For the sake of reasoning, I think just use CONFIG_ARM for this. Otherwise
> we may still end up with potential corner cases of default_domain == NULL
> that we'd rather not have to accommodate.

The last patches prevent that directly.

I picked this option because I want to eventually get to the point of
having the special ARM_IOMMU code consolidated and marked using this
ifdef so we can clearly find it all.

> > +	    bus->iommu_ops->identity_domain)
> > +		return __iommu_group_alloc_default_domain(
> > +			bus, group, IOMMU_DOMAIN_IDENTITY);
> 
> Why not simply return the identity_domain that we now know exists?

Yeah at this patch it is true, but the later patches it has to call
the function. I organized it like this to avoid some churn

> It would seem even more logical, however, to put this ARM workaround in
> iommu_get_default_domain_type() and keep the actual allocation path
> clean.

I thought about that too.. It felt it might end up more convoluted but
I can try to darft it and see.

It is still logical here because this is the "use the DMA API policy
default" code path, and the default for ARM32 right now is this.

> Do we strictly need to check for identity_domain up front? 

You mean when registering the driver? It does make sense

> (Note that as it
> stands this narrowly misses out on un-breaking arm-smmu for 32-bit)

Can you elaborate? I don't know about this..

Thanks,
Jason
