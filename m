Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF23635FD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 14:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbiKWNct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 08:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbiKWNcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 08:32:05 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A52245
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 05:15:56 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s8so28095378lfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 05:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZNQEyA9/qavf+eaLOOoM57bfYHDSm28U/GYdsExyy0=;
        b=abN9UHVybGqjUb//CfYhP09NkJ6WB3mghNyGL45tfOFr6u4MCH4OigYCn534oMMjkp
         356vaV9SMp8cJqgjgCuVHRcZNwcUuMYnNRaJHfNB4jetV+LeslLEgpdxi21lQyojvCPj
         HooKfTxDA/T5fcbVPuC08WGYZ3wZLl18hQHhlXUgPcbGZtA8VYoTQ7lEwo3F0I4BJ+31
         cOMZ3a6xcPsGoeg4L1JHLkQKjJYKg3AoetWY/4bsvgKt9U+Gan4bujoIQnTom/yKxh0l
         WcZEwomdmaEjEY5z+B+KNvj5m0VSu92uLy3UGtbZYHel3l2aARkXPhgSne1Z0uK8FAzW
         ETJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZNQEyA9/qavf+eaLOOoM57bfYHDSm28U/GYdsExyy0=;
        b=wvQCdiABMvkUdhV91tY41jkFnoLCAEVc6f0KsWIwFTQ8mMLgP5qnZv6R7JGbYRc1+F
         PTVJ+YHyQ7xfDrkUmfjjBKazv7l7rWX2+AIFEwt8su0myif7kZgmKaNUh2beN0fiu+bz
         oAsFPLq0TT30b8mTaxXaZZCXpjtBA5LxOWF8tzDmD4RHwFu3r5IWjtFm2DgRWrKQ+w6g
         hj6gVDRXRWZ2rgIFh+NzeCz8pL2sDaVtjLeZZYMr0K3sqfz3wk/suFhN6+IvBYbZD7gm
         0XLDlCzmhBfD6hNFyiAcCjb/bOBMm5mTUDEigY9DOpjuoeuD8a9Gs9rqLASjTYDIDXd3
         SbjA==
X-Gm-Message-State: ANoB5pk8Odz4iJeYQqGo90J2rbqv7tF8ALMuGMBpxkntpLfLhP7aWjPB
        d0v6h2wIGzoJmeobolRkgcMAqg==
X-Google-Smtp-Source: AA0mqf4KA7upo1QyKATj7PGLnOtrvjnO80/cQB2mb80At2bZE7upIeCVeVZalRL8cZ7y5RfnA4Ttog==
X-Received: by 2002:ac2:4bcd:0:b0:49f:fd94:f107 with SMTP id o13-20020ac24bcd000000b0049ffd94f107mr9168949lfq.602.1669209354513;
        Wed, 23 Nov 2022 05:15:54 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id u1-20020ac258c1000000b0048a9e899693sm2895655lfo.16.2022.11.23.05.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:15:53 -0800 (PST)
Message-ID: <570aeaa6-0d3d-c105-5023-ea4484904079@linaro.org>
Date:   Wed, 23 Nov 2022 14:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc8280xp: add gpr node
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221123104342.26140-1-srinivas.kandagatla@linaro.org>
 <20221123104342.26140-2-srinivas.kandagatla@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221123104342.26140-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.11.2022 11:43, Srinivas Kandagatla wrote:
> Add GPR node along with APM(Audio Process Manager) and PRM(Proxy
> resource Manager) audio services.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index be72b1f7ad61..e8b6f67b928e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -1626,6 +1627,44 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "lpass";
>  				qcom,remote-pid = <2>;
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x0c01 0x0>;
> +						};
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +					};
> +
> +					q6prm: service@2 {
> +						compatible = "qcom,q6prm";
> +						reg = <GPR_PRM_MODULE_IID>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +						q6prmcc: clock-controller {
> +							compatible = "qcom,q6prm-lpass-clocks";
> +							clock-controller;
> +							#clock-cells = <2>;
> +						};
> +					};
> +				};
>  			};
>  		};
>  
