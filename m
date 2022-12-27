Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C3A6569E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiL0LZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbiL0LZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:25:30 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE122DDA
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:25:28 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e13so10903506ljn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEa56J+biClKPdkkPeUTIeERhI25bf4Ip53h94j7TL4=;
        b=JaLOCcLH/gVNwLPstc8naPCrEaY4UIwMLGkLFxm+UPL07bsCP/eoR/vqcZYT35JmOw
         NO39NoBZpPGOEuL0TcYejs0bah8JH1m1FmO06991p71P8t7SMlDbNF/Ti8Tn71RUoBIb
         cF/991fEUnBhYTCRfEXXctxZPWf59jkiQFUgJUf4nglAArwQHIchiiHJ2y/MrjQjPNgw
         YitDky5WQBxspZOgNF2ctCfR5ynVbOyQhnsgyu1IlGRrbaJwYY5EX6McWXen2ds3L+TI
         cVI225TlMpfQrlnvPU64JR9o4ZxDk3Fyhu1zDP8qFLltMxg7F3dQ2/9xjUvTJzgSu+v6
         OpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEa56J+biClKPdkkPeUTIeERhI25bf4Ip53h94j7TL4=;
        b=VGQgBpmZFYyhoELkVeBtcuf6G7+Bo9APPajQb85BGQoBQ/5q5c/eC56ljURG9Ddvfs
         CcxM8NNwi46sc01p2qlGTP/JB7qllKRh+AeEJE84X0PZzw+ABpBtI20m0A40rzDTM/kH
         S/qKPE9T4O3bVA4QuJtfJ63qozA/Y76zpqF4fDxVPfsj4PINQk6jYLQEbYv0Gx9lz7/h
         vbYtNzFatKdidICtMQrUZoHvWKnwwUM+blwO8cKJPBPU69LEL7wd/+JEsjOOa2rk9Fj3
         EjNrLqKJfu9nWcjUd1Uj+k0mPxnc+08tSjOGYgMYhD/BzdvK/fY1aK/B/F1cPvqI2tT+
         vqDQ==
X-Gm-Message-State: AFqh2krj8dTCG72MgYgM7v1wL/OOeAUQyw/H6IHF59zm8jStF2t8gh4F
        CQ5YPQO2S8vGGYSwq/1uDgv0qA==
X-Google-Smtp-Source: AMrXdXuk0th3z2aOH7BrqnA597ywVwt9CU0nAFjDv9qzL7/X+sYNYd5o34SwsSiSHYyBXYO9ltuNoA==
X-Received: by 2002:a2e:300b:0:b0:27f:bf36:8e20 with SMTP id w11-20020a2e300b000000b0027fbf368e20mr1645106ljw.53.1672140327063;
        Tue, 27 Dec 2022 03:25:27 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id bf20-20020a2eaa14000000b0026dee5476d5sm1602134ljb.113.2022.12.27.03.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:25:26 -0800 (PST)
Message-ID: <575679f4-f7c5-78f8-4f00-4e7bd0ba6be4@linaro.org>
Date:   Tue, 27 Dec 2022 12:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8992-bullhead: Fix
 cont_splash_mem size
Content-Language: en-US
To:     Petr Vorel <pevik@seznam.cz>, linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        devicetree@vger.kernel.org
References: <20221226185440.440968-1-pevik@seznam.cz>
 <20221226185440.440968-2-pevik@seznam.cz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221226185440.440968-2-pevik@seznam.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.12.2022 19:54, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Original google firmware reports 12 MiB:
> [    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000003400000, size 12 MiB, limit 0xffffffffffffffff
> 
> which is actually 12*1024*1024 = 0xc00000.
> 
> This matches the aosp source [1]:
> &cont_splash_mem {
> 	reg = <0 0x03400000 0 0xc00000>;
> };
> 
> Fixes: 3cb6a271f4b0 ("arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping")
> Fixes: 976d321f32dc ("arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994")
> 
> [1] https://android.googlesource.com/kernel/msm.git/+/android-7.0.0_r0.17/arch/arm64/boot/dts/lge/msm8992-bullhead.dtsi#141
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Hi,
> 
> I'm sorry for introducing a regression.
> 
> Kind regards,
> Petr
> 
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index 79de9cc395c4..123ec67fb385 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (c) 2015, LGE Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
> + * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
>   * Copyright (c) 2022, Dominik Kobinski <dominikkobinski314@gmail.com>
>   */
>  
> @@ -49,7 +49,7 @@ ramoops@1ff00000 {
>  		};
>  
>  		cont_splash_mem: memory@3400000 {
> -			reg = <0 0x03400000 0 0x1200000>;
> +			reg = <0 0x03400000 0 0xc00000>;
>  			no-map;
>  		};
>  
