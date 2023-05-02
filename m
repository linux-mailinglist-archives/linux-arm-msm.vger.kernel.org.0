Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A416F3B47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 02:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjEBAQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 20:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjEBAQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 20:16:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAD026BC
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 17:16:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so4141220e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682986585; x=1685578585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNbPmr5bNbBTGpERvChrdW2sKTJp+U0aa0vtTqIBezc=;
        b=hPtiT8DyZ40DxiHCHZDQgHQwzj1/Cv6zfCU9uuNqkyFsJQ8jvE4NE5IdL4h6TjQcC8
         l7bwXgr1vSoi4V6XPvy7FYFbT9d19qXn81S+3zGgtvgQfLd27DfO3W0QnbVJPdrN+xne
         E2S5SaMHxT6HtE7c0H7uzUg3VaO7vWWS15S2WeX/H0Kbd490bJMXjasJGHDbuiIILAWP
         EdlLPfKN1szRJTSIfF0baGIc/NPI9rwSYA1WtlBZOoD/y3A2Kt+Sbwvr7g1wme/9jS6e
         mcFnom5TmRQYbAvFyA9WdrgG9Ujq4z8mJVbk0OG3ZyRkyIrmM2mwj6FMPPQhU02htgMX
         SH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682986585; x=1685578585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNbPmr5bNbBTGpERvChrdW2sKTJp+U0aa0vtTqIBezc=;
        b=CHCHuw8O3cWBpms8fMQbtPiA7RupwqNcwGRA6kH2P5lb+GlTdbyiD232PsGncZtz+2
         iOpVxm3SBf/Kjbrv623a7p7QRNWEEGVw2YhCJwrLlQTiP97IKUYF4ZgPbG5DbbAyH35V
         CgOSwFhFGxsRo2E00qgBU9WsusclZx27l6d8u5S65Icp7tvH/bSTDaocQI5D+4NYNA0N
         yvx4Ep9GqRyQoxwp49irY2mWdjEexCVCM7Gb45kYsmkQ+UNvTZbqKkz6y7g6l8hdl6Vk
         VO3jjNQYfBFUkXXxdWA0OI3HAkVoMaZtRQgHAheV+XCAdjC0RRhA8/en24Ri21EDUZFU
         JaXg==
X-Gm-Message-State: AC+VfDz3BozltlDQm2AFxHPKiGWBUsAxQVFPeKI+p/2EMMiWr67Drz9T
        CSY8cOqlpco7pKdROIgWf/XwVw==
X-Google-Smtp-Source: ACHHUZ4gLX7H8mWJSHjWdjvuUfToGQ1BcPPIcO9rw7RnG2M0fdeOMyF40KfTWVA763tBb2KTcJ6sVw==
X-Received: by 2002:a19:ee0c:0:b0:4ea:f526:5bef with SMTP id g12-20020a19ee0c000000b004eaf5265befmr5192356lfb.28.1682986585453;
        Mon, 01 May 2023 17:16:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u18-20020ac24c32000000b004efe8d7891esm4302694lfq.161.2023.05.01.17.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 17:16:25 -0700 (PDT)
Message-ID: <4f88dc8a-0e8c-156f-bf7c-4fcf30df1037@linaro.org>
Date:   Tue, 2 May 2023 03:16:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: qrb4210-rb2: Enable USB node
Content-Language: en-GB
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, kishon@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230501192432.1220727-1-bhupesh.sharma@linaro.org>
 <20230501192432.1220727-5-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230501192432.1220727-5-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:24, Bhupesh Sharma wrote:
> Enable the USB controller and HS/SS PHYs on qrb4210-rb2 board.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index dc80f0bca767..eae3024ce003 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -222,6 +222,30 @@ &uart4 {
>   	status = "okay";
>   };
>   
> +&usb {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	maximum-speed = "super-speed";
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l4a_0p9>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l15a_3p128>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l4a_0p9>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +
> +	status = "okay";
> +};
> +
>   &xo_board {
>   	clock-frequency = <19200000>;
>   };

-- 
With best wishes
Dmitry

