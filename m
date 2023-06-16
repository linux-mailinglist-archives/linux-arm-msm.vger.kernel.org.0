Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558C2732FF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 13:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244204AbjFPLgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 07:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245281AbjFPLgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 07:36:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696552D60
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:36:27 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1b06af50eso7607991fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686915385; x=1689507385;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nd2+y5FOD0js54Jlzt9YMY1XXmMWttJihYBEi7eAis=;
        b=F99eWGrob74bUKUxo4SyMxapCXfyZPWkFbu6a2GblQM3ogA3pokM2aXFQlvCpRKWX0
         ywE/JVZjVIuzOHi/vDX1JXyI2oOiMkdPeg4mlsLTCkbWBxl9nP4DE4gV6OxPjVAewZ6k
         fvym5yh1HRii9IF3Z95Pcl6VDcVvZVJMFFZVQznKV38yPXxEb3d9418nlSwO0u0YL4FG
         OU+8TSyB9erYQbQrRe4xvWCJZSPFqczWBg/a5hGU580UqmoNPHQ54MZSNSjaS1g+ftY0
         NgZ07BcFIJlToMqgxnShu6JKX9uEhr5WvTTKkdG2WSXmZsWcTRSqQj0UnzXOD4xVU16I
         ZL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686915385; x=1689507385;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nd2+y5FOD0js54Jlzt9YMY1XXmMWttJihYBEi7eAis=;
        b=TAau7a34AiKKwVDA+XE7CPJy/QB3Fiz8jcnACOVzP9L9njoUJrIQ1dyZkxxuwgMkEy
         8D/t9d4sWot5m4TN5kNQslCtqGPghFUA8UH4jrEtEVlL4k8Vag7F+T9IsKF+2RHIj2tk
         IowdwV7vIKolRFD1C0nFdoCGWHyKVgR1Jp9KeeLbCoauwVRJa54WuGmQ8FZ6GxcfYR/R
         9P46w/rL7ZqiEJiz0VnYTvWA1zAlZQ+FFw2XmA/OUIyLlkRjkM4z2yHUgihirwYcjMxX
         0kxIliy4FGvFmoAP392l9/LcoX703km9gUbT9CK4F73u8f1B74/65S9IY+O4SxdM1n0X
         qgFQ==
X-Gm-Message-State: AC+VfDxWAP/F+6OZ+kHvYYYO9oyQOo3Xj3XYkLHZOW2p1aNSxYOxawZy
        rO2zL1oe8rAxATswLc7F0Gayyw==
X-Google-Smtp-Source: ACHHUZ4VHuScWcMmQmkl2PxwRNO9kvdY7q8r8qdMqxMXbSEiD+xFQg91cfPbsiev/FMUIypDdi/0Tg==
X-Received: by 2002:a05:651c:22d:b0:2b1:d19a:f190 with SMTP id z13-20020a05651c022d00b002b1d19af190mr1522620ljn.49.1686915385658;
        Fri, 16 Jun 2023 04:36:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id w25-20020a2e9599000000b002b34735dc72sm1300665ljh.108.2023.06.16.04.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 04:36:25 -0700 (PDT)
Message-ID: <b2553058-bd78-6d9f-dcd0-d1c086b4fc3b@linaro.org>
Date:   Fri, 16 Jun 2023 13:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        andersson@kernel.org, broonie@kernel.org, agross@kernel.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, judyhsiao@chromium.org,
        quic_visr@quicinc.com,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <20230616103534.4031331-1-quic_mohs@quicinc.com>
 <20230616103534.4031331-9-quic_mohs@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [RESEND v6 8/8] arm64: dts: qcom: sc7280: Add qcom,adsp-pil-mode
 property in clock nodes
In-Reply-To: <20230616103534.4031331-9-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.06.2023 12:35, Mohammad Rafi Shaik wrote:
> From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> 
> Add "qcom,adsp-pil-mode" property in clock nodes for herobrine
> crd revision 3 board specific device tree.
> This is to register clocks conditionally by differentiating ADSP
> based platforms and legacy path platforms.
> Also disable lpass_core clock, as it is creating conflict
> with ADSP clocks and it is not required for ADSP based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index c02ca393378f..876a29178d46 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -197,6 +197,14 @@ q6prmcc: clock-controller {
>  	};
>  };
>  
> +&lpass_aon {
> +	qcom,adsp-pil-mode;
That's a whole bunch of hacky bindings that makes no sense..

What should have been done from the beginning is:

- all clocks should be registered inside the clock driver, unconditionally
  as far as .c code is concerned

- the regmap properties within should reflect the actual max register
  range within the hardware block

- device-tree should contain protected-clocks, which omits registering
  specified clks (I guess in the ADSP-less case you could probably even
  register all of them and it wouldn't hurt)


> +};
> +
> +&lpass_core {
> +	status = "disabled";
status = "reserved";

Konrad
> +};
> +
>  &lpass_rx_macro {
>  	/delete-property/ power-domains;
>  	/delete-property/ power-domain-names;
> @@ -239,3 +247,7 @@ &lpass_va_macro {
>  
>  	status = "okay";
>  };
> +
> +&lpasscc {
> +	qcom,adsp-pil-mode;
> +};
