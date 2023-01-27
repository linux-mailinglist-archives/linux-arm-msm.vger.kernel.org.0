Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E4D67EAF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 17:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbjA0QaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 11:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbjA0QaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 11:30:04 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEF47E073
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 08:30:02 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so5438931wrb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ztAvsoAzYQImTyVwJUVqfrV/IQgOhB+RwyTM9zN6WaY=;
        b=UW/5znNUwWsxvfsjtLLjFNwuhIHaKoEBOcjG2bb+eyjm4LFBQQU/uNvVu8hyIHuIfg
         TrF8XHNzNV2W6mFSxW2/d9VqXhW7qvciaeq278xXYgm2FjbNy01st3qhl1swl+CQXS7T
         OhBgh/PiSDjYTubUwawJO32zi4WG9aqdJ+lLDSj+KkbzxjE+N5D4z2oZOtmmj4sReDwJ
         +R6NqIZUoSnBip5r6zKeuL5ViswQCe8l+vpr/x8olZsehlBdPaSslP2ze9TQ3D0VPT7W
         KykIByDJomJsKVDZcf0gbaPAEG51J61vOJRAzEooe11Iiw5rgbh2+yEq/hKIbnVyDhdv
         qq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztAvsoAzYQImTyVwJUVqfrV/IQgOhB+RwyTM9zN6WaY=;
        b=kWZ8cAawcIV32GDh1clRKySVnToO39C4LgAeqDvdOzKPP2VU5PNS0VBRRJYroT8bKd
         z9XC3HcAY/KrH1lFZ1YC5SA/SxFLUFvIS5E2x3sVL5WKEnMZ/JVc+z4omVyOKtUtPa2P
         k2hy44iQsKiNiArGIDZiYOMIrre9oBFyEBUVGLcGG3ntAIVpfEFZ72c+NQx/fOt1ESrZ
         x3LVQeSFIL7HrYgCKCrwSEL+Tb9Pr3/cuM/iLOHeypns9XEPv38tI1p39U7FhpjVi6iR
         h6Jt6/H6yML5lkyhNN5NQjwnDmGNRkX/jugHHLStIEkloOlqsWFfjEYT5aSRs9rh2Kt5
         M8EQ==
X-Gm-Message-State: AO0yUKXyrF9dlRG8NgDeUJhbe6X4sU1qLF084AP2IpfKkDseYbL2A21K
        SttNzRrz1ufYBSr5j2HmrNA0Tg==
X-Google-Smtp-Source: AK7set/UDizDnyMvruCOZDEScNCNmOdz+58xyORUaEm+CmHCC7J/2oz7CtwVd6r4oePH8H84tPN3ZA==
X-Received: by 2002:adf:c7d0:0:b0:2bf:b113:8ae2 with SMTP id y16-20020adfc7d0000000b002bfb1138ae2mr12176745wrg.15.1674837000960;
        Fri, 27 Jan 2023 08:30:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6? ([2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600010ce00b0029e1aa67fd2sm4447762wrx.115.2023.01.27.08.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:30:00 -0800 (PST)
Message-ID: <575d7d75-7fe7-77cb-c39c-4385a14c1f61@linaro.org>
Date:   Fri, 27 Jan 2023 17:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Fix DSIn PHY compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230123200552.553181-1-konrad.dybcio@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230123200552.553181-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 23/01/2023 21:05, Konrad Dybcio wrote:
> Use the correct compatible so that the driver can probe properly.
> 
> Fixes: a6dd1206e45a ("arm64: dts: qcom: sm8450: add display hardware devices")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d66dcd8fe61f..8d85a3139849 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2873,7 +2873,7 @@ opp-358000000 {
>   			};
>   
>   			mdss_dsi0_phy: phy@ae94400 {
> -				compatible = "qcom,dsi-phy-5nm-8450";
> +				compatible = "qcom,sm8450-dsi-phy-5nm";
>   				reg = <0 0x0ae94400 0 0x200>,
>   				      <0 0x0ae94600 0 0x280>,
>   				      <0 0x0ae94900 0 0x260>;
> @@ -2946,7 +2946,7 @@ mdss_dsi1_out: endpoint {
>   			};
>   
>   			mdss_dsi1_phy: phy@ae96400 {
> -				compatible = "qcom,dsi-phy-5nm-8450";
> +				compatible = "qcom,sm8450-dsi-phy-5nm";
>   				reg = <0 0x0ae96400 0 0x200>,
>   				      <0 0x0ae96600 0 0x280>,
>   				      <0 0x0ae96900 0 0x260>;

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on HDK8450
