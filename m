Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706B67A77DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 11:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbjITJp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 05:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbjITJp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 05:45:29 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05576A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 02:45:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bffa8578feso60183131fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695203121; x=1695807921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROIbgkr8E7Nrb6d7F4e7U0q1YWrRxeLH8QG4xJU6CVU=;
        b=nZ8u1l6kZoPDjHYSW/3pmFqnjGoZIJQwotgIEdglVyT7+dB7CgnY1jldXXxkJjLT0B
         ePtmKjLz1VziNIMqM8aVS4uR1OXG211fTCB5scvpV+fweR3AyxN+YYaHqOIq7eBY+h59
         6KmrhNvb7BAZABVseMO/rc6bncUm1DtGV3eqkCypUYPpQogmSUF7BImlhjllSbpI9P41
         jvY0CgExZMwm6jq8B/fiWJ0HNAobjcHbTxr/bQmbqCd4w0n16WJtgoNX7fPk+3PSoa61
         4Z6k9R5B/+OzABueUn6R+gxox+tUiUafin8RLWvRmaDZVQksnSD2sAWmcwWg8HQdnlHn
         iAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695203121; x=1695807921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROIbgkr8E7Nrb6d7F4e7U0q1YWrRxeLH8QG4xJU6CVU=;
        b=fYg+O7pS5snEiM1PZ1Hv8xKdSJAVCX4vlZto6mMNIgtOYIaXN58aEFB+KZs+F14Jui
         JIbhwNWpjdOhrIhs88ZRDEk/2+SXe3o9irf9VV+toZgQSMtyAtSaAYPnH9mGMiPQUMNH
         8DKTtcDGGAFxDt850dD0vGK2vLdZ5FNl8x+OMPhgaW5mLqBRuNCC5xIErNNjSECRQjN6
         w9CTJaU8YmS6gVjERSf3IgNDRysou4g0fd2IGDdGTKgsCnnvpV0rlLJk+r2DTDDz69/7
         OxmpKoBfTB6wo09uWXiMnoFwfrnZs8Kd8M6Fe2WpXTj4y77lrLJ25bQAyTqCRpRTPRVn
         a0/w==
X-Gm-Message-State: AOJu0Yx00r3a+tCiaXWlNq8h/w5vFItYmdaqbK+nFs7c0Frs5CGJeNWX
        UY1/eMXAGi5k1TDazCh02TGqHA==
X-Google-Smtp-Source: AGHT+IHGhu0CGwoUKzQBJ/ayJeMLhvpN2LuyyiuKSKpZpEdfk+C9egH6A8RMkDkjP+miH0u0kax/HA==
X-Received: by 2002:a2e:3609:0:b0:2c0:240:b574 with SMTP id d9-20020a2e3609000000b002c00240b574mr1631517lja.31.1695203121167;
        Wed, 20 Sep 2023 02:45:21 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709064ac100b0098e2969ed44sm9043952ejt.45.2023.09.20.02.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 02:45:20 -0700 (PDT)
Message-ID: <68fb2f4f-ba21-21b0-ddbe-aab92991ec44@linaro.org>
Date:   Wed, 20 Sep 2023 11:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: qcom: Enable RPMh Sleep stats
To:     Raghavendra Kakarla <quic_rkakarla@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_mkshah@quicinc.com, quic_lsrao@quicinc.com
References: <20230920052349.9907-1-quic_rkakarla@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230920052349.9907-1-quic_rkakarla@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/20/23 07:23, Raghavendra Kakarla wrote:
> Add device node for Sleep stats driver which provides various
> low power mode stats on sa8775p SoC.
> 
> Signed-off-by: Raghavendra Kakarla <quic_rkakarla@quicinc.com>
> ---
The subject must include the platform name
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9f4f58e831a4..23ae404da02e 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -1912,6 +1912,11 @@
>   			#clock-cells = <0>;
>   		};
>   
> +		sram@c3f0000 {
> +			compatible = "qcom,rpmh-stats";
> +			reg = <0x0c3f0000 0x400>;
Please test your patches before sending. This one has clearly
hasn't been.

Konrad
