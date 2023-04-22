Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBBD6EB921
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 14:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjDVMTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Apr 2023 08:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDVMTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Apr 2023 08:19:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D75E198A
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 05:19:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ec817060cdso2835118e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 05:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682165958; x=1684757958;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fs5WpnEzScYRY0NWX98UQblKp+aME7xLTSV7j9HLXyA=;
        b=haGLbmX02zS0oMyXKvxUEmeulckl7+xD3FP7P4FFRUBxO4LhDVIS7MIJ3dOpYNcQ6f
         tDG+KibL7sZ+u7JcC0G0Iy7pXilEO4gMBpXUR8I8bkQh/aG8bfS7BzP3DWo02fU3sDd0
         9PixJ+OE9FylpKA1LqaBNXcF6p8icAEXzY8ZN2MLyI+TVfkuKgsxRamjZsqR8eDiX0tf
         bQ1iivSxPgzKp85e2UA6UaQo0fux83aqaKHQHLS0NLWMBiTmbz9tLijbvlGMaCa3Crty
         9fWPjX9kyZRXM9CoLM4sIjKCsKlOZuJBrwdkG4ubOc0UGgD6GddojixeQNsgibQCG9/M
         ZzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682165958; x=1684757958;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fs5WpnEzScYRY0NWX98UQblKp+aME7xLTSV7j9HLXyA=;
        b=G5DqNqtoF/7yYfYshPB8V6oLdni1BvVT8IOIAx5lbdf2+FhGSoQREAnvcXy0MXjI8I
         Vie0kcCcLJvk//N9jaGIswLzDFYk2t0xY2Oa3JsDwo6PWl7ZY2jNMLG8ZUQykXOid3MU
         e7b263sY2ewlq5TGuwfLLoLsjVBgdS9CEBHpqfllgSwhTiaQHqSrmeaTNOAMiQvH3His
         ukAx2gEv0VFbLWD5mM08742ZkoJcDAgZ35jYX772vo5XKX8mH9KE8neD5Z4hWQ1lr4z9
         gHqKCftOy2XemPWHHgPrTv8bJRF5K+GRqDc+FK7A3oCyG99hsqATHAl0Y3q75k8Kvsu1
         9G2g==
X-Gm-Message-State: AAQBX9eKMVK0kwpwIgW4lBMoIDfv9xLWcjb36cXPAFaIsaiLximUv8vo
        QGdgD0a0y8h66VCsF0knOc2AvA==
X-Google-Smtp-Source: AKy350ayaic7fsPd2jMuxHiut+KzG0HpH3HoR/EcTNQb+rSltT42PSrtvGO7fjkAgct6AKKJbmYenQ==
X-Received: by 2002:ac2:5a19:0:b0:4ed:c76b:6aaf with SMTP id q25-20020ac25a19000000b004edc76b6aafmr2152132lfn.56.1682165958424;
        Sat, 22 Apr 2023 05:19:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id u6-20020ac248a6000000b004eb51cfb147sm869940lfg.115.2023.04.22.05.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 05:19:18 -0700 (PDT)
Message-ID: <30e57210-c356-4663-be72-3f876605b390@linaro.org>
Date:   Sat, 22 Apr 2023 14:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8994: fix duplicated @6c00000
 reserved memory
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420180746.860934-1-krzysztof.kozlowski@linaro.org>
 <20230420180746.860934-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420180746.860934-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 20:07, Krzysztof Kozlowski wrote:
> Reserved memory @6c00000 is defined in MSM8994 DTSI and few boards:
> 
>   Warning (unique_unit_address_if_enabled): /reserved-memory/reserved@6c00000: duplicate unit-address (also used in node /reserved-memory/hole2@6c00000)
>   Warning (unique_unit_address_if_enabled): /reserved-memory/reserved@6c00000: duplicate unit-address (also used in node /reserved-memory/memory@6c00000)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
I only see the downstream entry for this specific address on the
Lumia UEFIs, not in Xiaomi or Sony downstreams.. I'll investigate
a bit more including booting downstream and checking dmesg,
maybe it's reserved dynamically..

Konrad
>  arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts        | 1 +
>  arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/msm8994.dtsi                    | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> index fcca1ba94da6..501e05efbef4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> @@ -15,6 +15,7 @@
>  /delete-node/ &audio_mem;
>  /delete-node/ &mpss_mem;
>  /delete-node/ &peripheral_region;
> +/delete-node/ &res_hyp_mem;
>  /delete-node/ &rmtfs_mem;
>  
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> index 2861bcdf87b7..cbc84459a5ae 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> @@ -23,6 +23,7 @@
>  /delete-node/ &mba_mem;
>  /delete-node/ &mpss_mem;
>  /delete-node/ &peripheral_region;
> +/delete-node/ &res_hyp_mem;
>  /delete-node/ &rmtfs_mem;
>  /delete-node/ &smem_mem;
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 5a7923d7c62a..405778d92b43 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -231,7 +231,7 @@ adsp_mem: memory@c9400000 {
>  			no-map;
>  		};
>  
> -		reserved@6c00000 {
> +		res_hyp_mem: reserved@6c00000 {
>  			reg = <0 0x06c00000 0 0x400000>;
>  			no-map;
>  		};
