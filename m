Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B260D77BD4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 17:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjHNPks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 11:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjHNPkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 11:40:32 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2416E10CE;
        Mon, 14 Aug 2023 08:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6Nx9dHCLprArIOSEaQcSHcfUCZ/C/RIaPS6B0aXj+qTb7oOrC+N5zMPt2GXpO8OK02y+aEZ8W9/4DIGLVRP5w5KiCmpIX/0gkQwhmYyhDHXZouifZXDitaiY2pKh0RkLznlQYeySTLvIvHcnar80pqWBwnKA16FVzOaRayt3Cz13shM3Vb1HFDldOtuUPHZcPFComQLKF5KYGZ/BMdPb+I1e9VsdXkOKbO8KwCBAA3oIReF5l7QyfxKhFqLUpf41lxQ5oEpXbh5W8pJjrNegK7EEUwyX64xuwT+5pVZqDWp30C3q3UsJ9Elhz06GFsTfuy/cr+THSOn6UdIh17CTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrteVFyviVj6MJDC8LV/yV7BPT1IC3NH0CTs3yCKRcM=;
 b=PXVMMiV66cls0OYQ7MhfBB4X1xFa1m/HIOLkIhV+xUt+MdA45uqhsZ43j9ao91ywy/vkBozYYk4MzSJYrUauiyYsXhI7S9ih6dCCs2WMFdM2rHYBuG2WMWHaTnsaNCWpsYJnlLbEDMiapZqsVxMvr7Z/1LHfF6Fx1lNw14pB9kT2vHhz4GUUfa+VdkM/s3TiGWM5qKjPaUrL9tOp4oIEv3s0gg9MnaTnV3hkbXzybniStjLLzrgkEo2mluusz2igPokx1aT/Teh8n3IqtoPYQFKb5VFBW2uEqkT1WfiICf67G3jr5OBMQz3z7UT4STOQ8DKe89y8y0FIMRj/Aapbew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrteVFyviVj6MJDC8LV/yV7BPT1IC3NH0CTs3yCKRcM=;
 b=J+6nMO1O1qCoyXzo0BXpZNvOzq9ZGL0SIkgVTTF5+gDHgXWnu0pTg5xPvavgRp0/Pu4uuH5y7sNEWkYLKEgrZenzDDeDys+NsU1934aLRmWIlVZjFTEQMlLW9VJyOygnkY9rXBzdFsX9uPxjppnkByNYK01exj4pPv6jp7KIuqhupoaBUMeA/TflOoi9OUtYX0Sjo/aX/oTidIGvJmpYuBrBj9MyEpU919yG2J+NrhYD8MqgPAUv6CfORVn1TYWgnJ2El+txa91Gpl0HPn6bra4ZgWvUaBVHYIpwUcgGLmgFsBJoeZmqcbmWYMtOkBAM8wA4N8vbBK/EBs+Qaq2CpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:40:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:40:29 +0000
Date:   Mon, 14 Aug 2023 12:40:27 -0300
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
Subject: Re: [PATCH v6 24/25] iommu: Convert simple drivers with DOMAIN_DMA
 to domain_alloc_paging()
