Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4166D2255
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 16:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbjCaOYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 10:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbjCaOYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 10:24:46 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE731B34E
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:24:44 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id l9so11586483iln.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680272683; x=1682864683;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLTALbZ3iWI28OvY1+0nhMvm9XJ3QRjCWYBqsta0epY=;
        b=UEfsqds9SPT+VVyaRR2lyLk+gB8SnuhWaGL1k+gIPQxfo/3W75tA/g83to8hQEGqw9
         pd5M/TXptL1kLZZoyd/mO23VsLEb+dLJezm6korh462D58rka4w0Fa3OvSaZ6+rNbuFH
         1Xdm9k4icWYbzPoPN+c/7mtvXI4aZhI6fk/982YlvpekElzmgq3sHQn9PkuZsw+h8j4I
         ayhg59BWQVCPESfkD+KBRBhgRLShRMpS+81g6RgemMzx+VnU+vUHpmohP1dxzh/6ab4s
         gfCVQxDZYdd+9rPpD7froDdbjp8cEgg9u0yZzz0NERZQzFotGf23rkPKVXoR2sPRxmQC
         AgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272683; x=1682864683;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLTALbZ3iWI28OvY1+0nhMvm9XJ3QRjCWYBqsta0epY=;
        b=wvb7Su+W3uwXqHZu4urZX/OValMBeI+mRn7Lhr0kg+bvPyrBqX4TCOGyP0M4Fk35Iv
         N0Ai8fhLzuoU3EtzVhMyo9jAioY7ko9J0SaPCWgTX7illots7zhJ5QO1pUN3/+AZM787
         5gPAolSQ3lGsCIZ8T4lQOzKR+z0gxb6eZDrDFu8f1XL9jBf2nXYiFy6y8gF15+nynzl8
         c0y+b/pqYRQpaTmfXEc0wDu5AN96FqjOTYlt8FM114iPLxodtr48pvqYDn8UkXeweASE
         OrWb0Pai29Umi+B8G57ypmT1SIXTEGXGNmLGQJcgpqW0vQKNfrAL6o6bfi7I8+dO5513
         bb/Q==
X-Gm-Message-State: AAQBX9dWEnboCeqQ/ubyVKfbWVG+NsOtwweAyGQ70ajMsqPvbab22F45
        qMnHrxg0wDDkCAaN8CzjBGOFXA==
X-Google-Smtp-Source: AKy350bit1MFzYAR/bHvDaXdvqv4ndlNkul2p0/ISTHL8LriewjkQbU4Hn+SvC5PTgM986/3Gqzhvg==
X-Received: by 2002:a92:cb0a:0:b0:325:b32a:60fc with SMTP id s10-20020a92cb0a000000b00325b32a60fcmr13368695ilo.5.1680272683406;
        Fri, 31 Mar 2023 07:24:43 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id n17-20020a056e02101100b0032648a86067sm515200ilj.4.2023.03.31.07.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:24:43 -0700 (PDT)
Message-ID: <ea527244-c8ff-77fb-db77-3aa5470f3fb6@linaro.org>
Date:   Fri, 31 Mar 2023 09:24:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v11 03/26] gunyah: Common types and error codes for Gunyah
 hypercalls
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
References: <20230304010632.2127470-1-quic_eberman@quicinc.com>
 <20230304010632.2127470-4-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230304010632.2127470-4-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/3/23 7:06 PM, Elliot Berman wrote:
> Add architecture-independent standard error codes, types, and macros for
> Gunyah hypercalls.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

See a few comments below.	-Alex

> ---
>   include/linux/gunyah.h | 83 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>   create mode 100644 include/linux/gunyah.h
> 
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> new file mode 100644
> index 000000000000..54b4be71caf7
> --- /dev/null
> +++ b/include/linux/gunyah.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_GUNYAH_H
> +#define _LINUX_GUNYAH_H
> +
> +#include <linux/errno.h>
> +#include <linux/limits.h>
> +
> +/******************************************************************************/
> +/* Common arch-independent definitions for Gunyah hypercalls                  */
> +#define GH_CAPID_INVAL	U64_MAX
> +#define GH_VMID_ROOT_VM	0xff

The above definition doesn't seem to be used anywhere, but seeing
it begs the question to me of what type it is expected to have.
If it were used, where would it be used in an 8 bit field?

> +
> +enum gh_error {
> +	GH_ERROR_OK			= 0,
> +	GH_ERROR_UNIMPLEMENTED		= -1,
> +	GH_ERROR_RETRY			= -2,

There might be nothing fundamentally wrong with this, but I
dislike seeing negative values assigned to enums.

These error values are returned from the hypervisor, and it
looks like they'll likely truncated from a 64-bit unsigned
value.  Are they *sent* from the hypervisor as 64-bit signed
values?  Or 32-bit signed values?  (In that case, the

I just wonder if you can use 0xffffffff or 0xffff for example
rather than -1, depending on the actual value that gets passed.

> +
> +	GH_ERROR_ARG_INVAL		= 1,
> +	GH_ERROR_ARG_SIZE		= 2,
> +	GH_ERROR_ARG_ALIGN		= 3,
> +
> +	GH_ERROR_NOMEM			= 10,
> +
> +	GH_ERROR_ADDR_OVFL		= 20,
> +	GH_ERROR_ADDR_UNFL		= 21,
> +	GH_ERROR_ADDR_INVAL		= 22,
> +
> +	GH_ERROR_DENIED			= 30,
> +	GH_ERROR_BUSY			= 31,
> +	GH_ERROR_IDLE			= 32,
> +
> +	GH_ERROR_IRQ_BOUND		= 40,
> +	GH_ERROR_IRQ_UNBOUND		= 41,
> +
> +	GH_ERROR_CSPACE_CAP_NULL	= 50,
> +	GH_ERROR_CSPACE_CAP_REVOKED	= 51,
> +	GH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
> +	GH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
> +	GH_ERROR_CSPACE_FULL		= 54,
> +
> +	GH_ERROR_MSGQUEUE_EMPTY		= 60,
> +	GH_ERROR_MSGQUEUE_FULL		= 61,
> +};
> +
> +/**
> + * gh_remap_error() - Remap Gunyah hypervisor errors into a Linux error code
> + * @gh_error: Gunyah hypercall return value
> + */
> +static inline int gh_remap_error(enum gh_error gh_error)

Since you're remapping a gh_error, I would have named this
gh_error_remap().

> +{
> +	switch (gh_error) {
> +	case GH_ERROR_OK:
> +		return 0;
> +	case GH_ERROR_NOMEM:
> +		return -ENOMEM;
> +	case GH_ERROR_DENIED:
> +	case GH_ERROR_CSPACE_CAP_NULL:
> +	case GH_ERROR_CSPACE_CAP_REVOKED:
> +	case GH_ERROR_CSPACE_WRONG_OBJ_TYPE:
> +	case GH_ERROR_CSPACE_INSUF_RIGHTS:
> +	case GH_ERROR_CSPACE_FULL:
> +		return -EACCES;
> +	case GH_ERROR_BUSY:
> +	case GH_ERROR_IDLE:
> +		return -EBUSY;
> +	case GH_ERROR_IRQ_BOUND:
> +	case GH_ERROR_IRQ_UNBOUND:
> +	case GH_ERROR_MSGQUEUE_FULL:
> +	case GH_ERROR_MSGQUEUE_EMPTY:
> +		return -EIO;
> +	case GH_ERROR_UNIMPLEMENTED:
> +	case GH_ERROR_RETRY:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +#endif

