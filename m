Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3288B732FD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 13:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjFPL3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 07:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjFPL3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 07:29:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8C11BD6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:29:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b445512846so7245191fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686914951; x=1689506951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPl/Cm9TUOIJAydXqu/DaBtxLQsqLO/czBac9wLWX/0=;
        b=MuFnXiXNi4gk451FOYKezE9N/oK+j6bnAE5Vu7vXJ6sw14V5qVHQDl1yXoq9UmMBxO
         3rX9ISyF8OHgdvjZ4mu9wA4sMianW8ZdW0Gos5GavFSc77y3xZMYS3oCenjXOSlgI0cg
         J5bFDcufryPBluZKlszl9NMCjVn2rhBii2xQiRhWzooK6omvViMzxvuMQJ83DKxpDwo5
         KV1nh6+0UZP2ZyDFb02uujrVtS8uVHC3XNlJFR7DDEDqsJca5XJseOhrJPBCWs+BtHEP
         NbNQd6WjK3WF3ngRMJK5FA21T0IkFpnAtb67wS/MA6n5f/0cI6OcB1Rjh53DxCpTsxlV
         ziSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686914951; x=1689506951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPl/Cm9TUOIJAydXqu/DaBtxLQsqLO/czBac9wLWX/0=;
        b=cxzcFQUN5+ZQymFuPdjYF96H63GUpVqd7FyqOBGT6Z++e6YuXkC8Ym/yBWkt1mU+TT
         k/ODpzBBvnbkf6hzyvsztbeNXnoz8gkSzdZ89+f4NY2LNHSnG3kQSKdRKs/avnTRzEu1
         UysVqwjv+09mvqC3pRBr0MM7runXS+rVdZXJaIJsLbvSv/DBd3RSk0ASHtTgs08KslbL
         /MwlvemfqRWkSLtPuiuoQwVCs+P25O7DsMiWisbi7QMPC5FcM7buvg0HvLn6EB5M+WzI
         EGRJYddzBHZ2U4Zm4rzljj92M9BzLDRA88JiQmGH1Q3Au1dUkKT3/nsRZwcWz6unKaYF
         oOkQ==
X-Gm-Message-State: AC+VfDyheGOexdrd5UemZ1vkF+mV9ylbkVguWXI07+lHeL89B9LA6clJ
        /byLo9Hw0xDuUnuiIuAFqdFKtA==
X-Google-Smtp-Source: ACHHUZ5GqF0WMOzAI6Q/BVK4J832e4ALlDR8lDuwXSJmIo5ZLqbT1NyvufaXxwDRquYbpj0l37hsoQ==
X-Received: by 2002:a2e:3c16:0:b0:2b2:3a4:4ebe with SMTP id j22-20020a2e3c16000000b002b203a44ebemr1600689lja.48.1686914950883;
        Fri, 16 Jun 2023 04:29:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id j3-20020a2e8503000000b002a8c1462ecbsm3575638lji.137.2023.06.16.04.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 04:29:10 -0700 (PDT)
Message-ID: <7d2e580e-1861-d22f-e67d-726a2a69043e@linaro.org>
Date:   Fri, 16 Jun 2023 13:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND v6 6/8] arm64: dts: qcom: sc7280: Modify VA/RX/TX macro
 clock nodes for audioreach solution
Content-Language: en-US
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        andersson@kernel.org, broonie@kernel.org, agross@kernel.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, judyhsiao@chromium.org,
        quic_visr@quicinc.com,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <20230616103534.4031331-1-quic_mohs@quicinc.com>
 <20230616103534.4031331-7-quic_mohs@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230616103534.4031331-7-quic_mohs@quicinc.com>
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

On 16.06.2023 12:35, Mohammad Rafi Shaik wrote:
> From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> 
> Modify VA, RX and TX macro and lpass_tlmm clock properties and
> enable them. For audioreach solution mclk, npl and fsgen clocks
> are enabled through the q6prm clock driver.
> 
> Delete the power domain properties from VA, RX and TX macro,
> for audioreach solution the macro, dcodec power domains enabled
> through the q6prm clock driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
Maybe sc7280-audioreach.dtsi containing all these changes that could be
reused by others would be in order?

>  .../sc7280-herobrine-audioreach-wcd9385.dtsi  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 9daea1b25656..c02ca393378f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -196,3 +196,46 @@ q6prmcc: clock-controller {
>  		};
>  	};
>  };
> +
> +&lpass_rx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
Surely they shouldn't cause issues, even if the vote would be
superfluous? They are still powered by these power domains, I'd assume?

> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&lpass_va_macro>;
> +	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
The drivers use clk_get with name-based lookup.. you should be able to
simply extend the list in the common DTSI. Please test that on both
audioreach and the other thing though.

Konrad

> +
> +	status = "okay";
> +};
> +
> +&lpass_tlmm {
> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names = "core", "audio";
> +};
> +
> +&lpass_tx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&lpass_va_macro>;
> +	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
> +
> +	status = "okay";
> +};
> +
> +&lpass_va_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names = "mclk", "macro", "dcodec";
> +
> +	status = "okay";
> +};
