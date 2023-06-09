Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67FC729ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 14:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbjFIMyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 08:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjFIMyg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 08:54:36 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718F03AA0
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 05:54:03 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1bdfe51f8so35841671fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 05:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686315171; x=1688907171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3E4FrvXxjw3vFtK6MuykysfCoEE6PED1NVjQeLR5t60=;
        b=aN1PaecVQJI/vxYCh8CD5Wk1dRW2Oi7b8rOu/u7hMl0SqBiEixPwXDedHGnh9eYiwg
         J9bRUo0Q3F4Vne8PB4K3wLjiQSIIDPCM8H3gP0EBMUxcel9KKDASE9R8S5xT6qShpexu
         4JScGzc2oufunfRgg6yV+a+nEe2qVLI1coJgycaSZPVEFyYCdZAcERpqxWgrBRKi8aCu
         CrEwuEmnMPXlzunoTmOORkXyJeL2Zg7ziNi2lLAePMG1L8qaqJgODFz89mB2F+UvGbRW
         f1IuyFT2Glc0sAJNprVUall+nDyl4FBDrbKAgvCbEeYf2QGSw4ylUpQJRrDlFRcBDs5L
         s/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686315171; x=1688907171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3E4FrvXxjw3vFtK6MuykysfCoEE6PED1NVjQeLR5t60=;
        b=G83/PpxydmROLa4K+v/lbAX+HFraTj3FPa9O8AH86mYtMfZcT+06Ggk12x7vC/Pf3I
         KJIO/O7Y0zkTQHVAabdiKsXt0cAwR1MY5UrY76F1929OCfXpa45R+ND+HjN2+n2F3GqG
         UY4wFPnYlnLTUU6mNGmrr6WwNnlav/seYt4mhV++IpLX+BuMBKF1WA+rnrfdRpAflPfg
         A1nWHB6wn7NMr4BhSrzD0Z4O3fdNL01wNwgPfliV6Fft0EAMNJT5jBj2WmKk2emohcBl
         Kx2Xt2eoCfVC4KbvphLJnRQYqexaI4M4cmtyLxVBvaQq4Qhg1O9IwAXn2OSp0Y6y/kXm
         hgag==
X-Gm-Message-State: AC+VfDxFbHh6sQSQv7mi6b3dJ+T1kPsG6BFomaF+xtf5md3ofrgMZ/FB
        f5eyUJ50ZwrGq7nRDVaGmVovQg==
X-Google-Smtp-Source: ACHHUZ4YnOWji9N7SFsl7pE2g8V8bX1xTsXIMzOg963DBHURNlJMy4zY1UNiRxozvl9wBx6XvAzXSA==
X-Received: by 2002:a2e:80d3:0:b0:2b1:b186:142c with SMTP id r19-20020a2e80d3000000b002b1b186142cmr587292ljg.14.1686315170742;
        Fri, 09 Jun 2023 05:52:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id n7-20020a2e7207000000b002ad1ba6ee36sm370863ljc.140.2023.06.09.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:52:50 -0700 (PDT)
Message-ID: <8d1ead23-8361-7943-baba-baf20d16cbe5@linaro.org>
Date:   Fri, 9 Jun 2023 14:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Add camera clock
 controller
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230609115058.9059-1-quic_jkona@quicinc.com>
 <20230609115058.9059-5-quic_jkona@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230609115058.9059-5-quic_jkona@quicinc.com>
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



On 9.06.2023 13:50, Jagadeesh Kona wrote:
> Add device node for camera clock controller on Qualcomm
> SM8550 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes since V3:
>  - No changes
> Changes since V2:
>  - No changes
> Changes since V1:
>  - Padded non-zero address part to 8 hex digits
> 
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 75cd374943eb..4d2d610fc66a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,sm8550-camcc.h>
>  #include <dt-bindings/clock/qcom,sm8550-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8550-gpucc.h>
>  #include <dt-bindings/clock/qcom,sm8550-tcsr.h>
> @@ -2419,6 +2420,20 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8550-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SM8550_MMCX>;
I see that both MMCX ("mmcx.lvl") and MXC ("mxc.lvl") (and MX, FWIW)
are consumed on msm-5.15, with the latter one powering camcc PLLs..

How are they related? Is that resolved internally or does it need
manual intervention?

Konrad
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,sm8550-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
