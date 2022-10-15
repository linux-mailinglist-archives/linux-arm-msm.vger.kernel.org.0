Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0A15FFA5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJONmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 09:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJONmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 09:42:10 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E35220C8
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:42:09 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id b25so4184677qkk.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhAlAARnIPGam177y6OJiyvrCLX8kzTXnnGL7iq4rIY=;
        b=ZpjQGE/Bmcgc8bSanW1fEasPRrB2kqK6dOwBkwFu48kQK0n9dK9qYAjyftlsCJaZ6/
         TpK0yUXT1UsjADBPBUDyOixO3WXUOdtz5ZssQeTbcWdg2vcvSM0MCIgPlNiKYwa7Vv4e
         aPrC++qsJCuHqgd8vaIQclarraAgBR9uG7vB/NaatKlIv/9NE2H0IeOt+SOliKfyhbRj
         Rq80IdYXWMn4IWVggon9OdUX9YTGJRSSldFurbflV8Oi83MXZeeZ/LnClwP6HTPFAOD/
         hdfq5Nu1CFOIdw/SFDrLr8g9JWaYhi4MoK9wD0gQIoPoVViJIhx7JfsFLpZiBM4Ler6k
         hj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhAlAARnIPGam177y6OJiyvrCLX8kzTXnnGL7iq4rIY=;
        b=e3TNUcRgbEmsO6rU5mlWQtVp/gfE1OjZ/RvvPJX6lHT1w0czL3XsjYEOL7gmP1XAmq
         e6O+y6OK3kg5pzZ+ipRwqbG1GRf5TUDmTthtxF/2YogkiZt61q168560rINKxttkfS2Z
         1U69Xh8BCsxeESRL9QywB3HTuOnnQC23OCI3IdCgpMdhVYexYzmYG+xkTNMboi11BNn6
         oXdR/eipyH5J8HTlOf1wgDJmXxRrldCbR6gOPxlYaXsKPxxXUlckI50RBy9rQnbTYfB7
         DOSV11r6B1cux90MjK98jpWx5mB6fNsLN1P4fYDcv2BnfM0Y4kHNKAWdYT7INATcsiY+
         QkxA==
X-Gm-Message-State: ACrzQf2Ii8b8HGkHET+lfUXX4lPC+zsXz84VowgN6v7dsXh2gk8xDMFK
        dfIOFQHvdUI32EjtpxG56Gd9fg==
X-Google-Smtp-Source: AMsMyM4OlsWoO2000zSa+l8h9YfqFaHroP6BZ5Dm86x0WH+MZjXhXd8zW5Py9llNqIXGjfAjif3BWA==
X-Received: by 2002:a05:620a:4155:b0:6ce:3e56:c1e5 with SMTP id k21-20020a05620a415500b006ce3e56c1e5mr1865011qko.350.1665841328143;
        Sat, 15 Oct 2022 06:42:08 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id g3-20020a05620a40c300b006eed14045f4sm3299177qko.48.2022.10.15.06.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:42:07 -0700 (PDT)
Message-ID: <15b50b09-ba8c-c93c-a5f8-7b0d4d12f223@linaro.org>
Date:   Sat, 15 Oct 2022 09:42:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/2] dmaengine: qcom: gpi: Add compatible for QDU1000
 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221014221102.7445-1-quic_molvera@quicinc.com>
 <20221014221102.7445-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221102.7445-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 18:11, Melody Olvera wrote:
> Add compatible fields for the Qualcomm QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/dma/qcom/gpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index cc938a31dc2d..02438735e92b 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2286,6 +2286,8 @@ static int gpi_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id gpi_of_match[] = {
> +	{ .compatible = "qcom,qdu1000-gpi-dma", .data = (void *)0x10000 },
> +	{ .compatible = "qcom,qru1000-gpi-dma", .data = (void *)0x10000 },

The feedback was: drop entire patch.

There is really no need for this pattern to keep growing.

Best regards,
Krzysztof

