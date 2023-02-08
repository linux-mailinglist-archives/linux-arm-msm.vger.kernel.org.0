Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9668468F3A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 17:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjBHQoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 11:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjBHQoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 11:44:08 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65864E53B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 08:43:40 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id rp23so1519982ejb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 08:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASbsE/XmAlMrDircKHKs5lE92BDcQ2dh7PvE1hQ63fE=;
        b=EXIefF7NkFQhnz6WXVJgBWhSVN0YZG69qlxFwlhMrse5t8dtnaNwCPZFR/u/pLt3gE
         V/DWB8M+haVNDAKX3i7vWpjm/AWl2OgxMj8E40xbBxYraC5wsGXEMXy/rjkIAsvJfdx7
         K/b9dUDLIRuFELLr1IGqZa5ry9VZBqV6eTQJxJbB/IBX66DcLa4DVIuLIAFcd/+7LY1y
         9fUW/FIKj6lqMVcr+wd6ewBSL5QvYdZLWr0aNqmEzyIJ8KhKWdYZUdPsz1cpyK5WGNuD
         oZpEiOtRxqhoWJTKf0E1YNTt4WanKcqrC2qJgFeBDZzgPH8x4iMIwwAHtoSA8WfMIHa3
         jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASbsE/XmAlMrDircKHKs5lE92BDcQ2dh7PvE1hQ63fE=;
        b=OmEbOBrZD2mvjPK8BayY1732T5BD6Vf4ZTwTNnyqM1vCIWReKKAet1k+JlCcq4xJPg
         SSD0PTqvFIfshPDh03d4vT/yBeqGrW3BUC5OJA2hrlbtDfSkC6OIJRtTIXmE7PkyxKET
         Qxak6uvivHhNzR4dOSyZLVnZ5XU0uLWxITAcAK3fqTmUQ4uHjU/j6yB2niAxxO1bUA23
         fTx61Cs5p3x/0UgScPzsx1r0EFMvG0/+oQFJzhMYq5GsJJPNgGPsM8vBn9BgBLHffFR5
         fx8Qj2uer8vK6mtp3ZJk3t4WTZcKaQsgsxiEJgX78Mz35S7rO4iELAm++zikF5u68x5E
         +lAQ==
X-Gm-Message-State: AO0yUKUEds8eTBru6vZcmKn2xAVRU0J497Y7jRRI3rPgHDN8EmM0lVmj
        y/tr/G8nJY8RD6iOREOjDKSInw==
X-Google-Smtp-Source: AK7set+RAX84i4gKstXtg9gLaHvp4VUWeWIP8mak3bhwJw+R/hfeFhIOdVQu3SHtfkpRQcIdY6Zvrg==
X-Received: by 2002:a17:906:1286:b0:88f:9c29:d232 with SMTP id k6-20020a170906128600b0088f9c29d232mr8545358ejb.57.1675874617446;
        Wed, 08 Feb 2023 08:43:37 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906609500b008a58c3b8daesm3912331ejj.164.2023.02.08.08.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 08:43:37 -0800 (PST)
Message-ID: <9ac637ef-ab11-518a-b5bd-243712a482b3@linaro.org>
Date:   Wed, 8 Feb 2023 17:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
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



On 6.02.2023 15:57, Dmitry Baryshkov wrote:
> Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
> the GPU to function properly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index df841230d1b7..5e744423a673 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -284,6 +284,14 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8350/a660_zap.mbn";
> +	};
> +};
> +
>  &i2c15 {
>  	clock-frequency = <400000>;
>  	status = "okay";
