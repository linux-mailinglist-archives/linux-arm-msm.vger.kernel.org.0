Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71679732FDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 13:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241187AbjFPLbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 07:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244879AbjFPLbD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 07:31:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB8D1FF5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:31:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f84d70bf96so802600e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686915059; x=1689507059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//Qu3hiEpe4TLJdaTFZDC48BNT7ERszPyV1zXJ0yHKg=;
        b=uxWtNsJwvZ7HF7KxfcW0YjH/M8cblUzouedbDzOZ5eXHgUJpgNiTjRXoU+hUgqwemw
         jMoXOC8uFFVPzAofHyzci7EJgyYLj7JkLdhns5WCD7/vfpyb+ZwP8jGhtGfL8Salic0M
         RP5YzhDCeGvQlDSNNEseyl+Swwja0XAemWdMwlmEWFM0ey1RETRNQbkP/pjKHwZOVqWl
         6atqNG1hzyWuyfCCrUqs7cRFnnc1wmbTpnmyQhAYXVqUXSboQW1lXnnqXRSH4oCQE6tX
         DNxSaGmd+/CsSwyF/nwX0tv7pKjJeIqYPoGtLiZvj6JmdbY+VrGBQRR7VEcAqF/ViLc3
         dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686915059; x=1689507059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//Qu3hiEpe4TLJdaTFZDC48BNT7ERszPyV1zXJ0yHKg=;
        b=I6ZeVvBq3r1kdMFCfOH2HpJvZh1HUr3SCG0SjdbkFg1etg46f27qxyT8H263wUqjOH
         sa/ekG4EJHcM7+V3fBdq8+35VX0V7ohSVDsq5o+0RsOqNEVLnHoygiHtORA4VBOBv6gJ
         3VT8uz4GPDn7Pbv6mQ+ZGUISuXNsY0fKBToeEL//L/o88SLLiTR8NBGzUT3xDYnHQqRv
         2RkWmvAvbeHHO7SnFWWiKKbM9MaHRO0St0e9hazJFpaS/mCmDO1MRlF7MrKM45A2cyde
         Qhjq4QEkcfVoXjtNZhYeNqG8pU8gHlF0Pl4Z70+RzlcwOif8CuV7LOtKGcaGKhsGrH8Y
         oyOw==
X-Gm-Message-State: AC+VfDxXvnuQej4qPbVpWLovBISX/TrqOJpKt3N4utydgl3M9O99labI
        JhdzjxQNn+gVhZi5sWPNP5XJcg==
X-Google-Smtp-Source: ACHHUZ6xOEU9IxkNAKpDcdKP6bGtm30j0f0RiCE4/9TaVC12Vt+UWYvrK8C42wyXSoBUqZYplv9I7Q==
X-Received: by 2002:a05:6512:52e:b0:4f6:3347:a044 with SMTP id o14-20020a056512052e00b004f63347a044mr660271lfc.26.1686915059114;
        Fri, 16 Jun 2023 04:30:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v27-20020ac2561b000000b004f2391fe9a6sm954063lfd.266.2023.06.16.04.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 04:30:58 -0700 (PDT)
Message-ID: <6a0a9fe7-d08e-4d1d-0085-f854f95c390f@linaro.org>
Date:   Fri, 16 Jun 2023 13:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND v6 7/8] arm64: dts: qcom: sc7280: Modify LPASS_MCC reg
 region size in the lpass_tlmm node
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
 <20230616103534.4031331-8-quic_mohs@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230616103534.4031331-8-quic_mohs@quicinc.com>
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
> Modify LPASS_MCC register region size in "lpass_tlmm" node.
> The pincntl driver requires access until slew-rate register region
> and remaining register region related to the lpass_efuse register
> is not required in pincntl driver as lpass_efuse register region is
> required in adsp remoteproc driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
Fixes tag?

Konrad
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 36f9edabb9d7..ec38f2feb9bf 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2509,7 +2509,7 @@ lpass_ag_noc: interconnect@3c40000 {
>  		lpass_tlmm: pinctrl@33c0000 {
>  			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
>  			reg = <0 0x033c0000 0x0 0x20000>,
> -				<0 0x03550000 0x0 0x10000>;
> +				<0 0x03550000 0x0 0xa100>;
>  			qcom,adsp-bypass-mode;
>  			gpio-controller;
>  			#gpio-cells = <2>;
