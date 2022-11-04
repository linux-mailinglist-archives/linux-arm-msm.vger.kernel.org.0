Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7276198B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiKDOFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiKDOE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:04:59 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0B324BE8
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:04:58 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id x15so3045110qtv.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2m6cq7kFzzEaxP7O9ejPfXQmot6awwv9l7I+qVo0z0=;
        b=uRZU/4QIAT59UqeDVgxS85cFh23L2EGiDUtKmICnbQy+vrtUcRqVEwXC052AF5iL/u
         cTThKui0gFoB+2TVpCalmvyJ9696QFjpodgyGHLr7irUymR0b43TPetAVUX71XwuggtQ
         zlj4USiS9I0Zu5Qcp/L653RLexAAi2mnLJ7ECBG/RQ9UwzPtXWvRf9StHBVE5krnZ0cF
         bIbLznH1gwAn6bc1YLzC4ofgYD8bVoFh9a+anagPK2+ZrRtZ/DjuF6yL7SjzJG9EHQLQ
         wYV2MMTpp/6QRb+AXcmNJKbS0W6mXHMQFsJnwOklcx1/zScCGGmzf/vjFBg5UehKSssd
         45Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2m6cq7kFzzEaxP7O9ejPfXQmot6awwv9l7I+qVo0z0=;
        b=CD8t+pjny3mILZRg0WNkNDmybfhti6F2cagqlgGwZnfee+VSPwTKc30WCvduipyU2f
         ju28Pm6XXpAOurYYBQK7nH53zBnWyOS1lOKd4mxT7bc/o786vmMUPF1mXpQlpBXucjre
         Qyaal3LlLzGX4vlReHIhOKkGW7JjO2pcdyhBQAQUR2uAb7qNZ2cAB1ZsOLKbhSKP5/wW
         z+IUTVdizbunCvTxYcmxlM3RU/LtVD6uYwmOLaVU66XN/PPny9jz0kmknqWdCw2Y4bXC
         u7ZbR9294JrICh6Zhpou/0JShCb0CfViexdGPntQMwBC+unZyEoR6JP6tjC6IhWqCYO0
         QizA==
X-Gm-Message-State: ACrzQf0NpSMcv0/sM5D9d02Jg2PCMyTcmPrI/ehsck+AsMIiDkcRqKEW
        +K8aiW08jEQG3swwKlYlU6tgQg==
X-Google-Smtp-Source: AMsMyM5yhFiKshrGUaE44F1gDdjYEEe0Vr5IXXubMcT1QjWiRxovppwbwEok+YIIgdWwYaP+Y9tlPw==
X-Received: by 2002:ac8:51c2:0:b0:3a5:2d34:78cb with SMTP id d2-20020ac851c2000000b003a52d3478cbmr19392277qtn.677.1667570697997;
        Fri, 04 Nov 2022 07:04:57 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id g14-20020a05620a218e00b006ce580c2663sm2907966qka.35.2022.11.04.07.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:04:57 -0700 (PDT)
Message-ID: <9b77200f-19e2-e212-f1d4-bf3161c75ed8@linaro.org>
Date:   Fri, 4 Nov 2022 10:04:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: spm: Add compatibles for
 MSM8976 L2
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        kernel@collabora.com
References: <20221104133452.131227-1-angelogioacchino.delregno@collabora.com>
 <20221104133452.131227-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104133452.131227-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/11/2022 09:34, AngeloGioacchino Del Regno wrote:
> Add SPM AVS Wrapper 2 compatibles for MSM8976's L2 cache.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> index f433e6e0a19f..80434d7111d9 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> @@ -24,6 +24,8 @@ properties:
>            - qcom,msm8998-silver-saw2-v4.1-l2
>            - qcom,msm8909-saw2-v3.0-cpu
>            - qcom,msm8916-saw2-v3.0-cpu
> +          - qcom,msm8976-gold-saw2-v2.3-l2
> +          - qcom,msm8976-silver-saw2-v2.3-l2


I don't know what is the ordering in the file, so:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

