Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD2F673B79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjASOP0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjASOOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:14:44 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8176180154
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:14:03 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x10so2983783edd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8+Q1PlYOd/3jq/Ct66oKi7A5pNhIhS9/AykSy5kXAo=;
        b=cB39M1hNvo5ETlJXRXWGaNCJIx3Iofuu2LyIZwg0CD3ZHcSVVsGqR2zF1BKmD2vEP2
         rKQ0ZFPgJrTt//1TKkGQx8oRMV3TtQneH0JL48pQDLFNz9CP4vlPbz7CwmJ62MqVc2+t
         T3ehUMdTu4dpJAXp1QbQZwD33jABnHNjakeKD4JVQ3UAzLEeRVnA8Be2RIXx0n9lnI0r
         lx040/emL1wXiQ4pu7oV3NeFUwmB5PrZMGwjY9BdaQRQFMB+4fGcakNwKvwFRqbPpzSt
         B6Do334WzdrBFPfbzRDaP19SwF0kzHH3+bDcpGYvCnhZT2XZ6D+7af9qqiXjFE4PjQPX
         Caiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8+Q1PlYOd/3jq/Ct66oKi7A5pNhIhS9/AykSy5kXAo=;
        b=ctB5iWv2/PnT/koyg5zp8gYmUMWfaRLCaPnMhTWqMq5MgRfcbe6sQWSScnYZWx3Lhz
         ZPqP+XCkSBd8DEhaXt1k/iIlMU45HDtzrFjZlQZtHnGv2+PBpzTZoaUcww8o4FWQERkG
         WCpcW5mdesiYy1ZWDYPup/4ouR2T0Bs/VeXYSHcN6iQZM5SMTCH3/M+uPpyB/WxTe2il
         IcVduqpanCNl2surbOmHDfWi2B0eZ5YqkyV+kivbabQT5N5sv58wq5GB8CKdTgCLRFde
         58dN8xeGBVeg+W+c7xJLl0qwdZebggWvgkYPa3omKeNg85OepQmcCIB30+DXUzpfUSQa
         9i/Q==
X-Gm-Message-State: AFqh2kpbaJGDNvBygesdkuumxdnHJAyp7EcSgrpU6zQVf5bx5eerUQTS
        fKRwF2DNCkgugtjG9hn3CC6f54NaAAbSYiwX
X-Google-Smtp-Source: AMrXdXtYX2hBeXugcheLGbFyUKf9r52lBDT7hi4K/THGQ+IaRAVeFFu3R3oSzp3E+ZrHQucbORi4MA==
X-Received: by 2002:aa7:dbd0:0:b0:49e:351b:5ab3 with SMTP id v16-20020aa7dbd0000000b0049e351b5ab3mr8255049edt.6.1674137642114;
        Thu, 19 Jan 2023 06:14:02 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007c16f120aacsm16229309ejn.121.2023.01.19.06.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 06:14:01 -0800 (PST)
Message-ID: <8b71ca84-197d-127f-0caa-e0ec7b1ae15c@linaro.org>
Date:   Thu, 19 Jan 2023 15:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280-idp: drop incorrect
 properties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <20230119122205.73372-1-krzysztof.kozlowski@linaro.org>
 <20230119122205.73372-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119122205.73372-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.01.2023 13:22, Krzysztof Kozlowski wrote:
> The sound card does not expose DAIs and does not use custom qcom
> properties, so drop '#sound-dai-cells', 'qcom,msm-mbhc-gnd-swh' and
> 'qcom,msm-mbhc-hphl-swh':
> 
>   sc7280-idp.dtb: sound: '#sound-dai-cells', 'qcom,msm-mbhc-gnd-swh', 'qcom,msm-mbhc-hphl-swh' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
> 
> Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 43e61a1aa779..8b5293e7fd2a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -113,12 +113,8 @@ sound: sound {
>  			"TX SWR_DMIC6", "DMIC7_OUTPUT",
>  			"TX SWR_DMIC7", "DMIC8_OUTPUT";
>  
> -		qcom,msm-mbhc-hphl-swh = <1>;
> -		qcom,msm-mbhc-gnd-swh = <1>;
> -
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> -		#sound-dai-cells = <0>;
>  
>  		dai-link@0 {
>  			link-name = "MAX98360A";
