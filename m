Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51EFB5BE9C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiITPMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiITPMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:12:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFA526122
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:12:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c7so3341323ljm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZDQKf8hMaoTftjO/wZ7T/DZ09g0+Y8QFKUhj1aczZO4=;
        b=ijboJH4ZrvEVX7eaxNhBtr6nvX/5TUNuJFbmOqb0+QVyWacM7IZnlW5yZJuYuClDvZ
         v4snu7Fkf2FNjd4tVHOObneeahy8b84caSjAI7JNomzrgj4KlvmmbGBRbBlIQDScGkU5
         AtjjSLIFGry4WeNbCg5T1m5FeInNPPQLbsY8D0ysBmH9Ydb+zN0yU898nwA5nNQ5bM2O
         X0hBLN7WAek0/smDVWaHRNRklQ2eKn+W735Fg2/9g3xRfPsqh5qTykYmLMEos7L6T9jy
         JJZRR8d/3zZSkmAdDjJ9+umgDxlvr5XgkRJcVC9sj3hxuU9sv2FUfjHXvupE53tlIRbL
         QRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZDQKf8hMaoTftjO/wZ7T/DZ09g0+Y8QFKUhj1aczZO4=;
        b=jEB5jBmn9qswN5GbukX4T7Tctx+te+hmIRG6UglQxBQZ0ur2A2B86ENN4mRC89Lgwc
         uGyZI5FJzAZ0bEcLeoYRvrYsaI24Z95flpeEIVFcMS4PlMyViK2PTIanFbt+85hJDyVf
         OzLja1YtZtzmxJ4diMYvsDjgp85qWKQM+rQOpZ+liH815bkWwHOyDi1eBcuvgyxLhQqA
         j+7fIDbLe3iDwh/pRguSkZNNUzBfx9H/e4TP0q7X5OqD/NXRP3pHaQ3/R8Y4D7CutXgs
         C/fw4pE6pTwvDWuYnJBP0m5gie6MTUqe8qbxLoGxmTTw1O+/U25j4WFMlfCcaQBQij3o
         UpOg==
X-Gm-Message-State: ACrzQf0zGbx8am9Gk4H9SdCJ4ARPnzKTtyonwAH+3+QRkH3eWI6SQ8Pz
        ohn2u35lSk6LpmUUDNdcjQjdbSCVmDvCmA==
X-Google-Smtp-Source: AMsMyM7QSPRloERUtnpYtYvGWHR7eEWFhijs5dTYRI013FK2V/Z/om+lBoVDAQl70Nxw3ITy/2Cang==
X-Received: by 2002:a05:651c:514:b0:26c:5815:551d with SMTP id o20-20020a05651c051400b0026c5815551dmr1792306ljp.28.1663686761755;
        Tue, 20 Sep 2022 08:12:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm1781lfe.195.2022.09.20.08.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:12:41 -0700 (PDT)
Message-ID: <b4016460-f43a-13f8-432e-47c27237e005@linaro.org>
Date:   Tue, 20 Sep 2022 17:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 6/9] crypto: qce: core: Add new compatibles for qce
 crypto driver
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, andersson@kernel.org, bhupesh.linux@gmail.com,
        davem@davemloft.net, Jordan Crouse <jorcrous@amazon.com>
References: <20220920114051.1116441-1-bhupesh.sharma@linaro.org>
 <20220920114051.1116441-7-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920114051.1116441-7-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 13:40, Bhupesh Sharma wrote:
> Since we decided to use soc specific compatibles for describing
> the qce crypto IP nodes in the device-trees, adapt the driver
> now to handle the same.
> 
> Keep the old deprecated compatible strings still in the driver,
> to ensure backward compatibility.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: herbert@gondor.apana.org.au
> Tested-by: Jordan Crouse <jorcrous@amazon.com>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/crypto/qce/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 63be06df5519..99ed540611ab 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -291,8 +291,17 @@ static int qce_crypto_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qce_crypto_of_match[] = {
> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },

This is okay, so there is no ABI break.

> +	/* Add compatible strings as per updated dt-bindings, here: */
> +	{ .compatible = "qcom,ipq4019-qce", },
> +	{ .compatible = "qcom,ipq6018-qce", },
> +	{ .compatible = "qcom,ipq8074-qce", },
> +	{ .compatible = "qcom,msm8996-qce", },
> +	{ .compatible = "qcom,sdm845-qce", },
> +	{ .compatible = "qcom,sm8150-qce", },
> +	{ .compatible = "qcom,sm8250-qce", },

This is a bit odd... you have 7 devices which are simply compatible or
even the same. This should be instead one compatible.

I don't really get why do you want to deprecate "qcom,crypto-v5.1".
Commit msg only says "we decided" but I do not know who is "we" and "why
we decided like this". If you want to deprecate it, perfectly fine by
me, but please say in commit msg why you are doing it.

Best regards,
Krzysztof
