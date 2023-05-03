Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9AA6F56CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 13:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjECLCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 07:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjECLCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 07:02:16 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D425FD7;
        Wed,  3 May 2023 04:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZbmahQv1GGnM9HCVsWfUG4n1eF9SYEyUslu1p3sQYVwGEjUCZt93GLmB4/uSCIugfiC5YYB5nNbVHyjWgMgTsE8Dvh8U5HfxqbodovxQErdQaBFBDSVE5CI6I7Xoi16GsC8Y4IMb1doLGvgRgtzm5SD984HuEITBy3gMACiedYZ8xCbq1X/m3Po+vo6p7rwJX6872HoUKkoWFgnt50LT6KSpJlkuSZPPM8srYVkzKWA1umtfkLfYHYItFyBA2Pa5a5PkdPVSUvJeN+Feo124wozRTteWbxxIh9eCsfcjmrK1w0qsdBrl+u6CgO0ljxTINE//clKSF7r2oCKXM+eRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xsog/tuxM6mckLWu9RwRNSa6Zt3KC5+NEUffst/eiSU=;
 b=Ao598vXZorIeJ2ENdkkh33JpbnStxO41C+3XWdBRwoTCQAgpoX5RRm8Ils8NTFzJaP9fF8H5BQIpMZq9DEim7ZWAorba3o8imzYZNXzOhb5u7tTziDaTnFg40EoOzaHKP8EyteQC86SHJ2lwd+KPcAZl8Ctw6vlea2Qq9mvIhx66bj440ngwNSHn2pyD9s8VrL7cSDzIrnrE5n98451lBmJDmIqW0DVfd3DfJXYI1xrZwS6SV3COe4UD1hk1UsDvAiAciNKTwMguGbKuVkUMXEjjy/MVP9KAuUgqX8aETXDr0YDXhrggtXelN2CGe0lS9gDuq9AxUJwfRYZiIZ2GmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsog/tuxM6mckLWu9RwRNSa6Zt3KC5+NEUffst/eiSU=;
 b=qj/ICgBDsUfKe/IMZBauzqLhEkSGY1GEa16ClXbLfbt4adkZkg8dVQ4O+yHWLbHidgxNnlIgHGEaWo4a5CUyQKQ/ln7ajHLTx7h6euMFSbpjtPKHkJHHPhrG87zhfJt7qNDpokJ48NRQv+lP2QnfpFy+IY1eSMb7oM3BlR+thidiE2dect14O8cW3mcafuW/jQVo60Wz2dXuo7oM/UJM1XxJiucZrRJmo4dCyH1hHH1hIgBxq0s76CWVeB+hO4tuy8X+G6npK8AFyJM99t001pmuttDzH7Uc3/oQijZR6N/K/O5YBjoYy5gM2ZQhQIHySCXqfewnniVv+SRPP+F8Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 11:01:36 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 11:01:36 +0000
