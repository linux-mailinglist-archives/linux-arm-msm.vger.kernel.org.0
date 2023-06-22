Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7968C739C55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjFVJMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjFVJMM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:12:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A4E422B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:03:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so6153511e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687424580; x=1690016580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDKWTMfSR4mt31phk/KeRhZIz8arN3kbkS8NI9VJ9YE=;
        b=dpiUwDWXL9mVEaazdAbJNN66Y2lK4sP/I0RQQynlL7ToeHC029eWBIgqwCq2834V0v
         e9UbQ59HULsY/Wi0g6zoU92nBSPeD2nsPrwXE6tFGxnfYpqMO1gS39VTSAvc+J9nKmEq
         YmEBoQMwj55L1Ci7sNqNsQu+NyXPhHiFDliecgNcn1vDNV5k+h0Cqq8gecluAZzRpx+S
         Pwn4SS696cd/DnJnyjpwaIA52Qu3rwEEoF5FhWa5QDGzvz3B4bpHp87lCkOQvYBuGWTs
         G+CmOMj6Y3ADUxfb6+MW2L/hIvh3V9HsssL3Pk/ZsEMnNp6joBbmOKwwweu5XR5mxepd
         smtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424580; x=1690016580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDKWTMfSR4mt31phk/KeRhZIz8arN3kbkS8NI9VJ9YE=;
        b=EPt2IDgdAhXC1wxUWt1J8xidk/3tEAFE3j7vKGuVEE2icrOoeedw0BnkXDZrawtqtL
         JMEJvi8c4U9/mPSJt0NlptnLYPSCe4AY/QPERep/DQ9VduaWfPZFIy3QRFMpQzCLKC+0
         V15bZgpr9E3xyoKgRj6Jru16PDq1q8jFuFXpDzI0Lle4VKGZzWFGu+KaAQvrGdMuuV44
         di+caGw2BQVVpAtN/DK8nEIP4u4i9RcQm4WTT9lLw5CKq/0hbZVu9M5avzLwLuPaFmxD
         CLf7Q1bZiikQklUQiw3iMYKr7rio5g+YQIisa4Bl3FRsbj/8RHEgm82J5lAPs9vL9MoP
         UotQ==
X-Gm-Message-State: AC+VfDzfZwRWHaX5YxGUVJMUu2Ym5eCY1O/ygZarxk5B1PvllIqnXnW1
        QBm6R0s+71CGjagO0exWRJ4GcQ==
X-Google-Smtp-Source: ACHHUZ5un3yzLTYH7titk4WkzbT83Wi5uRqRPJU0XebH3G4YW40/VdWKtX+EGjWNgn8EEIRRji1I0Q==
X-Received: by 2002:a19:2d01:0:b0:4f8:7568:e94b with SMTP id k1-20020a192d01000000b004f87568e94bmr5588553lfj.56.1687424579764;
        Thu, 22 Jun 2023 02:02:59 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id l10-20020ac2430a000000b004f84305bde3sm1022199lfh.242.2023.06.22.02.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 02:02:59 -0700 (PDT)
Message-ID: <2c3fba34-14fb-2bf3-8368-d638033da4d4@linaro.org>
Date:   Thu, 22 Jun 2023 11:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-mtp: add chassis-type
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
 <20230622-topic-sm8x50-upstream-chassis-type-v1-5-13f676eb71f3@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230622-topic-sm8x50-upstream-chassis-type-v1-5-13f676eb71f3@linaro.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index b2d4336e764b..41675a8de268 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -15,6 +15,7 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SDM845 MTP";
>  	compatible = "qcom,sdm845-mtp", "qcom,sdm845";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &uart9;
> 
