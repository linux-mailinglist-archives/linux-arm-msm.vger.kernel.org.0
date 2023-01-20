Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496BA675F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 22:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjATVWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 16:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjATVWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 16:22:31 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D98EC55
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:22:29 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so17142863ejc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zs+UmtgIVGddv6KprN6BXtkow6vxqhZUCHnX30GG25U=;
        b=X9pJ7J7c4pfA5xNIpjYeRsukd/H1nHACT4Nfu4T99rkLdG5idf+bsF2NWw7izRYvhq
         oVE2WqaOfgjZpydJ6CRTsYYkoIZ6ozHvMmgVlXtfuLMF98vjtwILcyx+2P15Eg1fyWRB
         70yLM2xN2acXpqRDAOmNh9BR0O5IczjGqsBSNKDfy1Ul2YCWt7txgcEnMkqrZ1RHJXbQ
         bnZLICF5V8nE00jHEQYqFZjaMzzGEM4q8yxH8WR2nXaOsko7rJx8tsRF8xNEEtEpzxqC
         GmCqmjRvyMSV5TSGA5Z/ETZKxLULBsZu6UEEfFRGOPdg69bDNX0MjTN/C0ZiaM7eCCTK
         IBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zs+UmtgIVGddv6KprN6BXtkow6vxqhZUCHnX30GG25U=;
        b=X8fuofembs5E1jVt3Ex6ApYjxvyUBSR8a+aSR+u36Ajvd9lOjNirrp4nBfOSO8DIPq
         2D8rNsCGpbAnSDO/3qHvRLEoMlgudpYDeKvzJWAo7JZwqxpiIf2I1mBd4cJrbnGADnFt
         MrIUzqUtWW7nT098VGcd2yi0LDPpwiNYOTbMj28AQ5pyNsLtHiJ7QNs5VaJrqrIr3oYv
         /uZBI2u14ZtK6XLEp8P15KsfI82z6Pq6SGKSfNjLFmkdIJUSzgs4L/dAnBftdaX11Dtp
         zpwy/6HpZiMeQAEZ+9txNHRfU+qZyVKL5h63w7uI8gzV3BCzzJEQcw9xF9gQnMdf4Qdx
         6KIQ==
X-Gm-Message-State: AFqh2krCqCfM6mNRWsLeChaar179Lvai2VJ4yGpvrAa+vewTk61ktk0C
        IBIYQOVJspwQnc+C5DlBJbd3Y0Oru5wzwpbi
X-Google-Smtp-Source: AMrXdXuLUbPoZoARW90jlFLIvQDjlEXpxoRIk7pxHrrrCXNjAqSD+GPJEpN5eEiS01RZnbQ3wX2A4A==
X-Received: by 2002:a17:906:1911:b0:870:29fd:be41 with SMTP id a17-20020a170906191100b0087029fdbe41mr11380858eje.48.1674249748345;
        Fri, 20 Jan 2023 13:22:28 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709067c4300b007c0a7286ac8sm18494294ejp.69.2023.01.20.13.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 13:22:27 -0800 (PST)
Message-ID: <e5bd7941-0a7e-f8b5-2be8-d0d7cc0f84f7@linaro.org>
Date:   Fri, 20 Jan 2023 22:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: Add base QDU1000/QRU1000 DTSIs
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230112210722.6234-1-quic_molvera@quicinc.com>
 <20230112210722.6234-2-quic_molvera@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230112210722.6234-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.01.2023 22:07, Melody Olvera wrote:
> Add the base DTSI files for QDU1000 and QRU1000 SoCs, including base
> descriptions of CPUs, GCC, RPMHCC, QUP, TLMM, and interrupt-controller
> to boot to shell with console on these SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]
> +
> +	arch_timer: timer {
Unused label

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qru1000.dtsi b/arch/arm64/boot/dts/qcom/qru1000.dtsi
> new file mode 100644
> index 000000000000..eac5dc54a8ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qru1000.dtsi
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "qdu1000.dtsi"
> +/delete-node/ &tenx_mem;
> +/delete-node/ &oem_tenx_mem;
> +/delete-node/ &tenx_q6_buffer_mem;
> +
> +&reserved_memory {
> +	oem_tenx_mem: oem-tenx@a0000000 {
> +		reg = <0x0 0xa0000000 0x0 0x6400000>;
> +		no-map;
> +	};
> +
> +	mpss_diag_buffer_mem: mpss-diag-buffer@aea00000 {
> +		reg = <0x0 0xaea00000 0x0 0x6400000>;
> +		no-map;
> +	};
> +
> +	tenx_q6_buffer_mem: tenx-q6-buffer@b4e00000 {
> +		reg = <0x0 0xb4e00000 0x0 0x3200000>;
> +		no-map;
> +	};
> +};
