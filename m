Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984516FFF1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 04:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239780AbjELCzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 22:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjELCza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 22:55:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA2D10FE;
        Thu, 11 May 2023 19:55:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f26f437b30so1538362e87.1;
        Thu, 11 May 2023 19:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683860128; x=1686452128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkOUlUNxiR4Gqj0+EmYuULSRki0JxNp8SsnGkEdjwKw=;
        b=PpruK/NzGHjzRovvWCYvW7HqDD68KmOoIjPRjVBwwjOl44YKmS9LJw0bJlpO5wCaTK
         JYQMRTt8PUIg7Tt3sXx/BumOofEX1UyIXH2rVZ7HQ4xk8w/0TIePej2ODQWIhhjMLGCF
         ObsKQnai0HwA0gxPpanVkllqPWACWFvsyhk8otvSXkxJ7boKNh6rOvhXhhU7XGpKW3yF
         bnb3jZjGoJuviMp6XaP/FxIe9hwsqI+C+2qQBWPRGsJkiS6fP0ZvUhHR+JTm3yUIwJpq
         rSKT9UqKx0zvTFuela8XEHqJdseFq2qZbEhMjlCN21nk45Ltut9jjYaQ7C5U84jN7UFH
         YUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683860128; x=1686452128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkOUlUNxiR4Gqj0+EmYuULSRki0JxNp8SsnGkEdjwKw=;
        b=SNHFvnD+CBi7k+wKkZwcApgmHUUpAhRhOk1MsquemG3eAdvr0TGMiptNimpA49Yjii
         WLmRcnKKdvXiBee/qgLZ5cXjox5MPdiXdn4utH9qdn2cWNbGdWgqu++Dh/vyGJ3+xAlw
         qa/JhZPKDdanrccEGMuHitPFTblufERSv7KunhepPFmA9pXp7XlkYED8VJ4lzQnkx1wa
         UlTycLHBU2XTMG68cHHe8hD+6YiZxLkLKz1scCt51BNDUC1J4jNksKeI/uigK4+0fUke
         qcqohiXdg0ihHlctFzwmFdTTVrd2TgYSqt34J4fx/XadIGSDaMzfjoCbdc94l7J3lzaL
         HPag==
X-Gm-Message-State: AC+VfDwUgiB7bFmfPd4Dhg2hNPFparvcrQJNwYMUgp+vPMopBhJZlEkk
        Ce25K+qUKpdHmx0zlqJPtSw=
X-Google-Smtp-Source: ACHHUZ4dxW4iqzv/N28X1gKcL88SemTjJ65/wtcy0AZdHSmj4XHMTrDxPz8Icvt/RO3sRR4TuYCJgw==
X-Received: by 2002:ac2:488c:0:b0:4f1:4086:9384 with SMTP id x12-20020ac2488c000000b004f140869384mr3159987lfc.61.1683860127415;
        Thu, 11 May 2023 19:55:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-144-198.dynamic.spd-mgts.ru. [109.252.144.198])
        by smtp.googlemail.com with ESMTPSA id c26-20020ac244ba000000b004efae490c51sm1285288lfm.240.2023.05.11.19.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 19:55:26 -0700 (PDT)
Message-ID: <4a5ebc65-a384-a8df-c692-ca114f1a018d@gmail.com>
Date:   Fri, 12 May 2023 05:55:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com> <ZFI/D6mnLKYpdIqx@nvidia.com>
 <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com> <ZFJlZ03lswl9uHD0@nvidia.com>
 <ZFJzKQcKNFHdIWqy@orome> <ZFKXz/HWFkYOJrgT@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ZFKXz/HWFkYOJrgT@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

03.05.2023 20:20, Jason Gunthorpe пишет:
> On Wed, May 03, 2023 at 04:43:53PM +0200, Thierry Reding wrote:
> 
>>> The only thing it does is cause dma-iommu.c in ARM64 to use the
>>> dma-ranges from OF instead of the domain aperture. sprd has no
>>> dma-ranges in arch/arm64/boot/dts/sprd.
>>>
>>> Further, sprd hard fails any map attempt outside the aperture, so it
>>> looks like a bug if the OF somehow chooses a wider aperture as
>>> dma-iommu.c will start failing maps.
>>
>> That all sounds odd. of_dma_configure_id() already sets up the DMA mask
>> based on dma-ranges and the DMA API uses that to restrict what IOVA any
>> buffers can get mapped to for a given device.
> 
> Yes, and after it sets up the mask it also passes that range down like this:
> 
>  of_dma_configure_id():
> 	end = dma_start + size - 1;
> 	mask = DMA_BIT_MASK(ilog2(end) + 1);
> 	dev->coherent_dma_mask &= mask;
> 
> 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> 
> Which eventually goes to:
> 
>  iommu_setup_dma_ops()
>  iommu_dma_init_domain()
> 
> Which then does:
> 
> 	if (domain->geometry.force_aperture) {
> 
> And if not set uses the dma_start/size parameter as the actual
> aperture. (!?)
> 
> Since sprd does this in the iommu driver:
> 
> 	dom->domain.geometry.aperture_start = 0;
> 	dom->domain.geometry.aperture_end = SZ_256M - 1;
> 
> And it is serious about enforcing it during map:
> 
> 	unsigned long start = domain->geometry.aperture_start;
> 	unsigned long end = domain->geometry.aperture_end;
> 
> 	if (iova < start || (iova + size) > (end + 1)) {
> 			return -EINVAL;
> 
> We must see the dma_start/size parameter be a subset of the aperture
> or eventually dma-iommu.c will see map failures.
> 
> I can't see how this is can happen, so it looks like omitting
> force_aperture is a mistake not a deliberate choice. I'll make a patch
> and see if the SPRD folks have any comment. If there is no reason I
> can go ahead and purge force_aperture and all the dma_start/size
> passing through arch_setup_dma_ops().
> 
>>> Thus, I propose we just remove the whole thing. All drivers must set
>>> an aperture and the aperture is the pure HW capability to map an
>>> IOPTE at that address. ie it reflects the design of the page table
>>> itself and nothing else.
>>
>> Yeah, that sounds reasonable. If the aperture represents what the IOMMU
>> supports. Together with each device's DMA mask we should have everything
>> we need.
> 
> Arguably we should respect the dma-ranges as well, but I think that
> should come up from the iommu driver via the get_resv_regions() which
> is the usual place we return FW originated information.
> 
>> For Tegra GART I think there's indeed no use-cases at the moment. Dmitry
>> had at one point tried to make use of it because it can be helpful on
>> some of the older devices that were very memory-constrained. That
>> support never made it upstream because it required significant changes
>> in various places, if I recall correctly. For anything with a decent
>> enough amount of RAM, CMA is usually a better option.
> 
> So the actual use case of this HW is to linearize buffers? ie it is a
> general scatter/gather engine?
> 
>> This has occasionally come up in the past and I seem to remember that it
>> had once been proposed to simply remove tegra-gart and there had been no
>> objections. Adding Dmitry, if he doesn't have objections to remaving it,
>> neither do I.
> 
> Dmitry, please say yes and I will remove it instead of trying to carry
> it. The driver is almost 10 years old at this point, I'm skeptical
> anyone will need it on a 6.2 era kernel..

You probably missed that support for many of 10 years old Tegra2/3
devices was added to kernel during last years.

This GART isn't used by upstream DRM driver, but it's used by downstream
kernel which uses alternative Tegra DRM driver that works better for
older hardware.

If it's too much burden to maintain this driver, then feel free to
remove it and I'll continue maintaining it in downstream myself.
Otherwise I can test your changes if needed.

