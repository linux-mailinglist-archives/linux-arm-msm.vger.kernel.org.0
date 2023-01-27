Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE43667E450
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjA0L5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbjA0L47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:56:59 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A0381B0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:54:04 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id hw16so12957264ejc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kc9X7Psg9XH95WUM/pbLlM0skWooRYAQlEwzHs4bLi4=;
        b=InvVlCHtG9hTtOGLMC0ut/USz0ZRvGhzpSZZufIT1PVkuQgrf6Jqq64nhw8p+XJrMB
         MQmkdu/1S/0qvc3DohzJBB27wzwR9+6AyB71gbOcBiFeeMaf6WV+JQ1HgC+O5hzHOs+g
         O9qOrMRy9oi/6DO2oxJ1mlnk+uOeTLJ+4dTnsVBJ5+iCjM/zYujhEE7DXXroadhZQjl5
         EsziqJU9VDYMqjCYJMS7vfYoM48KLz7d2u8m7xpDhzg3Tg1TE3kUP+NJZocTmLvNMwfK
         biqH7GBdX1hpFQXCbslGTrFG2OnXNLc2nhar2hBCo5FR+qEzwYBzs6idsbWsbsaQXciQ
         oBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kc9X7Psg9XH95WUM/pbLlM0skWooRYAQlEwzHs4bLi4=;
        b=dBb7G/Wyb7CyPDrL9QbRKWFDpLQkcWYE/pRLzFGm5J3Z4pGB4kDP2iGTsVfRdb1vn3
         WEaGia2MebAOPT/LtgZUurQqmbPSPvfaoUtrjX/U2y0d+xPjkzaT70QcrommSZUjgGq0
         ptNMwTc1CaOxpyrqTqCQmGbKUfBEIjOh3QVr5KRENa7FtEZbDcR+3KRoEaWNnLUaFsnv
         cSFci/S2SoIc6omoYlCgraa7VnhVxD80v2l4qmqV4Saq1/VPhDL9VVb9CGCEGJRYQDxd
         Hu2nPpWSTGhBB2z2pn6LDh63Vem3jfA4SAAs09cCIw7dXauoTBCMQt+xOksOh/+Irgra
         J4kQ==
X-Gm-Message-State: AFqh2ko6nEkTNGr4qgZj0jzqi9k5T7yjtFGAbeSxhTYh0GQlcG4q1v4r
        VZi1d7IMB1QGTwmcm47djgiN5Q==
X-Google-Smtp-Source: AMrXdXs5TtLT+nzqXy7OSsMFvTU8VuY1tsIPNgpfOx+NcJgVrlvaoMINgL/37uc2L0bsKXdlYVduBA==
X-Received: by 2002:a17:907:d049:b0:840:604:1da1 with SMTP id vb9-20020a170907d04900b0084006041da1mr47705828ejc.61.1674820357452;
        Fri, 27 Jan 2023 03:52:37 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709066d9100b0087856bd9dbbsm2150627ejt.97.2023.01.27.03.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:52:37 -0800 (PST)
Message-ID: <ad4bd119-d66f-a7ce-f9c7-556ed92af969@linaro.org>
Date:   Fri, 27 Jan 2023 12:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc7180: align RPMh regulator
 nodes with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
 <20230127114347.235963-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-4-krzysztof.kozlowski@linaro.org>
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



On 27.01.2023 12:43, Krzysztof Kozlowski wrote:
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 6ea8dd7d3e01..c3bdd3295c02 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -90,7 +90,7 @@ mdata_mem: mpss-metadata {
>  };
>  
>  &apps_rsc {
> -	pm6150-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm6150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -212,7 +212,7 @@ vreg_l19a_2p9: ldo19 {
>  		};
>  	};
>  
> -	pm6150l-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm6150l-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index dcb179b2a3fb..423630c4d02c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -438,7 +438,7 @@ flash@0 {
>  };
>  
>  &apps_rsc {
> -	pm6150-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm6150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -551,7 +551,7 @@ pp2850_l19a: ldo19 {
>  		};
>  	};
>  
> -	pm6150l-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm6150l-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
