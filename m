Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB325099CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 09:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386085AbiDUHo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 03:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357136AbiDUHmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 03:42:16 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0C0E00F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 00:39:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r13so8234046ejd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=61zWdSoSfwdGyGU44PP+1guwlHy3W/BFUYlSNhQpCK0=;
        b=CBU7olitGiLQzzEx9iv6wPvEsjbkpfrTdaLx9MIyj5KLa35zGrbCLuN1J6hL5gfybY
         L8nh5fo2YrgNW1FDKdtBOWGmBWIpeii0ODyz9vm9uEQeOeJzvDCJqQXOCsUut3tgw1N6
         1k4Cc0RE8ojHMIc2RO7RQC9orFAuvMYGJe4MNfAiD+1xkt1F0rMXsXPy9pd9ff4OkOcE
         7iGBAY+H4mo+sygXKBEqcRMxV4HdzrtytPUbRRoPHP1KYc9D82rdNwL66WIgFMX2p5eq
         jEmYVFntcMnAxxevgaEv2kusq82D/1Ap0R/mrEW68VYqdCmt8xjwD0yUDsVV0iqaBwwa
         7FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=61zWdSoSfwdGyGU44PP+1guwlHy3W/BFUYlSNhQpCK0=;
        b=yc25atdUVaVEoJQ4ibp7W6qxzVI1hzDq6zUPq352XZufTNnWbuNaE7lx9IF2ZCcgP7
         Df/wycj7qyLnWtDjpSypB9zdwv+Ly9aRzOTLwkUQ8z1wTg6S3hy73TnI0k3N4dQW8mrM
         T/eJDA+Uo1WG0kc1DDAbZu+VLBfCquAx24zPHqqJ3slGQLUyMm+omP9UO8vbNBngrRul
         4iBLX7NdhpG73Yq+YhU3zItGuE3xfeZDRQh40YrvOksa88xPYfpMgA/4OerMHM6e22jz
         QdOYBBLNFTxaxER31csbLGuj0gQSLRBPyfYfcVGFjGgOCZFUUc+SQRQYAe7LmaVHwXRo
         jVtg==
X-Gm-Message-State: AOAM532nsrY5wFxeo5uQOeQ11jbKG8W88AuIgYD/kzFsoWdidP+QjmaI
        ILkc4ydUvVyKG2OWJIKXrF9DVA==
X-Google-Smtp-Source: ABdhPJxaRfyAn8cs1xVngJOMFpWPzz5LlyNq2PV6KZNKfmogE+zYMSfsE/xO6jPk9Gbll6tTtRLyuQ==
X-Received: by 2002:a17:906:2646:b0:6d5:d889:c92b with SMTP id i6-20020a170906264600b006d5d889c92bmr22061179ejc.696.1650526741998;
        Thu, 21 Apr 2022 00:39:01 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 25-20020a170906311900b006e87e5dd529sm7496681ejx.70.2022.04.21.00.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:39:01 -0700 (PDT)
Message-ID: <ff80981a-54e8-9163-ed62-bbb4e81bdb92@linaro.org>
Date:   Thu, 21 Apr 2022 09:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: Fix can-clock node name
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20220421073502.1824089-1-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220421073502.1824089-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2022 09:35, Vinod Koul wrote:
> Per DT spec node names should not have underscores (_) in them, so
> change can_clock to can-clock.
> 
> Fixes: 5c44c564e449 ("arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