Message-ID: <ZNpK64GfQtFUUhPU@nvidia.com>
References: <24-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <90d3070b-a3ff-7007-9b55-aef1e9b472aa@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90d3070b-a3ff-7007-9b55-aef1e9b472aa@linux.intel.com>
X-ClientProxiedBy: CH2PR05CA0002.namprd05.prod.outlook.com (2603:10b6:610::15)
 To LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 912156b9-4aa8-4fca-5bd4-08db9cdcc970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zb80+olHZD77pAQ1+hx58zxAqDpd5hIH8nbTs3gGU4n3y491ZpHE0xDaU/XJJPCjcsMf04/3GIAb8MGyuhxV8PIIaIH0osT1Jy+8kzlxiJ6yrCIijlEikOtEuyKW4kezlfyGcjXFfxVfygKR+B5OKL8nDwc2ZJ9Kq97RtnudfI1ax1nS6BHYp0KquvzIWBQ6BMAxBt/jwdgoKj0u42lSC7YKPDZfZeFKuGgEDqk9/Z8yYBwT32ENcIMqooOiZwW+n152yEV59oJASAvxhgZ3JwjvmgjHGVroDUgPQltsqpjGhTFeoxuaStHILc58jhmpxmNFzAjZkUjv836BY+dTaJY56mz6NVF+36Xj2gPyteVjwiXOR9Q/tDcWKuXpPJM7pGAnw6++/gtQHKoRikViaWZZlbUafwRV4DlkJX190zfLoAYenUo/vFdwPHw8FyFJVnbLENMobnT8d+tujxfR1z0H5KH8sjK44CsF+GVmhDPf0aaJQXDscOl+7m/735jX++UPpy/FoklrDeDJmOHFr6ISnd724xguM0h9rg20dv35MAO7TnMmvI/+rQbrzY5grSAh/ZCT1KTxZWEe2JF3lLOWOgdpsNj+AOrJshKWGtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(186006)(1800799006)(6486002)(6506007)(478600001)(36756003)(86362001)(2906002)(7406005)(7416002)(6512007)(26005)(107886003)(66946007)(4744005)(2616005)(38100700002)(316002)(4326008)(8676002)(66476007)(6916009)(66556008)(54906003)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2PskAawHjFn6ibdJbxuPIRoQb13KAj0UH73GMuK8RSRS4hRL5nngnMW2EIa?=
 =?us-ascii?Q?9MFEmA1jgaa/DbZ+C+xUx2D4Yk2y+0lbovKO3EzzrnuOrak1oglF/Lcagjrk?=
 =?us-ascii?Q?j0pdTheJIwJ1/dyWKts1p15dG2IuNXao5rWSgWoXClHPKLkECjwBmO2Xkbot?=
 =?us-ascii?Q?TPME7Mm/T3y6dG0hsod81yvyyLwQFO+5okkRNqhUb1Dn3N6EEabS9bmc7YaU?=
 =?us-ascii?Q?csSlcQUR7/ebr9FamjyrBeSnvhE535RHrkJnStcWQgauGEERN3oFd5fsePK+?=
 =?us-ascii?Q?i1ogEyzoISRpaIj/6lScR97KjM3aAd3mOyGg/XRxLo9T6E4duRXY3gZLfK6Z?=
 =?us-ascii?Q?WCarwpibiWLuUsLgrz8a6/BVGO/pKjiLTt1h8988VQk7yKIg59NhYR2BO5V9?=
 =?us-ascii?Q?S6YQZgOmqVYxMVYG7jheooJgeUqbfRwiunQXUKZfyXG03Z0jpFQIWfQeWHM4?=
 =?us-ascii?Q?AXwDSLjsk5oJn2V/8wverR8+mlR0qTNUB6h/62s9Tsz0ZHEJbTF9EXfpkmJh?=
 =?us-ascii?Q?tV22NP0++EfS4N0fv7mnqIhFsLH4I+vL8w84In6qPFb2EOBDrQjYIYYk/s9D?=
 =?us-ascii?Q?LmL/xP08nclfKXaajfhkPJF89m2NKUlgdBOKzugEFF1MXYv7xAL91ubIu8PW?=
 =?us-ascii?Q?jaxVxlN+5lhDPfJLP90dtI3Hd05GUnid03GNFz9oD5xa4zOrhc2iY+crZxKQ?=
 =?us-ascii?Q?8oTytFhIPplvZw7SwxKmyG42QYCLBrLraZf25S/u7WMMSgp63c4wG3BD5tlt?=
 =?us-ascii?Q?w62TRxVbRclpjOhS+HLg72wj+QAZqq9EWqHSLPaVbnIQdhp3CbRquPpndIR1?=
 =?us-ascii?Q?2ACB258fl6bdQvGxTJFMwgFEjFJrwE5UA8v6Ifoh44tcB+2Z5NnkDn+9ikRD?=
 =?us-ascii?Q?pMe8xQywNfqfZ9Y9lg10SA7Nj4vL0YQcmnKfk9byKc9Z+co0Qjj9BeeWrIAX?=
 =?us-ascii?Q?4WrI5eaefRx4MzrRv0u11BlMg9kkza5XGL8SNx6JqviNCm8JCd7JCHF0CJW3?=
 =?us-ascii?Q?VfPeAz7eBeFgRtFRY2IM7voXw0jthtDRiCiSxBq7qI5fZY+jdNXkK+J8Lqyp?=
 =?us-ascii?Q?PseIp9/F3pjSEL5dbxlC/x5XJwA75/z+wx0xNuyDcH7BR6BSS2MYqhHqflPl?=
 =?us-ascii?Q?RBVakmh7OzfkXpP79hc3hZ2I9BzxaFTVd/JyWuf1zJyJY/19HRHJAM/NZWlC?=
 =?us-ascii?Q?toshTISssEaAqHRiqLfKrGw3CSKHaCLh3DTVAulEsclMK7OMY+G6iNneJ/k9?=
 =?us-ascii?Q?g1401HY77V5NSQwWI3DxNV0jffUg8A8qRlKYHyky0MKueI+IXeTMldVwRXlk?=
 =?us-ascii?Q?PBrzOOX4nDAtlec5DcC58AzpoGLKCZBLl9Wtjpxe9eGnUyby47Ca7Q5Sj/vH?=
 =?us-ascii?Q?EnViWptqqMbfeADtj+Unc/Cw3ArYs0gKKCubFOPUcJ50fUE2VqZs91r7t/m+?=
 =?us-ascii?Q?OJycJLU9eD+bBurnhT9xA0teSs/yuUoijmRKwRD5x5vfUsK5YgMn7k47UKwX?=
 =?us-ascii?Q?EBRhiVSPW++BLigrMk0ZBUrRUocsdFRQb7NrSPJvM0d2ZDoc0lH3OZbHtklI?=
 =?us-ascii?Q?1JUmQEwG/lulxc/s6vQ1XXhu1OEz32UB3EuDtq5u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912156b9-4aa8-4fca-5bd4-08db9cdcc970
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:40:29.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbAn/tfYDXxhGLjbb7An6LaU4YAbKqWeBli1LWYMzBsnr/285zgHoNbOzQDexknC
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

On Mon, Aug 14, 2023 at 02:58:14PM +0800, Baolu Lu wrote:

> > diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> > index 0bf08b120cf105..056832a367c2af 100644
> > --- a/drivers/iommu/sun50i-iommu.c
> > +++ b/drivers/iommu/sun50i-iommu.c
> > @@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
> >   		sun50i_iova_get_page_offset(iova);
> >   }
> > -static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
> > +static struct iommu_domain *
> > +sun50i_iommu_domain_alloc_paging(struct device *paging)
> 
> Why not "struct device *dev"?
> 
> Typo? Or anything I missed?

Typo, I fixed it

Thanks,
Jason
