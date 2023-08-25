Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285BD788FC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 22:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjHYUZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 16:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjHYUYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 16:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB022129
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692995031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6UBqcsz+qyHMazVNsnwC+GgF7rp1trrk3H8y0CxPC4U=;
        b=h/IiRGuHzZzKuF7AeqrNzrlcYnWBY9ijKnSCsySjI6ejiJL170XTlomgMvf1CPPZLXTPTI
        kTmD/cltb3QDNugiaDR0gmcsCO6WVKHawqHnal+N0NHunjoJWbhdS+bYD8FLKWSnVpAqkA
        EIAdceJGV461QgRB1yxUggtTeTYnntA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-KvaV0zp6NT-HP-brOD_mBQ-1; Fri, 25 Aug 2023 16:23:50 -0400
X-MC-Unique: KvaV0zp6NT-HP-brOD_mBQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64f39876f01so15278536d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 13:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995029; x=1693599829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UBqcsz+qyHMazVNsnwC+GgF7rp1trrk3H8y0CxPC4U=;
        b=jmTuuiyu2KpPReQ3aBKEUAaEHuJHdUJlyyniJKIKU5cYnVypn+fM3Ax+tCbamVWsXl
         7GAIOwQ6dAcAeDfTXqL5tusJV6xzuC03yH5npfzjo0Hr2iWeLrNM7lnQm7gCZqYt/SJz
         xXS0+ukrJDtuKfPPoyxD58r9Jk4MdPXTe/HTVHvbnYpJCYiAcd1fKLw0skcx9cgzKaNB
         FFOa/xoXWceCMvs1MOpu91mxFBLj+XqmLZUDc3psE38ozMKKf5KW9gvz6gvEzZl6A2lS
         jyYkJ9+W49eGCbQtR5mHOI0BUUGGi5wlY64lWu+mya/w/ub01XF+LQmpjDNsu5RMM0hR
         ungg==
X-Gm-Message-State: AOJu0YxzN8eHrWDvsnaAFIqVJwrbXYdESi6sR9vsF+6tP70d3fX+vN4I
        ZHfNuocSPE0r5/7XhJIEncizRCAyZ7FD6xm2oKQRH2WKoqKLZWghdZzpNFwjlGa51tMpiCVUv/p
        mH1G8e3TfbB+44NbtcGBozPGtag==
X-Received: by 2002:a0c:9c06:0:b0:64f:3e2d:93db with SMTP id v6-20020a0c9c06000000b0064f3e2d93dbmr20305584qve.6.1692995029622;
        Fri, 25 Aug 2023 13:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhcq54IOGRl9sNdHkLdvPnzpjB/PihT5afG6dr52Z2uB4cbUOhKAsFPETyVjj3ta3v5KMJ7g==
X-Received: by 2002:a0c:9c06:0:b0:64f:3e2d:93db with SMTP id v6-20020a0c9c06000000b0064f3e2d93dbmr20305555qve.6.1692995029386;
        Fri, 25 Aug 2023 13:23:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a6-20020a05620a124600b0076c72dad35dsm738410qkl.63.2023.08.25.13.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 13:23:48 -0700 (PDT)
Date:   Fri, 25 Aug 2023 13:23:47 -0700
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
Subject: Re: [PATCH v7 02/24] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <uwi23vasgop7nrnrvalquu6e4jepyiub7aopj7bcgiaw26zx2x@xslngjsllztb>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <2-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <hbmfqpq2oyjjz3loccfbslpalzhlsyr2w3bpx6qasq23kyrfso@e6kry74ifgnt>
 <ZOjneiqLzRRD7ulL@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOjneiqLzRRD7ulL@nvidia.com>
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

On Fri, Aug 25, 2023 at 02:40:10PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 24, 2023 at 06:51:48PM -0700, Jerry Snitselaar wrote:
> 
> > > +	/*
> > > +	 * Allow legacy drivers to specify the domain that will be the default
> > > +	 * domain. This should always be either an IDENTITY or PLATFORM domain.
> > > +	 * Do not use in new drivers.
> > > +	 */
> > 
> > Would it be worthwhile to mention this in iommu.h for the iommu_ops default_domain?
> 
> I did this:
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 11d47f9ac9b345..7fa53d28feca87 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1757,8 +1757,8 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  
>         /*
>          * Allow legacy drivers to specify the domain that will be the default
> -        * domain. This should always be either an IDENTITY or PLATFORM domain.
> -        * Do not use in new drivers.
> +        * domain. This should always be either an IDENTITY/BLOCKED/PLATFORM
> +        * domain. Do not use in new drivers.
>          */
>         if (ops->default_domain) {
>                 if (req_type)
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 7e9d94a56f473e..6f9e0aacc4431a 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -267,6 +267,8 @@ struct iommu_iotlb_gather {
>   * @blocked_domain: An always available, always attachable blocking
>   *                  translation.
>   * @default_domain: If not NULL this will always be set as the default domain.
> + *                  This should be an IDENTITY/BLOCKED/PLATFORM domain.
> + *                  Do not use in new drivers.
>   */
>  struct iommu_ops {
>         bool (*capable)(struct device *dev, enum iommu_cap);
> 
> Thanks,
> Jason
> 

For all of 02/24

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