Date:   Wed, 3 May 2023 08:01:35 -0300
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
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Message-ID: <ZFI/D6mnLKYpdIqx@nvidia.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
X-ClientProxiedBy: BLAP220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 2009068b-4c8f-4b26-e2da-08db4bc5c371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/XpO/bQuzJernT8ARNbs+Quh0GGIUDefEv9lp5Q1G7Mnx1iXRM93c+NJ+R2MLDpDT+DpNTlZpplPQ0cgPtJXtBwfw+UvRUjGu/niVN3LOpuvenxq9Wb3W5UBCmfJkeZwvC2dVm6XaDjFQjshhkdekhn8y7h8c9Qga0Rz7DlQJ/WsC3TheJrHdisBWDp/maPUYUtT5KoPGa+m3KF5PLc5IPEFHqkz3S8u5RK3yJwQwA5p/Cz7Ykb1s3gLervex9/V9NbkQzz/HG0zIkbHU36cBENPg++fNPCTzKuu8LM7WprwcJePx41LMmU0HauYuEtf/SDQSn/RVKA/7SqYBxt1V9yw2AqsMP/anpLQJXR5FT2poOymHcobhrkVmrMlBqUsizQFfQEib8sb4z0mOV8M8P4EZ7f+glZuKxMCjcZmTy6SkuimW3I9wUtcW1+2LKcxQ0zBNqu6m5ddrlb/G+IwQsR45gDS/QvAhfIPtozuX18vExdXEuGrDjuIE/9GsVNle48iuvxqoIG7g01c1oxhVtZ8FPWOJb5VW4DB/UL14OERDAiQP2U8mbhfU5hvGQt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(2906002)(38100700002)(83380400001)(2616005)(26005)(6506007)(6512007)(53546011)(186003)(36756003)(8676002)(8936002)(5660300002)(7406005)(7416002)(66476007)(86362001)(478600001)(316002)(6486002)(4326008)(6916009)(54906003)(41300700001)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cwUjcchTUL0kBm0NONjq5SuAwLP7JqpG25XgGgt3c/jtJkKshIUhdR167qLu?=
 =?us-ascii?Q?pGVRiG+rWS5vhOKgZiHE0ftONvEq8D8nngkdRMeNDbDOcL5HbOAqqlb+y3g0?=
 =?us-ascii?Q?q4rQWLYNIA4Lwzn1xra/gQvECJh+Ce/JSsMsxd+bQYXlQPHWG8lY1eoCiKix?=
 =?us-ascii?Q?33kP9npM4ZvupaAi/4UzJYOY0AsbonP2KPdJVh45aSIhGKN8KiNaN5sV0oSp?=
 =?us-ascii?Q?wv40E45o3iKXAXd91kgJeZ6crahBU8eMpjJBjoVC4ML/h/g+luKB01VTk8Y7?=
 =?us-ascii?Q?v7Ie253hCN5AGeFn1TJJHElaVDxcomzcP+8JRYas0eTaBmUqgiHjf61CLMrL?=
 =?us-ascii?Q?lCeaLCqq/Jm2oR0W6rSLBVnmNy9PvF4H7r/dYeH8oi5jfDSulXCPjT7SdKN8?=
 =?us-ascii?Q?C4nRjrG+Te0KLFRFgTkS0FtgYa6btnMb8U3kB/YgR2RRXunp+HHsAmrLUmzP?=
 =?us-ascii?Q?F/4WBlQekhYNXd+JoRQl4VF0z3U2Pf8WWWz0KzTA2aps3crwbS5N+oVmTtBx?=
 =?us-ascii?Q?LoGag25br6D2i7Zz/2fpWyF1XZBgTXpSV+hrTZqS/FMxTUpcIWNLiWYl5xLM?=
 =?us-ascii?Q?9hHVAYrq5FG9BdBnktNyIMix+QjV7CQBOH8ojJ3SU1A8YIvRqkl1J/P9cbuK?=
 =?us-ascii?Q?FXJ/VOMxxkVY+7ZrRClmhGdBi8VSM+n0hF2bbfGAVHoo0bnz0+7RVgWjyjS/?=
 =?us-ascii?Q?iB1wbQ6WfNBi8Ook7psD9zWWA9yMOES6WT+MWyHVyyoXnvWCH5TKd6eEThZe?=
 =?us-ascii?Q?G9mLKCuEg3ijFGANgx9KL15FIJ+KVErdKON/D5+WWo105pHPQbRKSJfH1rcj?=
 =?us-ascii?Q?fnBt1owFEDFfaY9Ky5/CpHsorV/5lKlijjgowkx1j67H+ymHM77w7NHiHHOv?=
 =?us-ascii?Q?MOfXVTiOeuUNhCsLxTo6HMDKbEPplevP0HzVf7ILlqoipgsUQQ7sHkyG7YSu?=
 =?us-ascii?Q?KNwhM+V/4zh4A0K0EuI9tm5+Sr1AjzCWl7hq/Ip3pja3bmFiY5hyFCLaFP8j?=
 =?us-ascii?Q?GdEnXgjBAt8xrj4KYuz/SwctO/KvCz0lUueDjRYXco6lStB2U1qyZqKC7xY/?=
 =?us-ascii?Q?Y36uHc6rkEc9navTe9vMvBoqwn/IPGkaWQW6X9JQX0rDrt2529vFpcsHPC/E?=
 =?us-ascii?Q?RPRbgdgn5Gj/UtGK7Z7c7+dYVfXYowbQKYYG/o0WAHtH3/tzrKNS2irGHERn?=
 =?us-ascii?Q?qh/D04cY6Rk89VQ3IWFD6JskszIY3l90ysAWbKEF+KvZLPw97ghJFjI904oW?=
 =?us-ascii?Q?SP4MBmOBx5AqN/QulmKEnGgvtG+W/gfeWy6QIyXWeCnLQ5Od7LBprCv82KiL?=
 =?us-ascii?Q?YeESU9wV3wM21gNLLvLf27/92Djd1k+bqbNWHWRNiJeeHhQLejYLuxBLxBFc?=
 =?us-ascii?Q?cmQCR6U4JtF1E+xtDAA1V4v32N66DcbHerwDFXOFZCA4htJENp1KtIhaFRQk?=
 =?us-ascii?Q?6uQlxtUlClqDCTYvC6Kqsf3ZVKEWmJTAeyO08pPznMAkEt9aIhdNHTcYPKEF?=
 =?us-ascii?Q?ZBdSictw/g0PF+u7JTTP8FAwvxSl7NzvLMg9+O5kfRqSy4FpIHGUsOQoMWqY?=
 =?us-ascii?Q?6KK8Ix0FBuh4cKo9MGc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2009068b-4c8f-4b26-e2da-08db4bc5c371
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 11:01:36.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8rjzxaN220al3RXQVwNZB0WpX557QeUmex4Md+XOKFYJIPuykFWoomCpOjdj9Oj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891
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

On Wed, May 03, 2023 at 10:17:29AM +0100, Robin Murphy wrote:
> On 2023-05-01 19:02, Jason Gunthorpe wrote:
> > tegra-gart seems to be kind of wonky since from the start its 'detach_dev'
> > op doesn't actually touch hardware. It is supposed to empty the GART of
> > all translations loaded into it.
> 
> No, detach should never tear down translations - what if other devices are
> still using the domain?

?? All other drivers do this. The core contract is that this sequence:

   dom = iommu_domain_alloc()
   iommu_attach_device(dom, dev)
   iommu_map(dom,...)
   iommu_detach_device(dom, dev)

Will not continue to have the IOVA mapped to the device. We rely on
this for various error paths.

If the HW is multi-device then it is supposed to have groups.

> > Call this weirdness PLATFORM which keeps the basic original
> > ops->detach_dev() semantic alive without needing much special core code
> > support. I'm guessing it really ends up in a BLOCKING configuration, but
> > without any forced cleanup it is unsafe.
> 
> The GART translation aperture is in physical address space, so the truth is
> that all devices have access to it at the same time as having access to the
> rest of physical address space. Attach/detach here really are only
> bookkeeping for which domain currently owns the aperture.

Oh yuk, that is not an UNMANAGED domain either as we now assume empty
UNMANAGED domains are blocking in the core...

> FWIW I wrote up this patch a while ago, not sure if it needs rebasing
> again...

That looks like the same as this patch, just calling the detach dev
behavior IDENTITY. Can do..

Thanks,
Jason
