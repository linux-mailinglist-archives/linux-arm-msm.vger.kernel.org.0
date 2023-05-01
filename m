Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A59E6F300A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjEAKDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjEAKDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:03:01 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3930E46
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:03:00 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so2760479a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682935379; x=1685527379;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0csi5MRgE6Ap/iZuV4MKkzZgN0pcDdGkqiip6JvmNSI=;
        b=Cb0453LCEO77Sxrx4mSlVaRGRNMbdC6BHRGIUBgDHa7EZjXeSuxCMxaJynY1cTcHeO
         N3JzIwdYsMt2rXvqs8+RBCQqE7zc/AYImDO6OCLSQPDO1lJffQNcNsPrTfeYqkFhXivw
         /Bzta/lpzqD3H2R7qux/athNCXTvtS/SaoYHsT4iAO+XcGwzunnSuj4qzUoiwKvOY9kt
         oLD4YUcz0M6tc+I8LBVWomPCjOaZknr5brm4SJHuXTCDmLpX+wHzPEzNxxEchZMlch+Y
         C5dH5M4wfMu6mpq3tjyIvZIsiogXWAzU4mB81cUa7BqWjHOq5E5n7TSJ0VGP7W/OMMym
         Hocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682935379; x=1685527379;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0csi5MRgE6Ap/iZuV4MKkzZgN0pcDdGkqiip6JvmNSI=;
        b=E5MrQ0BjcZnIh89s4joxWmxWnR+DSG7s2DQuYPkm137E88LDenNlaG64Md4O50ZuWS
         sWxB2Xl1MEdM6yKLRenxK43o3mb6cBCC6WWvnqZZEqnS/pAtFJV5z5T2x2p7Bxsk/Rxn
         TwC6eohLD90ZqKGza+AkVi8P4ar4vVBXd5pe/WoL2KutHO7QFRm8kbdTR7XknOqHHSdB
         FlUqtwQocxle4icce7Gw3xhVDlqlmLutJ6erds5IGKr+GL1drpUUxagOD/urYJtoqKkd
         lt64aSaNOT+/XyNWrSrtpjG81YFFu3GdyY9pZSkmIYhBa2p8AsilG10MSUCSyIYkGT/Y
         uYDQ==
X-Gm-Message-State: AC+VfDzEd5VWvxmIihl8CdYoh0RBO2IV+yx9kBLUiKZiEWE9NuPOxASt
        fmTYvn1rvO3JFhoqaRriR4kZ/Q==
X-Google-Smtp-Source: ACHHUZ6P/NTRzCid9IkjGKJMGhcTWkdeugkzLl8LgDDvzV3/dulQk2WwnlbNkY57Ng6n7VTVmGF5Dw==
X-Received: by 2002:a17:907:1c8c:b0:94b:958c:8827 with SMTP id nb12-20020a1709071c8c00b0094b958c8827mr16017268ejc.56.1682935379094;
        Mon, 01 May 2023 03:02:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709064f8900b0094f3b18044bsm14553440eju.218.2023.05.01.03.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 03:02:58 -0700 (PDT)
Message-ID: <b5df5692-5319-b5ff-0e9a-c66fb1f8358d@linaro.org>
Date:   Mon, 1 May 2023 12:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: Add QUP5 SPI node
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230426185647.180166-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426185647.180166-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2023 20:56, Robert Marko wrote:
> Add node to support the QUP5 SPI controller inside of IPQ8074.
> Some devices use this bus in order to manage external switches.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 64c2a30d9c25..4a682e3442f8 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -774,6 +774,20 @@ blsp1_i2c5: i2c@78b9000 {
>  			status = "disabled";
>  		};
>  
> +		blsp1_spi5: spi@78b9000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x78b9000 0x600>;

reg is always after compatible.

Best regards,
Krzysztof

