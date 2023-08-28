Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCAB78BB6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 01:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233836AbjH1XTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 19:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbjH1XTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 19:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ABC10C
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693264701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=;
        b=d6xNKgjlS9CH+ZuDN2utM1wWpXH3ZlAI9xdkvTOfQIWcTqMw4skyDDlOOhYdAQb2p8cH3E
        HUuCIaRrcRI46Wy/wxnzsy+QF1nYctYE+NZzVopuwie0mEKBXe0xaW4PvPRsiGBaMrEWjs
        7s1JRMFM8lPK/cAnNEH/50XxrgwRQSs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-lnU4kL2dM5yr6jGKHlSDuA-1; Mon, 28 Aug 2023 19:18:19 -0400
X-MC-Unique: lnU4kL2dM5yr6jGKHlSDuA-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1bf58d92bd9so38618115ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 16:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693264698; x=1693869498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=;
        b=loTNRn3MJQpdlkDaK0sc5S3ljxQfkTrHSS3iArKEYPCLkYPz2mxi1fCQKcvrwJpCeY
         wqlK32SsnrBCoyECZyx364ZYlJRpuU3BhKZ3pefjXfroruMbrjUroliqOjKOrrzyCO6k
         CRFm2blGJQ+WUojj0q1Fow6xRfry+iPMyE+hwwpcUVp6oJET1VWSUz4vxywHe6KiYqO2
         R/0qhb7JbydU54nqYft/9lOmVPJO4jgrGZ7EOUENH0bXmcpfl4CdkjnjRvcRN507Aykt
         DFef2xBbpb9MMUPoXAgKvZJGcu4MC9hZvIWrm6f0+TqfM1ZmKnIsYwy5kGYIvKAMNWn3
         pDIg==
X-Gm-Message-State: AOJu0Ywu+G+c1nAv2M36OgZr0K+/oDX7dRlDPvrn5AkFSjfrc6C68UqJ
        WiFbbla46RLNbZ8O58KB1qYOmKxGteXAgyYQW7X43suoR7122u7o+35cUTHUQfBc5HtjSczhj4Y
        oOxbrldWtRlkynK4ftfDNGMo0Hw==
X-Received: by 2002:a17:902:ea08:b0:1c0:a30e:2388 with SMTP id s8-20020a170902ea0800b001c0a30e2388mr17734008plg.31.1693264698549;
        Mon, 28 Aug 2023 16:18:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4PLIDBi9wZuEsVkyH1S0PFnZ5haeuWus0luN/Yrn+a4DV04N4xayoEkUTdP5JJP349iuJ+Q==
X-Received: by 2002:a17:902:ea08:b0:1c0:a30e:2388 with SMTP id s8-20020a170902ea0800b001c0a30e2388mr17733983plg.31.1693264698231;
        Mon, 28 Aug 2023 16:18:18 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001b53953f306sm7947728plg.178.2023.08.28.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:18:17 -0700 (PDT)
Date:   Mon, 28 Aug 2023 16:18:16 -0700
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
Subject: Re: [PATCH v7 22/24] iommu: Add ops->domain_alloc_paging()
Message-ID: <6wbamqxazr3yxu25haul2vcbyt5da5py4i2pemga77pg74knov@htfe53txxkzx>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:36PM -0300, Jason Gunthorpe wrote:
> This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> domain, so it saves a few lines in a lot of drivers needlessly checking
> the type.
> 
> More critically, this allows us to sweep out all the
> IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> drivers, simplifying what is going on in the code and ultimately removing
> the now-unused special cases in drivers where they did not support
> IOMMU_DOMAIN_DMA.
> 
> domain_alloc_paging() should return a struct iommu_domain that is
> functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> 
> Be forwards looking and pass in a 'struct device *' argument. We can
> provide this when allocating the default_domain. No drivers will look at
> this.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 17 ++++++++++++++---
>  include/linux/iommu.h |  3 +++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

