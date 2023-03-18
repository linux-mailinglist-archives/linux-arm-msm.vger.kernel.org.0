Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F736BFA28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 14:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjCRNNp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 09:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjCRNNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 09:13:44 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F6F17CC9
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:13:42 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a32so7726824ljr.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679145220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjmr2nAua78gEqtz1WDKDDPtSDYZ8DpOst2CageaHa0=;
        b=xp362ba1yyj5PGKIBVIZWfa15y0rAnMlDjjHHP9r6s5+yvKaX1hayfOJGMae1kN5Bk
         3nM5IkSzwrvcFxXoSdiVYZHVI2nEqgh8URXC32SBPUeRR9N+F2iAezGxDH5JUBa954Lt
         bsTHnGiBQhhGmwUIDlffd1WbgCV1bRgATzBkSlEE0HX+vlnrPbwjN7JCX21z8qp27G8N
         OzcBRaoKOLazd1hPpH7hshwh5FZd6Zgm7ijGrcSo0U9kgsnY9r/nq5bLL/Ggkcbr+mCD
         JPctzoEXe6aBdyo38+qroygvHpUvy+RE3/re4TnSoa+SNXyj8K4Oj49Hw9aYR598jX85
         x1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679145220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjmr2nAua78gEqtz1WDKDDPtSDYZ8DpOst2CageaHa0=;
        b=1d/xTm0sbehkvw3yTQK3nsuthedJZhwSaLMAOg0Z4JvvsMBJrcQNG76DeyiUgKfe8G
         ucfF5w9Wes+ORULgtfhW3TWDXWwxK0lUkuba012Vy2VbU3a2uEGAI0t8nus4HyvYV/Pc
         xgFHwI8kVesiMnR2PZG2KdG3g7wnAbyfB45zOfWsUytKnXAQZ9u8/ftpt2ZwGQah22Zz
         vJmjqEGkQ3sjoCG2lmX7nPG2LhHLmg9SAwi1P6DLo6kAFy9mrgQ2YrgS7u3zRKG51BeF
         o54I0WBo//MzBwMLqsOjt2a1BmkKE0n/asSpfwoEggSQ5PA93DO+4ON3wx7JGYFqwFuR
         txIg==
X-Gm-Message-State: AO0yUKXsOwpMPSgAgcNEiymXrtr5nJljuWSbSzVMBt8EbiGeCVa01ybC
        D8/S2SpOUV4x3DV98Y3ZY83x8g==
X-Google-Smtp-Source: AK7set/mZURMrzSttemnB8LyVCWsJ/nCFWzbuKXCB3kOdk2TmaO2WL3OUnEsV3sHoL4moxqYNPZcAg==
X-Received: by 2002:a2e:95c7:0:b0:29b:c987:b34a with SMTP id y7-20020a2e95c7000000b0029bc987b34amr452925ljh.19.1679145220132;
        Sat, 18 Mar 2023 06:13:40 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id j21-20020a2e8015000000b00294649d3dcasm881652ljg.44.2023.03.18.06.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 06:13:39 -0700 (PDT)
Message-ID: <2e197a09-5e66-67f0-bcef-958578a85e75@linaro.org>
Date:   Sat, 18 Mar 2023 14:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 14/18] arm64: dts: qcom: pm8150b: Add a TCPM
 description
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-15-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230318121828.739424-15-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.03.2023 13:18, Bryan O'Donoghue wrote:
> Type-C port management functionality lives inside of the PMIC block on
> pm8150b.
> 
> The Type-C port management logic controls orientation detection, vbus/vconn
> sense and to send/receive Type-C Power Domain messages.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 70 +++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index 66752cc063d60..6db32bdbf5747 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -7,6 +7,8 @@
>  #include <dt-bindings/iio/qcom,spmi-vadc.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/usb/typec/qcom,pmic-typec.h>
> +#include <dt-bindings/usb/typec/qcom,pmic-pdphy.h>
>  
>  / {
>  	thermal-zones {
> @@ -37,6 +39,14 @@ trip2 {
>  			};
>  		};
>  	};
> +
> +	tcpm: pm8150b-tcpm {
> +		compatible = "qcom,pmic-virt-tcpm";
> +		qcom,pmic-typec = <&pm8150b_typec>;
> +		qcom,pmic-pdphy = <&pm8150b_pdphy>;
> +
> +		status = "disabled";
> +	};
>  };
>  
>  &spmi_bus {
> @@ -59,6 +69,66 @@ pm8150b_vbus: usb-vbus-regulator@1100 {
>  			reg = <0x1100>;
>  		};
>  
> +		pm8150b_typec: typec@1500 {
> +			compatible = "qcom,pm8150b-typec";
> +			reg = <0x1500>;
> +			interrupts = <0x2 0x15 PMIC_TYPEC_OR_RID_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 PMIC_TYPEC_VPD_IRQ
> +				      IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 PMIC_TYPEC_CC_STATE_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 PMIC_TYPEC_VCONN_OC_IRQ
> +				      IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 PMIC_TYPEC_VBUS_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 PMIC_TYPEC_ATTACH_DETACH_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 PMIC_TYPEC_LEGACY_CABLE_IRQ
> +				      IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 PMIC_TYPEC_TRY_SNK_SRC_IRQ
> +				      IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect";
> +			vdd-vbus-supply = <&pm8150b_vbus>;
This belongs in the board dt, it references nodes defined there.
> +		};
> +
> +		pm8150b_pdphy: pdphy@1700 {
> +			compatible = "qcom,pm8150b-pdphy";
> +			reg = <0x1700>;
> +			interrupts = <0x2 0x17 PMIC_PDPHY_SIG_TX_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_SIG_RX_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_MSG_TX_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_MSG_RX_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_MSG_TX_FAIL_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_MSG_TX_DISCARD_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_MSG_RX_DISCARD_IRQ
> +				      IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 PMIC_PDPHY_FR_SWAP_IRQ
> +				      IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +			vdd-phy-supply = <&vreg_l2a_3p1>;
This belongs in the board dt, it references nodes defined there.

The rest lgtm, I think!

Konrad
> +		};
> +
>  		pm8150b_temp: temp-alarm@2400 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0x2400>;
