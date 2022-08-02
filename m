Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85274587865
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 09:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbiHBHvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 03:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236219AbiHBHve (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 03:51:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34F54F18D
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 00:51:07 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z4so101418ljn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KZltZr/4NkwY3ziTNTcm8uGPp+xZ+8XkMJFiPkxcvFQ=;
        b=Gnn6F9Um0vDb/h89yLPdb1rwtantM0TcbgpTwkhQ9C/81KNiRpB+qIZJyzPrEs7/kL
         jL16qyTgG0b9vtKRiZ53JSadQQmwYJa2l38/+TNhKL/wfsQzMxI1DWwbuWN4zUYKf2EN
         1uTe2epmuaperXNX8Xsr43EahWdxOFwN7LL6UAA8oirbQaB8H0gpHTuv2+nARUSCi+LK
         6WbZEhDB0tXAvpzrX8Q+0BnwakVMLc7Sq3019Ye8eNadyHfF6UpEVZT2v0BUnEp8JlOv
         nmN8ErL0p8YyNNIDiNIL270adnMdNxsnxo3M09FOVqS/W3EjEWKw4lq40nuzI8o8WDuj
         YD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KZltZr/4NkwY3ziTNTcm8uGPp+xZ+8XkMJFiPkxcvFQ=;
        b=ANBwiqbSBP0QWenRp42qKEi2xIq2FAqsNDU9M9dlCXE0pgY+nghnQ7wwe4y8XZTXrd
         HEj9ecYYHEMjG0mII9uJJ0AVbh8cpi8WCuiDHIsgiarf5eSJfih/3iIxup64A9nHfzZW
         K8mMwSnYOasBksn6idMEtCENW8xnzhYrmj+ssaNKus9DQ5DwtlunlXWCwN3Yd0T9rar3
         ydoq9rLgh7R1CYZPPEyl0sJ0H2c+ST8ll4PqHtsZrNevKLltU22T+jMKBSALlGaQYFMf
         IG0G8pzucVox/V+rsaIut/N4tHGKbzxfp1DAcCwKq6EefQTzHgByFhDyUYb3PyXyzBUf
         zH/w==
X-Gm-Message-State: ACgBeo3XVlSq9ci4VLBxmvida06uX1Xmxm+D3rWas+RDW7cIoIosPVTo
        88s28zLRxx8yqc37PoXN9W4knw==
X-Google-Smtp-Source: AA6agR6ua7oHBR59juEc+5zZXX8Y8OMP9D0y0Vjm9UnPOZIMQu+1i+dL6dS8pjN9q9GBlEPMaAwboQ==
X-Received: by 2002:a2e:9053:0:b0:25e:5c99:9fb5 with SMTP id n19-20020a2e9053000000b0025e5c999fb5mr582908ljg.268.1659426665719;
        Tue, 02 Aug 2022 00:51:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e8048000000b0025e5755fd16sm367574ljg.36.2022.08.02.00.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:51:05 -0700 (PDT)
Message-ID: <c786ed2a-e22a-5ae4-5b5b-0c0c2815cc57@linaro.org>
Date:   Tue, 2 Aug 2022 10:51:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/11] gunyah: Common types and error codes for Gunyah
 hypercalls
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-5-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-5-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Add architecture-independent standard error codes, types, and macros for
> Gunyah hypercalls.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   MAINTAINERS            |  1 +
>   include/linux/gunyah.h | 75 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 include/linux/gunyah.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 02f97ac90cdf..2e4f1d9ed47b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8744,6 +8744,7 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>   F:	Documentation/virt/gunyah/
>   F:	arch/arm64/include/asm/gunyah.h
> +F:	include/linux/gunyah.h
>   
>   HABANALABS PCI DRIVER
>   M:	Oded Gabbay <ogabbay@kernel.org>
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> new file mode 100644
> index 000000000000..69931a0f5736
> --- /dev/null
> +++ b/include/linux/gunyah.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _GUNYAH_H
> +#define _GUNYAH_H
> +
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <asm/gunyah.h>
> +
> +typedef u64 gh_capid_t;

I think there was a rule on typedefs? Maybe I'm mistaken, couldn't find 
one. Why do you need it in the first place? Just use u64. Or 'enum 
gh_capid'.

> +
> +/* Common Gunyah macros */
> +#define GH_CAPID_INVAL	U64_MAX
> +



-- 
With best wishes
Dmitry
