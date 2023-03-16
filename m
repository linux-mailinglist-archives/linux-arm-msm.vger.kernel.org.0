Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92EB6BCA7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 10:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjCPJNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 05:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjCPJM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 05:12:56 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212204614B
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 02:12:52 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id o7so827592wrg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678957970;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4i/+IbvCXFdjz4/Efw9W5WipElhYaJU8p9Z3d1lAFC4=;
        b=E0+h3yXwq5fvWGNhV8VYhU38LOM9BchpTo9sZX+1Iuk+GRUdIBSDcswSrjXKgIoSYu
         zCE/Y0S1RE6d55RUxTPve2n/dbd1BtK3gMidj6WB4FqobDGXRUpCFik3BU0wf1BhdBoF
         TcZYncP1u2G2xmQA8PViKF9VngzzIreFVQ7BmkuIHAgRGniPtChAIEmjnaQzrGUSL+ZS
         YAaXCkT0dM3oLR9SiwBYlcAl0gl1Io5cA2fszdkKKUkjlLw2eMrkXG4n8/okb09QcL3V
         s7p3INwrwAB8SK7CkXCD0FeyHBwS8JalWojsX+g/SYvQBxtH4nJitSxSF9bTMEoTSMIe
         BaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678957970;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i/+IbvCXFdjz4/Efw9W5WipElhYaJU8p9Z3d1lAFC4=;
        b=QVb9iFRzSq0AA1GPxS65RYlWsoOrOBt1E5WbODK3t/oS+14U2zsYTFkESe8LW/Pcy2
         SRdqYKV9umR8RSQCD5ZinZwGr/ywXDi1S0saz7iRo99zzPXV3VHHe/jrK69ei/YleWw7
         Rp0GbuU3PXRL7EmAm0cKKxAJMDxdMsmVLrp8uekbnNU26cI9D94OoAuKCCAsyaowQ439
         7T9jNk7hsmd/RmZjgpg7NYxniW1L8a2YqxUfJuRk19unThD4pLoxSgqKALYBjORPngFY
         XzG1s1yeUsa6PAH+j29nQfktdWwlujI7loSZe9sDk26cHCfS7Qg+CHl2IXlS5KUV53MN
         0dCw==
X-Gm-Message-State: AO0yUKWIQrVPuISeAYGxCXunudQABNbJo8cFLD0gCx2jy3PO0GpsmNQu
        xM2aDjzWfquuASk+9ZFy+wo4Hg==
X-Google-Smtp-Source: AK7set8jZaolZMq/mj8iZgCzDU5vopOEcP9e972h+2SL64Qr19+KS2HhPt/PZAi+SVgjykT7KAaHyA==
X-Received: by 2002:adf:e48c:0:b0:2c3:dd60:d749 with SMTP id i12-20020adfe48c000000b002c3dd60d749mr4559291wrm.47.1678957970566;
        Thu, 16 Mar 2023 02:12:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d33b:7c79:2a99:1fd4? ([2a01:e0a:982:cbb0:d33b:7c79:2a99:1fd4])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b002be5bdbe40csm6717165wry.27.2023.03.16.02.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 02:12:50 -0700 (PDT)
Message-ID: <3e2932d4-89ea-39e1-da46-e9fd2d889fdf@linaro.org>
Date:   Thu, 16 Mar 2023 10:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sm8550: Use the correct BWMON
 fallback compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
 <20230304-topic-ddr_bwmon-v3-7-77a050c2fbda@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230304-topic-ddr_bwmon-v3-7-77a050c2fbda@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/03/2023 15:11, Konrad Dybcio wrote:
> Use the correct fallback compatible for the BWMONv4 with merged global and
> monitor register spaces.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 25f51245fe9b..b5488c6822bd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3391,7 +3391,7 @@ opp-8 {
>   		};
>   
>   		pmu@240b6400 {
> -			compatible = "qcom,sm8550-cpu-bwmon", "qcom,msm8998-bwmon";
> +			compatible = "qcom,sm8550-cpu-bwmon", "qcom,sdm845-bwmon";
>   			reg = <0 0x240b6400 0 0x600>;
>   			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;
> 

I can't test right now, but:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
