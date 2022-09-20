Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF4C5BE9B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiITPKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiITPKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:10:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842E917A99
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:10:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a2so4309528lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OViHu+PU5jEpPTNCIuO30uizM2q0/rKRcVFoq6MpQm8=;
        b=Mgvo7+TX/PagCkx35EfYZnfTM/X0/MHnFq68QQT8p3Jk3ObhJqaUCACvhkdNJJqbVh
         Ltc2Npmgy1AnwVWCTFGdpLsfdkUT0A4OYyslgLErhbyWsy+p1u+4pHURu0nqrVaNb9OV
         72Qk2hivZMjiF9ExFGZgfQhhoWNNG+Uc/1Flszgk/oasmkw0F7LHcDuJ9ziQR0hp20Uo
         A7Zh4rhp6CEwMH3cqlttkbIeojJvXrgqLP5JrpCuBnhOkDh4VeumfKgRI7og1Rg+Q0yV
         5dK2iUkhugrslmwT9B2zWeU1/HrXcoTfYpxCYwg5Rc9KD/QgzflPFZ6hBiY0ig0hPgAl
         PhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OViHu+PU5jEpPTNCIuO30uizM2q0/rKRcVFoq6MpQm8=;
        b=bYxbNc+ldlDst65RVBd1Pi6hRMw5RlPXJ1FUUwsTB/m9+O2A6HQzHn08sxlZoHYwZl
         Do42kI7PgLXB7N0bK5OgHFos0LVlxKs7M+Z2aT1G58oBR8P2X8U+nMAsIxYFawFTJqCu
         nXnrIymNBDE1a7KBOvUhMgghHXicO4xk41w6BrYEr/OjbcPD8TpX+SUwa1ebf7iBo74N
         0xnqX7jvC7qRyHAVzm1gmPfznzWXV1MEu586Yie4Z5k9CyPKhlRGuNDR/y8z2jJQ+QWo
         P0hvtPFcc5IkDMD9emNjnrWpM/BMpoHcKaVLDSTyO1mh54YKyuan6wroG/A40HfkEjIf
         fXQQ==
X-Gm-Message-State: ACrzQf23w2QpM+0Zm4hSO/gaczGuvYyO0qnrc5PFXGCVBsdhsensoP1W
        c5aZV5KTJaTCmDDSJR3TVN1JfA==
X-Google-Smtp-Source: AMsMyM4glAPExuXIHfUSqwdUwYLj2e3fxyvPVe/CF6+S04oyl9aGtnJL4wIddz/70d4jhJ+atFfuTw==
X-Received: by 2002:a05:6512:10c8:b0:49c:14c5:e081 with SMTP id k8-20020a05651210c800b0049c14c5e081mr8574761lfg.615.1663686614879;
        Tue, 20 Sep 2022 08:10:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020ac25e70000000b004974da17c2bsm18620lfr.0.2022.09.20.08.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:10:14 -0700 (PDT)
Message-ID: <0a6b443c-33b4-5fc7-5a2f-e55f5387999f@linaro.org>
Date:   Tue, 20 Sep 2022 17:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 4/9] dt-bindings: qcom-qce: Add new SoC compatible
 strings for qcom-qce
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, andersson@kernel.org, bhupesh.linux@gmail.com,
        davem@davemloft.net, Jordan Crouse <jorcrous@amazon.com>
References: <20220920114051.1116441-1-bhupesh.sharma@linaro.org>
 <20220920114051.1116441-5-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920114051.1116441-5-bhupesh.sharma@linaro.org>
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
> Newer Qualcomm chips support newer versions of the qce crypto IP, so add
> soc specific compatible strings for qcom-qce instead of using crypto
> IP version specific ones.
> 
> Keep the old strings for backward-compatibility, but mark them as
> deprecated.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Jordan Crouse <jorcrous@amazon.com>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/crypto/qcom-qce.yaml         | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index 4e00e7925fed..aa2f676f5382 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -15,7 +15,15 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,crypto-v5.1
> +    enum:
> +      - qcom,crypto-v5.1 # Deprecated. Kept only for backward compatibility

No changes since v6.


Best regards,
Krzysztof
