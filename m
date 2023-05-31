Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E967717C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbjEaJmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235440AbjEaJmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:42:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D209E8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:42:37 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so6586028e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526156; x=1688118156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRXUSNqugmt1DxICq6vTlYhWNy/3sixeVgzKtxI9suY=;
        b=X+BrRLiUrObzW0nBasG+2wuJAh4K8HI0dKxpA7cUnQYLwei96kpSjbfl1W0AFdnH+D
         TLS5zZrie+1+HN9A4X+O+VopB/KXqqqGG41w3G+DJhggwjds3LAa/uYriOMgvjZIH5ud
         qiApZjc5ERTiJMnWZBDPH/ksdpoGIyEQpUs+qdUNIKAb+YC6pO7z2MQAN0M8Wl2fGdb3
         4RqsPqvVUZd8ZIUAHYcHqro6GyFLa6kjmXiqk3qGGQMa2KJ6OFk7ZDvrQlQjHDiHwtFe
         Qv0c28A4b45vYw8PZIdw05yCS6kds2DT+sWOqK8s7uD4xDbH5pzPFDEcXyOkXlq/CkBF
         zUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526156; x=1688118156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRXUSNqugmt1DxICq6vTlYhWNy/3sixeVgzKtxI9suY=;
        b=IS4zWpAUbAbw5qX0hqyD/wbWBed0UcjTCmbmQ22VIjQHlmP7ufJsAAOpchEvEIPTGX
         EoD+Ky0BHbUFhu5X+oejmY4aqU/d41UxeIUy1g+AqpRWW5qhb3dvWTW7qGrKMHnVzl2W
         1WRBp1D/rKHaXnchEV1PTYd1LaWvrvO4rEUq/AgtOujWEkKtfLSXL1WJimoP9gLklgpe
         9CfjrvidfSAtqK/MkItwkawx/zfGHfX865QniFL3Ws5GCTA2fR2oAaDDRbzeGPVV6DLK
         k6G8WKJ4Oo3013yocZUtzlZbGYVh2SKHpbo/1Dr3g2DeIyobZ6gW7QCh+9xWX+0T3YTE
         dVHw==
X-Gm-Message-State: AC+VfDxPrVhsISXHrU8DMGnv5Lx8kyokVSSNxzwvcENqmL7PRqENOqwa
        qgpR5V6vpzIBYRIPccO5nIT/Mw==
X-Google-Smtp-Source: ACHHUZ68R0/erNkMZHMipeA+iwl+mX/6phS5Q20zkEScCO/LuWwDgmt2GIzHsbUcQxqSYgHhYleu7Q==
X-Received: by 2002:a19:a40b:0:b0:4f4:b783:8556 with SMTP id q11-20020a19a40b000000b004f4b7838556mr1901689lfc.66.1685526155918;
        Wed, 31 May 2023 02:42:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2598a000000b004f392625952sm653381lfn.26.2023.05.31.02.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:42:35 -0700 (PDT)
Message-ID: <1958b027-a470-8fde-0b9b-89cc8a7b5bc5@linaro.org>
Date:   Wed, 31 May 2023 11:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sc7280: rename labels for DSI
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
 <20230531011623.3808538-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-9-dmitry.baryshkov@linaro.org>
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



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> Currently in board files MDSS and DSI nodes stay apart, because labels
> for DSI nodes do not have the mdss_ prefix. It was found that grouping
> all display-related notes is more useful.
> 
> To keep all display-related nodes close in the board files, change DSI
> node labels from dsi_* to mdss_dsi_*.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 1aa3c6bf81f0..2f5e73da8b6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3888,7 +3888,7 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						dpu_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  
> @@ -3973,14 +3973,14 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi0_in: endpoint {
> +						mdss_dsi0_in: endpoint {
>  							remote-endpoint = <&dpu_intf1_out>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
> -						dsi0_out: endpoint {
> +						mdss_dsi0_out: endpoint {
>  						};
>  					};
>  				};
