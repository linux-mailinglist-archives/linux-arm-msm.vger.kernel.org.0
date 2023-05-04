Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10056F6CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 15:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjEDNOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 09:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjEDNOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 09:14:42 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAF36194;
        Thu,  4 May 2023 06:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h04D2tz1PBIG7m/ma/heLA5CI/Mxl90uKuB9oAbowaMbfYARM9s0lC//SoAsHbIn0On+77HeI6Nf1OCAkzROOfWG8NDIpY/EXb3FQDiaJ3socXMQ+rdPruPIK0mGYUd+e9THV82k4TD8JlvAnJna6GNYMdLXqXZS8GZAMAC01OW57YND+aggSge14dO3MTpCkExsK1P3BLXGz/iR4dqGeltro0TrAs/Z4dUVrnGCrl2osZ9SKAhSpOdL3+1tyomgqVovjRK382R51vAQgHK9wnz8cT91NDZ6AQaKWoGvn2DbYWAbd9a2L/kYfbml9yyOjRjmGEdzxV/I91wad5hHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c++qFGxC41nKYtAqjLjUljavOozQm0MlK+NZdBecY4=;
 b=oFgp7yr5LzoJ34ZSsOG+enp360GwtrRSG+ygIfMAwSNsOCUipgoQXFkYN4Rx0K4IiurHY0l2VJ+Tcx1jhT+VrB+tvdk1hU2Q1WP5L7db0I/x0trcg5HywPxOkKa5Pb6e8/mXzXpLvLDq8LeFHy33ZX+Ft6gSF0QlR0bokTqUoRRzerXk4miP5wgtmw6o4MgP89372GpHHh8aUh06JooUfwqk6HykeKjf+Uh/GQ4MOPH+bAVfIvsc5+s9DiwsZaBaqGvqe5cLQQBslefI/1ioFJY8LEboJvpS3ITMVmfkf7o9BBb8Ul/xvUuaRS9L6b0z1Ln62U6Bgne244zzc+StsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c++qFGxC41nKYtAqjLjUljavOozQm0MlK+NZdBecY4=;
 b=pflt9Qvy6F0LNb2pQB/xQimzuvzqKiYPMhZkRNcdiLj9irglsjQhyV5X0bxRnT0vG+UeyQZDIU58Kv1AqohbgjT1hBN7WOmEqu5iuBNv9CTJpdpF2eZeLPwYeuHBn699LWb0OgUz1ubeo0KL03djA5j72w7vBlJoXCg2nkNaqFqkQo5FMl7C5w2cKXyAP49f7VvTFukYuSxu8jPL2jyeKiSeiVKf1eLVxwyf3J4VjfSMo6DlAWMHlkv/aW6az3Myedd5n/BQzfp/y3N1kTGReSP5Z6EQmi/3Ihavcd+jKr8Aa3rf8Y7Mn/2MtcSpeVyGuq9dJFtZ1wD4YwKJ1tGykw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 13:14:39 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 13:14:39 +0000
Date:   Thu, 4 May 2023 10:14:37 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Niklas Schnelle <schnelle@linux.ibm.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Andy Gross <agross@kernel.org>,
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
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 18/20] iommu: Add ops->domain_alloc_paging()
Message-ID: <ZFOvvdneHI5yZlPy@nvidia.com>
References: <18-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <fa8c5e95-b8c8-f4c0-63a0-d3176718d304@arm.com>
 <ZFK3dfb4bFiJjw9M@nvidia.com>
 <c643db828f441009a5281127122a967c7fcc7149.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c643db828f441009a5281127122a967c7fcc7149.camel@linux.ibm.com>
