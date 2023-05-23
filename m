Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D2170D56E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 09:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbjEWHms (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 03:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235363AbjEWHmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 03:42:47 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7616186
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:42:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510f525e06cso986693a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684827762; x=1687419762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3RG61/5+/WSVFHjkPw5mlqbSw7Nb1Tx6G3f5gWMvqU=;
        b=Ed/kvf7n8y8StHxYUypqKr4D6wmWMs8a8y1ekdK8RzcqDkcYXNKJDbeGhRKU3vdeDZ
         fVcjw282LfSKCi1TkOWDjX4675FUWtesrVdQYiYvR5Ft2LkyVawB/o6qg6up8ygknk5m
         ZOchqaF03OyQ8BO0JY4OSWutjEfpeke+rd9groAF9CxjeuUk4hiAp1q4P6Pn2eyrZV7R
         2CzRGURmhfqkhRCmn493IZ3xxDc8zUBgJ0+hC/FBvHvuLxnuH0XRTcr7oReIaMjpL52d
         8MoxHWYslbQp7BhVICasxb8WtkCehtuf41KwEwpsTQgPrd29fjhQ/YzGksdnrm/K5BfI
         VTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684827762; x=1687419762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3RG61/5+/WSVFHjkPw5mlqbSw7Nb1Tx6G3f5gWMvqU=;
        b=fgrwCTPLLq2VZVB7oU/VjYuyPXYJJG00wip1nVt07CTj+eMhYnoIcQ9r2XKT/6fMrT
         FAEOk1eW0bvEUmitbml1f0PiPP8qvxqjFvxvk3khdyQUD2tbywuLqnRcM+rohcMcPIm8
         KgrfiwRYrYDto6O5P3w/JLGUeocn6H76ZBSWYVEHB3hkmpcn7KwrP0PyiBWsodh7wijy
         e75TlX0o2p8otrSz4QxsrxrBrHqY24BsurAQuavKknM1gVpoCHRA76n8hlpcIqOvQYJv
         e7Bs3BuBKY9rudV7mjArUbrQwSG+qc/VeDw7oMgIgFqZNglHpXwEIryFz3P8lnWHPfmP
         RgPA==
X-Gm-Message-State: AC+VfDzk+Z9aTl51Y8K0Hh1Dsq0tK/2PgO7l9HRHCh2IMPy9eIibHbgw
        9uqYolH2OuuU75Q98ecMntG8fZVgjC/o23aZLIs=
X-Google-Smtp-Source: ACHHUZ6HRyf/NCQ88ZSlgqg8T9QJtsOCFVuwQZlk584ddQWpQWfvPDdxbTa3oq+weEAWe7eT4qiSBg==
X-Received: by 2002:a2e:4941:0:b0:2ab:bd1:93da with SMTP id b1-20020a2e4941000000b002ab0bd193damr4648474ljd.10.1684827059258;
        Tue, 23 May 2023 00:30:59 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id s16-20020a2e81d0000000b002aecfa8c58bsm1494161ljg.40.2023.05.23.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 00:30:58 -0700 (PDT)
Message-ID: <552d20f5-ed3c-2f69-2715-ab64914e131d@linaro.org>
Date:   Tue, 23 May 2023 09:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: clock: qcom: Accept power-domains for GPUCC
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230523010348.63043-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523010348.63043-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.05.2023 03:03, Bjorn Andersson wrote:
> In many designs the power-domains provided by the GPU clock controller
> are powered by some GFX rail, add power-domains as a valid property to
> allow this to be specified.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
You may also wanna add some runtime pm enable calls in the driver

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> index 1e3dc9deded9..a00216b3b15a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -50,6 +50,9 @@ properties:
>        - const: gcc_gpu_gpll0_clk_src
>        - const: gcc_gpu_gpll0_div_clk_src
>  
> +  power-domains:
> +    maxItems: 1
> +
>    '#clock-cells':
>      const: 1
>  
