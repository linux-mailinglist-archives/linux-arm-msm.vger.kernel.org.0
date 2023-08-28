Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F31978B985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 22:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbjH1U0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 16:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjH1U0o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 16:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4409A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693254354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=;
        b=Z8yeLMtITU9aooygC6FMQzDdaHKVEaG8Ys6Ltrw05oy9ZiLkcyh9PRNjVt/3VWZ7qrWtiH
        i8zENHpF1mLBrtjd9FekWF1G6Bp3Q4iaFaTJOPhfY0ZxTCLkBob5ahS4YNlXxpRK95GXFJ
        OlykZCI/3WlCz8D1/M+7b9htbI5YxeU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-lyvZv7hYNd-KG4QOk9ddnQ-1; Mon, 28 Aug 2023 16:25:53 -0400
X-MC-Unique: lyvZv7hYNd-KG4QOk9ddnQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76e26652e6fso457219485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 13:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254353; x=1693859153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=;
        b=L9kMd4zH+wTRGspBo7UXWN/8lnBcVy4iSRrM2HCxfaHl5BSOyQ1NBcRERul0AJ62s/
         NZVfI9pyOBSr/wlh+4PikZ7bcsVQXT84TMF0eWKmbnZpwxjyorJntiuV3NfFR7iCiA15
         Gk4fPyr2j4+Cq02+1NTMS+4lkotHR5VMED2+PWQO46F1JJ3z2cwM15ouQF8SA5nrBCaP
         9c4KzX9VZh6oIVI6GOAiI+e2vnnu+X4fr21kppTFsjVoxHAWcSK3zSXCC4raetumJHRc
         KkF3Z0/2EE7s3BmfgZQMtfMHOoN3QTDKJcWkbJd7brg6vOqac/wZhUIWoKKAgO9b/a3L
         8CJA==
X-Gm-Message-State: AOJu0YykOI3ZydUw6+XB1qnyNzn+2+gggqzFgHKFt43g8yB592cZ1o4S
        L4j4WMBiZsLAoKbs6PcChxz/M3V/V7xo4U0wm+S0q/Tu57eYauA4uIhCwXIWQbd+AY8r51FXLI6
        9ZxOIBUow/JfZK8uRtZkor+gISQ==
X-Received: by 2002:a05:620a:221:b0:76d:c63e:8e70 with SMTP id u1-20020a05620a022100b0076dc63e8e70mr14041503qkm.27.1693254353201;
        Mon, 28 Aug 2023 13:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9O6FxP0inVTnVJ2vRf5VolLj9Ux6/2WGBYm17sZOw53hmRs71i9SgIXCArw27HMmN5iSTDg==
X-Received: by 2002:a05:620a:221:b0:76d:c63e:8e70 with SMTP id u1-20020a05620a022100b0076dc63e8e70mr14041474qkm.27.1693254352979;
        Mon, 28 Aug 2023 13:25:52 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id o22-20020a05620a111600b0076816153dcdsm2613458qkk.106.2023.08.28.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:25:52 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:25:51 -0700
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
Subject: Re: [PATCH v7 11/24] iommu/tegra-smmu: Implement an IDENTITY domain
Message-ID: <mqc777v7h4bpz5xgfcqjqig4zoo3ifobiyut4r43dghkxp3yl2@uyb72ermxszs>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:25PM -0300, Jason Gunthorpe wrote:
> What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
> putting the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

