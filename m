Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76DB65B1932
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 11:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiIHJs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 05:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiIHJsz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 05:48:55 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6804912952B
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 02:48:53 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f11so12801678lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=r7HxyAiuIo3swPN9fhXwT9h8PjnLxQoP4Y9NKAjnfBw=;
        b=Hiee+iUQQZ1lwx+362bMLmcIHCFgOOiyzBVaL9U1NB8lVTOcbKTbBYRooTVwCzOxWZ
         ajViLQxYJh9SFRnDism0VNUFhMDKEOy76ifgnIpG4+4Hz5M/Voi1xwxjL/YbA/MNOMS6
         5CKY0tfZG55ZN3G5ngEN01QLUEGKjXVePYacbBhJE5HFYDltny3ly1eFcu1oRKQuySx5
         fspsKU0qEoKPhhIGbfEReZwYHFhI8FOkH3/Zr5dXtEASuoeIM6RzrCU7fczbsmkGtajP
         zAXORKHj+0boJPhbaW+wF7ilnESuz0mjv2sIdBlsxv1sjMlQKfGflcYX/m0nkQOTGmOG
         TP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=r7HxyAiuIo3swPN9fhXwT9h8PjnLxQoP4Y9NKAjnfBw=;
        b=cGa2YRDmCAXVZt8jNp67N3lmg8dKjXthkqQ2iVUWWmzCV3+U/yaIibmKDCVQTo7uNA
         y3QywOI1JjfgggLNL33gI7d70MwDwYpMYv6zpRnIX3IhReyoYPLZYSEdHAwrKU/vmERk
         tjs5UcVxXtEzq9V8qugxpI/2y4rG2906SWRR2ScgUcefwYRPAk7u5l1cB9pa1GpKFMZY
         VadmPUIaZM/vsGPJPAmL3zZ4YcmO7wEW8h94J7R+sfLZ1DA1B0L5nMQxNyHjMsMRwHHa
         OZtlphkC4w4wG0sYuBjaDd9+WsrNigrplUCnWVl6MOUtjhBUw63EA/lbTZGHvAm5APO9
         j7lg==
X-Gm-Message-State: ACgBeo2aoGxM3Kg94Fcof30Q97UggvdQLibNoJ3A78TOrE4jjUxF5DAU
        bn59VwjXX9/eCFP4S9k7M4hcOg==
X-Google-Smtp-Source: AA6agR5w40X1JsBIjHh4n8PbgAUBbivVRyL9yb+ORTJqNZsseOcjJXYOkUJT2BMQ+QAGVnZnQtMMBg==
X-Received: by 2002:a05:6512:6d5:b0:491:a52b:2a47 with SMTP id u21-20020a05651206d500b00491a52b2a47mr2413221lff.608.1662630531802;
        Thu, 08 Sep 2022 02:48:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b00494903a1f5dsm2966668lfr.187.2022.09.08.02.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 02:48:51 -0700 (PDT)
Message-ID: <1c6abc2e-9ec8-1786-9e05-eb2dd7dd2cb9@linaro.org>
Date:   Thu, 8 Sep 2022 11:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8974
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
 <20220831134626.2803117-4-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831134626.2803117-4-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/08/2022 15:46, Stephan Gerhold wrote:
> The "qcom,msm8974-mss-pil" binding is still similar enough to MSM8916
> to be covered by the same DT schema. The only difference is the
> additional "mss-supply", which can be easily handled using a single
> if statement.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Changes in v3: None
> Changes in v2:
>   - Add if to the "allOf" list (suggested by Krzysztof)
> ---
>  .../remoteproc/qcom,msm8916-mss-pil.yaml         | 16 ++++++++++++++++
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt | 16 ----------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> index e4ac4889fc92..c7e594873648 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,msm8916-mss-pil
> +          - qcom,msm8974-mss-pil
>  
>        - const: qcom,q6v5-pil
>          description: Deprecated, prefer using qcom,msm8916-mss-pil
> @@ -76,6 +77,9 @@ properties:
>    pll-supply:
>      description: PLL proxy supply (control handed over after startup)
>  
> +  mss-supply:
> +    description: MSS power domain supply (only valid for qcom,msm8974-mss-pil)
> +
>    resets:
>      items:
>        - description: MSS restart control
> @@ -181,6 +185,18 @@ required:
>    - smd-edge
>  
>  allOf:
> +  # mss-supply is only valid (and required) for MSM8974

Skip the comment, it's obvious from the schema below.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
