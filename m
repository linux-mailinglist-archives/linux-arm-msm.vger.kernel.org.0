Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E126569EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiL0L3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbiL0L3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:29:13 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A4B6568
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:29:12 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id s25so13493635lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wa3h2Qetrih6UoBE+cWeSohx9msqd5VAoUPVIqKDWUA=;
        b=GQxLRK+mIEdSPHTqvHwuBKOZCCVd7pDhEja+W1S/+IoDDwiyHbB6XKAiqEmeHWaKxl
         u56kddpHsXEovK0JkeZF+q5rclnayaHHbcVpWYjXJZQaE7UelbodffWHye7+rLJ52T3j
         3D3OqllrjTbaZvl5CMDLlXT5u+YHwUwF508UUQSfIDiFPb0HwizuPq4PooKvMp6B+HBV
         7Ah6l+mnFIFSJ82zUZUOyyLy5SQXdGlIzAwOSqhEsdv7OYAuwkGq5adcb1gWOhhQA6Ti
         FhFSunyg3jrR9AclKxnRpqQNRPOgvw8mudPJqR2Yf/ae3/Rjc9hMlyWYtO/s3cpixQ7e
         vgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa3h2Qetrih6UoBE+cWeSohx9msqd5VAoUPVIqKDWUA=;
        b=BIrXDf4Y9CC/sAx9d9Zft6MXTL2tuR/59X4hDrN3XDYIkcN6cdB9ZmLJCUSbg9lVhS
         ltVsORfCdwL91/a9HoII8EI2t79LgtbvFNaBpK2tFAodDCxVcq+elYX/rA9V3NxeM5AB
         SjXmqG0DhxWsJVKKJuUV6XycnK0KrdLfv4/heHJd0u/8cjF/czO93iNIpBMVKppOxdGU
         Ez70Lk+dXLgBg7STvclZgKg+o2fa2P1asMNHkxDL0E4nmytlUYbbbugaDWYJ/bBnbEle
         +aNG409xLA+Bq6Ofs11O1iFBzEBUWhgX8IhieYTNqxxpkyq2LdCOJlsbgDVisi+zS3Qh
         i0UQ==
X-Gm-Message-State: AFqh2krjqMRRaHJwDbG6NAvo9r1Pd/CFg+OaQ58cAe7WzLucAVGw4Ecu
        a4hgGZLZFDbn6PdPM0Y7dYhP8g==
X-Google-Smtp-Source: AMrXdXv1wDsMtEfJWaSqXFYKwABcvaHK8Xz1eDF1xeiPUsHWSiapTtU0tm6MRtexfJkYOp4hklCzvA==
X-Received: by 2002:a2e:2419:0:b0:277:63f7:48fb with SMTP id k25-20020a2e2419000000b0027763f748fbmr5264956ljk.18.1672140550547;
        Tue, 27 Dec 2022 03:29:10 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b0027fbfaa26dbsm609598ljn.14.2022.12.27.03.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:29:10 -0800 (PST)
Message-ID: <75d3e997-cd89-78c7-703a-f8f020065e8f@linaro.org>
Date:   Tue, 27 Dec 2022 12:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] [RFC] arm64: dts: qcom: msm8992-bullhead: Fix
 smem_region, mpss_mem
