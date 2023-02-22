Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB0D69FA3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjBVRe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjBVRe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:34:28 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3458C367C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:34:24 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp25so11190860lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dN59YH7HktjgMj5OjrTUOtlbYhIW/Rx8QjDE6EyJw6k=;
        b=A62osjPfpGpdg0t63Vx3paXGtgYpu0xHbhgXtxWw9PUFmspKHqgU1zXxUiY6n/ljRM
         56F3WU0UxqpRAaggnfFobSyQtl95t9uxsNV0DWAZG3HPDxVRE5feN7k4vUbFFDZO0u8A
         yVHCfff8tbqelbL6b7aPQnYs0QSjpEffYc4fVMINaz+TfKtHkAJ+Vr03utr04azgA8x/
         rQH4HdMnQPM+oumHdIcCVdooW6sL3tPGkJmACH0WbFK78mJ3mguL8iZeoWTz+oBVlhG0
         yHrYRfESJOr+WXC7WAsOvRoTQmdLl9ttEIK+9FvuCbwnvmkEminwQ1593YMvFOhpTN7p
         QNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dN59YH7HktjgMj5OjrTUOtlbYhIW/Rx8QjDE6EyJw6k=;
        b=UpFhlWXqVZi/zIo5V4HYSlT7NsXehX1/+/V5IKp/P89EEVWBac3NG2NHrPEqm3EWHP
         QEvPHQVm8Jn7oNGO9XS3mirfJb0tuWTIVrjJaSkCf48tDtZe9Ug7LJ93FRsLmreqXyoD
         jHbdu2LB9Du55Be0mGlbmmc4i/FC75Rg0eyUJIRj+B1m45DQKQNydpQEvgwbBWS4a7y1
         BP1mgQWIOSHDLEO88ED+4eO5rskNIFT3SUlTD4zeTX4sBwgvykweNILpbniM9EPtyOvN
         1WyNPNqHaFPZmYUZLYCVnt+mY49i28XxHihNIkNmsBy/jzobV6R6oeVrPmeIr5/XS6sR
         1kFg==
X-Gm-Message-State: AO0yUKVMCaRm33htSSFjHqODq6HXDTvFPz74Zlq5yVXrxoM1dFOMnIbz
        x0quWGf0nlYeMLounDI+Z87hMA==
X-Google-Smtp-Source: AK7set+STaQ15AJMYhkHPL7UhEGo+p3D9Rno4QNj6KEvcO/5dJ9mhbNlj8YfNmhwIr0Iu3uu2G1d4Q==
X-Received: by 2002:a19:ee0b:0:b0:4db:2cdf:4c12 with SMTP id g11-20020a19ee0b000000b004db2cdf4c12mr3450237lfb.43.1677087262601;
        Wed, 22 Feb 2023 09:34:22 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004a91df49508sm695013lfc.177.2023.02.22.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 09:34:22 -0800 (PST)
Message-ID: <ebffa713-fa55-63e6-7f45-3b4739d38184@linaro.org>
Date:   Wed, 22 Feb 2023 18:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 10/10] crypto: qce: core: Add a QCE IP family
 compatible 'qcom,qce'
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
 <20230222172240.3235972-11-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230222172240.3235972-11-vladimir.zapolskiy@linaro.org>
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



On 22.02.2023 18:22, Vladimir Zapolskiy wrote:
> The added 'qcom,qce' compatible value will serve as a sole QCE IP family
> compatible, since a particular QCE IP version is discoverablem thus, if
> it'd be needed to differentiate various IP versions, it can be obtained
> in runtime.
> 
> Two IP version based compatibles are left untouched to preserve backward
> DTB ABI compatibility.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/crypto/qce/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 5bb2128c95ca..fce49c0dee3e 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -293,6 +293,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
>  static const struct of_device_id qce_crypto_of_match[] = {
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> +	{ .compatible = "qcom,qce", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
