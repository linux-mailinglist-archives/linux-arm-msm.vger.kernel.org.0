Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6054866DD26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 13:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbjAQMEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 07:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbjAQMEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 07:04:02 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DE736085
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 04:04:00 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id b7so4340325wrt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 04:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LC36tYOsrzMFKc1hIJMxOzyJIsB2d2g/sMGeMuvD72o=;
        b=gEdKm4YiZXcUF8Nq9Qakm4fhHqWXOM33M0oeCopCt5ImvdYni59Wcptea4EUS/ev1U
         p9LvckWFMNcJIlXS4Cad0obqRw0tH1b/saKAPuGy/r2FsWHCIQPniv2mP1N+LCslXFbM
         4JEIat6zUxKfKpSS5fbV67+wful2yTalQPvP/RVthRVXSYMdynFddcGARv8SmJF8e9QL
         MAaJZaocMVsDiHnNmcUi3SHs4GbuaWJHWxRe5W5Kg8g2UQfHW1p8+fIY9rLsZc/Kxhi4
         7th2WI8J9ZnQMf+toftdjYdHBXUDbL+F4ifGUOCKLQSwiMd9qX34qGdRP1GQgC1dvzPT
         Vx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC36tYOsrzMFKc1hIJMxOzyJIsB2d2g/sMGeMuvD72o=;
        b=kt0bOUMAu+z4UPTwmKtkj7EfB9oXMNE3/555LThAjjJoQYbozAl/Sj9vHLoaaq7ZMG
         NSf5NT1F3QQhZVSBTqagXB1aNIaEWkZtrxvoSOfZPkHunUVt92OxJQRWbaj6WvECA1zS
         fbX1J63uIZlLwGZrLsCBxS8yHmIXb04zFMbRUuEBzX+i4mKLa4Ng7YGWPocJGUldJPHQ
         lqViGpnUVW7JmyjlfLmOqML7MlO1j8lsfIJxIkSTFp9a+HU+ec+XJQSgb4kTp3nPghPk
         QyE3n9FSJiyyr7VQdA5o6wCIDm54UaiRokzVuHgrYrS1a3BKDSUBs6BegNLusOPIDUcF
         9I4w==
X-Gm-Message-State: AFqh2kpP8kbNpSNgHMK1tQs4w8d33L/2GXyPnTJ0XCOGFVnSN8VxrPZ4
        bTLChEuZc+nMu7aNbej2pVSpQA==
X-Google-Smtp-Source: AMrXdXvAGlWA2xaue4XwpCW7OPs6lBGRcjQrVSo4YqU3LwD3OrpkOBI+8cwnGGA4R1HlGWjj8rAVcQ==
X-Received: by 2002:a05:6000:98d:b0:25f:8ead:96cc with SMTP id by13-20020a056000098d00b0025f8ead96ccmr2535229wrb.70.1673957039302;
        Tue, 17 Jan 2023 04:03:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:dff1:a9dd:eccd:492d? ([2a01:e0a:982:cbb0:dff1:a9dd:eccd:492d])
        by smtp.gmail.com with ESMTPSA id c13-20020adffb0d000000b00241fde8fe04sm28240223wrr.7.2023.01.17.04.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 04:03:58 -0800 (PST)
Message-ID: <6746407d-e72b-4003-9c4d-b4be36ee3e16@linaro.org>
Date:   Tue, 17 Jan 2023 13:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: sm8350-hdk: Enable display & dsi
 nodes
Content-Language: en-US
To:     rfoss@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
References: <20230117120223.1055225-1-rfoss@kernel.org>
 <20230117120223.1055225-3-rfoss@kernel.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230117120223.1055225-3-rfoss@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 13:02, rfoss@kernel.org wrote:
> From: Robert Foss <robert.foss@linaro.org>
> 
> Enable the display subsystem and the dsi0 output for
> the sm8350-hdk board.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 26a608144886..7878f42e9378 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -221,10 +221,32 @@ &cdsp {
>   	firmware-name = "qcom/sm8350/cdsp.mbn";
>   };
>   
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_phy  {
> +	vdds-supply = <&vreg_l5b_0p88>;
> +	status = "okay";
> +};
> +
>   &gpi_dma1 {
>   	status = "okay";
>   };
>   
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>   &mpss {
>   	status = "okay";
>   	firmware-name = "qcom/sm8350/modem.mbn";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
