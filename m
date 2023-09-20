Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512D27A7860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 12:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbjITKAN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 06:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbjITKAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 06:00:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E04EA9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 03:00:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a9cd066db5so884412466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695204004; x=1695808804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBd3XO3VXcZ5Eq/j57aWQEchJJdUk3Puq2N4/Qm3ZrE=;
        b=fIFFSWd4ZzHRni5pAcyyNjQcaD1AlBQwSWO3blkfpxagEQUBg/rP3i6Q9oV0LwGfeN
         64FfCRlIebfZb5MYiqvtONHekRd0i1q7+1h2Mqz1OkGj2LG/DihZkvje50J1jWhpOVkP
         ofj1ciHP+aCBHNk6q6r1lSH1pBN8q7d3RRi1hji6UylODXD5n33AWIbMO5zfvN5fIpZS
         XryUThF/QkCYGXMoyWDjPdyuhCUGGB4kYJZhTY86wwiuy+TLhCqEL2jhkMfyzxayy92t
         qmUPljhe4NLAN6UX/xquW5vpYNHHGMhwgPM9HG85HWad7FC29GLtfn0HeYplS78L4U99
         xCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204004; x=1695808804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBd3XO3VXcZ5Eq/j57aWQEchJJdUk3Puq2N4/Qm3ZrE=;
        b=qGWOMm9Fv48w7uMvqhFnixd8DU38mZQxBjbuWKZqAkjUYZDqcRoi0hceUAZoBwQlGK
         B4vUVvXs3yla95uwk38/99G60K3bDpQgXQ3ZAzFgHbxypmZg77tZNJa7/aSJaLAG1Esl
         8RAv6o79MGNkxp4dh0iEu3dyJsLMr2Rwi4N5k8KHEcTbmXz1Tg5VMyKk1YuI1nZakDL5
         vhKU+CZ66KvWMo2WVdYJsdbHNR/GWeh8aCsfqKUEgoOKG4D5vdcjuA4ozY6GoKzeaVoh
         Ut5RhxHh/LK3w5+339QydUUJGE1k6ePOtlgWpqL4nPPd/A9gu9OenwcSrYKfeC+GhzfH
         G5Nw==
X-Gm-Message-State: AOJu0YzpcU8NFwJcw+BNmWvY9bloOrmRBodoRKI4jWKhsQAHnU9tplKk
        HWLWurwgT3bqRrn4PEme+pHrKw==
X-Google-Smtp-Source: AGHT+IFzx44j6/2ljA8qYlX2Z/kLYtXcrrNf5TI8l2xvWsgQAei8ep7dJ2ovnEU2Nlx9asEfjVeJ3g==
X-Received: by 2002:a17:906:3091:b0:9a1:ddb9:6546 with SMTP id 17-20020a170906309100b009a1ddb96546mr1621996ejv.61.1695204003913;
        Wed, 20 Sep 2023 03:00:03 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n25-20020a170906b31900b0099bcdfff7cbsm9184201ejz.160.2023.09.20.03.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 03:00:03 -0700 (PDT)
Message-ID: <21b8b019-42b8-6e47-e640-8bca28d2d784@linaro.org>
Date:   Wed, 20 Sep 2023 12:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sm4450: Add RPMH and Global
 clock
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, tglx@linutronix.de, maz@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc:     geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        quic_ajipan@quicinc.com, kernel@quicinc.com
References: <20230920065459.12738-1-quic_tengfan@quicinc.com>
 <20230920065459.12738-4-quic_tengfan@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230920065459.12738-4-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/20/23 08:54, Tengfei Fan wrote:
> Add device node for RPMH and Global clock controller on Qualcomm
> SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm4450.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> index 3d9d3b5e9510..c27f17a41699 100644
> --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm4450-gcc.h>
These should be sorted alphabetically.

[...]

> +			rpmhcc: clock-controller {
> +				compatible = "qcom,sm4450-rpmh-clk";
> +				#clock-cells = <1>;
> +				clock-names = "xo";
> +				clocks = <&xo_board>;
property
property-names

Konrad
