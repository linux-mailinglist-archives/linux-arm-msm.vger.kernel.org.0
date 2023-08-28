Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0A578B9BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 22:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbjH1Use (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 16:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbjH1UsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 16:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F789113
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693255635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
        b=XC91y03PGZR0HvAzwBnNJNT4SwBDgT6GqHgpkCIB47BajQN+3tTw4IVMe77wJWjMgxgnCG
        OtxLC/kqhBUVygdGOtgAOsXDV2Iy1YGsTNdFOSjKtaTrThueSDokaFEELpM/0XGGOAdtgm
        n9f5EVj0O+URltOLMjABUijFQY3Al4Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-b6ZeKHdyNJGen2lfNZ3VyQ-1; Mon, 28 Aug 2023 16:47:14 -0400
X-MC-Unique: b6ZeKHdyNJGen2lfNZ3VyQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76d882c4906so461433685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255633; x=1693860433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
        b=hc9G0g4PjSxF1qpEjy3auMPUu4y+y4DVOf0DAuGhd2OQGYXnKTYZdDCZwvywfFAFSv
         1gY3MIyjKs7HBUmv6lDsxTaRlTzh+ZdKzwhCZiWxg+S5bo4TZh7PRQEriMlJRtlHfkr/
         9MSDiI+6HReHCXZmBesTAoeG74zk/O1iQxFCO3HD3rKhzw8wmhMOm4cjveu6p5nYBAst
         nCfANNOoMCnjJ0t7k6MOrHf+wYfpn/hsiGJmSggXjrjXunu9hv3dYoSCusv6G78oGAhS
         0YWnnC+GpBiBTe14m5BOF7c85rUGgKKeeilp0d7TzPRJnYUJlNxHHQgsiipzZ+uVhjly
         QugA==
X-Gm-Message-State: AOJu0YxTnORHGoztS14wQUbTXyi5OtO/5AYfQs1epXy3kTE6WaH3IB/U
        ecNHAEyGtS7+WB5L2Rn/ScituOrycczE3TGq7bOBhUDSQ4neetaaVxCRyZEzM6VFn35oYJyZZu1
        9cYU6nb78L1JrEfH5k3ARnQEGBQ==
X-Received: by 2002:a05:620a:4614:b0:76d:aa3b:ac9c with SMTP id br20-20020a05620a461400b0076daa3bac9cmr24655249qkb.46.1693255633378;
        Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwVuI8ZPuQEBsqBHLA4mM96XswCj3GuW2ha49h3MQX3EuB7tqhbB8UeA/K6lT7Jvy4c0Wwkw==
X-Received: by 2002:a05:620a:4614:b0:76d:aa3b:ac9c with SMTP id br20-20020a05620a461400b0076daa3bac9cmr24655228qkb.46.1693255633141;
        Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id g9-20020a05620a13c900b0076db1caab16sm2631338qkl.22.2023.08.28.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:47:12 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:47:11 -0700
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
Subject: Re: [PATCH v7 13/24] iommu/omap: Implement an IDENTITY domain
Message-ID: <242a7ntgcvqofkvw2aapftr3pgczpueam3beyr4qey5mgx2rh4@odjyxtbbscfz>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:27PM -0300, Jason Gunthorpe wrote:
> What omap does during omap_iommu_set_platform_dma() is actually putting
> the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
> compiled on ARM64 either. Most likely it is fine to support dma-iommu.c
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

