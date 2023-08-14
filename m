Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F8D77BD21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 17:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjHNPe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 11:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbjHNPeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 11:34:46 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECAAC5;
        Mon, 14 Aug 2023 08:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNyICTO+wETiRaoVSm1sW0FGFl8048HLtZ/1w3d5Y62yRGWiKBdPCqe8JOGLxaWYjtxayzg/B8ylP3ep5v2j+Hr96U2CM64TI5jqFUipgCMrG/b/aaakCalKs4OhYH44ABIJgjJ+BOtaxg17meVkev/2Dw9fJyhgeBZVVJlmfhxTrTUt8qnxv21Cz0Hu+T1fM84U+ObyAsK7N7P/d1woB7XY2oNSUDTLeKS+MuiVOt+mEWC15snyFoBRo8sLW9n+aJwjQMEHSO9lzfPcdLckIKhvphCDG1vX8Zd14qGq5x1p7Z7VZ87FLgzz4O5bVy+Mu745Lykn6Cm1CQFygmDOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu/mcvZD+1dFTLDVu+GJy3sVoBfuTSxiIJcYJD/zY2o=;
 b=TFB821TBnoNvMz95HvlcudSjAPM9q0/hwfoznxYuZaXqj1h/G9iWddr+qRf4hKkE0jxqO+tuXH6u0qo0lTnC9ubnl4l8HGCxfjL4q1K1GKoaqJ/MaHq1lIPgigVJiJ4F5tqilo7c+MAl7H2E/w7p0uxWUIOeaWW9G3XceFwgcAZfPnMhrGJ1oFmM1ceEg0txaHryswCRhZPZQbQ0cJGQLsGTQvAkwCN36alb7SAVGy9rX8uAiFVc3SFuG9TG2XuzXAexS8bd09KsQ0fUq1mMOrTONlOV4nk0XyYCQRYSHoBw0QIsOprER8nAAO1Zm9Ijok4CGNzxEfBBf5MiWKNehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu/mcvZD+1dFTLDVu+GJy3sVoBfuTSxiIJcYJD/zY2o=;
 b=liM/lDdafoqlnMirBRwpWDxpeFQIeepsrldqwMnEUogJsTUPYpwL8YH2k0PdRfasRgr5HErSffc+7uC0UY1Fu8RJdwaeaaFcF2e2Z3H5wIOzatjWDIw/HeSmYd9odjUziLrwsYk59+WL9z1yT+eudeTwDlC25FQTaLWfXi9kHdhfBpn9fRgBBCB1Aikr0jCvpzRXTjDGNW6ZCBe9cPjkUP+i7vAu8sVVmnZnaXs/9nUGtx6fJHimhvH2MYYCvne9YtjIv5XY21Guda3PWyrIzwpeBpbQ+3SyBAloNHRGd93j1FdMhVB9WXfhRZdo+oL0nONQT4wACunM4N04XFHrQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL3PR12MB6548.namprd12.prod.outlook.com (2603:10b6:208:38f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 15:34:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:34:42 +0000
Date:   Mon, 14 Aug 2023 12:34:40 -0300
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
Subject: Re: [PATCH v6 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Message-ID: <ZNpJkMp3W45mPnHB@nvidia.com>
References: <12-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <6675bf11-ed80-15b9-b8bc-dee65b595ba5@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6675bf11-ed80-15b9-b8bc-dee65b595ba5@linux.intel.com>
X-ClientProxiedBy: YT4PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fdf2a8-e9e1-4751-a7af-08db9cdbfab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igu67aXulfWo3E5bpIycQfWYRs8QxK1avua+jd8u+WMUQxR5mpVPb6tqYDEEW2kqEMSZw3wP6Ut2aDfv4QYkD5hq90EY8+aOIkzTNUidTjwzX/CY68DVwmiRU7zSe3MbA+VdRdcU2+ocw/gyRC4XRTUfQPhpwAvjDswMUDCbOvMul2mIDSaUGFvEAUjGage0X/wzuzbHWRpoxMovN4c1Xw8YZhXk8uZNxUCvFQFWU1Ca/z6HUcaK4s/Z4PvK+5grYhaFa63FL6OJWUglhP9BrjkfZ4EYkDIxkr26hgqrrOy5ilGftgKhJYqC7OfwVILjLhlNo/5SXR9zlCIJrOqMyNsO/MGrmpnIkaSfAmW3OIHH9ejXnRz1fHi0elBbA0OVoD1YvgBzPuT8MPhF5QyZO+pLrDfKa6RjV3C85vCd+GAN3c0LWwSM5lG24vTHvfnclg0qe44EVGCSUtwC7K5gzCSHpyNzOg2ZYnS4BpPM76kJEJmnc/DlysMJgaqDlzHMtE3ssQlesgPCa4LzNetRZGO0gjOciaN3093DwT8GqC2bvj2RIMaeRBW/uPu9sp6g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(1800799006)(186006)(451199021)(38100700002)(36756003)(86362001)(6512007)(6506007)(4744005)(6486002)(478600001)(2906002)(7406005)(7416002)(107886003)(2616005)(26005)(83380400001)(316002)(54906003)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BwSh4lqDUzhgC3yavwwSvn97qkOLyvGztrUKQ4Y62gKhUGBvwCw+n1K2K88s?=
 =?us-ascii?Q?nuCifP7MvTIo68+p5Z65VPGdT2BSAvuOlan+j1fX5GgjKKwG6vOktvxNig4v?=
 =?us-ascii?Q?YGWMBmmYvlDVWZh55nJm71VQJAeMtFligUkWCYHHfLnHucdo9DMH5m1MXlCu?=
 =?us-ascii?Q?SrGYIm4ECEcdTM2uwAQ5cUu3GoahQlelbJrLgp9JRYkHFjSo2jLDXIDY1Sf2?=
 =?us-ascii?Q?MtA+9AkWmSYakxGoiOuchckfjPP7j+A3v0L7DNVRA2LvuiDueSgzo+h3ZN65?=
 =?us-ascii?Q?v+0jMGhoQWdQkQqV8lBHJork91CR0dpAmcI04S/F5XeSmB/axsScttDrxtbO?=
 =?us-ascii?Q?w38xf5ggr3wOLCGP3rAoQIyxuo54/K9aHXhPUlqyTa7Z0ZdJrbWaV/cdAVIQ?=
 =?us-ascii?Q?Zo0JhgyUt866+knXgNj/IChzdzxZ+4gxFc9Y2lmBJPk7c/mD/9J92sO/NpU8?=
 =?us-ascii?Q?rsTrJOtxEz4+7K1rR6VY37v7boPtx2LgRY3rAzoGFLYKZ3y04eqxK6bR8h7e?=
 =?us-ascii?Q?YPyw8s1YOjkMjufIA0JQSIyrFbTKNvfXBIvqJ+z0w3qdH2wRpHh+IwKY3pSH?=
 =?us-ascii?Q?yXMGow7GW0v3fBRpTm1ZxOOyaHvJGMcEN8lhoQkdTUb73NSkeg9jemPw2yX4?=
 =?us-ascii?Q?G7sJ+rAP/S7++pfaUw8DYj0Mm9lIHJWXcDNc/hdOvlveXK2K5VJwd4I5lbEX?=
 =?us-ascii?Q?STRa/uaX22TLHabs6hcaD5P81QqUTMqlv6/UY0TmCEBWXAWlnLaQ6RCWHwyp?=
 =?us-ascii?Q?qa7eb7MkFg4F0gcVK9O991+z4jaFm9ePxvKl3NNzWwrwqbE9eIiY6TnMYmSx?=
 =?us-ascii?Q?Xf/24x9KmeVWpxsX+yRxkA5MBecXfmbVmAPZQHiyJlLCqwn9OQoiisMGQwGQ?=
 =?us-ascii?Q?s8IGQBQ5MNeZo0rP9hzXYhLWPMtBa7ofLJW+BPQnsJow3da8C9lKQhYOyZUF?=
 =?us-ascii?Q?oMgMad+bJCfHnewpvSqGaa7J4pT0vBUE4X9i+nm/hrRqjkDPbY99fhZgjxc+?=
 =?us-ascii?Q?T9xvUQKbq29jhrG84SRaUx4YtKJ8cuYnrXHb/q8ccrJog+WAvSZAWPYcBNDU?=
 =?us-ascii?Q?wKMyfZrp6XYhLXOP7nzrlNVo6U3HQbf01pCRqrLGBZ6OV/k76L5vLwuHddUr?=
 =?us-ascii?Q?upxB0ppomvhe/Bb/iuX1PqbfAH7o0IbM5A9cBcsPLduBPS9OJoDaRfziSiyo?=
 =?us-ascii?Q?XqxvLHsAGpUFvBC/ITC3rMrJEd9VF4EejRLaCgQlJxD0ayK2skcsEDlTHXMi?=
 =?us-ascii?Q?6m7yeky5ivVRQB1D75A0RN/YS/vuFMwjhzD7h/DY1T2+WJ48hI3J9myFMuhr?=
 =?us-ascii?Q?3d8eRpVez+4nWiXrUIU9SLrPxPAi7fydPrgaaLRlqE26JzUMEBG1Q6dMiN3c?=
 =?us-ascii?Q?OIB3zbpWUdTAlX0BYqMlVjh1B4+rQovcfxP4Ze6AqxVGDO4qPbHmpU1Kb24p?=
 =?us-ascii?Q?hn1IE8omiBbX6uiOtKkjPzpu08l3kDymay338h7aS4kjfw135rbLjEOyvkSm?=
 =?us-ascii?Q?64WbubL8rKzcK5ZObAN3LGebeHBIOZkxdQtiGynnuXqMV1OsZRO9WmT37wy5?=
 =?us-ascii?Q?+qtB8DrgnxQOwCjjErsU6x0VuHfu0gBvmHLbL18s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fdf2a8-e9e1-4751-a7af-08db9cdbfab4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:34:42.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiGpi1xC9GlFP+UdJ+GyUePShcJTK8DDABaYIk7UV4XhBX8+Vg41hlkVQnIvQ5Vt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 14, 2023 at 01:08:39PM +0800, Baolu Lu wrote:

> > @@ -989,6 +989,12 @@ static int tegra_smmu_def_domain_type(struct device *dev)
> >   }
> >   static const struct iommu_ops tegra_smmu_ops = {
> > +	/*
> > +	 * FIXME: For now we want to run all translation in IDENTITY mode,
> > +	 * better would be to have a def_domain_type op do this for just the
> > +	 * quirky device.
> > +	 */
> > +	.default_domain = &tegra_smmu_identity_domain,
> 
> tegra_smmu_def_domain_type() has already forced the core to use
> ops->identity_domain, why do we still need ops->default_domain?

This looks like it is just some cruft from an earlier version that did
not have tegra_smmu_def_domain_type(), I deleted it

Thanks,
Jason
