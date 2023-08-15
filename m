Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E077CE4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 16:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237720AbjHOOlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237741AbjHOOki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 10:40:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8421219B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 07:40:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so54771955e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692110418; x=1692715218;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSVBhXWt7TNqQc2EjdgZO4iqIf4JJ+I9/JS50KxzJlA=;
        b=c1FhoFHSurN696QKAroMPnZ16COmvLtaNEktF3j2u1wj47fJqOMv7QcL/qQb1VO2Ji
         bDhHJav9yC87r6vNTlSL3RcmxIEmCZdBChkTpqpCyWZAY94CkGjsiedFNAOOWU6S5wqd
         go12bxplHbCD8AbFIpdMinjYIEXF9PufktTuNvH3v86C/geXFjs106A7+crr6JtxXowA
         Ff+GZeRPklBU4WeuucxeVXdp2IUjYCQXW4eu6HYwbDeP7hgV0n5Y4DGV3kTh8UykOkR1
         r5bPA+iuFWGqMp4WJ/55cTAXFF5KbGAeUQk34ml1NkvZw3OqHDYSLdpYWZpueSCvnmIz
         0E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692110418; x=1692715218;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSVBhXWt7TNqQc2EjdgZO4iqIf4JJ+I9/JS50KxzJlA=;
        b=fxYw1x2fEXgYLels6CCT6crRa6Y3RIL9BpOFBtdD6g/bsTismEfRJ7THAPgiz37VPk
         57HiKHTBEAuApdhKr78NP+YHX4tkY4oP2E9tEjgIMYOgP9IVjI8poBT7Vbc3fdIFe+q5
         DlUzLrdXU0lXKPcP9Avj0hSlCfADsCOeOqFbX2iPRZfV52wN6fSeVIMXNpcjGOShR+49
         GN/6wMfVd+JX1ocdXoXyCATqbezn28DSHUX7Pt8HHxZ3t8EMud+MTnBoyt830P9LSSdy
         m5y4V3ETbVW/XpTl1HNDe0p6DS1MtfDpdLSq7w7Hloi0eiqrtM2q7sx2M4KUE+RTnvbI
         zdOg==
X-Gm-Message-State: AOJu0YwZrNAIp0XmxIwbcGqEFZxxW2yTzGIKP6oB6Ij8qGD9/IqUxYA0
        Xx+ABA1Gd1zLSg/5XRvMpnd3vywnHmKDnIq5UI8=
X-Google-Smtp-Source: AGHT+IEpvGhIfubksCEdL/OmxuZ5TRCfuGwk3fp2l69wE+slGPPNFJE+xDrK2HYAyxr06BpBMBiNNw==
X-Received: by 2002:a05:600c:217:b0:3fe:10d8:e7ef with SMTP id 23-20020a05600c021700b003fe10d8e7efmr11678457wmi.19.1692110417805;
        Tue, 15 Aug 2023 07:40:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g7-20020a7bc4c7000000b003fbdd5d0758sm17975681wmk.22.2023.08.15.07.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 07:40:17 -0700 (PDT)
Message-ID: <3174c398-a19a-3b59-c2fc-3ec9a5e1a9df@linaro.org>
Date:   Tue, 15 Aug 2023 16:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5018: add WDT
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        quic_saipraka@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230815141908.1084893-1-robimarko@gmail.com>
 <20230815141908.1084893-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815141908.1084893-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2023 16:17, Robert Marko wrote:
> Add the required DT node for WDT operation.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 3285c86824cf..168322bfb11c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -182,6 +182,13 @@ v2m1: v2m@1000 {
>  			};
>  		};
>  
> +		watchdog: watchdog@b017000 {
> +			compatible = "qcom,apss-wdt-ipq5018", "qcom,kpss-wdt";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;

I think all GIC_SPI interrupts are level high.

> +			reg = <0x0b017000 0x40>;

Keep the reg as second property.

> +			clocks = <&sleep_clk>;
> +		};

Best regards,
Krzysztof

