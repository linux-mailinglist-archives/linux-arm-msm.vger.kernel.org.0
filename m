Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F014285AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 06:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbhJKEJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 00:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhJKEJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 00:09:01 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95448C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Oct 2021 21:07:01 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id g125so16206999oif.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Oct 2021 21:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x6zJ1TMB99Xj1FgTf/EaXYFiMV4l4PhopS0sskGKUJg=;
        b=MMWmNas2Kk06bSpFDsluQBhy85L5MC4CSaXQzLEp1VM6YfCxptom3EfbZ9CNodgEHn
         XYrtNOSNSOtPQLbFOnP/MC5RUYm2+SaZbjkFaJB9RfsA0itlYKmCOz0E4iHn9+hxBZqt
         M30hT9DrRYaeKfFnX9Z8cOnrK0nIaVPla5p7coiLuri1CBQ4Xy1ngm11PzoMRqCQQ6oz
         QQpKxfsNulQhqPNOqzGv/zyyqeBjZP8Ld0L5zp83z8k3kMRBq76ZGJiH7sie2TcTRBzU
         QC61z0hPyd/c95TXvqf82Fl8DZ2/VlTRIbvaW2h9aUDX+2zAbKOx3dVMV5z9zKCJrBot
         yI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x6zJ1TMB99Xj1FgTf/EaXYFiMV4l4PhopS0sskGKUJg=;
        b=NfrodJoQ8zWNhd5DQh/2+apY4m+3J3TB9MDSYvznkBZGiNw/1O+Ga97Lrae+hU6t8h
         31XBYZFEejy68cLdu4Nj0LCbqKGANt6MW83MLOgq+Gw88BfUdEIiDSnNOxDpPio+Y5Ft
         wwT8RuPNiWAASQw34NqFMUJnCSGquJOWGryjWi9eEx6SrdcrCp6XWdY1j49s2Zzj+lp5
         rLTTrsQRHt84cAL5NEc+I9DrtsEFT7lWYmnNVCV2xgA7l14C0zaChRjs3Ao/loFXMHc1
         7P8C6U3vzPHOV07PrqtcN4eLwq1GFWEGrNJ7OSN+JZPQRWHPQZ7eoOmYkyixX077nMFu
         oGXw==
X-Gm-Message-State: AOAM531WuPfDgaECRosqT+1BusP6MAB2yBvuJgFzB1xVCwzWvvHAwxPb
        7axQBwgoWvdehqTqYEXiBlOx/A==
X-Google-Smtp-Source: ABdhPJyNBhey2POmoHGytDsM+sjqpo3nS+HnjONu7HSk/QnQNoIRcds2yh6VSQNMRwLWpByqHsAFIw==
X-Received: by 2002:aca:5b44:: with SMTP id p65mr15644888oib.158.1633925221021;
        Sun, 10 Oct 2021 21:07:01 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id bi1sm1506166oib.34.2021.10.10.21.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 21:07:00 -0700 (PDT)
Message-ID: <e655dd45-7d08-b82b-75b7-a9aa3bd4c50e@kali.org>
Date:   Sun, 10 Oct 2021 23:06:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
 <YWJpJnaQ2Nr4PUwr@yoga>
 <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/10/21 12:42 PM, Arnd Bergmann wrote:
> On Sun, Oct 10, 2021 at 6:17 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>> On Sat 09 Oct 21:33 CDT 2021, Dmitry Baryshkov wrote:
>>
>>> After commit 424953cf3c66 ("qcom_scm: hide Kconfig symbol") arm-smmu got
>>> qcom_smmu_impl_init() call guarded by IS_ENABLED(CONFIG_ARM_SMMU_QCOM).
>>> However the CONFIG_ARM_SMMU_QCOM Kconfig entry does not exist, so the
>>> qcom_smmu_impl_init() is never called.
>>>
>>> So, let's fix this by always calling qcom_smmu_impl_init(). It does not
>>> touch the smmu passed unless the device is a non-Qualcomm one. Make
>>> ARM_SMMU select QCOM_SCM for ARCH_QCOM.
> Sorry about this bug. I was sure I had it working, but I lost part of the commit
> during a rebase, and my randconfig builds still succeeded without it, so I
> sent a wrong version.
>
>> Arnd's intention was to not force QCOM_SCM to be built on non-Qualcomm
>> devices. But as Daniel experienced, attempting to boot most Qualcomm
>> boards without this results in a instant reboot.
>>
>> I think it's okay if we tinker with CONFIG_ARM_SMMU_QCOM for v5.16, but
>> we're getting late in v5.15 so I would prefer if we make sure this works
>> out of the box.
> Yes, makes sense. For reference, see below for how I would fix this properly,
> this is what I had intended to have in the patch. Feel free to pick
> either version
> as the immediate bugfix. I'll give the below a little more randconfig testing
> overnight though. The pasted version of the patch is probably
> whitespace-damaged,
> let me know if you would like me to send it as a proper patch.
>
>         Arnd
>
> 8<-----
> Subject: iommu: fix ARM_SMMU_QCOM compilation
>
> My previous bugfix ended up making things worse for the QCOM IOMMU
> driver when it forgot to add the Kconfig symbol that is getting used to
> control the compilation of the SMMU implementation specific code
> for Qualcomm.
>
> Fixes: 424953cf3c66 ("qcom_scm: hide Kconfig symbol")
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ----
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c5c71b7ab7e8..2dfe744ddd97 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -311,6 +311,7 @@ config ARM_SMMU
>          select IOMMU_API
>          select IOMMU_IO_PGTABLE_LPAE
>          select ARM_DMA_USE_IOMMU if ARM
> +       select QCOM_SCM if ARM_SMMU_QCOM
>          help
>            Support for implementations of the ARM System MMU architecture
>            versions 1 and 2.
> @@ -355,6 +356,13 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
>            'arm-smmu.disable_bypass' will continue to override this
>            config.
>
> +config ARM_SMMU_QCOM
> +       def_bool y
> +       depends on ARM_SMMU && ARCH_QCOM
> +       help
> +         When running on a Qualcomm platform that has the custom variant
> +         of the ARM SMMU, this needs to be built into the SMMU driver.
> +
>   config ARM_SMMU_V3
>          tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
>          depends on ARM64

FWIW, I tested this patch on the Lenovo Yoga C630 with Dmitry's patch 
backed out, and this does the right thing as well.

So if we go this route instead of the other patch, Tested-By: Steev 
Klimaszewski <steev@kali.org>

