Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A966175783D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 11:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjGRJkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 05:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbjGRJkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 05:40:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D643E60
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 02:40:40 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99454855de1so481927166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689673239; x=1692265239;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0N8btKrBEl8US0muPWkTHrV3A+jfker/XqFXbKhuNM=;
        b=LiktnGMdMBgcrwGwBd55VnfmVE4V3+RMVccoWw1Whzak1pjDcIQtAermeh3RUAk7ol
         Mu4FMjXKSp7ZY70SbVCPFwoKmFS51bLCwiZL1UqkrCaHMY2yunR5qSwKmcir9D0s5zCP
         /kpXFTlhK4chBS5+jG7gYGiY6LeRuTWFVzM1f5z2t62jRSkpif4FTaXl73IlhLkHa30C
         SdGowawyPq9EwUkJVdOXfNqk33FWSdBJK2vEL/gWDFm45BDv+kp9w8zTWqNLg3Ok6MwI
         C/Z9p05zUD7wl5fpCZa8ay0ZmDhkjI/wXQs0nH58pjvJ/lSznudtW6WVAHx+C6J8d1mW
         iw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689673239; x=1692265239;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0N8btKrBEl8US0muPWkTHrV3A+jfker/XqFXbKhuNM=;
        b=OtRAy7YcvJEDd4hv01JHStS0zlQ1uqs+eNf9mADtJ+SpKeiw1a0YJUZ571ZfXBn4/T
         dgP8W7ZGRW9n+afFTpvth9xXKLmhDNw6U5s0aFU/lzCvh0hHc8pIGG/3KFMDKwb8Ezy9
         YVTAdSXW7NG6zEFb44oupsSVntpX40oNMIfbUdS4WhbvTaJ3iidkHqawhNOT0FLyzE8q
         S7tP7+fdavHpcvmx4vv4KqFqnMtZA+x87eFFf5G4KxOobh8eyGzrhykNPapUt2HKF2Ri
         Gxk9t9reR1aVWfksxsGuFBVrtTZUo0vOCq7MKY2578OYXV1RoJnMWn6cAbo4N7Oqn9P6
         g8EA==
X-Gm-Message-State: ABy/qLaHdXOH456CN+rwvYHPwShU1TZhF1NbIT7rWoY+05RdwOIofMKf
        EfRmIlVbjbpwy7YU9tN8QenmBQ==
X-Google-Smtp-Source: APBJJlE29PdR8LOpeQCVpY3BGmHmGV2bndVirQX9jqE36YcbNr53bhsq+2ZlKH7NGxw1s1x3ODVrMg==
X-Received: by 2002:a17:906:739e:b0:993:e752:1a71 with SMTP id f30-20020a170906739e00b00993e7521a71mr14389092ejl.9.1689673238920;
        Tue, 18 Jul 2023 02:40:38 -0700 (PDT)
Received: from [192.168.1.194] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id l22-20020a170906231600b00992e4d8cc89sm800293eja.57.2023.07.18.02.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 02:40:38 -0700 (PDT)
Message-ID: <76c99543-4f77-38c2-5940-517f2715060d@linaro.org>
Date:   Tue, 18 Jul 2023 10:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450-hdk: add other analogue
 microphones
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230717143824.203352-1-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230717143824.203352-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/07/2023 15:38, Krzysztof Kozlowski wrote:
> Add proper audio routes for onboard analogue microphones: AMIC[1345].
> Use also new DAPM input widget (TX SWR_INPUTn) for them, not the
> deprecated ADC one.  Change is not compatible with older kernels not
> having the new SWR_INPUTn input widget.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on ASoC driver changes:
> https://lore.kernel.org/alsa-devel/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/T/#t
> This patch should wait till respective ASoC changes got merged.
> ---
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index bd5e8181f2aa..9bd1ef401ca3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -915,14 +915,23 @@ &sound {
>   			"SpkrRight IN", "WSA_SPK2 OUT",
>   			"IN1_HPHL", "HPHL_OUT",
>   			"IN2_HPHR", "HPHR_OUT",
> +			"AMIC1", "MIC BIAS1",
>   			"AMIC2", "MIC BIAS2",
> -			"VA DMIC0", "MIC BIAS1",
> -			"VA DMIC1", "MIC BIAS1",
> -			"VA DMIC2", "MIC BIAS3",
> -			"TX DMIC0", "MIC BIAS1",
> -			"TX DMIC1", "MIC BIAS2",
> -			"TX DMIC2", "MIC BIAS3",
> -			"TX SWR_ADC1", "ADC2_OUTPUT";
> +			"AMIC3", "MIC BIAS3",
> +			"AMIC4", "MIC BIAS3",
> +			"AMIC5", "MIC BIAS4",
These should reflect the board-level wiring of MIC BIAS, are you sure 
that this is how the hdk is wired up?

> +			"VA DMIC0", "MIC BIAS3",
> +			"VA DMIC1", "MIC BIAS3",
> +			"VA DMIC2", "MIC BIAS1",
> +			"VA DMIC3", "MIC BIAS1",
> +			"TX DMIC0", "MIC BIAS3",
> +			"TX DMIC1", "MIC BIAS3",
> +			"TX DMIC2", "MIC BIAS1",
> +			"TX DMIC3", "MIC BIAS1",
Same here.

--srini
> +			"TX SWR_INPUT0", "ADC1_OUTPUT",
> +			"TX SWR_INPUT1", "ADC2_OUTPUT",
> +			"TX SWR_INPUT2", "ADC3_OUTPUT",
> +			"TX SWR_INPUT3", "ADC4_OUTPUT";
>   
>   	wcd-playback-dai-link {
>   		link-name = "WCD Playback";
