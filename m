Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FAB72303E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236096AbjFETtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236036AbjFETtF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:49:05 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8996B10D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:48:42 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-77493b3d18cso212661939f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994518; x=1688586518;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pqz7dKlCFpKHeC1hM9llutxXnmBYOpbsNK/LcnDGjLA=;
        b=iE7rEZ/5jJEFJkOeyJTDZWDelOFZAqkJA9+l/dzLOqBEhImk+CwYgekGbj4JKgZAEf
         EayXIDaR5bzrYTKmPrOhq+1fiU/YjtKvOdIHu1q+LIHUE2mtQuEZe0UvNkz/aiHlpUTb
         GPOr60SnttLPNeVMJJBy2Npq+ZBa5+2875Rau4jT7N65k2mA/fOAYOTCAs7Pgjchfx1r
         dTnjllpX11zMgBNJDxKBYu9oDfEn9hQQHJNoUogQz4YvL8UbDMghwQcBs5TRp76SKWj+
         H8Yzfd1E3kzSadZ6tCdKWMj/M5+P1F4FppCV0c5rmkSH+ZauzvZ89vrS49RCXf+cF/ZB
         XXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994518; x=1688586518;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqz7dKlCFpKHeC1hM9llutxXnmBYOpbsNK/LcnDGjLA=;
        b=FrMZJsbcluN/CYGNk96Rat+N5K4Yq2o/pS1Ii3sYT32hYz/DOI4unP19fDXMwmAXcv
         nNWDleKCNnmWPrwme5hyaE3cBRXXeVkyHkQz2qgevLqOP5jsv0csaa0C2osxuWJ1YpCm
         GICKvJ17PfYsFwSooLUmJBoV3JKUaGjXDyN3CR1iMpw4dU1BkGGEOeAiYMU1Y7z+XCGx
         rDuAYPEZgmkkWqjFqUUslHRPsj1HwmvFJXPm7vPwd/Fh4MUD1xZTT/bUO3G9qgJqLzUG
         R+Cb6LLhGAVMGzOueRMIxOfXTuQy/JbwUWw85l0tPT96srbKgZj3PBcpQul/NfAglYm2
         GUOA==
X-Gm-Message-State: AC+VfDxfSaz4BrH5P+7E7hivSBxutG1uIGxQ/YDyGWqpY/VeO7u0G7FU
        MAxzE+HpcKiy6iMMJtFkHsyPqQ==
X-Google-Smtp-Source: ACHHUZ6TdCehFloH2eMhgF6TB0a01z4a2fQfHv42ISig5LnVp7kPTKBiIS5RncSPu9gGyCXCtH3qyA==
X-Received: by 2002:a5e:8b47:0:b0:777:b7a0:75d7 with SMTP id z7-20020a5e8b47000000b00777b7a075d7mr203183iom.13.1685994518678;
        Mon, 05 Jun 2023 12:48:38 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id y28-20020a02ce9c000000b0041684163ee1sm710229jaq.146.2023.06.05.12.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:48:38 -0700 (PDT)
Message-ID: <e57c3c7c-a557-30f1-ffa1-8ead67d3ef2c@linaro.org>
Date:   Mon, 5 Jun 2023 14:48:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 13/24] gunyah: rsc_mgr: Add platform ops on
 mem_lend/mem_reclaim
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
 <20230509204801.2824351-14-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-14-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/9/23 3:47 PM, Elliot Berman wrote:
> On Qualcomm platforms, there is a firmware entity which controls access
> to physical pages. In order to share memory with another VM, this entity
> needs to be informed that the guest VM should have access to the memory.

You might be able to avoid the lock by using rcu_assign_pointer() and
rcu_dereference(), but I'm not recommending it (because I'm not sure).

I have one more suggestion below.

Reviewed-by: Alex Elder <elder@linaro.org>

> Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   drivers/virt/gunyah/Kconfig                 |  4 ++
>   drivers/virt/gunyah/Makefile                |  2 +
>   drivers/virt/gunyah/gunyah_platform_hooks.c | 80 +++++++++++++++++++++
>   drivers/virt/gunyah/rsc_mgr.h               |  3 +
>   drivers/virt/gunyah/rsc_mgr_rpc.c           | 18 ++++-
>   include/linux/gunyah_rsc_mgr.h              | 17 +++++
>   6 files changed, 122 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/virt/gunyah/gunyah_platform_hooks.c
> 
> diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
> index 1a737694c333..de815189dab6 100644
> --- a/drivers/virt/gunyah/Kconfig
> +++ b/drivers/virt/gunyah/Kconfig
> @@ -4,6 +4,7 @@ config GUNYAH
>   	tristate "Gunyah Virtualization drivers"
>   	depends on ARM64
>   	depends on MAILBOX
> +	select GUNYAH_PLATFORM_HOOKS
>   	help
>   	  The Gunyah drivers are the helper interfaces that run in a guest VM
>   	  such as basic inter-VM IPC and signaling mechanisms, and higher level
> @@ -11,3 +12,6 @@ config GUNYAH
>   
>   	  Say Y/M here to enable the drivers needed to interact in a Gunyah
>   	  virtual environment.
> +
> +config GUNYAH_PLATFORM_HOOKS
> +	tristate
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> index bacf78b8fa33..4fbeee521d60 100644
> --- a/drivers/virt/gunyah/Makefile
> +++ b/drivers/virt/gunyah/Makefile
> @@ -1,4 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> +obj-$(CONFIG_GUNYAH_PLATFORM_HOOKS) += gunyah_platform_hooks.o
> +
>   gunyah-y += rsc_mgr.o rsc_mgr_rpc.o vm_mgr.o vm_mgr_mm.o
>   obj-$(CONFIG_GUNYAH) += gunyah.o
> diff --git a/drivers/virt/gunyah/gunyah_platform_hooks.c b/drivers/virt/gunyah/gunyah_platform_hooks.c
> new file mode 100644
> index 000000000000..60da0e154e98
> --- /dev/null
> +++ b/drivers/virt/gunyah/gunyah_platform_hooks.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/rwsem.h>
> +#include <linux/gunyah_rsc_mgr.h>
> +
> +#include "rsc_mgr.h"
> +
> +static struct gh_rm_platform_ops *rm_platform_ops;
> +static DECLARE_RWSEM(rm_platform_ops_lock);
> +
> +int gh_rm_platform_pre_mem_share(struct gh_rm *rm, struct gh_rm_mem_parcel *mem_parcel)
> +{
> +	int ret = 0;
> +
> +	down_read(&rm_platform_ops_lock);
> +	if (rm_platform_ops && rm_platform_ops->pre_mem_share)
> +		ret = rm_platform_ops->pre_mem_share(rm, mem_parcel);
> +	up_read(&rm_platform_ops_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gh_rm_platform_pre_mem_share);
> +
> +int gh_rm_platform_post_mem_reclaim(struct gh_rm *rm, struct gh_rm_mem_parcel *mem_parcel)
> +{
> +	int ret = 0;
> +
> +	down_read(&rm_platform_ops_lock);
> +	if (rm_platform_ops && rm_platform_ops->post_mem_reclaim)
> +		ret = rm_platform_ops->post_mem_reclaim(rm, mem_parcel);
> +	up_read(&rm_platform_ops_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gh_rm_platform_post_mem_reclaim);
> +
> +int gh_rm_register_platform_ops(struct gh_rm_platform_ops *platform_ops)

Can (should) platform_ops be declared as const?  (I think it can,
that would be better as long as you don't expect operation function
pointers to be added after registration.)  If you do that, all such
arguments will probably need to be updated to pointer-to-const.


> +{
> +	int ret = 0;
> +
> +	down_write(&rm_platform_ops_lock);
> +	if (!rm_platform_ops)
> +		rm_platform_ops = platform_ops;
> +	else
> +		ret = -EEXIST;
> +	up_write(&rm_platform_ops_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gh_rm_register_platform_ops);
. . .

