Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7FCF7865EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 05:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239649AbjHXDmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 23:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239656AbjHXDm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 23:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C47910F0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 20:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692848505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
        b=I4kDFujAOgWWAOl0aUYsz5otZMn5Bz4nKwZZ1ysZ3QZDYN4aESBvifOmT2ecq345K2Jw3N
        0QhzFTWfH85QV2HV6MEkDNBk/50VH7m80QmTkYJXprdvrgpCTo8Kv5/bHTku6asZSU5w1c
        eweqoLnMePh71KUIs7LhK+iYjk7VSRY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-g_KVVgteOXat8N1iQCghrw-1; Wed, 23 Aug 2023 23:41:44 -0400
X-MC-Unique: g_KVVgteOXat8N1iQCghrw-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-411f7e77b44so10750741cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 20:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692848503; x=1693453303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
        b=kPJgMrx5Q7BFwRiPXHs+rKEVCk1fWCeJtwdZxQ9gEFetF9ZX+Zfk4E5ntj36lJwr9g
         GoQ8/pZ6wUlGo/iUpHW0uQebeqBSRHGJl2fSr8IWX98kJ+Mvkdc50tUQtwJdWO/Akwgz
         4owz4KVJPw8u3JsXH0AwTjxo5SCUwHCkUBj/kwv1ckK3NaLPnp4r9ZlDkJXxE/PbMrKw
         OBo7PhpQ/OEJNhhM8S+gloW03Wx4U2uaXXb/DiR/3znnVNv7wAEJKtRS3FZStG72vyge
         P4MVtb0+qSSGGfwjklH8bNT7sb/+J03sbDtpHvWjOe/Hynnv8nARIAs5GLBsh1S7FWds
         Xqmg==
X-Gm-Message-State: AOJu0YxsMp+34ncPBDwoy0a/4MpCu7Lao7QQl5rdLPeBvO/Ldu1JgTbz
        CHgcwKbxZJs2C0ElOTSwx2+0912sCl12tpNAYN8w83w2/WXuZz8OlIbTlBy1J/xZFF3Zt/SArzT
        dJVk1KgGlX4sxzfP/Fn4Dr5R33eiV6O++I+Lb
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211955qtb.58.1692848503543;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHjWv1CiL8QEOPMtXQgjOpwEGJSl7biyyoMP2HI5INen9hHlXD9XV1I7hmZP4s4Z/4tJVc6A==
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211932qtb.58.1692848503326;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id s26-20020a0cb31a000000b006375f9fd170sm5116337qve.34.2023.08.23.20.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 20:41:42 -0700 (PDT)
Date:   Wed, 23 Aug 2023 20:41:41 -0700
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
Subject: Re: [PATCH v7 01/24] iommu: Add iommu_ops->identity_domain
Message-ID: <r362pqn2venwjut7ernpzbxnc72kvknshxeobrvkvp7p5m554e@7jnu4wja663k>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:15PM -0300, Jason Gunthorpe wrote:
> This allows a driver to set a global static to an IDENTITY domain and
> the core code will automatically use it whenever an IDENTITY domain
> is requested.
> 
> By making it always available it means the IDENTITY can be used in error
> handling paths to force the iommu driver into a known state. Devices
> implementing global static identity domains should avoid failing their
> attach_dev ops.
> 
> To make global static domains simpler allow drivers to omit their free
> function and update the iommufd selftest.
> 
> Convert rockchip to use the new mechanism.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

