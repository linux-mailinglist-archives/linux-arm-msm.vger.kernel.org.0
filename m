Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A31906ABD2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjCFKq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjCFKq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:46:26 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2501B20540
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:46:25 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s22so12075844lfi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678099583;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YzhRAgsZhV6Ga3q7XmiZtU/lCKypkoDOUZ/kvTeC1A=;
        b=TSdbC1h/oifoknEbyHvRePomHwk2sibWJ5zg5r4xd6cDSX4So9yuyravKsY9+pEtHA
         V9IHD1te2DOzY0MahtVwotcufiJ51t9pbBMSMddmwstcfomcfEI3TlUbkQeXp94AWJxM
         8U7jSulIitrbqAV1LhiCgscWrBFUflsRj4NOEfHhwB6eXJFen6eLwmrQafE/tHJgc+j9
         UrkPlWYvK5/s7Yc6BRJHDEA6R5eklSfvLg/l7w202veb015c0dsQbkVvEyhL1lflsf1P
         Xuy7Z7AeyYt8Aci6/0uZ1ODUEmcY7ztZmhZijVVcf7aJIknwwsKE4YbpVj+cGT1JQJQX
         EXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678099583;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YzhRAgsZhV6Ga3q7XmiZtU/lCKypkoDOUZ/kvTeC1A=;
        b=Hxv5cRkegipdTujrznpa/y38JoSjTsCt7kjvfJJlIg3vZqiuev1BQ8hUG1lmmo/lPl
         yAKJNvPa0IxNbV67YNPieWB1YyG9DycFfTxuVueFS5pHAXt+iGdBumVukxRX2F25Oa4y
         qYYYDRQfPJNtXhCCumywTu/3m6yYZF69oAMQcg3rKhXsqMYbwsb4wfVZuZFeyMfgzVoA
         PSVr0k3ZEXGEGQbg1OpIvxDJnQUv3H+cdUXjsx4B6Doi4IsHQ5fNA7vDWHes/EUnElg4
         3bvjxWoj8bajnInH6ndPRDlmxyaLCFkwicrnkrYdERbJf4MOgO2tjc5ll+bS8ee3jIQT
         PJWg==
X-Gm-Message-State: AO0yUKV09n0JWccDOP4s8ZGCMwfaBCANxWr+QJ23bt7top4UlgmNcljE
        R0DWt6Rb+XiFn6FJByBzTdEzTA==
X-Google-Smtp-Source: AK7set/QyLAJ5B7LzZb6thLyX7sRxJJLxHVXr2l9mXIFJW3R3vA9FIhkLbxKDnmRlHVcN/aZQ+Xeew==
X-Received: by 2002:ac2:5fef:0:b0:4db:38aa:a2f4 with SMTP id s15-20020ac25fef000000b004db38aaa2f4mr2680351lfg.14.1678099583439;
        Mon, 06 Mar 2023 02:46:23 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id m17-20020a056512015100b004dc4af9089bsm1579078lfo.231.2023.03.06.02.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:46:23 -0800 (PST)
Message-ID: <27e96c7d-6c2a-da0d-7653-a7aba736de0c@linaro.org>
Date:   Mon, 6 Mar 2023 11:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: soc: qcom: smd-rpm: re-add missing
 qcom,rpm-msm8994
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305122428.167580-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305122428.167580-1-krzysztof.kozlowski@linaro.org>
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



On 5.03.2023 13:24, Krzysztof Kozlowski wrote:
> Re-add the qcom,rpm-msm8994 compatible, dropped during conversion from
> TXT to DT schema:
> 
>   apq8094-sony-xperia-kitakami-karin_windy.dtb: smd: rpm:rpm-requests:compatible:0: 'qcom,rpm-msm8994' is not one of ['qcom,rpm-apq8084' ...]
> 
> Fixes: f935a752f229 ("dt-bindings: soc: qcom: smd-rpm: Convert binding to YAML schema")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
It's funny how it was used in the dt in like 2016 but only added
to the driver in 2020..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> index 16fd67c0bd1f..3580b209cd4a 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> @@ -40,6 +40,7 @@ properties:
>        - qcom,rpm-msm8953
>        - qcom,rpm-msm8974
>        - qcom,rpm-msm8976
> +      - qcom,rpm-msm8994
>        - qcom,rpm-msm8996
>        - qcom,rpm-msm8998
>        - qcom,rpm-sdm660
> @@ -84,6 +85,7 @@ if:
>            - qcom,rpm-msm8974
>            - qcom,rpm-msm8976
>            - qcom,rpm-msm8953
> +          - qcom,rpm-msm8994
>  then:
>    properties:
>      qcom,glink-channels: false