Content-Language: en-US
To:     Petr Vorel <pevik@seznam.cz>, linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        devicetree@vger.kernel.org
References: <20221226185440.440968-1-pevik@seznam.cz>
 <20221226185440.440968-4-pevik@seznam.cz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221226185440.440968-4-pevik@seznam.cz>
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
> smem_region has a different region on downstream than on msm8994, it's
> defined as 150 MiB [1]:
> 
> [    0.000000] Linux version 3.10.73-g65a266a (buildkite-agent@lineageos-buildkite) (gcc version 4.9.x 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Mon Feb 24 10:43:08 UTC 2020
> [    0.000000] CPU: AArch64 Processor [410fd033] revision 3
> [    0.000000] Machine: LGE MSM8992 BULLHEAD rev-1.01
> [    0.000000] cma: Found secure_region@0, memory base 0x0000000000000000, size 150 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found qsecom_region@0, memory base 0x0000000000000000, size 4 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found audio_region@0, memory base 0x0000000000000000, size 4 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found removed_regions@0, memory base 0x0000000000000000, size 34 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 12 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found peripheral_region@0, memory base 0x0000000000000000, size 28 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found modem_region@0, memory base 0x0000000000000000, size 100 MiB, limit 0x0000000000000000
> [    0.000000] cma: Found ramoops_region@1ff00000, memory base 0x0000000000000000, size 0 MiB, limit 0x0000000000000000
> [    0.000000] cma: CMA: reserved 152 MiB at 0x0000000000000000 for secure_mem
> [    0.000000] cma: CMA: reserved 4 MiB at 0x0000000000000000 for qseecom_mem
> [    0.000000] cma: CMA: reserved 4 MiB at 0x0000000000000000 for audio_mem
> [    0.000000] cma: CMA: reserved 34 MiB at 0x0000000000000000 for memory_hole
> [    0.000000] cma: CMA: reserved 12 MiB at 0x0000000000000000 for cont_splash_mem
> [    0.000000] cma: CMA: reserved 28 MiB at 0x0000000000000000 for peripheral_mem
> [    0.000000] cma: CMA: reserved 100 MiB at 0x0000000000000000 for modem_mem
> [    0.000000] cma: CMA: reserved 0 MiB at 0x0000000000000000 for ramoops_mem
> [    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for default region
> [    0.000000] PERCPU: Embedded 15 pages/cpu @0000000000000000 s38912 r0 d22528 u61440
> 
> But that conflicts with cont_splash_mem and cont_splash_mem:
> 
> [    0.000000] Linux version 6.1.1 (pevik@dell5510) (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for De2
> [    0.000000] Machine model: LG Nexus 5X rev 1.01
> ...
> [    0.000000] OF: fdt: Reserved memory: failed to reserve memory for node 'smem_region@0': base 0x0000000000000000, size 150 MiB
> [    0.000000] OF: reserved mem: OVERLAP DETECTED!
> [    0.000000] smem_region@0 (0x0000000000000000--0x0000000009600000) overlaps with memory@3400000 (0x0000000003400000--0x000000000400000)
> [    0.000000] OF: reserved mem: OVERLAP DETECTED!
> [    0.000000] reserved@5000000 (0x0000000005000000--0x0000000007200000) overlaps with memory@7000000 (0x0000000007000000--0x000000000ca0)
> 
> 1) Obviously there are more memory to be fixed, e.g. modem_mem, but
> fundamental is to find out whether such a big mapping should be really
> used. If yes, what is the trick downstream uses, that it allows
> overlapped memory? Or memory is not really overlapping and I cannot
> trust the reported value? What base and size should I define then?
> 
> Angler downstream defines crazy values for secure_mem as well [2]:
> [    0.000000] cma: Found secure_region@0, memory base 0x0000000000000000, size 300 MiB, limit 0xffffffffffffffff
> 
> But then in mainline is defined just 2 MiB at 106 MiB:
> 
>     smem_mem: smem_region@6a00000 {
> 	    reg = <0 0x06a00000 0 0x200000>;
> 	    no-map;
>     };
> 
> => should I use just 2 MiB region? But at what base?
> 
> 2) Is mpss_mem equivalent of downstream modem_mem [3]?
> 
> Kind regards,
> Petr
> 
> [1] https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-7.0.0_r0.17/arch/arm/boot/dts/qcom/msm8992.dtsi#278
> [2] https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-7.0.0_r0.17/arch/arm/boot/dts/qcom/msm8994.dtsi#272
> [3] https://android.googlesource.com/kernel/msm.git/+/android-7.0.0_r0.17/arch/arm64/boot/dts/lge/msm8992-bullhead.dtsi#148
> 
> Not-Yet-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
smem is not device-specific. secure_mem is a bunch of PIL+maybe
TZAPP memory regions, it's really a mess downstream..

Look here:
https://android.googlesource.com/kernel/msm/+/43154bfee910f2efd0ff0d60e6b1c25192367ab9/arch/arm/boot/dts/qcom/msm8992.dtsi#2173

Konrad
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index 4bceb362a5c0..fb4879b4acbe 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -12,8 +12,9 @@
>  #include "pm8994.dtsi"
>  #include "pmi8994.dtsi"
>  
> -/* cont_splash_mem has different memory mapping */
> +/* different memory mapping */
>  /delete-node/ &cont_splash_mem;
> +/delete-node/ &smem_mem;
>  
>  /* disabled on downstream, conflicts with cont_splash_mem */
>  /delete-node/ &dfps_data_mem;
> @@ -60,6 +61,11 @@ removed_region: reserved@5000000 {
>  			reg = <0 0x05000000 0 0x2200000>;
>  			no-map;
>  		};
> +
> +		smem_mem: smem_region@0 {
> +			reg = <0 0 0 0x9600000>;
> +			no-map;
> +		};
>  	};
>  };
>  
