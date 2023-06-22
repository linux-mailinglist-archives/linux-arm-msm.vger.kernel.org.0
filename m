Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8820D739C27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbjFVJI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjFVJIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:08:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE1B2D5A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:59:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f875b267d9so5697676e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687424389; x=1690016389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcskLwOTpD8wQSkQDaTOdQc/F5jugyU14yNTRSoQkfI=;
        b=J7LCCSKRjCnUrBvwdX4x4251uRUWXoPSXfcl/E300OWDc186++vlIlw7+1IAXOfcpT
         hNmdb013UqBn/pWOOCs8CyZ1mfnmNI88CnddM2ecYAVXhQPm43iNqJV373hCb3CbhbhR
         BRpvo27CRDMUlGRfC1rga1TRG4/Fv4IZhz1dQcdeVRSdnKiheTtk3N2gD3b2GdwuuoF6
         GanOb9UVQr32K9cipk5Ec6pvGiNXZybe7OHeYL7LVDos20ipFes0+KgmftgfslmuHeUK
         kGTxCOytkRpYoOwAE/E1pI8k8N8HIvMGhio/Swmv/P+I4GdmGnEhV9FpssG1eslUSkcH
         asSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424389; x=1690016389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcskLwOTpD8wQSkQDaTOdQc/F5jugyU14yNTRSoQkfI=;
        b=a1u+ZxBpL7eCh337YnO5svI4h2lMonisgd+12b0Y5BuDm9VyQGmP2Ia1T4dOMvty+J
         gpBJuIY/FAFvRngIID3XqdqDGTJ9es4HUgDdDv4kFX9ajHXJ4KMKeVuEw4xZm8sTO5An
         LmykadW+M8stGJPDE73XPgmxDGMY4BdMEP1RXm47BSBPBHko2l8Dd/ZP4matFdPYrA5J
         CsdMpR5Vc7eUuKxJbrlUCOEpNLqamdHcaDVzD+5buebymSKX66bcJpSLuNut0KmZRc/5
         BTJces6ZZT8cMknKRsVkk9BlL66D6YOVzcyBzdjYZ7bBrBy/reysjM9FZ6vHgvs00YwO
         +f3Q==
X-Gm-Message-State: AC+VfDwfSj/+SGDL1IJCvuPGlrkr7nFqXuGcwxdzGpXz6MDjWX06UzSb
        Eb6yQYQBuwFgJe4ugBjqs4TLbA==
X-Google-Smtp-Source: ACHHUZ709zw/bPwq517EI6mXV/c0cXMHUC0RPzt1Z9/s7ik6OC9/9EwtODaLvfVuXoQlrBDTp1YH7Q==
X-Received: by 2002:ac2:5052:0:b0:4f8:655f:e127 with SMTP id a18-20020ac25052000000b004f8655fe127mr9328029lfm.64.1687424389329;
        Thu, 22 Jun 2023 01:59:49 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id k11-20020ac2456b000000b004f6150e0899sm1020542lfm.290.2023.06.22.01.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:59:49 -0700 (PDT)
Message-ID: <eedf1f91-d884-6bef-7a39-efcdea37c474@linaro.org>
Date:   Thu, 22 Jun 2023 10:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8[1235]50-mtp: add chassis-type
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
 <20230622-topic-sm8x50-upstream-chassis-type-v1-1-13f676eb71f3@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230622-topic-sm8x50-upstream-chassis-type-v1-1-13f676eb71f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22.06.2023 10:57, Neil Armstrong wrote:
> Qualcomm's Mobile Test Platforms devices are handsets, set the
> chassis-type property to 'handset'.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Bit of a thick "handset" :P

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index 34ec84916bdd..286350ac7751 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -16,6 +16,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8150 MTP";
>  	compatible = "qcom,sm8150-mtp", "qcom,sm8150";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &uart2;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> index 4c9de236676d..ad2b60e281eb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> @@ -18,6 +18,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8250 MTP";
>  	compatible = "qcom,sm8250-mtp", "qcom,sm8250";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &uart12;
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> index d21d2aacf201..c5a6c8745606 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> @@ -17,6 +17,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. sm8350 MTP";
>  	compatible = "qcom,sm8350-mtp", "qcom,sm8350";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &uart2;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index ec86c5f38045..00c7e1704a8c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -18,6 +18,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8550 MTP";
>  	compatible = "qcom,sm8550-mtp", "qcom,sm8550";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &uart7;
> 
