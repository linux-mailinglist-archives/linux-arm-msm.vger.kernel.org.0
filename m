Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C895ED647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbiI1Hg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbiI1HgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:36:20 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1C7107DEF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:35:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s10so13402550ljp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=60HbfXGFJSq6MviideHNDByyawzs0Eu0qQcu3vNmPOM=;
        b=sQYW7f7s0Nt6yzJNxqkaTDr0cUlTAFn64ggsUvHstWE5DXsu7xjYzZCK9lWGZ3FclG
         MEn6+cP1n2bRnBmVJLzeFikRQ7Uv2X25Ou/iK9i7AVjQS7Hqsf6B3O87ZLPz+TGT28Kp
         KZ5C3zSlIRDEK45POewaLTHSthvIkfwq5rZGvz4BHz5HFFOgYzWiXHHmSg6qisYBRcYY
         ijJqQd+eEAJuClnBm5Of2sWyDe86/ZUogQssXoiorPVLuQksLqCMmLBNm+0qypzw5hp3
         nYZUSrTaZ2aNYaI/w8iYQOYD998gVSdCHtDoslWhYzJqP5Dg46ssCRLIGU1Gf1UT+FK0
         gr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=60HbfXGFJSq6MviideHNDByyawzs0Eu0qQcu3vNmPOM=;
        b=dH992YgAV0QOFBsZsUfJOsGO9+o+qaal/JoJYVQon41oL18cLpXBKj0ScMRb7MCbFf
         TdiruaA97dloRnejYV7DoJJ3ys/gm8Oen/q9xpzvtsdw7LSfgB5EXiWYlmBgPBFRdGU4
         sv16EmjvnWVBziDACGlbDkk3U23ITuQXiDe9cyS3sAadg/dUo8zRcjcXF9oa3FQPeRdZ
         B2rWfkN35VKI2FARb1IWxlt7zEVCOJFudYg9QrgIivz03xm6cwBr0DeDy7I15xzkQLqw
         VrnmZCo8Fc99JbQ2pfD0X/Wnywsn3peYQZX8LNeUzL6PeUblFEzJrk2JnpyXKu9ypcMG
         /L2Q==
X-Gm-Message-State: ACrzQf0hE6rdDcRjbwgeJWZ4m5EGusYJee84PlLa3LAIbUeN3EPehECq
        kkF6cTTzpJutVwEbqONf3FawGg==
X-Google-Smtp-Source: AMsMyM5FluMwKmSZsWwo+tEo05mSpr25PpnsouB4+c7Q6Ei197zM0GxTLRB+vlQT+ny70yPRvle/WQ==
X-Received: by 2002:a2e:9b8a:0:b0:26c:3dde:6b2d with SMTP id z10-20020a2e9b8a000000b0026c3dde6b2dmr11410073lji.243.1664350547270;
        Wed, 28 Sep 2022 00:35:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bf34-20020a2eaa22000000b00261eb75fa5dsm370239ljb.41.2022.09.28.00.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:35:46 -0700 (PDT)
Message-ID: <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
Date:   Wed, 28 Sep 2022 09:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: qcom-spmi-pmic: Add pm6125
 compatible
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
 <20220926190148.283805-2-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926190148.283805-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 21:01, Marijn Suijten wrote:
> Document support for the pm6125, typically paired with the sm6125 SoC.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

