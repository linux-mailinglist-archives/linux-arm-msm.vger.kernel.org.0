Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFEC6C1029
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 12:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjCTLEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 07:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjCTLDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 07:03:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C70E1EBCF
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:59:39 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s20so4409736ljp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679309973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWGmTe6cHKLXfItotDWU53tPbM2QwDIy9fraKQP6pWc=;
        b=fPtSz4zlJ2Sk4eFhtWbam4CMPpNfaATlOBuaBi2n0//M1pTJoDVzMYiC9uSo94WWKW
         3X/okk4DsiMX/RvXemf/Lr97/VBjB/GZXEH7sEvXPKNwHJXA+k2jzDV77bVuoSXi6b8W
         av0e1cjbAIUqEn1x5f3/EoIuxHFduyCfS/NZiFQt3aXOL3u6zvDF45aQkcoDgiZCjowf
         kOpmeV2Fm62/f0LJZ8qSqyJFbOwp+hlIXpSepklWGt9Cl20D7Wn+yOt3dwFXBAx9fWTI
         0pvZycsEBp8ajkqgBUnz6GrXlOXDRAVMC1zTXHJypZKJ7gqpUveNBhZ9+U60Bz6BHR8f
         fy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679309973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWGmTe6cHKLXfItotDWU53tPbM2QwDIy9fraKQP6pWc=;
        b=oSDPe2qRfAK27u1QkFadVEbpcH9xPGA6osqK4VmOWwf1OZYqOv6dfa7KYdx4jw1Qin
         699b5ruWc/giM1ko6MPniTX+uQfBnFPF8nmVxtwaQWnJxYEa2dJpolTKSAJGWiCyOLiZ
         nOfSvc3sGfspGjVXjhDvz6wDVnJJ+GbXG/9k0+ekuxOJ8Dz12Z4qrVV8RYycbmlUazA2
         LQYr7nHDdYIWrv+CaCXHDBExCHarkU110a+smHvkDPC05owqbakYJJAhSkYVGCSK4B64
         MavDUfd48dTp6wK3lGnvchUrONUC7WXCS3g4XGpEbRugw5YFN+Cjnpsf7ewCe4KRfKm6
         /wBg==
X-Gm-Message-State: AO0yUKXw2A1peXqSwJdJzwyvSVEeHKCJydMjwm+t4LnI22Dc7mBRhz4i
        SvGmN06sKoanX7xWHH6wolf/iA==
X-Google-Smtp-Source: AK7set9tM5PRfDurzmymTzNE12vthtHUPQDrRxC6SHxx5x5Vhd8wk3NJ/cEreblq8XGdz7zgDBkmIw==
X-Received: by 2002:a2e:880d:0:b0:29b:d436:5c8a with SMTP id x13-20020a2e880d000000b0029bd4365c8amr1741092ljh.3.1679309972812;
        Mon, 20 Mar 2023 03:59:32 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id d3-20020ac25443000000b004e83f1da2b4sm1643915lfn.66.2023.03.20.03.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:59:32 -0700 (PDT)
Message-ID: <515e4533-fd98-ec96-3e00-03d27168e576@linaro.org>
Date:   Mon, 20 Mar 2023 11:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc8280xp-x13s: add wifi calibration
 variant
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Kalle Valo <kvalo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230320104658.22186-1-johan+linaro@kernel.org>
 <20230320104658.22186-3-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320104658.22186-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
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



On 20.03.2023 11:46, Johan Hovold wrote:
> Describe the bus topology for PCIe domain 6 and add the ath11k
> calibration variant so that the board file (calibration data) can be
> loaded.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216246
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 150f51f1db37..0051025e0aa8 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -711,6 +711,23 @@ &pcie4 {
>  	pinctrl-0 = <&pcie4_default>;
>  
>  	status = "okay";
> +
> +	pcie@0 {
> +		device_type = "pci";
> +		reg = <0x0 0x0 0x0 0x0 0x0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		bus-range = <0x01 0xff>;
> +
> +		wifi@0 {
> +			compatible = "pci17cb,1103";
> +			reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +			qcom,ath11k-calibration-variant = "LE_X13S";
> +		};
> +	};
>  };
>  
>  &pcie4_phy {
