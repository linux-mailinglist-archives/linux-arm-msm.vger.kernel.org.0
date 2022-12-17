Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0DE64F997
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiLQPFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiLQPFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:05:11 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F99112AAD
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j4so7803634lfk.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnIzRoZUtaVJ74HIsztH5b3lR60yKlYfkN0aaqkEILQ=;
        b=MgnOV5Qsubwco3wCihC5nK988UnH2rw4wVzhglJRYmxESHCkUtIeFdcwvPB3XNdXPn
         N48dTUf2AsCzVtehyT0MPU5iAgjV7PU4O4N5HN5dl1I1ev7iX7UeGp3TcJnHUXDkHSXk
         Vtlz/wnHkzoKDu/0GvWlux225/z4B8tyFLeKuDr5pvzhxg/XQ8eDS0CYPmkJJmmut6XD
         KCiwKAHwZeLdJ3lnLk6o/HgnwfFcqdWTMyskCLITt578hb7W4meOqmXkHLiu/LTh8TZP
         qKHDcNugoPiSA1DXF8rTxdAiuwst4YGS77t2pldKFEuUEnyiNXgb1HEwpfLQkq/ZROht
         20Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wnIzRoZUtaVJ74HIsztH5b3lR60yKlYfkN0aaqkEILQ=;
        b=MqWgdlpZA2GCworYg3Oiq2CLr8xep/OGRM6imXsSDW529/+lhsJf2NyU4qjZAiItE/
         SAGA7zWKEwZIU7ANLp2E958zGwVyin/nr/z41E4cpZ9jO2Hr0pxwVFBqWF0uE56QjVDb
         kZ/vHDLXDTr/AMHXg9tG5pKxFszi4+cfhd4J6Q6J7H6FoglAYTqyftk+M4x+ydF41kDl
         TfDEQcftNoBAwuxyYUlOnT+0S6arcU+nXLd6Ds7ZucLlpX+EDzXCv7qbT8uQgVrTEa6A
         PEgX/4zkBd4v8OfmNR1ffgudmopS9v4n8ps13UuzNEA1bupQGMS3QPYGyhSxqv/e0+kH
         +X0Q==
X-Gm-Message-State: ANoB5pnwPGJS1WhFZFd3LAlENPF5K6UvIEgOkvXsnmrMFTVDhmpe3tcl
        Jt/moYMfGPLECaIINIWMyYV04tPlK3kgvayR
X-Google-Smtp-Source: AA0mqf7EUTBX4P1t2dNygS5V46OHzGzm/zmFjfiisE8LCdJP+M+FK+RvjGLs0e48yzRnm4L5olg+Sw==
X-Received: by 2002:a19:f50a:0:b0:4b5:9138:145b with SMTP id j10-20020a19f50a000000b004b59138145bmr9443812lfb.14.1671289508647;
        Sat, 17 Dec 2022 07:05:08 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id o10-20020ac25e2a000000b004b5478d8222sm531284lfg.184.2022.12.17.07.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:05:08 -0800 (PST)
Message-ID: <15a00364-db2d-3025-bcb5-87c464756ccb@linaro.org>
Date:   Sat, 17 Dec 2022 16:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8450-qrd: add pmic files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
 <20221217003349.546852-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217003349.546852-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:33, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> SM8450 QRD features bunch of PMICs, add the PMICs which we have already
> upstream files
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index ee62514fff68..e24bb77b2410 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -7,6 +7,9 @@
>  
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm8450.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350b.dtsi"
> +#include "pmr735b.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8450 QRD";
