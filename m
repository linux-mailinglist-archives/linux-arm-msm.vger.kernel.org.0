Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA55178B9D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjH1U7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 16:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbjH1U7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 16:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D67C12D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693256315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
        b=YwyTtnesoTqWDIxeUTe+s9TIjKizXl9FLO7J1stvvXh7hlDgWm2BPbsJb+33U+trc5EtYV
        0XR+I8p3e9nodMkuL/c3r76iXGYS27YskPuikB2rHd6Muzlurh6Os5CdVgSrXES/TTv3C4
        WoaD5V+Wab+agO/lwTxWHrmBSiiVDz4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-bvX9NW0SM2i8dA7ncVUNGw-1; Mon, 28 Aug 2023 16:58:34 -0400
X-MC-Unique: bvX9NW0SM2i8dA7ncVUNGw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41230af5721so6334211cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256313; x=1693861113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
        b=i2b3mVQM79RZMYYs1vzZd00ECRlQc6rKWjGlbp5LN3qaXhNTa6CgEY+fM2xfQ/rH5x
         HtGi++rKUKgQUKLkqw0xvOUdXTFjf+P0APRsAgh5etKzTlX0U0yeK6+YaL4eVnt4YWJD
         HuphBfNH6jbwDFSV2qCSrbDw+YDMkY3qx5+Df2Emvs1thfmS7YS3+1n+7Rx8Z8DZpC53
         4pt+wIUnGnBYVDWE/zZn3mYjNCP5Srj1UmczmoA0KnX4xn+cLUsKdoSXWVL9VSQTgEIn
         RzeDPbssAhF3HeCtbFUcZAeW/Ysl6+XIXLNkE+VkM1lBnIF5MDPtG+28nhvx/DKEWAvW
         HbWQ==
X-Gm-Message-State: AOJu0YytkkhefGjEohQu7sno9Dx7Q2RN1eZBu9zi+/IlPXpyy5mT8dR/
        X3RdBridKJ0wcRYbLaRElzgf6Fo8Boe/nTc3kf3G1Xv9Fn8sf26Nca+wyB9OsEW0dM1oAjmSMCS
        4ebq0L2LOvlagigtigiBfqr47Cw==
X-Received: by 2002:a05:622a:12:b0:411:f7e6:3be5 with SMTP id x18-20020a05622a001200b00411f7e63be5mr18754106qtw.30.1693256313488;
        Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqzxLWZK4Sb4/58FxlbaHsUgrMjm1Fc7pMUPbHePKpRNp9fWsIa9/KWnDi5jm+4pqQWfwb1w==
X-Received: by 2002:a05:622a:12:b0:411:f7e6:3be5 with SMTP id x18-20020a05622a001200b00411f7e63be5mr18754084qtw.30.1693256313282;
        Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a11-20020a05620a102b00b0076cf49bcb50sm2613298qkk.37.2023.08.28.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:58:32 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:58:31 -0700
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
Subject: Re: [PATCH v7 15/24] iommu: Remove ops->set_platform_dma_ops()
Message-ID: <6thxe2cqyfs6czmd63a7ompjpvkv2c2aestp7almmk725r5ivd@2lmwtzyfylmp>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:29PM -0300, Jason Gunthorpe wrote:
> All drivers are now using IDENTITY or PLATFORM domains for what this did,
> we can remove it now. It is no longer possible to attach to a NULL domain.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 30 +++++-------------------------
>  include/linux/iommu.h |  4 ----
>  2 files changed, 5 insertions(+), 29 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

