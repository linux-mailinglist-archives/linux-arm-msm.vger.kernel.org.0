Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A66F5CEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 19:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjECRUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 13:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjECRUU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 13:20:20 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3021CF;
        Wed,  3 May 2023 10:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/tMF04KIzQ1pc4mpae2AeedhvsQ89ShEgyUyxtm5VDyPnG0gLmVLX7x6n5jUEqvMLN2Ip+D03I25kZZYzgf3pxbXnOLAiOxO2PtzUI6dwo5lgMNOFClaHC30r5e4oxsTWancIfRrKW128kQbZ57zh1MzHMq31Lfiw3CM2HkVHOr6sBox5hFFa0LhzfVdRzmV6ICkVLJAVF/DOXrI0z7ryDTGqnx7wIHZZYnnymX/+Jh3n8CuVB7af0M/inWLS3E5PUWGeDDqY0bvvmFrhi+QU8FXiI0fjbl9fHQrxXWWSTMvGbhmpTf0chjov5uUJAGYRzG3nRvz2vHCeHnQez9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA9piRNbsFy/TB9nCuK2s2w2LXtquvXHc3J71OJskOw=;
 b=aiw/gDnvETpbBhKvFRYgZxs2F5iihqWEhcNDhuPMDX/h+gkKY0x/rIC+li/dB2wz4NQNz5DDOb6NpEBewS8scMjrIakYStC43xDys3RR+xNOYLQ0FY4YJy01uLmTHz3KZ7g5iR52tvN/M+21HSUggdsG3adjH8sR9iP42q7yKvCbge+NfYnEMSx3yhCCyqBV+ByANS/UGZry+w8yxtxvt7G3b26Pn823HIZBGBSYYFggIWQv7vd12Cjzx+ikB/jAJhGKFLV5tUmMOG/F5TpB2Sj9D5FXBdVuE8jDvi0L1dIy/7jLtUZT/BvenXweVbuGg4WLslacKDxnSQ9MuUpEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA9piRNbsFy/TB9nCuK2s2w2LXtquvXHc3J71OJskOw=;
 b=rhRE3dmLoZ9gG9Mw62dLxUYoiyW8TtHCdjS4kQOPUdNFz7HqtC2egEa0cWYx8FLk0tTg1W7lP9ZaCdCLG8L81AYcv3s3jlGFcou6LxIwvRFcn5NZ7SeeAFXM2OGtoTNdJMv4BYKHWVO4irkvojN73xGzNa5LTOImcvoErFhen+LoHOngLzQ6axPjp2cYa8DI40mcAklpAJyv9Q6DBzh5BCHG99z/ySacr7jHrW/1oa3EhLON8AGOm3tA0CjfU60VTvKVrhq9LdKs/T29CdLh6aA6xgh8c/Wq9FpgI2j0GVaQXOsmLQmXafKqx7eHycaaa50J9AB7ZO+a9Q1zSoe/pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5236.namprd12.prod.outlook.com (2603:10b6:610:d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 17:20:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 17:20:16 +0000
Date:   Wed, 3 May 2023 14:20:15 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>
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
        Niklas Schnelle <schnelle@linux.ibm.com>,
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
Message-ID: <ZFKXz/HWFkYOJrgT@nvidia.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
 <ZFI/D6mnLKYpdIqx@nvidia.com>
 <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
 <ZFJlZ03lswl9uHD0@nvidia.com>
 <ZFJzKQcKNFHdIWqy@orome>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFJzKQcKNFHdIWqy@orome>
X-ClientProxiedBy: BL1PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ef5a25-09b4-418a-221b-08db4bfaa998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yL65eIZpcIWFTrR+XzwpU6wOVzpvmDww/UdiLT86H5RJ51pkVx+iQChfY25kA66WKy6BKkhlw8dy9jfunhehRMrZKS8jiOtMpI2IqeQWj32qUFUqyerKfnO1fpKc+HVgccuHcnZ7mQfY7RKZ1q7JzD3baw9Oor9UsiSY3USlTVhtUVhPB3iOy1al99ggEclWeDBKQUKo2nrKalWVMFBwJxZPr4x+/irA/mZuMjy4BjCooWK+SYpmBkM8MKqpywIinoK3rPtXfkl4yxbhrEcUoTQC9GT1tHv7ZC8dTDfZ/tR7+JhJcDBKlmuTLqOvkwylOy+N/Mm6gpallo7RMfMvupm0oYW4nFdtFYZNafGnPhbEC1o+ODqOUOMFg4GZZ2fUAjOS1Xa4IpBRIX/sQbCyv2z1u/Sn6S1c2l5wG/+BLG51q1BsAdHobgdh87rTBKdsgOUpKqB2FJPd/NsvtAWDcrLiXPNfAarZ7GMbRtpEW6SGIFxwx1GrsfWiTKFFKl6G2m20TXOzjTjUpmVokSEQCwZQv8phUTOMwWChhsntINobS8USoIzi5aCTSVbazn+M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(478600001)(2906002)(316002)(66946007)(66556008)(66476007)(4326008)(6486002)(36756003)(186003)(41300700001)(6506007)(6512007)(26005)(2616005)(110136005)(86362001)(83380400001)(38100700002)(54906003)(7416002)(7406005)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3T0kEAaQu2xYSUQCpMUTENoPAFLCaQoTmF3u79yKkOoo4luhzbGOzpc4NA7p?=
 =?us-ascii?Q?iL7XaE7AUtJYrosSmSZ9jYrtvMaJuDCLfgF0uP9ELtGViEkl+r+lfDjUNEiW?=
 =?us-ascii?Q?4aWIkilhxrfXQwe+TJiHGQghbzVa9fWulDt0mvqxzfEFGEn+XeA8f1P3tKXf?=
 =?us-ascii?Q?ofgDJvZ2Vbaq2qcUWNtazA72muO3NJgnhU+3qjVoy6g2Iws6b6iEDjJyDRer?=
 =?us-ascii?Q?Fb6guluIGKNQQHXnbuiQMabfo7J7P1364q2JijCqqo5xB4WZ7DUPVotq+GKN?=
 =?us-ascii?Q?bnalnFFz8XA+gKuzEvBpoHs871IXtFoEBLXAw7Z3yb4MaFKqLjK48TCL8HR8?=
 =?us-ascii?Q?LEei5iu7G1pth/6SzGUWZ2WdUU8oCGrKwHFHA/hSeQOjfiTGjByeFF52115g?=
 =?us-ascii?Q?jyGkDej2hzURUVd+a9yCmweGQcWPSqVJWVip1iunGOmHjK24Fqm8NDVL7ADg?=
 =?us-ascii?Q?nlPZSobK4Xl1+7nOhKV7R9bxyxQyRX+WNmznWCXNkWqX32MBc7kcJAzbB/pQ?=
 =?us-ascii?Q?Utxt7RQMV/g26tG0bZiTKvtecE4igKgnLIrEj0Sj4emhOZMviD5z/AECAgGz?=
 =?us-ascii?Q?sBvkusnmP8NjF9oyixBK/txLEzK206fezfV4Xy9byUn2W2l0aJbZfCHl9eR7?=
 =?us-ascii?Q?YP+qSf00L1Fv5zxvOfIr3PzH7qgDKQ+JOp2jIpvKuHIl7hYPetjHe5+IgW8U?=
 =?us-ascii?Q?s0kahezaMANdFVktV+HzquvjLUojzXLLHAmtSIfetbDVBNHdXCGRiemaWSsU?=
 =?us-ascii?Q?0nH9AjNtwKhENgx3ekPaxxfJj6cAcDMyvanywNaZK/azcz8RBE1eisDii+n0?=
 =?us-ascii?Q?J6R1B/zSB4yywNmbBm7fkBkEC+OOnfPCgAcM/l/IwFP16X863Ts+eHSw4jrC?=
 =?us-ascii?Q?Jxy8VtMPcycSOrENv1s7tRtdUCwjsiMDtLw6DkKPc/q0vQQo5bMoo9stI9uD?=
 =?us-ascii?Q?N7JR6n9rNNv3OISI+PVb4e9nsbW3cqpkESpu8GovWKmop8gkRAjgGXIto8AK?=
 =?us-ascii?Q?a9MAKVZQ/nArgSwXRwyoLNjr9nuSpkEZvrznRhH+s7nfUvJqG+sbr1YvW4H1?=
 =?us-ascii?Q?UIjC6hcFirD0nBUSI2j8CMkm7zoGUSINd9EyXBX29qL+Mx2PtEVAH70gNAO7?=
 =?us-ascii?Q?Ett9jGtUb1noG9jV2JV8rPSXTxlnf4KOgdx2xy7kkKcaLujKG8lndtxIQCvs?=
 =?us-ascii?Q?QkEyyi/vo8vdfjgGst6dW0/Lzpsw7DTPZiRGxgVoZSvGLY/BVDokDO9JDjDs?=
 =?us-ascii?Q?OQOQapxsUgthpGQmSTsvMCvUqjucs+WNnJgHE90sCqsUrh+n5y/+PQ/XGILc?=
 =?us-ascii?Q?pBzk0V24zdffMtaXwKGm9vyVmP1edel/qh8LbMT+OUt2YxwilMo6kkRk3H9f?=
 =?us-ascii?Q?LT6unHJ0cfSDb7o4GCynI4tuglFnz68Oc4qSBSk6KrA3ECUVY3TASPK5YdZQ?=
 =?us-ascii?Q?AGVcA/GhleLwconBIRedlgVA7VwFK51CWoe+AlOBlEan1cmhn/DNenkQzLlR?=
 =?us-ascii?Q?XR7vZY+1TJQPGRvpwk83t3OFpYxhzjc17kBkC0D7JB5OQkShYznmu6w9Muv3?=
 =?us-ascii?Q?Pv6l8JtU1GFXf4VSGux6MxxXGr+y66IVN+NyxYMm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ef5a25-09b4-418a-221b-08db4bfaa998
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 17:20:16.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siUFPYCXrXFFi0BlLecAhJTDGFR/lTdPrZkiUrY/FIkk/PMCe3P6WlBmW81z/BD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5236
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

On Wed, May 03, 2023 at 04:43:53PM +0200, Thierry Reding wrote:

> > The only thing it does is cause dma-iommu.c in ARM64 to use the
> > dma-ranges from OF instead of the domain aperture. sprd has no
> > dma-ranges in arch/arm64/boot/dts/sprd.
> > 
> > Further, sprd hard fails any map attempt outside the aperture, so it
> > looks like a bug if the OF somehow chooses a wider aperture as
> > dma-iommu.c will start failing maps.
> 
> That all sounds odd. of_dma_configure_id() already sets up the DMA mask
> based on dma-ranges and the DMA API uses that to restrict what IOVA any
> buffers can get mapped to for a given device.

Yes, and after it sets up the mask it also passes that range down like this:

 of_dma_configure_id():
	end = dma_start + size - 1;
	mask = DMA_BIT_MASK(ilog2(end) + 1);
	dev->coherent_dma_mask &= mask;

	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);

