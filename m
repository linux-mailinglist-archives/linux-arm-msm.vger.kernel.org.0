Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380775ED6D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbiI1Hvd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbiI1HvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:51:06 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7831191A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:49:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a10so13497186ljq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Tz8FnON40hM72t8l0w9zzHepsEG1dR1dE8lAypF/8gQ=;
        b=xqjKOEM60b3kO5FXONlqeS+u0bfBp7+2es6bDeu2a+RrQHudBK97LmKepBt01O9JZx
         SdyDC3tgMc0Crc9/eYvvhXzxw4StPOVsLDgWZWrlRHFFMwo740zcTp5mR9AsbU+0HwsE
         zzAVP8APIKOA3HdkoYOHy7+rwQy+gsIr5PMsdW7LkJyVkFRG0UQrmpzyJPwmZK6ufnVd
         eA1gsfQ1LzSClp7Gew+OIwT5zbVKRMFLFJTVFEDJP3ZqgIypeoalhBj+xYzRylTXPDVA
         +5Gv98mFdrD7gDa/Wt91W8FL0fxGXJyI6MxxTiEBd5/Pu7oeD1pzghWHA9dNvupqmN5L
         k8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Tz8FnON40hM72t8l0w9zzHepsEG1dR1dE8lAypF/8gQ=;
        b=hjHWfWsdnQIipkTbhJl1tiO+0KrjUPndvG4pv38IZ0nRc+wcCDN8KElE/YnU8KDBZP
         lf0GB7FdwTYQ+Z4Ic2gJoRvFCnZQZGqJpcthVZY6Fhq23F1HT+iv7F1o/uDnI9cpOoAn
         Z/KDlkfDaPfWBm1Nb0FLx7WPljCn1qE/hyEyJSIaph31MF8IzbjaJrC/PYEGl8825Bpm
         o3CHYHKwODJM4+GtRlpEqzxJLgSoqecR/3gCyZHi19PXbtzoBO3wQ/xk64DMspbw8ywF
         pTCJMdu8sGMljTWwh194kFIDTD3u3USoReD/a2WNg2oO6doBVc+E61NEFuD4mGfxi9Ng
         3yIQ==
X-Gm-Message-State: ACrzQf2B6Inw3hSYCRUR5V+m5bidEGj18/xUweWwaFp00Wn+ZJrBMPp4
        fsIQtUFkbVoHGXFZM5DGTtkrZQ==
X-Google-Smtp-Source: AMsMyM6XEyT9Y+vKgFQGHVFAkmCRPGlrudBlXOq6fAezTaw3b6tDxijEtcG5CNa1XooTvy6H/3fYRw==
X-Received: by 2002:a2e:7808:0:b0:26d:295f:dfef with SMTP id t8-20020a2e7808000000b0026d295fdfefmr7220913ljc.266.1664351389228;
        Wed, 28 Sep 2022 00:49:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id cf31-20020a056512281f00b004a044928923sm395342lfb.293.2022.09.28.00.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:49:48 -0700 (PDT)
Message-ID: <9c88a0ba-36c4-ae04-cf04-51174613893a@linaro.org>
Date:   Wed, 28 Sep 2022 09:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 4/4] dmaengine: qcom: gpi: drop redundant of_device_id
 entries
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20220927014846.32892-1-mailingradian@gmail.com>
 <20220927014846.32892-5-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927014846.32892-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 03:48, Richard Acayan wrote:
> The drivers are transitioning from matching against lists of specific
> compatible strings to matching against smaller lists of more generic
> compatible strings. Continue the transition in the GPI DMA driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/dma/qcom/gpi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 89839864b4ec..e5f37d61f30a 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2289,8 +2289,6 @@ static const struct of_device_id gpi_of_match[] = {
>  	{ .compatible = "qcom,sc7280-gpi-dma", .data = (void *)0x10000 },
>  	{ .compatible = "qcom,sdm845-gpi-dma", .data = (void *)0x0 },
>  	{ .compatible = "qcom,sm6350-gpi-dma", .data = (void *)0x10000 },
> -	{ .compatible = "qcom,sm8150-gpi-dma", .data = (void *)0x0 },
> -	{ .compatible = "qcom,sm8250-gpi-dma", .data = (void *)0x0 },

You cannot remove them that fast - it would be an ABI break. Just add a
comment that these are deprecated and devices should match with a
fallback compatible.

Best regards,
Krzysztof

