Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926DB773B6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 17:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjHHPuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 11:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjHHPsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 11:48:36 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F37A4696
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:41:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcfe28909so801801066b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509301; x=1692114101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMEaWb1xblsQVJcXEol8oykgDk7Z/s9Dq4Nd7yRCjng=;
        b=m8RJUnggZk+8BJbj8xr3VVE/vG+UEjuAA+YMwfpYe0beo8AMMJQqBxAlZUJWLmGJNA
         8nSTxcF6wFPYcaC4Fii1LKWR1NKvmvX4ZhXB8AcCwvWAHphVDG2DDv672stB79VLsncZ
         wYCucJWWF7s+7raUKXTN6jfst8mAdvH7K0r6pm6DiBXvJdIyHuAyKIy+TlX87vBRPDIm
         clI/mm0s1RSxdbYJas7g5DFwEE/2qM6af7nD0nsY8zR3Q2BWoN6gNFCH/v0ISIA5B3vo
         xmbB+yxVlNIf3pjHjgrcPp6AnTaaj10A2o3I4NU7GyzzFC+UIki1cD7fV1UUem3dwnXK
         51vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509301; x=1692114101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMEaWb1xblsQVJcXEol8oykgDk7Z/s9Dq4Nd7yRCjng=;
        b=VxVJ8M0JIzWpecSvBoA9I5n2FPGGkGqcelv6v6ErJSMFa69/H89SJ0GYT4WVhbI8vm
         bSV7QCC0j205Ui5dUB3BYNPZiGKlYdkYn7nvzHfs9oVoSndebOAnJIifH/BUIlkVFrNB
         9hjAkGYt9FpCsPSSmE2wyQbgZkfbq6P/9acRFQamnJpY8zoC1kXxD1KnbrYzopX+vTLD
         YqNMbiRJ5LsKOkAUTycTOcW8PSXDf4Rkx4fcDwU+HS9xRLBQkdWO+jkHoJUpLS2aLOtp
         DGjlhXmNqjx25oMFXX1Jegv6BIcA/3PQXco3iVdETZShkbygARs2V/VwBQALtj6CEutm
         Ia7Q==
X-Gm-Message-State: AOJu0YzWi4m5sXUQV69AO3HebZIniuc7MDhjGe06fhiPrfIL4raWlVde
        sBScJXCf3rr3Hzxuo5vr7/1qvXAKOZ5l87fzgQQ=
X-Google-Smtp-Source: AGHT+IG+hPH130GsaAWOXOCOgUJ4jN56dYOBsImJMdrSAJG+P3lNXldoERLeCFvY2fbEGvnW5W5Tww==
X-Received: by 2002:a05:6402:514:b0:51e:309:2e12 with SMTP id m20-20020a056402051400b0051e03092e12mr10221930edv.28.1691483803097;
        Tue, 08 Aug 2023 01:36:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id d13-20020a50fe8d000000b0051e1660a34esm6227195edt.51.2023.08.08.01.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:36:42 -0700 (PDT)
Message-ID: <a5b2f1a2-d509-0949-fc1d-929476c2618b@linaro.org>
Date:   Tue, 8 Aug 2023 10:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/9] i2c: mlxbf: Use dev_err_probe in probe function
Content-Language: en-US
To:     Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-3-liaochang1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808012954.1643834-3-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/08/2023 03:29, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

...

> @@ -2413,10 +2399,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
>  	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
>  			       IRQF_SHARED | IRQF_PROBE_SHARED,
>  			       dev_name(dev), priv);
> -	if (ret < 0) {
> -		dev_err(dev, "Cannot get irq %d\n", irq);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Cannot get irq %d\n", irq);

I don't think this is needed:
https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Best regards,
Krzysztof

