Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D2077BF04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 19:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjHNRbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 13:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbjHNRag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 13:30:36 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB0B133;
        Mon, 14 Aug 2023 10:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaCFlgOyZ4m7k3XyWZYvpEd5ZyDFzyJPhguZn9dyqfwt8ltR6hvUSdZB8vD9DjRE3zxz5yFXVXSljLzQJVUE2vP19y9+UZPOyjA3DcGqnqMtm0/AhYCR9P4DXvzFMj+D7AMQU8NqCwDxiK5AOlPFYlAp8v/Q8rUcgDxcRxUHZxd3EC5Fw0vDr7qOGpmsiaHv+cNAZzWjQQVuSmySkIaWsKWnn2wGeXVtT4+vDnCV2oiAv+jva2XdDtbXMZ2E2deG7HgWK/HUahw+Q61QBkzs5HUTzMUUox66VVwidJdMYLrAUm3+NuN+ZiWgJGV3irKTNVekVEnm/oSqB121Mw1Rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3pNRKemzhOIPa6pNoK/rQxGwjMeSRkydMK98LvtGJo=;
 b=AKf78I9lfOILhnTgevME5/UGxYsas+Iif7P5eRTRzjVellceHuJDzlZVNsV8hJ1KHcFWj7cE4qSyy5eCvN3oPddaLzGACb2TUIRIjSRZpdtu3ObhwuP1DxDtWjGUfAJmwNewY5vbQSp1u8VyV0nOgA/sTYGdMz5/S2q6HPbBVvvIIwUXojwJOQuo9vwOnJr9kKgKQgPXk5GMnBtkN6MnXGhCRu24XOMggED55g9+zgzeftaEC0zjF1wCoC6R4cky82Wm+xSQJb32mm4lmfAzPLgkNU7tuo5xIN+bOGB1BzP0XLY5+f1Cdgpx12hBeYw/JDrtyfi7lxn8JxswNPNRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3pNRKemzhOIPa6pNoK/rQxGwjMeSRkydMK98LvtGJo=;
 b=EJls9eu6SkgPctyU2XzjCBouTKJY6eRishdaYs2bn4W4yhFUyXzrk4ySJzH66LRCH61l+ut6+5+ncHhWIoDO/4gDLE7VfZhTG1mQf+mWTjVdnV5HlbBjtcyOSlqc5YUxZcMCUvCehkq2XrQHzNJ4gwBxFDW7c70iCgsb3voaFrdXmuovyQiMsytdkxh+X6vQWhvb00gv3E5aj1MaJuJYCZwOT1FaS2LGrPgPXDxKNNecW1Cpt6sUKj9T6Ktgo379iGEI/KbNHdIGlJEQ1oLhX+O7Vo8Mtx5jC6OmmkUjgxFkebWWVfkAzwRGKF3Xz/W4R4Bjij4IWu+L9yRjAhf3cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 17:30:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 17:30:29 +0000
