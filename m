Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97C2712DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjEZTrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjEZTrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:47:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF4CBB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:47:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f4c264f6c6so1284558e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130462; x=1687722462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQkzKtEisrpF8CUT81uX61iLEGb3pWUzxMWX9GGjneU=;
        b=f+pivJ3BCexcZFqZwMdNWnVhCA+BYK32sNXhN7peuXD1TAAziaCXTrqzoTRCv0TH/r
         PbGbkz0BORT1NwwURbYutyAwvEd5OIj/MQVU8iqxZTTwkbLHMhWIlldmZo+i3SkVnBuB
         S5xItzXHVpD9y5XmDtbx7+Ajclx4J3hInf94zCN8xR+kpnhkGqowN0ifeS+hbe5G5pEQ
         Q4WBVoj+hepJPHB152a75G3SY6vs38TKSSyNPlWFDyy2XzApt9JztX5btRxqLjZLPOLs
         y/H1+ZWtrG3VVS5OWJt1XtNPYQUEz9xPc4qkxexhqgAcpADuNrR5/XBSti/1WrDnnGXt
         x+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130462; x=1687722462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQkzKtEisrpF8CUT81uX61iLEGb3pWUzxMWX9GGjneU=;
        b=iCq0T8PQl4WGrPkWxtSZ3utpiTsCvN7ocVkePui573iWj+Sgq5ChuxH/cq/vFBZpdB
         ZYPmNLvKpIzd1Fmq48l/3Nijum0WMs2/XjrMUDm0/nnzrE1ny7PegXEgyjWlZ7/gVaSb
         4jloDNypYXFTCMBrsTi5bz+nvLXCbe95OlMY63QC5MnOYsA1m5SySmOzZYSNCsEyK4nX
         J7mZiOSvIuWrORXxMmiWNEnAxvVnatYs0ZQJKRgtPFjqes9psL7XLBXZFHZvalNP69bO
         qreluNeY39019XJaPa8wR2kO+lCkc0zvtlU3T84RkrEx2LdOww55o48bGYz4Pzyllw/r
         rqXA==
X-Gm-Message-State: AC+VfDyhQPYuY/yG1Idj7XDPrXUydT4CKzsuZJws9uzm/nNkIp95BKc8
        bg3zoh1TFhfUrz4dRC09Xx8arA==
X-Google-Smtp-Source: ACHHUZ6DMx+hasNATl8WCs5n/+Q5y8JrS66TTH0PhzIZg+omiOjBIbLy4x/4SDy/9yzsAttmyUUQwg==
X-Received: by 2002:ac2:46e5:0:b0:4ee:d4bd:3475 with SMTP id q5-20020ac246e5000000b004eed4bd3475mr834098lfo.32.1685130462349;
        Fri, 26 May 2023 12:47:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id t17-20020ac24c11000000b004e84d64ab51sm754144lfq.58.2023.05.26.12.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:47:42 -0700 (PDT)
Message-ID: <3210403b-eb17-3667-2cf3-8a4e82a24fa0@linaro.org>
Date:   Fri, 26 May 2023 21:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 pmi8998 charger
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-6-f9334afc4505@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-6-f9334afc4505@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.05.2023 19:38, Caleb Connolly wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Enable the pmi8998 charger and define some basic battery properties.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 1915643f1c49..2060b31648fc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -115,6 +115,14 @@ rmtfs_mem: memory@f6301000 {
>  		};
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <4000000>;
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
> +
>  	vreg_s4a_1p8: vreg-s4a-1p8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_s4a_1p8";
> @@ -341,6 +349,11 @@ &pmi8998_wled {
>  	qcom,cabc;
>  };
>  
> +&pmi8998_charger {
> +	status = "okay";
> +	monitored-battery = <&battery>;
status last, please

Konrad
> +};
> +
>  &pm8998_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
> 
