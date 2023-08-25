Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2153F7890BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 23:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjHYVun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 17:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjHYVuh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 17:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE7F26B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693000189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
        b=NaGrv5xDzRiKSyY4xaYCPr3Tue4R0zPn7TSaDR+PKYKYedRZ8K5Orw2QntNF2BwfUWNu/V
        T/NIwXNiZj0D98fmOCpKqJ2StaZNjlQ0DBY9NRjrlD2EeThYSEPmvBCkmORFmLMznOfwWD
        9mFdI3l+jNfi59Mte2ERLe9sbAJdux0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-GO5ZvBH0OzqyqbFBJXvK9Q-1; Fri, 25 Aug 2023 17:49:47 -0400
X-MC-Unique: GO5ZvBH0OzqyqbFBJXvK9Q-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-d74c58a3dd7so1680828276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000187; x=1693604987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
        b=gmqfJKhuJLn4Pu8t6FtvrZR85m7bMknBOIO+kU13knQNcPKU+Yvl3HH4TDrVuUeowa
         5E7t18JiIHwgkZZaZNeLg+QhG7weF0mL2kcvKQWzkeGqedtArGvVIzknXTS345nuw5Fm
         BDJCRtxU2SPWo4nyiH68k4cfe9YezUj+FOfog3aW4qDXQ3ifdafuyURSWhBZWVIHS1Uv
         muRhbQv+5DsSfwxSTsqWrHXe/kqgVGFI2tKwBOev9lw04463WRuApmw6ryVA/8rC0jCr
         lqjWaZ1lNnHWjasydHGSuEmA2AYcvuzBrBS6bfXcUAahwFPM2n0GarlRuiqSbqSC0WUX
         rg9Q==
X-Gm-Message-State: AOJu0YyJrHqDhzTa4VJ1776btGwZTORvRdChnAtKwSTlyLqb0dUIovws
        pFYEamaw5uEWKWFBgMsDYGI2XywWrP8bna1cO3esUI6OwbCgorkokMhNDC6mYHWMH9ekJ7n5MWm
        HZtrEwFwcyTTIzIX6K7JUQfX1UQ==
X-Received: by 2002:a25:d8d6:0:b0:d78:3047:62c6 with SMTP id p205-20020a25d8d6000000b00d78304762c6mr3495310ybg.21.1693000187279;
        Fri, 25 Aug 2023 14:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgZnJ6x3Khmaw73UVVO8ipGtpfGFEkJnwrK/gjpvrarbZH5j/AtFZ9PMl7lOmV6YAsTBEFgw==
X-Received: by 2002:a25:d8d6:0:b0:d78:3047:62c6 with SMTP id p205-20020a25d8d6000000b00d78304762c6mr3495280ybg.21.1693000186913;
        Fri, 25 Aug 2023 14:49:46 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id ki6-20020a05622a770600b0040ff0e520besm770523qtb.35.2023.08.25.14.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:49:46 -0700 (PDT)
Date:   Fri, 25 Aug 2023 14:49:07 -0700
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
Subject: Re: [PATCH v7 06/24] iommu/tegra-gart: Remove tegra-gart
Message-ID: <stzz6hsyx25u5bbkgwftde2jdtjxgb5ghofwfymv2ny4vfbpch@nuli2d2mthaq>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:20PM -0300, Jason Gunthorpe wrote:
> Thierry says this is not used anymore, and doesn't think it makes sense as
> an iommu driver. The HW it supports is about 10 years old now and newer HW
> uses different IOMMU drivers.
> 
> As this is the only driver with a GART approach, and it doesn't really
> meet the driver expectations from the IOMMU core, let's just remove it
> so we don't have to think about how to make it fit in.
> 
> It has a number of identified problems:
>  - The assignment of iommu_groups doesn't match the HW behavior
> 
>  - It claims to have an UNMANAGED domain but it is really an IDENTITY
>    domain with a translation aperture. This is inconsistent with the core
>    expectation for security sensitive operations
> 
>  - It doesn't implement a SW page table under struct iommu_domain so
>    * It can't accept a map until the domain is attached
>    * It forgets about all maps after the domain is detached
>    * It doesn't clear the HW of maps once the domain is detached
>      (made worse by having the wrong groups)
> 
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