Which eventually goes to:

 iommu_setup_dma_ops()
 iommu_dma_init_domain()

Which then does:

	if (domain->geometry.force_aperture) {

And if not set uses the dma_start/size parameter as the actual
aperture. (!?)

Since sprd does this in the iommu driver:

	dom->domain.geometry.aperture_start = 0;
	dom->domain.geometry.aperture_end = SZ_256M - 1;

And it is serious about enforcing it during map:

	unsigned long start = domain->geometry.aperture_start;
	unsigned long end = domain->geometry.aperture_end;

	if (iova < start || (iova + size) > (end + 1)) {
			return -EINVAL;

We must see the dma_start/size parameter be a subset of the aperture
or eventually dma-iommu.c will see map failures.

I can't see how this is can happen, so it looks like omitting
force_aperture is a mistake not a deliberate choice. I'll make a patch
and see if the SPRD folks have any comment. If there is no reason I
can go ahead and purge force_aperture and all the dma_start/size
passing through arch_setup_dma_ops().

> > Thus, I propose we just remove the whole thing. All drivers must set
> > an aperture and the aperture is the pure HW capability to map an
> > IOPTE at that address. ie it reflects the design of the page table
> > itself and nothing else.
> 
> Yeah, that sounds reasonable. If the aperture represents what the IOMMU
> supports. Together with each device's DMA mask we should have everything
> we need.

Arguably we should respect the dma-ranges as well, but I think that
should come up from the iommu driver via the get_resv_regions() which
is the usual place we return FW originated information.

> For Tegra GART I think there's indeed no use-cases at the moment. Dmitry
> had at one point tried to make use of it because it can be helpful on
> some of the older devices that were very memory-constrained. That
> support never made it upstream because it required significant changes
> in various places, if I recall correctly. For anything with a decent
> enough amount of RAM, CMA is usually a better option.

So the actual use case of this HW is to linearize buffers? ie it is a
general scatter/gather engine?

> This has occasionally come up in the past and I seem to remember that it
> had once been proposed to simply remove tegra-gart and there had been no
> objections. Adding Dmitry, if he doesn't have objections to remaving it,
> neither do I.

Dmitry, please say yes and I will remove it instead of trying to carry
it. The driver is almost 10 years old at this point, I'm skeptical
anyone will need it on a 6.2 era kernel..

Thanks,
Jason
