Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9700756E32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 22:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbjGQU2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 16:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbjGQU2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 16:28:19 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B11188
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 13:28:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-313e742a787so3096661f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689625696; x=1692217696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AG7fGvafEd/lisvGfSpBrXxSbQJiXU+xkXO7Ug+DfFg=;
        b=vJj5ns2hBibr8T92EKehctfcZ+HAd+4WAtmeNlCiv4wgtQ4ZasJ1bDtiJZEbq0CQiQ
         NnmgFPPDS1HyW3inCNkpGqYhWX20gPZPcA9fZm1YpHOW3GqwSrUSZ1Il2ydvoz/8KgMH
         MdYu150g8O+++oQ29UG12SoGWx2gCPeb41TY9vEDbPm0uYsA79wlcfWemluSqlP27n2o
         +RcANGJEzeiy5jrXyyXkIhxkMt3S/xua//9HPgb3N06SMX3mSea+B+/pqfhYPmr9hFIR
         50/ruasoH6F1g6HQ89H6gC6zpn0BMFH5C13b95ZT7LMhYPIXT8XB5x7ZYN5uBV2pR8ZQ
         HWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689625696; x=1692217696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AG7fGvafEd/lisvGfSpBrXxSbQJiXU+xkXO7Ug+DfFg=;
        b=kgbRg+h022SaeFvDFQdEBlUwIS7WsGMbhKtY0DiWyznCgQ0hQ20oNsAu/vQ7ZefjjJ
         84R3DWGISrqlu8FI223NnOgQ0c1/jrQx57E2ZRczRVX+eNP14p1fZN2V9FCaJYors8Ch
         YC3qddFXPFnU9UwHr521DNTCWKH7N4EXdrJsdzkGKD7u7vXKuAloAmnWRheYQ3UcT0GF
         keBfe+ANUWAyLmOclI5S8gIJrcJTKhWYd4HXVdQUpG4vhf1MCdMp0f0Ew1HewKusc9lH
         3lqeKWIGjiWrhQYRx86OwEyeuxQ9G4P6acS4Er/JEPrx51LfAVRmcfHHc0WWZR9G9ODH
         0rag==
X-Gm-Message-State: ABy/qLbyGJgWk6ntLyprSMl9BO9lwz6cixVjSyRhMuc16q4wMOIzB9ZC
        belvBVP6f8ZV5kR/mW9fvwL5xDX9AxYqnMd603M=
X-Google-Smtp-Source: APBJJlEBrSfU2cS21+fm2MoIe7W+6L9Lpz1+1PzSPvK7sQ+YdcnkmO/+0KK6jHlgouyAycsqc+MvnA==
X-Received: by 2002:adf:e90a:0:b0:313:f000:5de6 with SMTP id f10-20020adfe90a000000b00313f0005de6mr8649051wrm.16.1689625696336;
        Mon, 17 Jul 2023 13:28:16 -0700 (PDT)
Received: from [192.168.2.199] (host-92-17-99-126.as13285.net. [92.17.99.126])
        by smtp.gmail.com with ESMTPSA id v12-20020adfedcc000000b00314315071bbsm378022wro.38.2023.07.17.13.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 13:28:15 -0700 (PDT)
Message-ID: <34a4a052-b76f-b49d-6703-405d65ffd597@linaro.org>
Date:   Mon, 17 Jul 2023 21:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sa8540p-ride: enable rtc
To:     Eric Chanudet <echanude@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230717182351.3389252-1-echanude@redhat.com>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230717182351.3389252-1-echanude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/07/2023 19:23, Eric Chanudet wrote:
> SA8540P-ride is one of the Qualcomm platforms that does not have access
> to UEFI runtime services and on which the RTC registers are read-only,
> as described in:
> https://lore.kernel.org/all/20230202155448.6715-1-johan+linaro@kernel.org/
> 
> Reserve four bytes in one of the PMIC registers to hold the RTC offset
> the same way as it was done for sc8280xp-crd which has similar
> limitations:
>     commit e67b45582c5e ("arm64: dts: qcom: sc8280xp-crd: enable rtc")
> 
> One small difference on SA8540P-ride, the PMIC register bank SDAM6 is
> not writable, so use SDAM7 instead.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi | 10 +++++++++-
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts   | 15 +++++++++++++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> index 1221be89b3de..9c5dcad35cce 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> @@ -14,7 +14,7 @@ pmm8540a: pmic@0 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		rtc@6000 {
> +		pmm8540a_rtc: rtc@6000 {
>  			compatible = "qcom,pm8941-rtc";
>  			reg = <0x6000>, <0x6100>;
>  			reg-names = "rtc", "alarm";
> @@ -22,6 +22,14 @@ rtc@6000 {
>  			wakeup-source;
>  		};
>  
> +		pmm8540a_sdam_7: nvram@b610 {
Johan disabled the SDAM node in their series for sc8280xp. Unless it's
used on all sa8540p platforms, you should probably also do that here.

			
> +			compatible = "qcom,spmi-sdam";
> +			reg = <0xb610>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0xb610 0xb0>;
			status = "disabled";

With that fix,

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> +		};
> +
>  		pmm8540a_gpios: gpio@c000 {
>  			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 5a26974dcf8f..608dd71a3f1c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -407,6 +407,21 @@ &pcie3a_phy {
>  	status = "okay";
>  };
>  
> +&pmm8540a_rtc {
> +	nvmem-cells = <&rtc_offset>;
> +	nvmem-cell-names = "offset";
> +
> +	status = "okay";
> +};
> +
> +&pmm8540a_sdam_7 {
> +	status = "okay";> +
> +	rtc_offset: rtc-offset@ac {
> +		reg = <0xac 0x4>;
> +	};
> +};
> +
>  &qup0 {
>  	status = "okay";
>  };

-- 
// Caleb (they/them)