Date:   Mon, 14 Aug 2023 14:30:25 -0300
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
Subject: Re: [PATCH v6 00/25] iommu: Make default_domain's mandatory
Message-ID: <ZNpksUtIY+3N1Hn3@nvidia.com>
References: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <50feed07-f89a-dfc2-d8a8-16f9bf0fe937@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50feed07-f89a-dfc2-d8a8-16f9bf0fe937@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dec0aae-b228-46dd-a1bc-08db9cec273c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObG5WL5hXf73ld5xVkdV9rGSht+CPvTRahLzOrBwwrqo3eRNHPHV4qjU/hRT8ItRywHMgcmyITHP9K2ExfWQFtd2v+g2HuAk3o3BDnGDFmD/NmpQ9V/phq+lIQfsYRo2doqtIaj+Z8LVl3BI75jdvxMIdDJLvJwxpJmz+XoKvTTLIlQCBQNlRHf9GB7Sa6p7wfosHFUqLjK9ps+HxZBySs0qMUtSuaJ3LLupM4GwEHuyy0Ipacqgf7kgwwRc4ISoXj8asL4/CFPAuJnMMcwjioo4T4WFpU0PvTMPEz+cbs/stAMZfLVRS2QL4Aff1WgE2IFFvP6ZDHmocRi8aAGXpGMOY2Sn9sCj+dv3xSjXBYa9LLEqM6fmpm4LPfJ7AkD0Gy6QEBPf9KTCTe+CrIZO9en2/RjJj+K2MoYt99vMdSSyPyQVqX/3E3Ce3D/PRGebeCfXq8lTw9VO5Bb/PrteBoZYvF2U9RvlxHc8OfkLgb6I/kyuMk7B4gUzZMHJ0JIfmM6nhFV4yUwKJIoYW23fVM8/GembtYPh8VDeqfG+LjyvG1NNqiH7yKjnDKYSjUI+CEAU/5/S4Dszl+E0T1n6CM7EgAsQl7sz2zFXSS01PJt9k5A1n3mMiUM1Bpkab0+NZ8OULx/iZspnw4nl9MI21w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(186006)(1800799006)(6512007)(6486002)(6666004)(54906003)(478600001)(2616005)(6506007)(2906002)(107886003)(26005)(316002)(4326008)(6916009)(66946007)(8936002)(66556008)(5660300002)(7416002)(7406005)(8676002)(41300700001)(66476007)(38100700002)(36756003)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tznxj4HhhR9nWsDCwoV6ELxC76TapySK2wMOAyE6Ouiz4NSGWoIIKgi/BD+4?=
 =?us-ascii?Q?Sr76X5obYG5doDcvOCKZPhJ8HPtEh6Qs20Zm92zbJwgN+OMBrZPenWuwZ2bx?=
 =?us-ascii?Q?gEtXU1R51wYN1RLIwOkEh5eHKlSTn4CdIeL7v8ha6T2XaZMJ5ATcWQovhscQ?=
 =?us-ascii?Q?337bPNQA+zN7aLUvueE/BHEXrK24rHVp9O9T/kcgYz/6NAdHO9bbyEfYkNlc?=
 =?us-ascii?Q?KEDNcFQNpNPZNGzKKZFOUoWslDuZ4N8qXa/seqFWy5yOMb5fLx/xP1DF2PBw?=
 =?us-ascii?Q?T9c7R/lG2k2koaMpOp4ahwBFDeIn8exfUAUr83fi/m0d0zDDX+NNgrisgaiQ?=
 =?us-ascii?Q?CthSAOTmMnpjE+AaKlzpLV9ohYk072AJBZ14LfCmWggQiCv0d+JqfQyNNz0O?=
 =?us-ascii?Q?iwUrajujan65RhiTHAqukX4DVkYuEHcotXnmRMZ/ygI65WIxL+d5kQeZV2Se?=
 =?us-ascii?Q?3O+z4lHwDN0B2et9z7Mmeq2S4hVAHRkcokcjlYYSuOYjCsA3FX8e6ydA6ZXx?=
 =?us-ascii?Q?mIHUhZkCqrfiGI7UkZq+RCmcnVNC1a9w0RcqkLioG90qHByc2JtxUVueKlqF?=
 =?us-ascii?Q?mh9Mav9NFxIN55JLbA4H8HVOsCLv6OCJUbe7azuyfT/MoOOpCEnz18oc3sJ4?=
 =?us-ascii?Q?aLv7597SWE5q9NPQqYdBW8DGVQDLewzkg4I+bEA3cRV3y+ysbY3hHjoHlUPK?=
 =?us-ascii?Q?MOPvaFGF2S9AMW26QUBemnK4d/XaN4eyI5g5KUZ/MOwXcwbgbG+qDa87zYSw?=
 =?us-ascii?Q?BpOmgRZ7znKjc1zexg5QWpcF2XyNI1/Jxkr7E5ssKCwnRMi2Mw/BNS+J/IbA?=
 =?us-ascii?Q?f9ajbJ1GSeJdjnLGRT1/an8eGkI+Eave3zENtcW3w5VQka+QVqueAdGI2qmb?=
 =?us-ascii?Q?c7/aeTjJfszlBx8IWMx2wkpC1f95PLLyPiUWvbosa/JPl6so2F7wjC67CpVH?=
 =?us-ascii?Q?564fp7qcZ1m3hX8+AnTtY1eONvwmdg6CB++Vr4Elf3thWfH/edR/EcVLwEzq?=
 =?us-ascii?Q?XFbag8l47dGRGsEnryralKi04teF/12K1w7vhwmthLwQX+oIdAewt0V1merp?=
 =?us-ascii?Q?IEunbyEoCFeWSeh7rs4P+QMwKJbteVLJZ3or7yV80nIquzt6DHPXLAMS0WMN?=
 =?us-ascii?Q?5iHDS042uWmjLew+tuiehwFrrJA+Ot7FmSF7xrQTizoElcdvYExyaIM5Tkb2?=
 =?us-ascii?Q?75rLXfkfHUmxrpl/OC15pPQMRhbdZrUgpvgne97/t9vCgjgUkkWbt8SvPwx3?=
 =?us-ascii?Q?OhmW503Mimvl1OyeBCWbvk6qdl+QPBVuRYygw1FcjwUn8ryfUw/xSemGI5TE?=
 =?us-ascii?Q?lzKm6Med4TLt4DHCNm16vvGqdZevF1nkJbH7thUTC6KcTlMvJ8eliwCSUjHj?=
 =?us-ascii?Q?lFZq+4CRGbr+5EaiKQdOa/95U91xFlHpSskbF/k0z5Co3RUOqDbnoSr2R2/A?=
 =?us-ascii?Q?fQMnICi2rTirnQjAIQvaQzE5/0YL3rAMqe6UWeOmmIzw5iaFKQfpEi/VtaIL?=
 =?us-ascii?Q?ZwrZ+qwUyzDC2oOCAfgmzVsw+YOZr6jR8m1KUWxn9WCrvMzt96O+d92PTxMc?=
 =?us-ascii?Q?SqODEGs2hWRY5G2d7C7ipsbM4BAH3ZLcHcR3vkAj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dec0aae-b228-46dd-a1bc-08db9cec273c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 17:30:28.9942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgiNbHxAGGf0equWbkPcTUZ5uP45Wfm4kvMU79izw2qWF82HkIheCklJhfp+RLkY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 14, 2023 at 04:43:23PM +0800, Baolu Lu wrote:

> > This is on github:https://github.com/jgunthorpe/linux/commits/iommu_all_defdom
> 
> It seems that after this series, all ARM iommu drivers are able to
> support the IDENTITY default domain, hence perhaps we can remove below
> code?

Yes, but this code is still used

> If I remember it correctly, the background of this part of code is
> that some arm drivers didn't support IDENTITY domain, so fall back to
> DMA domain if IDENTITY domain allocation fails.

Not quite..

	if (req_type)
		return __iommu_group_alloc_default_domain(group, req_type);

req_type == 0 can still happen because it depends on what
def_domain_type returns, which is still 0 in alot of cases

	/* The driver gave no guidance on what type to use, try the default */
	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
	if (dom)
		return dom;

So we try the default which might be IDENTITY/DMA/DMA_FQ - still have
to do this.

	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
		return NULL;
	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
	if (!dom)
		return NULL;

	pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
		iommu_def_domain_type, group->name);

And this hunk is primarily a fallback in case the DMA_FQ didn't
work. Then we try normal DMA.

That it also protected against not implementing IDENTITY is a side
effect, so I think we have to keep all of this still.

Jason
