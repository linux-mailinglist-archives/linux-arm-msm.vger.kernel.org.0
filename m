Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E93577FF29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 22:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347636AbjHQUes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 16:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354963AbjHQUeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 16:34:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9287B35B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 13:34:10 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c7so2462215e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1692304449; x=1692909249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJanSbcbdRbqlFQWo2SBp1vOjmdCAm9+u8RhmfEAHas=;
        b=HokACvUW0mjpLc8YiUL9KCHIpjZi7PunfjPeUHX6F+hjAFZ8BdwqsjEvDvr+7iRwVG
         4RUuiYx72kRPxCLwwB7DdFYF8LNXJ3naJlB86oAWLH1YmN47FzCgCLklB55s8jPnmKSv
         htCVokwgGAVZVfCchsvs3EHYtrIfyJGhbyy/int/Mmafg9jCf7KOSyodZjfmmPR91HGa
         vfqJcPLKBW6Hu4qVQ8QLDIIE5mMlYp4V8C/+6JToFay+dieiQWQWy269oXSrq9rPtrUe
         52UHXxT6IHvN+zic1Nru5lJKeD9q0GRPM2I09yq5wLSQp4EPMDxX6fz9RH8ROpVRu3Ox
         3NPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692304449; x=1692909249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJanSbcbdRbqlFQWo2SBp1vOjmdCAm9+u8RhmfEAHas=;
        b=LVFykxUgYN1gCllt0WOBeTn7Ezg/fcdwHL/WcKXgQBPwsQPHyr9toGf8dteqivGgDs
         NOXAz8rG35OdOjwQTfS8v9fqDbiU3jx5B0EZuKv/70IIaJnIcnP1v1nbYUrKH5jGN54T
         FUgr3M4Ok0WBydqKEZwTWdp4wvDrCg4QRYsVYWAil2b+UwLVVWNx7nHZo0KEjIqoPeYd
         g23gWWdp6JZkO77UpVKTKNSgqXI0GT//acfAWbWs6Qb3/Tlc4NKEQU4yxjRRR7C9Tomg
         OQl+T3hbZW7h/N4W/4BOu9MR3Bj7zMEA1sROFRZTB9hHCqGQus3HQsrp3EFssm0Z0mec
         n3dw==
X-Gm-Message-State: AOJu0YyKHHMUakgXMqP++8ygNDwyygrFPIUgJmgobjNRW4ywSngsukxy
        GjBgus32CMqm2WRnsS7AjGRxew==
X-Google-Smtp-Source: AGHT+IFq0O851NzocA+e/CpjQ6uPrVChiJJ+FMGBCKsk+tDIGC8ffOouYN49JM4byaw7gqWx2KgfSA==
X-Received: by 2002:adf:de8c:0:b0:317:e515:d623 with SMTP id w12-20020adfde8c000000b00317e515d623mr416308wrl.60.1692304449002;
        Thu, 17 Aug 2023 13:34:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o2-20020adfcf02000000b0031423a8f4f7sm323543wrj.56.2023.08.17.13.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 13:34:08 -0700 (PDT)
Message-ID: <653fd80b-0055-ddbd-3641-a38efaa3be9c@nexus-software.ie>
Date:   Thu, 17 Aug 2023 21:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-3-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230817145940.9887-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/08/2023 15:59, Dmitry Baryshkov wrote:
> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 52 +++++++++++++++++++++++-
>   1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 303d07f9c6e5..a4f7a9f9c22c 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -610,6 +610,46 @@ lt9611_out: endpoint {
>   /* LS-I2C1 */
>   &i2c15 {
>   	status = "okay";
> +
> +	typec-mux@1c {
> +		compatible = "onnn,nb7vpq904m";
> +		reg = <0x1c>;
> +
> +		vcc-supply = <&vreg_s4a_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_usb_con_ss: endpoint {
> +					remote-endpoint = <&pm8150b_typec_mux_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_phy_con_ss: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_out>;
> +					data-lanes = <0 1 2 3>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				redriver_usb_con_sbu: endpoint {
> +					remote-endpoint = <&pm8150b_typec_sbu_out>;
> +				};
> +			};
> +		};
> +	};
>   };
>   
>   &mdss {
> @@ -1299,7 +1339,7 @@ &usb_1_qmpphy {
>   };
>   
>   &usb_1_qmpphy_out {
> -	remote-endpoint = <&pm8150b_typec_mux_in>;
> +	remote-endpoint = <&redriver_phy_con_ss>;
>   };
>   
>   &usb_2 {
> @@ -1388,7 +1428,15 @@ pm8150b_role_switch_in: endpoint {
>   			port@1 {
>   				reg = <1>;
>   				pm8150b_typec_mux_in: endpoint {
> -					remote-endpoint = <&usb_1_qmpphy_out>;
> +					remote-endpoint = <&redriver_usb_con_ss>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				pm8150b_typec_sbu_out: endpoint {
> +					remote-endpoint = <&redriver_usb_con_sbu>;
>   				};
>   			};
>   		};

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
