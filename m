Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E11673A46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjASNcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjASNcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:32:08 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728387C875
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:32:01 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o17-20020a05600c511100b003db021ef437so1265989wms.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EOpVZnjKrO7Yh5EsqJUZSLEPLkGrMAnumjuBQ+xGD8=;
        b=NWQl8S/zxWQpym0QTAJs8bV0RBtPthkFvu+DJtU+JtZJXhezEyO3AdJSpA01ocqB2R
         QTgKsnUbtkEDt9JMbstPSlMTHIWHr2kbEiyqo9piVzn32z8odIHrBM3FkIRa8Jc1eMMW
         p6bABsONEnWhlmH9tLc4gqI2f0Td2NLxBE4caLFMKYgzHy9poG+Zl/RsXjGOsCVaa8cq
         XXrvET532RdoT6a10n0vm8epB/RKuMwq9Ti+nsZZi4jKWiW22/f/MWlx0YygEac7Fp8s
         lsTK+N8hzDEz6rhvjzka8Ncb8VSHtovgyMZ8f4DfE8DPRHq6riPiIMCoSLw8s0ClRcH6
         l1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EOpVZnjKrO7Yh5EsqJUZSLEPLkGrMAnumjuBQ+xGD8=;
        b=wtIz+f70GRFzXA2IvRjWpzLHIQpsUc0xDVTf0OkFKKok3RgnxDKqvi3l2BmCbHsmVT
         Do3cC93ZxaPwhj47kR4r/fXXWMlKUnD5EwecfCjJXMnCRMtM3qlAjUMm+cHEkCx5HFWF
         039/w9zyOTQKIOcdUqJdeVl7h8Ekn9BsUYhj++XhIj7ihdSONIBbVo4O6UkFxxaHQJEp
         q35xQJH+s/V5a+O0s0hgQTQK8vgqYla3k3W2HBEz0I17Ej4eiftJxJMFApAasvnBc3Nc
         Cvzsn8IFufGkDdwFb/ZmvYKxgDCDqoWDN5LC4WG90FVfR/fQnIhzEcP5iYpCxSu0JxPn
         gzHg==
X-Gm-Message-State: AFqh2kozx9w5agNrG9tkOLWmTcvZ9t3PEq2i40EKG5F9vI3kXqYcjuK2
        MwWNgu5KeFdWpq/neyoZYhx5yQ==
X-Google-Smtp-Source: AMrXdXt/GzDdw4HU7OC2tsFKY7iQ/IaxIdtDr0iP7gx5odSJTGcJgQlhP1BNyv7JUpM4mUu9ISlTFA==
X-Received: by 2002:a05:600c:524a:b0:3da:fa71:a333 with SMTP id fc10-20020a05600c524a00b003dafa71a333mr10827273wmb.12.1674135120045;
        Thu, 19 Jan 2023 05:32:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ay22-20020a05600c1e1600b003dafbd859a6sm4975286wmb.43.2023.01.19.05.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:31:59 -0800 (PST)
Message-ID: <17b895c0-3985-a012-9b02-94d5ebb11ff9@linaro.org>
Date:   Thu, 19 Jan 2023 14:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Update VA, RX and TX macro and lpass_tlmm clock properties and
> enable them.

Everything is an update and this does not explain what exactly you are
updating in the nodes and why.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 81e0f3a..674b01a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -8,8 +8,67 @@
>  
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  
> +/delete-node/ &lpass_rx_macro;

Why?

> +/delete-node/ &lpass_tx_macro;
> +/delete-node/ &lpass_va_macro;
> +
>  /{
>  	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	lpass_rx_macro: codec@3200000 {
> +		compatible = "qcom,sc7280-lpass-rx-macro";
> +		reg = <0 0x03200000 0 0x1000>;

Why? They are the same.

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;

Still the same...

> +
> +		clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&lpass_va_macro>;
> +
> +		clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";

This is different...

> +
> +		#clock-cells = <0>;
> +		#sound-dai-cells = <1>;

But this not.


Best regards,
Krzysztof

