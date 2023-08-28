Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3853E78B982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 22:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjH1UYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 16:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232271AbjH1UY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 16:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DA5F4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693254216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7SWaOyZqAW1ypmmx+bKaDOztNb8uWrADkHnWIObYyr8=;
        b=OinLOCjwWALGe1eN1psO2a+vRev4MlXzozNfDo12nTwm9h8KhxYoRXiebD20x4JYFlyYUe
        GsybjA3jD39E5+u1MztZ5GCsnKHf8A6dxjKmbijm5XHRx9cnEvz1JV5ciCOpRpaw15TsUM
        HJBkJu1vXWTAw1CLolZAnbOf5oB9/24=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-D7bjN3xdN2CiwcnrgFbOnQ-1; Mon, 28 Aug 2023 16:23:34 -0400
X-MC-Unique: D7bjN3xdN2CiwcnrgFbOnQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-76f0b7e3879so226886285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254214; x=1693859014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SWaOyZqAW1ypmmx+bKaDOztNb8uWrADkHnWIObYyr8=;
        b=d8fCkgUpYmrCoHw7juoK0b3gj5QiyAxS48rKX3iUpsFXSU3NSUqulkEQThOMlsd2Yi
         +QsZfT43yK00/UDv1ZmeVpq4U4YlHDeRh46DSvRslo2rjzEaSxKVMMZajl11AxkFnZ6k
         D9BwAQE4+sFf0XQ28gXWkz7qONU2x1n8kuOS0ZxWMfp7jztsXPO4NaWu/wthhdcdyltB
         cinRHy5WBGPc6FLLy/KugbXC3TCDZH3ykDVAQJhcvO7hN5Hg8tTcyNv+DKVdtzk9b87v
         Qgr2Aw29Wya1AoC9b78BeePQdQFL3Pq1UHYHA6vPkRnXoSMvh8gj3hDHghubbHURCcPG
         Eg9A==
X-Gm-Message-State: AOJu0YwYs773nn0OjeGXuHRxLDnpn6+Eboweq61jOEX/gSgvtxCz1XQx
        o3eR1vJmuxJMmojQTfaUV4MPMEhq8tdcQMOskSSSMyrDNqREMyZl5oepcnlCBT/mznd1Mu0m0ik
        BcnwAWgjn0LYRwMHgwrKZ6nIzTQ==
X-Received: by 2002:a05:620a:444f:b0:76d:b0d9:8714 with SMTP id w15-20020a05620a444f00b0076db0d98714mr26208232qkp.5.1693254214075;
        Mon, 28 Aug 2023 13:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOGXo/skhCWFBeQ+UjSUbgbXxxw2vI3Xem+7mdhyD8WFWDReG5aEYLekTiVlVTA/jMtEv3Aw==
X-Received: by 2002:a05:620a:444f:b0:76d:b0d9:8714 with SMTP id w15-20020a05620a444f00b0076db0d98714mr26208198qkp.5.1693254213880;
        Mon, 28 Aug 2023 13:23:33 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id pe40-20020a05620a852800b0076ca9f79e1fsm2608267qkn.46.2023.08.28.13.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:23:33 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:23:31 -0700
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
Subject: Re: [PATCH v7 10/24] iommu/exynos: Implement an IDENTITY domain
Message-ID: <p4rskudydgzbrgdhod2jiv7ksj2a2pxopsfnbvc6jfxtay4oaa@x5xu6eiqfpl5>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <10-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:24PM -0300, Jason Gunthorpe wrote:
> What exynos calls exynos_iommu_detach_device is actually putting the iommu
> into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c | 66 +++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

