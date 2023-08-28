Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC8578BA50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 23:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbjH1VdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 17:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbjH1Vck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 17:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9071918D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693258314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=;
        b=Lau8zgtjsq1xfaMsthbVscRzJDNaG8nLYcBgVoic9zvHk6QFdxuluFVZKet/GoIK5D6yTT
        6SQDtNWX+oT04JxNjcG7ejEc/OxOXnTni1gSNyVIUqOX11ZnuMwzonHStJyQVGdHK2GMht
        gC5xhzr2m0Vwvmz6rwcgQ9d99Ip7hP8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-gyLNJ6IiMkuVojh8XvczhQ-1; Mon, 28 Aug 2023 17:31:52 -0400
X-MC-Unique: gyLNJ6IiMkuVojh8XvczhQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76e26652e6fso464271685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 14:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693258312; x=1693863112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=;
        b=ZguybDsT97n2tRWQqhXCbyPbcBp9ddSzG1bPH4XX8Di2d/3HMJjDtqCt/fd71UOcpI
         zJuHqnmOX5l81SQJpOUWmazaFHdwSgcxyaoug3A5RQvy/yos2GPrzKk8U+KxEi0Ugs6z
         LD08XKNl3IR7xPD4IgbfB45Ck8vqFmQWBtqOaJ8NRCGz5b0pI948j3ryoud2x1cmAPFb
         xxZw54tW0ySyX9luhNtm6SaTVbi5nQPi0siHpo6Q8+RQi0FCaZX9Z8t1RaW5ebpHr03q
         KrknPddGY5iZltoVPjRNPfLBaz+1va6LMtpY2uc7t0pBmjHdjBA5TzlfmV62uc7mcH3H
         kJag==
X-Gm-Message-State: AOJu0YzAy1f4u1JP9Q9+YWuT8knTgG4cfygcV0pbc4GIGrCPry8u3m8b
        uPlm9b45dgq+U26ELa3j/9Fl7Elh2XkmaqxPESjZrhMS+hQMOSRnzW3/Az2sjvKHgEGr166eGdC
        chwhAmA04L2zK4UwHoG7imBab3Q==
X-Received: by 2002:a05:620a:9c7:b0:766:fe28:35a3 with SMTP id y7-20020a05620a09c700b00766fe2835a3mr28616579qky.32.1693258312045;
        Mon, 28 Aug 2023 14:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuVcTMTBbnLPs86MnCDU8eGTgJIDkNhQ+SHq++g5N+BlxbjD8TqX467y2sj6EMGyNhF/9w9w==
X-Received: by 2002:a05:620a:9c7:b0:766:fe28:35a3 with SMTP id y7-20020a05620a09c700b00766fe2835a3mr28616567qky.32.1693258311828;
        Mon, 28 Aug 2023 14:31:51 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a12-20020a05620a124c00b0076f16a00693sm697233qkl.47.2023.08.28.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:31:51 -0700 (PDT)
Date:   Mon, 28 Aug 2023 14:31:49 -0700
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
Subject: Re: [PATCH v7 21/24] iommu: Add __iommu_group_domain_alloc()
Message-ID: <dwrebxdzqjhnryum3czsh6zroapbhpjre7untly3cvl2tn3nij@hpckzx65oxx6>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:35PM -0300, Jason Gunthorpe wrote:
> Allocate a domain from a group. Automatically obtains the iommu_ops to use
> from the device list of the group. Convert the internal callers to use it.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

