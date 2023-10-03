Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2B37B6442
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 10:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbjJCIeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 04:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjJCIeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 04:34:24 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B8EA3
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 01:34:21 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59bc956b029so7989697b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696322061; x=1696926861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=;
        b=Nnyho37JLe/shXs59RWxP0LFbzenNiR7+5J+u4OAHOuBBKhQn1bK3OeFbKaCNYd6z+
         ve2ZdPw882VgiWs9bqNMe7MmlrKBvyPeaFeU+Y6HmdCxarKB+Y6yMgCFv1mv9R6lnP8h
         G8SBMa316LXAo4KbAezbxDHhVuZfO/O7ohK5Vjd8qld5xA3ea604mL/48FE5FeUNJ6le
         YW6TQz4u89BmIde+aETFaEPCSvhUNfD1xzrcE9riCiWQIZbnLsDzWqTgcgFE4wLV+CQx
         XfLYhOsNt57SLwhwyA41vZ2pmtff3203+Hq/OZnPPuJNbUl1iX1V2bJK9JvCtnTzs8et
         O+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696322061; x=1696926861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=;
        b=d2Mg9c22z7BvWQJAOu4HBmIQOjG53w+vpAWJtkEnh+V2Qi4sB+hiOElSkP5VZ/cW3I
         bjXRLsgsGbUMRDtfG06l2batnlspwwZZTLZfjPpejV6IbGaLMOJ4rEXRfrLfFZoto8fJ
         L5KZUoBiU0a26231OcWNMKf4Rrysr/vgnf+cpBwkKpgnwzjTpV17tUkUPLv5hxQr7y54
         eK1j4LoqG4hBF+IVn02hXesnkKA6o0GRBA6CxXiU8bJSlXPInI8LdSYohHsrEfibOy10
         bpwISIOysqg1F0shyLSF6HSrruMnpO9notMhahdQI/FCKcLjzPo0L4Ntbuz0On4naSQY
         B6Vw==
X-Gm-Message-State: AOJu0YxbLIEnnsAP65MY/P8jawESRtH8UsBCSFgCPPVYWzOtgymkpdcU
        XS4CcCHCZKkXWALP+6jvt9egAgsRrVeL3HXHK9ZSvw==
X-Google-Smtp-Source: AGHT+IFDzIQLW0laXGE7JKd6lbdhFAMnDeThlxxmtoO8UChMspJgCI8sx/aRikQspuJgbcSRJHW6nrx+DUBW3F7ngjs=
X-Received: by 2002:a0d:f685:0:b0:59e:8f6d:92e with SMTP id
 g127-20020a0df685000000b0059e8f6d092emr14665847ywf.49.1696322060718; Tue, 03
 Oct 2023 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
 <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com> <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
 <20231002230000.GA682044@nvidia.com>
In-Reply-To: <20231002230000.GA682044@nvidia.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 3 Oct 2023 11:34:08 +0300
Message-ID: <CAA8EJpr-CpgTVipd_t1uj7iHHq6__pj3mrm4Mn-pdZwhpS8aDA@mail.gmail.com>
Subject: Re: [PATCH v8 20/24] iommu: Require a default_domain for all iommu drivers
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
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
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 3 Oct 2023 at 02:00, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Oct 03, 2023 at 12:21:59AM +0300, Dmitry Baryshkov wrote:
> > On Wed, 13 Sept 2023 at 16:45, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > At this point every iommu driver will cause a default_domain to be
> > > selected, so we can finally remove this gap from the core code.
> > >
> > > The following table explains what each driver supports and what the
> > > resulting default_domain will be:
> > >
> > >                                         ops->defaut_domain
> > >                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> > > amd/iommu.c             Y       Y                       N/A             either
> > > apple-dart.c            Y       Y                       N/A             either
> > > arm-smmu.c              Y       Y                       IDENTITY        either
> > > qcom_iommu.c            G       Y                       IDENTITY        either
> > > arm-smmu-v3.c           Y       Y                       N/A             either
> > > exynos-iommu.c          G       Y                       IDENTITY        either
> > > fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> > > intel/iommu.c           Y       Y                       N/A             either
> > > ipmmu-vmsa.c            G       Y                       IDENTITY        either
> > > msm_iommu.c             G                               IDENTITY        N/A
> >
> > Unfortunately this patch breaks msm_iommu platforms. This driver
> > doesn't select ARM_DMA_USE_IOMMU, so iommu_get_default_domain_type()
> > returns 0, bus_iommu_probe() fails with -ENODEV.
> > If I make MSM_IOMMU select ARM_DMA_USE_IOMMU, then GPU probing fails
> > with -EBUSY.
>
> Oh, OK.
>
> Does this fix it?

It indeed fixes the issue, so could you please post it, adding:
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index cdc7b730192a35..f7ef081c33dcb2 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -685,10 +685,16 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
>         return 0;
>  }
>
> +static int msm_iommu_def_domain_type(struct device *dev)
> +{
> +       return IOMMU_DOMAIN_IDENTITY;
> +}
> +
>  static struct iommu_ops msm_iommu_ops = {
>         .identity_domain = &msm_iommu_identity_domain,
>         .domain_alloc_paging = msm_iommu_domain_alloc_paging,
>         .probe_device = msm_iommu_probe_device,
> +       .def_domain_type = msm_iommu_def_domain_type,
>         .device_group = generic_device_group,
>         .pgsize_bitmap = MSM_IOMMU_PGSIZES,
>         .of_xlate = qcom_iommu_of_xlate,

-- 
With best wishes
Dmitry
