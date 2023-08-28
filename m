Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A4C78BB72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 01:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbjH1XWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 19:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbjH1XV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 19:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1B2CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 16:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693264872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2tY2O409yN5fYvGoN8/JrlRj7FUk0pOGMULUjvQaUpg=;
        b=Gg4UGtu8YZcMeEQJKO8+0Ms4vYsbn75bO8Maf8SRoFNpK2ZZYPu3o1C4nODhYmjMGW/uAM
        LLxLC674MyP2U+63g3Dc3hMjncJySolSwzyZKiV0sVPKnSTArIh15eiIbflbF/ZgG6so7E
        ESZkv1481/1BZAjWjJOQRDOWWXX4yM0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-fsK69tEoM4StRvSPtSi5yA-1; Mon, 28 Aug 2023 19:21:11 -0400
X-MC-Unique: fsK69tEoM4StRvSPtSi5yA-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6bc7afd0498so3912369a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 16:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693264870; x=1693869670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tY2O409yN5fYvGoN8/JrlRj7FUk0pOGMULUjvQaUpg=;
        b=TU/x+hK3vXfrq6/nyfz8AvbMQnq3W3XJwqD4yXLSUPyolemkGNkUHuBXwOFlhpgZQs
         BnjUKgxrtXOJVa5hitTH8bcVE1p1y13PpcA/G2PcCXgsb7VfdplLluvpmRz/c/Jm/9Nx
         uQYdQ9RpHoV4OtYvBAWA7NpGvdpMwpP6hA3a8d7DeD5haohATSpRvqPS7d9tek3o3U+u
         3DRUbX4xKJlyV7wAUothPAS22fYqP2sML4gmmnBRWBjt2WF6kz2Vfy02F9h/I5JAnCke
         L3VwnfVieLWmtoMiEeR+u4WzLQzNgR7Pumgb/qIKq+oeDtd55goL2FeXcQjjeuGS2NUR
         rlRw==
X-Gm-Message-State: AOJu0YyoMNnNIIDEs+dTBymap1nW/B58BbAbQJj9+xlOcT1eC8i02Lsa
        OcpKsIWmhtqslsWCUO32AHOdpqKcOiOoWI+abBw3l0bsICWr7L3Mrs7nEG0BV4pYvqvdJkjy+Sg
        ObkYkBf0E5gUAAUrogPExkMtjPg==
X-Received: by 2002:a05:6830:1e69:b0:6b9:6663:4648 with SMTP id m9-20020a0568301e6900b006b966634648mr15282033otr.3.1693264870371;
        Mon, 28 Aug 2023 16:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP5/EEWHTR1bez5m3Juu4cnUjVIKCsfQBSYEYoBbAOKOAwmWfu7HwgfLHfFstKObHsFOXoGQ==
X-Received: by 2002:a05:6830:1e69:b0:6b9:6663:4648 with SMTP id m9-20020a0568301e6900b006b966634648mr15282011otr.3.1693264870175;
        Mon, 28 Aug 2023 16:21:10 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id e29-20020a63371d000000b00565eb4fa8d1sm7893911pga.16.2023.08.28.16.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:21:09 -0700 (PDT)
Date:   Mon, 28 Aug 2023 16:21:08 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
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
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 23/24] iommu: Convert simple drivers with DOMAIN_DMA
 to domain_alloc_paging()
Message-ID: <hqpyajmraabu5hwhprghy43p53f4qjwdux2job7bv3ss4mijuq@2ov4rd6ppqol>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <23-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:37PM -0300, Jason Gunthorpe wrote:
> These drivers are all trivially converted since the function is only
> called if the domain type is going to be
> IOMMU_DOMAIN_UNMANAGED/DMA.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
>  drivers/iommu/exynos-iommu.c            | 7 ++-----
>  drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
>  drivers/iommu/mtk_iommu.c               | 7 ++-----
>  drivers/iommu/rockchip-iommu.c          | 7 ++-----
>  drivers/iommu/sprd-iommu.c              | 7 ++-----
>  drivers/iommu/sun50i-iommu.c            | 9 +++------
>  drivers/iommu/tegra-smmu.c              | 7 ++-----
>  8 files changed, 17 insertions(+), 40 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

