Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE156F4271
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 13:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjEBLQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 07:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbjEBLQY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 07:16:24 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB63100
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 04:16:23 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f196e8e2c6so35921975e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683026182; x=1685618182;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cE6mUbhDYFfRG8tqGXVnf8qPg+fy2Z5p2puw4R3ssOk=;
        b=TH8xhFv7ZWHZ/VBl19IWBaTPKVvXrGAJKnGa8Ln7E8sT8bSUaLmOvYTIMwmr+8XzP5
         bwAL6rZXk8HlT98I/66BK3Tq5+HE4aXlUL+LKTWfYQ/CJwouOCjfYukF3c4Z6VOkTcMU
         Fr6tw5GY1NrgNQNMdda+UNzQ2g74Dq/8etBHElEEvl5bBMIKXGYBSydjzMDz061cGD6U
         BeqvN5CY/jUBwDxTAGCJBwPwi8YR5qG7ciq+t+aqtD3y8IybH4pKXy1X4SYgvlEtgGkK
         gIkW/IgZbG11qfVwT7CC/NCbmUywCQFNe22RyC6NBiFOgqtVh8SM1oPRxghg7niCHT5D
         kq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026182; x=1685618182;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE6mUbhDYFfRG8tqGXVnf8qPg+fy2Z5p2puw4R3ssOk=;
        b=RRXiW1GSVLhmv8KRM/ZNBbgEvxN1rat4xGz5WHE2w4U6A2Sa8nEz0SQ5GkP42QZGNx
         gu0PlkJZcRbjkSII7Ps1QeOLnZ+YG9VrNIWOgiegKLPbZPCZPK4iP45v5EZaIg5NCBto
         N5qHq/2xZRoiGEPU33W2UwH6CSUI2PwGefnJo+Mk1ApEa4u7G1m3pHbGX5mgFpCF18NM
         l9u1gBUl+pxPqCROX5H2reZEIAXCblyIhbhKP8f9Symco+YarLLKJrBwZ7U5t3IxAWdU
         WTUv0izfhbq4YH0nbQtO3Tq5AgpCX9VCg1zWThSsWjSPyW+W1xcgOmqnSGuo852TVDvE
         Ei/A==
X-Gm-Message-State: AC+VfDw3bUWlwYea5uqi6amfC/opgbD3N3m/BpoRCpdQUxhcTY83FYzy
        J+y/1w5PS78howZ28Q/Y2q9Utg==
X-Google-Smtp-Source: ACHHUZ67YtYANxx/lxRdshton+BJH6defRMxK1t92WqMhIQim5nVbPz3E29+Dizsl21jiYk1enDqXg==
X-Received: by 2002:a7b:c856:0:b0:3f3:1fa6:d2c8 with SMTP id c22-20020a7bc856000000b003f31fa6d2c8mr10941257wml.26.1683026181996;
        Tue, 02 May 2023 04:16:21 -0700 (PDT)
Received: from [192.168.1.154] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003f049a42689sm35029098wmc.25.2023.05.02.04.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:16:21 -0700 (PDT)
Message-ID: <7bb978dc-aef2-e700-e5c9-dd4ee3d25e4c@linaro.org>
Date:   Tue, 2 May 2023 12:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom: qrb4210-rb2: Enable USB node
Content-Language: en-GB, en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, kishon@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org
References: <20230502053534.1240553-1-bhupesh.sharma@linaro.org>
 <20230502053534.1240553-5-bhupesh.sharma@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
Organization: Linaro
In-Reply-To: <20230502053534.1240553-5-bhupesh.sharma@linaro.org>
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



On 5/2/23 06:35, Bhupesh Sharma wrote:
> Enable the USB controller and HS/SS PHYs on qrb4210-rb2 board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
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
--
Kind Regards,
Caleb (they/them)
