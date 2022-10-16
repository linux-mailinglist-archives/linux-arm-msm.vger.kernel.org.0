Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C25860001E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 16:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJPO5R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 10:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiJPO5Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 10:57:16 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903923ECEC
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 07:57:15 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id s17so4150279qkj.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DSlW8PNJtwCgbiq6siD3FnHoq6S/nqAGOOpU/YoqzYs=;
        b=vV/qQ6asJlxSPVcfjQJYDrv5VO6jXTRHaQoC52bpWb/eHqUFhRllYF01pr1+rac+An
         4a43tN9UZBJuhbNv6wQpXtDGYee5PWgim5ry/pu1oXszsyNV6RMb7dyNK3pTxYl3t/ku
         UKH8yef3b3ojfn3LJOJa/HIhSlMEZHxHXsFMjV0j75zf73GStE4tAJpZqTbjmXR9ABBP
         Eot7sQoCUrR2lcEy2u6ZYnuVjR+MJ6Wh+e4/NdemIJ75gA2V93+bVXmcnxnf9lgRjyRC
         AkYy3ARp6XEVn01Ncbikq1B0+oO/EKCc8v5rVQmgXCW9EnTen4Z+VzDQzKUlQrAfrYCq
         25Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DSlW8PNJtwCgbiq6siD3FnHoq6S/nqAGOOpU/YoqzYs=;
        b=xH88ieOy+N5plo5/4yXyTy3fubJv0EfCHDlAVzUjJlJk2jBW+U96K00SJh/KpRTOnL
         dyx8wqQ5IIJ3u+TPs2gp7D7CiWNXhS31WNVHFhjU4bqpI996JycQCNnkCfBtZfoX/fjd
         LJtHs6pIjNRGR8IrRARzPbSQ9gjrnyzKeeKTo86g+nJW8TIDDeB8xxlBPyjjcZ1Fm1N4
         2CaUVjwYQp9IK55wAVsejM/0HOuvIbDM9cDMw+khJKvOeaQJdajfm+j9dSzNox7ka7mS
         ax+Uhv1nfuBR/83AeVCposvNxeiPb2Q2F2QiTOd/o3oVttxkw6AFn4QkQ+3tIHkHUQ33
         +htg==
X-Gm-Message-State: ACrzQf2S383Qecikhu0prgG4f4IOLB3QOqM6sWWAz/UEMoaJJYbRxh/I
        UPbEv/4GZmc9Jiw08iYsX2/TfA==
X-Google-Smtp-Source: AMsMyM6hqn8kDuZJ9eDHrtktckLJoboMd0BBFXslzzqDdEvIbqxijizIwlja+Z95nxMZVSviDpsd2A==
X-Received: by 2002:a05:620a:25d4:b0:6bb:f596:97d0 with SMTP id y20-20020a05620a25d400b006bbf59697d0mr4868999qko.411.1665932234683;
        Sun, 16 Oct 2022 07:57:14 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r18-20020ac85212000000b0039a17374294sm5965001qtn.78.2022.10.16.07.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 07:57:13 -0700 (PDT)
Message-ID: <82e4f75e-ddf1-de9c-f552-bde5e35009cb@linaro.org>
Date:   Sun, 16 Oct 2022 10:57:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sdm845: commonize bluetooth UART
 pinmux
Content-Language: en-US
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20221016143300.1738550-1-caleb@connolly.tech>
 <20221016143300.1738550-2-caleb@connolly.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016143300.1738550-2-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/10/2022 10:33, Caleb Connolly wrote:
> The 4-pin configuration for UART6 is used for all or almost all SDM845
> devices with built in Bluetooth. Move the pinmux configuration to
> sdm845.dtsi in preparation to be removed from individual devices in
> future patches.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 23 +++++++++++++++++++++++

The move should happen here. Otherwise you add new nodes and we cannot
see in one place how the old nodes look like.

>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index f0e286715d1b..8c69942b969b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2971,6 +2971,29 @@ pinmux {
>  				};
>  			};
> 
> +			qup_uart6_4pin: qup-uart6-4pin {

-state suffix

> +				pinmux {
> +					pins = "gpio45", "gpio46", "gpio47", "gpio48";

Drop pinmux node entirely and put function to others.

> +					function = "qup6";
> +				};
> +
> +				cts {

-pins suffix

> +					pins = "gpio45";
> +					bias-pull-down;
> +				};
> +
> +				rts-tx {

-pins suffix

> +					pins = "gpio46", "gpio47";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rx {

-pins suffix

> +					pins = "gpio48";
> +					bias-pull-up;
> +				};
> +			};
> +
>  			qup_uart7_default: qup-uart7-default {
>  				pinmux {
>  					pins = "gpio95", "gpio96";
> --
> 2.38.0
> 
> 

Best regards,
Krzysztof

