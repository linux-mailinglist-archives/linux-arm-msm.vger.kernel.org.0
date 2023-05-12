Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61786700E69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 20:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238329AbjELSMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 14:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjELSMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 14:12:34 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8CE4B1BD1;
        Fri, 12 May 2023 11:12:32 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03D3D75;
        Fri, 12 May 2023 11:13:16 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 672A53F67D;
        Fri, 12 May 2023 11:12:26 -0700 (PDT)
Message-ID: <9488a2cc-fbc6-6c1e-58f8-e2e1dc5db579@arm.com>
Date:   Fri, 12 May 2023 19:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Content-Language: en-GB
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
 <4a5ebc65-a384-a8df-c692-ca114f1a018d@gmail.com>
 <ZF5uKPhpBNioJUwL@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZF5uKPhpBNioJUwL@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-12 17:49, Jason Gunthorpe wrote:
> On Fri, May 12, 2023 at 05:55:23AM +0300, Dmitry Osipenko wrote:
> 
>>>> This has occasionally come up in the past and I seem to remember that it
>>>> had once been proposed to simply remove tegra-gart and there had been no
>>>> objections. Adding Dmitry, if he doesn't have objections to remaving it,
>>>> neither do I.
>>>
>>> Dmitry, please say yes and I will remove it instead of trying to carry
>>> it. The driver is almost 10 years old at this point, I'm skeptical
>>> anyone will need it on a 6.2 era kernel..
>>
>> You probably missed that support for many of 10 years old Tegra2/3
>> devices was added to kernel during last years.
>>
>> This GART isn't used by upstream DRM driver, but it's used by downstream
>> kernel which uses alternative Tegra DRM driver that works better for
>> older hardware.
> 
> It is kernel policy not to carry code to only support out of tree drivers in
> mainline, so it should be removed, thanks

Aww, I was literally in the middle of writing a Friday-afternoon patch 
to fix it... still need to build-test, but it's really not looking too 
bad at all:

  drivers/iommu/tegra-gart.c | 53 +++++++++++++++++-----------------
  1 file changed, 27 insertions(+), 26 deletions(-)

After that I was going to clean up the force_aperture confusion. TBH 
I've grown to rather like having this driver around as an exception to 
prove our abstractions and help make sure they make sense - it doesn't 
take much effort to keep it functional, and it's not like there aren't 
plenty of in-tree drivers for hardware even more ancient, obscure and 
less-used than Tegra20. FWIW I have *20*-year-old hardware at home 
running an up-to-date mainline-based distro for a practical purpose, but 
I guess that's considered valid if it says Intel on it? :P

Thanks,
Robin.
