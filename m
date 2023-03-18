Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB056BFA25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 14:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjCRNLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 09:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjCRNLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 09:11:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F482916A
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:11:29 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s8so9410938lfr.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679145087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oFobvAALnJplAPOPW+XgZw5HuAXyVgPdb0ia9lKRjA=;
        b=Gr0U03VcP6HjWN0fTqhF0egq+7oxvYFpNYD9psJvVg8iRM1l6RTBRGUWljeEUYgfiQ
         UVAupT79eC9qP3rq3YyNGxGTn410LlO3xdqXlQS1IGMmqZCM5BAqYgk5lPokN4Ewxbkf
         uTA2RFmAL9bqCLXmMFz/f/s1krL+5aon4iaZOVKmvX7BgDMYU9pcCkYI+ORph79kIpKb
         cxceNuT+ui3hQl7Xg+FMfREjvrpMdkBouFGXi6e0BXc2wC4AzfYJj9439GBTCm3fdXcH
         FRhu95U2vbC9oKZDNGEXFiwny0WGK5+s8rlUpgY8FMAozc1OoeESaB6unM2tu8BX2K+t
         Yt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679145087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oFobvAALnJplAPOPW+XgZw5HuAXyVgPdb0ia9lKRjA=;
        b=xxMq0NaQJFEKn7wU9fImlThqUGx+ePrDweMgIqaB7DcVLByYsmrklgiNUOTEBDWub6
         tzWSMd7UUfG4wT/a48Unk7m8EXhGAIKdrWc2Hp4mxgUybWz30vqFftYHMEFe/cVgH2+H
         ON1XQQzZnmzIvA7/Llc74Rj1GJPJZCidQ0fTbRUhvR8e8C7td8cdwR0HKxk4WoSqDLZj
         YNi/FI5RxKLJQBqSiGYCKUVyvXiXTitt5YnNSFzckBOwuITd60a2SDzsTQB67G+y8ngE
         hznN4cIYx3BkwIOpTCfsgAWEIh9Q5Dw0gdPNpdV0a8ugZHgLH0QzjcTF+3mL2r6AaSgi
         mYiw==
X-Gm-Message-State: AO0yUKV2tZX1a6/rAkwjYcFw5577liM9YMS+em3cFQa8M4ooFV4+KSQY
        zcpHgsS5OzNMDSOXP9AlsgJEVQ==
X-Google-Smtp-Source: AK7set/vxs/hKwyf3U1vUyoVsH06YGgaToaSsmR3IGw3f9hakpnkJFSIbbmWd3cvenkEQ2ooecC1RQ==
X-Received: by 2002:ac2:5596:0:b0:4e8:49fa:ec1d with SMTP id v22-20020ac25596000000b004e849faec1dmr6152087lfg.66.1679145087578;
        Sat, 18 Mar 2023 06:11:27 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id f7-20020ac24e47000000b004d85a7e8b17sm823941lfr.269.2023.03.18.06.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 06:11:27 -0700 (PDT)
Message-ID: <3f223bda-fc1e-4340-ece2-183dca7b2f77@linaro.org>
Date:   Sat, 18 Mar 2023 14:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 orientation-switch for usb_1_qmpphy
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-19-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230318121828.739424-19-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.03.2023 13:18, Bryan O'Donoghue wrote:
> Switch on USB orientation-switching for usb_1_qmp via TCPM. Detecting the
> orientation switch is required to get the PHY to reset and bring-up the PHY
> with the CC lines set to the appropriate lane.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 43d549d6672e9..e5eecf02653ff 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1295,6 +1295,12 @@ &usb_1_qmpphy {
>  
>  	vdda-phy-supply = <&vreg_l9a_1p2>;
>  	vdda-pll-supply = <&vreg_l18a_0p92>;
> +	orientation-switch;
I think this property could be put in the SoC DTSI, the hardware
does support roleswitching

Add a newline before the subnode, please.

Konrad
> +	port {
> +		qmp_ss_mux: endpoint {
> +			remote-endpoint = <&pmic_tcpm_ss_mux>;
> +		};
> +	};
>  };
>  
>  &usb_2 {
> @@ -1379,5 +1385,17 @@ connector {
>  					 PDO_FIXED_DUAL_ROLE |
>  					 PDO_FIXED_USB_COMM |
>  					 PDO_FIXED_DATA_SWAP)>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pmic_tcpm_ss_mux: endpoint {
> +					remote-endpoint = <&qmp_ss_mux>;
> +				};
> +			};
> +		};
>  	};
>  };
