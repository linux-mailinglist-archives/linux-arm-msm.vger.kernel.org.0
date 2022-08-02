Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA8B5877E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 09:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbiHBHdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 03:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235911AbiHBHdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 03:33:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDBE15FEB
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 00:33:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so20773141lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 00:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=x0vIST26rZjynUdC0JD/9jdYIKyQsxo+i+ae0TFwt3I=;
        b=Ynj3vf6wpFup4Zbq1zEDpexAo9XLF5Wpopp0ljAX3UEU4+XaLR3OXTJW2DRzA7D6f/
         O9C2dDynvEdbBEjlBzHoLN0sdWLOjqlzn3m0vOAIZFrAi0PdYnZSiJDiN/p2oLjsHNUE
         t+17hpCPReEUV6/WpviWS9MuuzIBAmSfiUzTEGxkHwMMUg5FhZeYtXeW4ud4p5gU/Maa
         rg01g/BtuJKa/IeBBjC2BpqkeTktNn8oJlvH1X+a6Dma0RJgjQTJQ78BKoPyIWbAjA6x
         OOMtJSVIQgcejqs6LexBESy2EdVQgYxBIVjgMwpDwp0pPMUUF2HUnFk9qF6OVfr0IyKS
         5QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=x0vIST26rZjynUdC0JD/9jdYIKyQsxo+i+ae0TFwt3I=;
        b=hJmMp+gH3KSOJMa3Cs+6VJDFWlYZ5TKvTMgkgE2CcCB7jF1rvRK41e2sOEhODT2paL
         sRUyAQBpyXvSh7IJVATZRmJ0FmsOFJ4J6KI1t/Lhkkdmpu7dvUJrdkDmsedmQVyK+eVV
         pbOeA+E35orje0DfNoeDdmd//3j9YXtGWuPp5XcW4A9EJ2tczARNB9gohlxGj6N3gXye
         gN72BpVj9eqC0qQqI7TKH5I0jUMcOl3KBy6ubxp8R0AGGtojLc4ZjmF0RY7Yphjr34M8
         +7Fqq28GcxE8aTy0DjCMDVjjO52Yt0h+RqZaAJXC1y1P0cci+5EzZIHyubXfMB+SoDaM
         4zOg==
X-Gm-Message-State: ACgBeo0Sz0PB9MFI3Vt6CcKzSW5R8ZhVdsl7I6mfmshp1ybLCkdRfD/R
        f1E+aDGCDfrX1CsT0moOu/AyRw==
X-Google-Smtp-Source: AA6agR6W55Lb6cpzjt373AB2/+S8QAA6i4tr+Ru+u1BwPZ6v0wI3o12azkoxYP5Ptz0nUaCB4GKQqg==
X-Received: by 2002:a05:6512:401c:b0:48a:f35d:8b51 with SMTP id br28-20020a056512401c00b0048af35d8b51mr3795149lfb.172.1659425600014;
        Tue, 02 Aug 2022 00:33:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f48000000b0048a8852fc7asm1239895lfz.49.2022.08.02.00.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:33:19 -0700 (PDT)
Message-ID: <24a2d70e-0ed1-5f7d-9c9c-261afac73989@linaro.org>
Date:   Tue, 2 Aug 2022 10:33:18 +0300
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
> +
> +/* Common Gunyah macros */
> +#define GH_CAPID_INVAL	U64_MAX
> +
> +#define GH_ERROR_OK			0

Is there any semantic difference between GH_ERROR_foo < 0 and 
GH_ERROR_bar > 0 ?

> +#define GH_ERROR_UNIMPLEMENTED		-1
> +#define GH_ERROR_RETRY			-2
> +
> +#define GH_ERROR_ARG_INVAL		1
> +#define GH_ERROR_ARG_SIZE		2
> +#define GH_ERROR_ARG_ALIGN		3
> +
> +#define GH_ERROR_NOMEM			10
> +
> +#define GH_ERROR_ADDR_OVFL		20
> +#define GH_ERROR_ADDR_UNFL		21
> +#define GH_ERROR_ADDR_INVAL		22
> +
> +#define GH_ERROR_DENIED			30
> +#define GH_ERROR_BUSY			31
> +#define GH_ERROR_IDLE			32
> +
> +#define GH_ERROR_IRQ_BOUND		40
> +#define GH_ERROR_IRQ_UNBOUND		41
> +
> +#define GH_ERROR_CSPACE_CAP_NULL	50
> +#define GH_ERROR_CSPACE_CAP_REVOKED	51
> +#define GH_ERROR_CSPACE_WRONG_OBJ_TYPE	52
> +#define GH_ERROR_CSPACE_INSUF_RIGHTS	53
> +#define GH_ERROR_CSPACE_FULL		54
> +
> +#define GH_ERROR_MSGQUEUE_EMPTY		60
> +#define GH_ERROR_MSGQUEUE_FULL		61
> +
> +static inline int gh_remap_error(int gh_error)
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
> +		return -EPERM;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +#endif


-- 
With best wishes
Dmitry