X-ClientProxiedBy: BL0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:91::40) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4149c1-b495-4bb1-4b80-08db4ca183e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bw6uKJV6Iwq4KSDYTLaJsTTS72J/fdlySCgjK/ZNt4ioDPlRz7+vtYBbdTi88IM/MAZPD0MdRFMeQ5OvK0o0Q7+HC8ku+U/h40C1o08ltm/lPWb394gj3KtuYHBH3nhKd+XhmSLm49Z1G69dVqxKhomZUsBsJJWEzK2Vnp1udPx+M0MxpsSRuvWjNdSmGHWB3KJM1wm7r10EtTRfkI7R0xgXjVmp9NkxgULrznDkDEBlW5iDNeeJ4coBX6/ZUScLxxid+bi9dcQMt+26x+Ao6qX5JHzkiz7S1QJZOXo6ghsGifj/KT6kBnnJwgr9cGQiF+6XHG/yFC511yWM87AY+iPCamhG8olbJklBXexmZ+cVFAXfKrLIQl0zV32VVC9gARF2pFUOhgPi1+n9ntCx6+DJoBqplmjQ9g1jpIUS2Bc+C4+19LReHtArp+e2weReE5SD+VcXdyrdJYkpPh31vkVyR4XoMCab5kWXol+9HvQC4/ZvKQ66FzhelmLjqb05RMQGRJhLxTaTuF2BZg5mjv78zVFdj/Aaew2I1EU4ZFamnV7AStU6mRfGw5zPmf1y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(86362001)(36756003)(54906003)(316002)(66946007)(66556008)(6916009)(4326008)(6486002)(478600001)(66476007)(41300700001)(8936002)(8676002)(5660300002)(7416002)(2906002)(7406005)(38100700002)(186003)(53546011)(26005)(6506007)(6512007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Wfv2YqVkxUG1Ft1TCoBQBqPRyJmWHgc1Hg/olwlcaYH8Vgvlq/Rob6G3z5z?=
 =?us-ascii?Q?kFtKdXbEULEJwhN9EMU5vCPzaDeyi5kMxOVJ7Aq0oj7pVMnG0RhfFyFpUpbo?=
 =?us-ascii?Q?HCIw9nliK/NDrGsBsu8bbqXtrj4HWpkNvsAalu3qMHlm1A3vwRr1JjofpMKe?=
 =?us-ascii?Q?CLbsLCgABOM7ID4UxUkFp0U+dxUjXVPUzzvQ6EE4IFuFsVaOVLIsTUYVLtpt?=
 =?us-ascii?Q?TNfNCxP9GzRJmjUTsSjXA4CLKfoqMdNPvrVcfBIf0vop/RSWPSidoxj6vr8Q?=
 =?us-ascii?Q?mHh13unmM703V+Yy10TuYVK9YzZ6GzkBVnOGbs3RbVJDDdasDB93wh2XexC+?=
 =?us-ascii?Q?cI2sol/JiQVCvqYG6vDiYjgB4fhV+/F2LwALJk7mJzQQU93sF083HIfIHwxh?=
 =?us-ascii?Q?RUSJOsXU5luZPPOU04/18BWxhr3viQdlxICDg/1ILjtu0VFJ7+3sGgYel1zA?=
 =?us-ascii?Q?ddWQdgkv4bL82xXJb+vBUsuW0sEzT09n/Fl187BveKxvMJqwdYeROjYdC+Ug?=
 =?us-ascii?Q?1qhVBU+eKBM7r5nIIa9yWqTFsMuYgVF6cAjHML3V7zluTo+6egA6dwCtvNdh?=
 =?us-ascii?Q?votsMbTdirP51OWW5Wr7wU/GvQyk/DWYaEHGaxHEhz4gyuOg1IMWNcCA9Bq+?=
 =?us-ascii?Q?afdvXzdKUaKYB3nRu/DM0yFLUrfy7Wqsub9BTDJUYpPDwJc5rOgiDQ2UEQqg?=
 =?us-ascii?Q?Hhb5FMBWPRAcleuwG4JrQaGUUuFQuh/rtFal8TG8QfWzqsHh+xxBuwTXZc1I?=
 =?us-ascii?Q?KJMS97ACLzy1rAJTKVC5tveAF69WVWnYpZ4eq2dVJGy4vIkmquyMolDJdLx7?=
 =?us-ascii?Q?xekj6mB8x3a2YMrHWCS3v8Q06nWpFXX9KIkitmnP6xjGK0gmpDRyV0jS4qXM?=
 =?us-ascii?Q?SuIzhXAokKjS4NOqDEzFtknKoO2U1tpVWpttpJT7Qa8spCPc4lwV/8GRCxPA?=
 =?us-ascii?Q?Fsqot9vjkhPkH+TZiWJMRNeqY2tI5u7bW39uyJ5+w5WVaeEsqUOb0eg7w2Rz?=
 =?us-ascii?Q?3JZaBoChRluIU5DZGSup6kBE2Kc2hrHv4Gz+nun8jOAeqmW6t2YpUNOiS2sm?=
 =?us-ascii?Q?lKtLZr9XwAu/ZK7/IT5I+EsZy7VfWzxntp3ldjpqDnYFQ6K+wq4Enaa5UH8Z?=
 =?us-ascii?Q?0rtYZ5kxAIO2Qj7xxVAwn/gGrf6t+YfDlMYMqkzLOv0f6DUeEeGgh5XnxMXC?=
 =?us-ascii?Q?LurmK+R1xIDwc36iS36grp4zjzTXC1ghG03n0GFaVx98O29H1CpWNiKLUzLX?=
 =?us-ascii?Q?DxEybTlw/fbf3aYEWcFlSLsq+M9UkAGOseMqgeKeHozh5MBpWsc0S9B0II2z?=
 =?us-ascii?Q?pN5RlrsHz1vxZrEu/1sna4XliCMG7k65g/Syh6z/hdBVcjtsc5grM/xozWYZ?=
 =?us-ascii?Q?AEYv1OOxQV6Fd4NJ5p5f6SIAmTfEtHrL6IfZDWXnChX7Goopig1xzbnSJDF3?=
 =?us-ascii?Q?J7FnuQW+EPam4jY+CrsiRqvb8gGM1dqIeWMhJQwXtY8bija9xVPUUi5yeKIv?=
 =?us-ascii?Q?UISFMdc4UTfCginopJFCXw9LU+mJYJu3J/obHoxjdY1jHbXlc8MUgPQq3BHC?=
 =?us-ascii?Q?GTiXwWaW+rwNsDdanCoB4mRZRseZRIJza2ayn18i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4149c1-b495-4bb1-4b80-08db4ca183e3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:14:39.1068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzXdjaNUFIbufmTmDwYlcuidR2Vvhpsy4wq2cckJvCBRsI3mrJH6CbHd92x8xIBd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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

On Thu, May 04, 2023 at 02:35:35PM +0200, Niklas Schnelle wrote:
> On Wed, 2023-05-03 at 16:35 -0300, Jason Gunthorpe wrote:
> > On Wed, May 03, 2023 at 06:17:58PM +0100, Robin Murphy wrote:
> > > On 2023-05-01 19:03, Jason Gunthorpe wrote:
> > > > 
> ---8<---
> > 
> > > > @@ -1940,7 +1944,11 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
> > > >   	if (type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
> > > >   		return bus->iommu_ops->identity_domain;
> > > > -	domain = bus->iommu_ops->domain_alloc(type);
> > > > +	if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
> > > 
> > > Logically, "type & __IOMMU_DOMAIN_PAGING", otherwise we're already missing
> > > IOMMU_DOMAIN_DMA_FQ. Except maybe that's deliberate? 
> > 
> > It is deliberate for now, if it included FQ it would cause a bunch of
> > ARM64 drivers to switch to lazy mode. I'll add a comment.
> > 
> > I have drafted a followup series that removes all the
> > DMA/DMA_FQ/UNMANAGED checks from the remaining 6 drivers. I did this
> > by adding an op flag 'prefer to use FQ' and made the core code drive
> > the FQ decision from ops.
> 
> Ah that sounds like it could fit very well with s390's need for an even
> lazier flush mode to handle the virtualized IOMMU with slow IOTLB flush
> case aka _SQ / single flush queue mode. When you have anything ready
> give me a ping and I can rework my DMA conversion on top of this.

I'd like to get your S390 dma-api conversion merged ASAP!

I have this general objective to get the modern architectures onto
dma-iommu.c because I want to add new things to the dma-api :\

I had imagined a new op flag because it is is pretty simple, but a
op->get_performance or something that reports some data that could
help dma-iommu.c decide if lazy mode is worthwhile and if there is
other tuning sounds interesting too..

Jason
 
