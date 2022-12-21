Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4903C6537BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 21:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbiLUUoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 15:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiLUUoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 15:44:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF50B7D
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Dec 2022 12:44:09 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bf43so25248749lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Dec 2022 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yLX8oZ5v9e3fdvXtrp7X+EzXpLY8er8QpFf1kEgzpc=;
        b=BqGLUDayO13yDqIEzYpBIr57NeK6RZ33pNBNujzjDiFHb8f4Umc4iMYqPuI3VWV5/F
         Yy+V1JUsXssqj8YQcYeaxLGSjH/mEnZwJHZGQ+cRo4ca+mp8qijUg/Lt+pAnjiGn6At1
         qHltNmPCQXxzAgFL2e9ic5Y52tNe6aO1WpyTFwZZ0zpu5qOnB+P5qGanDX3cb6U7IIhX
         mVHtphs0umQkgLAFktgJpSO5D6wIqhzYehClv3rewXe2CMv2UkDf8bsV+GKfCtP5Th06
         T1PKkUpRDfP+IcNec1UQyFK013ertchqkFbK5jVmcM+UsEd/t958KUvZH1Jdd7AaH3hm
         MFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yLX8oZ5v9e3fdvXtrp7X+EzXpLY8er8QpFf1kEgzpc=;
        b=1mfZoAwYH/VmNaDLWGr746fEM1xIWsCIYkUyMvWVTdukott/KJHJqJ/dzyq651bt+m
         /jcLzmqXqKlQBMYZQkEARRloxU0LshaIaK/Btvwfa2ZH4z6ry/gO/7OlrAH1fhcTF8Ty
         NqhNyc0NTSgj2BnsB9VBKUJ21llfjMrHKTy4gFggrMhWXCWgJbTMafGvMzKvnWmllitP
         LTu7fdR9z90FGXXiDSiTWfq7/D04gF6+UYkufIJnPtLJ4L9I3qSfmM/KwT5JnjKcWcQu
         wDpxWGVjIDbGDeg5JNMBQcH/9qYwtn2sLq9l59XltTqwOniiNTYTgJRCj3D6G4zwSvr1
         g4Yg==
X-Gm-Message-State: AFqh2kq/pRMm2gHxdjVmk7GldI6L7WPpbOpVFQ7m9DtuaMohAaVy95l2
        iVuLXEh3lMDLBCoM/sLJt43Bng==
X-Google-Smtp-Source: AMrXdXu+8hyQRCnnntWOqqsS5p3qnKyy+begbAFYjuPYuS4VdwRfeRyE9mSsfVWotWQj1/l82YIAow==
X-Received: by 2002:ac2:59c4:0:b0:4b6:fae9:c9bc with SMTP id x4-20020ac259c4000000b004b6fae9c9bcmr932187lfn.4.1671655447821;
        Wed, 21 Dec 2022 12:44:07 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id a8-20020a056512200800b004a2c447598fsm1951904lfb.159.2022.12.21.12.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 12:44:07 -0800 (PST)
Message-ID: <c7c6df69-1441-26c0-5316-0dd464adb02a@linaro.org>
Date:   Wed, 21 Dec 2022 21:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sc8280xp: add rng device tree
 node
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
References: <20221220192854.521647-1-bmasney@redhat.com>
 <20221220192854.521647-8-bmasney@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221220192854.521647-8-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.12.2022 20:28, Brian Masney wrote:
> Add the necessary device tree node for qcom,prng-ee so we can use the
> hardware random number generator. This functionality was tested on a
> SA8540p automotive development board using kcapi-rng from libkcapi.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes from v2 to v3:
> - Correctly sort node by MMIO address
> 
> Patch introduced in v2
> 
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 4591d411f5fb..6c2cae83dac6 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1602,6 +1602,13 @@ spi15: spi@a9c000 {
>  			};
>  		};
>  
> +		rng: rng@10d3000 {
> +			compatible = "qcom,prng-ee";
> +			reg = <0 0x010d3000 0 0x1000>;
> +			clocks = <&rpmhcc RPMH_HWKM_CLK>;
> +			clock-names = "core";
> +		};
> +
>  		pcie4: pcie@1c00000 {
>  			device_type = "pci";
>  			compatible = "qcom,pcie-sc8280xp";
