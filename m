Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D254723031
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbjFETtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbjFETtD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:49:03 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E89E75
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:48:35 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-33bbc91dcb7so26796015ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994499; x=1688586499;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JO+Zwq7Td7cudm74srZfXO+ELXGsSxtzyzIGoDkDoeU=;
        b=IQYf78Sj/shJjABNJ6ObJBJoSZjt7wC3fB+c+cuP3Rc01ErjAUPPEDB8Ie6y0f4rvN
         8jIHyEaNxajud+HomT+uWDG6I0LIHoli//Mp0Q/+JLYo8g0+sZceJ678Qou4XlWY+rP9
         mDkPHHw/gQFXkXo4jNnf0tTVP6y25WzEWx1ryCVpkNeB3Kq+/H2IKQuHay/GJEizSgh+
         OqEQ+etvhJYS9AbzEbotmxRxgKL4mh8IuT1rOS6S+jYB4XkZk8rh4/TOlKGVSb7fJyYM
         N4bF9O4vs0BfBxNPomLPledTdY5ls9sDVy0MZ8tXwYViGDhkiHa7KEMNq91lvJXShdbi
         mrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994499; x=1688586499;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO+Zwq7Td7cudm74srZfXO+ELXGsSxtzyzIGoDkDoeU=;
        b=EzxNwG9HwkykNOg4UC7WbXylwiZh6rTGcsZY85+wragqnGoyZWGKVeXl5Z8y2iz57I
         jp4bM1X22ANfZok7yji3pX2mldPHNX8cPpb0Vi7xVfFnoIHEQAzDi21Yeno+mSg/EW/U
         /jvUKsNILXOGJWN7gWSdStVULJW8smiKki9q6UHh8ZLFulJPp162rG7Q5jI3gQfGFMtc
         wmxML2bK/CvM2Dd3Zq4WtLznwkmBQ2tmUlzcnqKZHHtWw5nvd8Oz8JzoxpDXaQmSWn+5
         9+f6CLXaIxcEKX2aPAQF81nBJyxZbPeMBNOZCizAXDARJfqtzEP3w8MUPNsiuEb9qZxP
         1PcQ==
X-Gm-Message-State: AC+VfDwjORyStswIb9Qb+96dC9hSus2qZi0pmO6Yx+un+Apy0tGe6/JZ
        tK2wkNF08sTx7CIawoJFSVlGPw==
X-Google-Smtp-Source: ACHHUZ5lHjKaGhUOoW5zKixm9mK+3elHqgvAg3A7ACkKm1208GuT9u2cpr+u65VT1Q2ss6XsIqikJA==
X-Received: by 2002:a92:2906:0:b0:33c:5109:bb07 with SMTP id l6-20020a922906000000b0033c5109bb07mr139586ilg.1.1685994499123;
        Mon, 05 Jun 2023 12:48:19 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id j16-20020a02cc70000000b00418ba399842sm2420920jaq.13.2023.06.05.12.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:48:18 -0700 (PDT)
Message-ID: <2c5ac9fd-79f5-bbb4-5798-67a1f9c161b2@linaro.org>
Date:   Mon, 5 Jun 2023 14:48:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 10/24] gunyah: vm_mgr: Add/remove user memory regions
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-11-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-11-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/9/23 3:47 PM, Elliot Berman wrote:
> When launching a virtual machine, Gunyah userspace allocates memory for
> the guest and informs Gunyah about these memory regions through
> SET_USER_MEMORY_REGION ioctl.
> 
> Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Two minor comments below.  In any case:

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/virt/gunyah/Makefile    |   2 +-
>   drivers/virt/gunyah/vm_mgr.c    |  59 +++++++-
>   drivers/virt/gunyah/vm_mgr.h    |  26 ++++
>   drivers/virt/gunyah/vm_mgr_mm.c | 236 ++++++++++++++++++++++++++++++++
>   include/uapi/linux/gunyah.h     |  37 +++++
>   5 files changed, 356 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/virt/gunyah/vm_mgr_mm.c
> 
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> index e47e25895299..bacf78b8fa33 100644
> --- a/drivers/virt/gunyah/Makefile
> +++ b/drivers/virt/gunyah/Makefile
> @@ -1,4 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> -gunyah-y += rsc_mgr.o rsc_mgr_rpc.o vm_mgr.o
> +gunyah-y += rsc_mgr.o rsc_mgr_rpc.o vm_mgr.o vm_mgr_mm.o
>   obj-$(CONFIG_GUNYAH) += gunyah.o
> diff --git a/drivers/virt/gunyah/vm_mgr.c b/drivers/virt/gunyah/vm_mgr.c
> index a43401cb34f7..297427952b8c 100644
> --- a/drivers/virt/gunyah/vm_mgr.c
> +++ b/drivers/virt/gunyah/vm_mgr.c
> @@ -15,6 +15,8 @@
>   
>   #include "vm_mgr.h"
>   
> +static void gh_vm_free(struct work_struct *work);
> +

You could just define gh_vm_free() here rather than declaring
and defining it later.

>   static __must_check struct gh_vm *gh_vm_alloc(struct gh_rm *rm)
>   {
>   	struct gh_vm *ghvm;

. . .

> diff --git a/drivers/virt/gunyah/vm_mgr_mm.c b/drivers/virt/gunyah/vm_mgr_mm.c
> new file mode 100644
> index 000000000000..91109bbf36b3
> --- /dev/null
> +++ b/drivers/virt/gunyah/vm_mgr_mm.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) "gh_vm_mgr: " fmt
> +
> +#include <linux/gunyah_rsc_mgr.h>
> +#include <linux/mm.h>
> +
> +#include <uapi/linux/gunyah.h>
> +
> +#include "vm_mgr.h"
> +
> +static bool pages_are_mergeable(struct page *a, struct page *b)
> +{
> +	if (page_to_pfn(a) + 1 != page_to_pfn(b))
> +		return false;
> +	if (!zone_device_pages_have_same_pgmap(a, b))
> +		return false;
> +	return true;

Maybe just:

	return zone_device_pages_have_same_pgmap(a, b);

> +}
> +
> +static bool gh_vm_mem_overlap(struct gh_vm_mem *a, u64 addr, u64 size)
> +{
> +	u64 a_end = a->guest_phys_addr + (a->npages << PAGE_SHIFT);
> +	u64 end = addr + size;
> +
> +	return a->guest_phys_addr < end && addr < a_end;
> +}
> +

. . .

