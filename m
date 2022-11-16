Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF68062BF79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiKPN32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236124AbiKPN3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:29:13 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F86645A16
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:29:04 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id gv23so11346518ejb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y2SGednwLIUSWdrpvgLWaQ6UAl5Le0cnjzvD5yy46M=;
        b=JCNclK2gNzC41DQ8q1ZbV2nxR/c5phT/+CDQW78qsnklM345zzEIIdvyZMgkv8LpNt
         9Ha7nFeMx73VBl7x+5eLkwW7lruwL/EHgpk8OCmcago07Cv05QVu5h2LI+3t3TRCVHaC
         oydyMW/wkwEyZ3wpji6+TZbhjmzi5wjl7zorJNm1FML+qdZOeukwcVB1FpYvyO10uBTh
         HAkcygEcPUK0Xiba/V1bPUUIUX5yLpcKPITB3HX9m+THhOY5gHUXTKexHvjCjNYWwGs0
         fM+I/w2wKc9G8Y7MTCCS7OIwTPUTRcC3zpV7CfpmnsJD5v4FvQQ94x167KNvEP0TwpEH
         PzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Y2SGednwLIUSWdrpvgLWaQ6UAl5Le0cnjzvD5yy46M=;
        b=U38+Jl7+8T1yX2usAhK9ibhGou+YmZ8ZpGsO1OgubH0QlKtFNjLy62T/1+Iz9kt0g+
         +ceXlAglueL/j7FJRCp4v7gWcw114qsJ0Q7YqRVCK3uXzU2JBpMbFi3boVSD5kQpXVuv
         NjVJ1fmgenDFn6JNmIPP6Opjx+w/TVDXeIUf3vPO09/DZWPKgdMFhwhscl/av1iFwOUP
         egW5rbtdTyv/2p+x0S6Bnx4cthtqPgLmCEpQaAoDo3ODowFNo2kktloEgP+YiKQCEqZp
         aIDHD+15sNQZuUSQcXLhnqY60T3D0Q9e0z7zSqmWs/aPwrj07mEZZsyCBO0nm62QN16t
         YMQQ==
X-Gm-Message-State: ANoB5pldaNoYJRzxeg0f8YKcDHFZub3IDvFF86DxN71XvOs9Y06z1mpb
        dN8NmSKjOVK7P7QcN8z0X2JV8g==
X-Google-Smtp-Source: AA0mqf59MDU3xxTRXgfl/y/PUh85AeEcGstGKV8g5HmAmf/TsCjtbzIdV8DUTbekr2DETvf6fDkcJg==
X-Received: by 2002:a17:906:8385:b0:7ad:8035:ae3d with SMTP id p5-20020a170906838500b007ad8035ae3dmr17696538ejx.46.1668605343152;
        Wed, 16 Nov 2022 05:29:03 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906315400b0077b2b0563f4sm6946476eje.173.2022.11.16.05.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:29:02 -0800 (PST)
Message-ID: <9666803c-2f9f-04b2-9bb8-2fec8231a324@linaro.org>
Date:   Wed, 16 Nov 2022 14:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 2/2] arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater
 node
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116132706.2852434-1-abel.vesa@linaro.org>
 <20221116132706.2852434-3-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116132706.2852434-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 16/11/2022 14:27, Abel Vesa wrote:
> Add the PMIC eUSB2 repeater node and add the usb-repeater
> property to the eUSB2 PHY to allow it to be controlled by the
> PHY driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 757cf4f7f195..539d75c0566f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -414,6 +414,11 @@ data-pins {
>   	};
>   };
>   
> +&pm8550b_eusb2_repeater {
Sorting is off.

Konrad
> +	vdd18-supply = <&vreg_l15b_1p8>;
> +	vdd3-supply = <&vreg_l5b_3p1>;
> +};
> +
>   &uart7 {
>   	status = "okay";
>   };
> @@ -429,6 +434,8 @@ &usb_1_dwc3 {
>   &usb_1_hsphy {
>   	status = "okay";
>   
> +	usb-repeater = <&pm8550b_eusb2_repeater>;
> +
>   	vdd-supply = <&vreg_l1e_0p88>;
>   	vdda12-supply = <&vreg_l3e_1p2>;
>   };
