Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD52739C31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjFVJKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbjFVJKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:10:19 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1363AA3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:01:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f870247d6aso6569021e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687424471; x=1690016471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3ultwgZVQ1MfvB3VgAwhjguMxX6kRgIS6xIizSazGQ=;
        b=DILVYRGLmK4mfxtP7iEIdVge7ZL6CiE6TfKIJUi0VsACdFFI7scX9NZoxtsDli2CjS
         XT3lxO801X0fC/PZy3urkUxaUPIpidbvATLaQ0+jnQhZjsgwcmCfnB0qj0ARhvmBBs/8
         pUA5EEHgTmWWCfIMS3/SIkvAgy31P02Aj4akc8eYdQ9L+A/aAUs9DVUF59/0Qr6yWWyJ
         GUHdoMmt7wppDE0hMBCrzTYEDStXihnHkGjxw3YqSesXEByd94hX+OHKLPuWDvcknkmN
         7bFztf7JHSA6C+vfsbia3gdbyOYFhybbPRsEqlVDNB5LKbAZ/oDaFZDzG/o0L+U/jvIy
         B6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424471; x=1690016471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3ultwgZVQ1MfvB3VgAwhjguMxX6kRgIS6xIizSazGQ=;
        b=EcvC8PO5sVAO5Bfsi1z+5a9Dw0vLY9lbI56q96U5TMYhUV+VZtHUN9PHwJ/9JHcg6d
         XNadWKRC4GfRoW6Kg+uWChY9pPXTg3MJnu1/r0M3Bv4mw0IGIJnGrpkOlk2JEaRedBG6
         3/ZDlZll+NGQdknCjEMz6yiBw6LWwELK+HvSVUbKgs+oHlQhaOFHndO97DHdf8KXbIkF
         tW6SFknjo5yRWbJQ5YxFlWx6RAZwUtIRENRgk8P8geoGIeIUvQQf7KiiVTEpOaWuphJJ
         R8DC5EEEkn+pV/vzFwx/ZeehXSZvr8xxoyXrb5kL6IAWmMozMRAi6AReph122jskmWrI
         hgoQ==
X-Gm-Message-State: AC+VfDyCpB22qNuS39BRz+1B1pkLKcc7LhK53uFvMpQcJiJhiF+ImYr/
        gLAhm0aZ2rTNo178jZMp8hNaKJiyBPVhyuFnOp0=
X-Google-Smtp-Source: ACHHUZ7o8LP3qGZozWgkQFPZiEJaIv6IZFkpmRsNnS0pTkM76MiqCWRf/xai2I/ouihD2czAvdzbdQ==
X-Received: by 2002:a05:6512:224d:b0:4f9:5d3b:6a38 with SMTP id i13-20020a056512224d00b004f95d3b6a38mr2823393lfu.45.1687424471089;
        Thu, 22 Jun 2023 02:01:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b004f63d35d396sm1018291lfm.250.2023.06.22.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 02:01:10 -0700 (PDT)
Message-ID: <c1861fb1-cd51-96aa-777f-ba9a3c4fcc13@linaro.org>
Date:   Thu, 22 Jun 2023 11:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8[1234]50-hdk: add chassis-type
 property
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230622-topic-sm8x50-upstream-chassis-type-v1-0-13f676eb71f3@linaro.org>
 <20230622-topic-sm8x50-upstream-chassis-type-v1-3-13f676eb71f3@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230622-topic-sm8x50-upstream-chassis-type-v1-3-13f676eb71f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22.06.2023 10:57, Neil Armstrong wrote:
> Qualcomm's Hardware Development Kits devices are embedded platforms,
> set the chassis-type property to 'embedded'.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> index c0200e7f3f74..bb161b536da4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> @@ -15,6 +15,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8150 HDK";
>  	compatible = "qcom,sm8150-hdk", "qcom,sm8150";
> +	chassis-type = "embedded";
>  
>  	aliases {
>  		serial0 = &uart2;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> index 0aee7f8658b4..1bbb71e1a4fc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -14,6 +14,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8250 HDK";
>  	compatible = "qcom,sm8250-hdk", "qcom,sm8250";
> +	chassis-type = "embedded";
>  
>  	aliases {
>  		serial0 = &uart12;
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 61dd9663fabe..a43e153e2a65 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -11,6 +11,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8350 HDK";
>  	compatible = "qcom,sm8350-hdk", "qcom,sm8350";
> +	chassis-type = "embedded";
>  
>  	aliases {
>  		serial0 = &uart2;
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index bc4c125d1832..984e3960a3f3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -19,6 +19,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8450 HDK";
>  	compatible = "qcom,sm8450-hdk", "qcom,sm8450";
> +	chassis-type = "embedded";
>  
>  	aliases {
>  		serial0 = &uart7;
> 
