Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C0B78917E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 00:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjHYWNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 18:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjHYWNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 18:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F93326AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693001551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=e+hge1oDtbK92kc9TmT9Xdf3z4r7E02Hg1hwzgG2crw=;
        b=VwgihAGFyMDGzqNbg1jyR1TLaVjUlQ4T36BNI4LsrZNp6+7t3uH89NoVzPulaD+R5vPz+P
        e8Cx0SmilW4NjizO8XYV5kG9okmbiWUYaOHaHe67/daX0GufIJgzXkPPyvQtMWx3Z7lsjq
        bdYDVz5tcVLjZyyDl1woL45wy4ULX/8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-UIg9pbdsOUS7HJ4STiKEJA-1; Fri, 25 Aug 2023 18:12:30 -0400
X-MC-Unique: UIg9pbdsOUS7HJ4STiKEJA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-59204757627so20884017b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001549; x=1693606349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+hge1oDtbK92kc9TmT9Xdf3z4r7E02Hg1hwzgG2crw=;
        b=NllR/6lfntnzP2yPuzTAglS4Hocj3QvEMnxQ8lLYx9SKVlfZ4ItbY6B08dEQw+S2+b
         FK6DfphHt9BtvAhtp5bDrj21djKpSRhak2pF8elw0AVQ34z52bFQ3A/tz7rWrJwBEjQd
         xeJTAIo/6HLYPWDcANuDnRa1s5x2vVkCZkixr5RN3f9wQX3qR9vhyARdANt95wx25l2d
         uRF6LevrI6meoSDYCVej9gHCB2C/GsrmvoPbTW257rP0mBcwoNKj/BAeu2SxYH+mlhJM
         /X8GONZgTZFO3Ox3dufblCGOtf1YVmYQFHDg9bu5fg9rtpR+gsVlUsImgkJbSxUakJzl
         nEhg==
X-Gm-Message-State: AOJu0YzMYtjyk2ZwtLm3v902kQ6TjROzstRqFswLw9l2OYSxnWaxphLG
        THh/vBoOvNamZy/WsyNFU1JQacXkA/q4bhv7M7AnlBhy3w85rDLv6Pbjh3tIU64itBPZ2WWxZSv
        Z1c17fXJQ9DSfR6dqiwPffKluyg==
X-Received: by 2002:a0d:d713:0:b0:586:e50:fb50 with SMTP id z19-20020a0dd713000000b005860e50fb50mr19547770ywd.28.1693001549711;
        Fri, 25 Aug 2023 15:12:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqzLCDM3DmOkP06FXZ9bPHPMsAQN6X4+gYJTqa+W/zrzV0quaG3oT8K/t8CMwB/6vm0x/C6Q==
X-Received: by 2002:a0d:d713:0:b0:586:e50:fb50 with SMTP id z19-20020a0dd713000000b005860e50fb50mr19547730ywd.28.1693001549499;
        Fri, 25 Aug 2023 15:12:29 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a9-20020a0ce349000000b006418c076f59sm817232qvm.100.2023.08.25.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:12:28 -0700 (PDT)
Date:   Fri, 25 Aug 2023 15:12:27 -0700
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
Subject: Re: [PATCH v7 05/24] iommu/fsl_pamu: Implement a PLATFORM domain
Message-ID: <2sctnqicp6snn7g7xlis2nfa4owdfbfyp6wuxsi65m2jmxmylv@xxa2ppitoelx>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <5-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:19PM -0300, Jason Gunthorpe wrote:
> This driver is nonsensical. To not block migrating the core API away from
> NULL default_domains give it a hacky of a PLATFORM domain that keeps it
> working exactly as it always did.
> 
> Leave some comments around to warn away any future people looking at this.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

