Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E655175AA95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 11:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjGTJZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 05:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjGTJZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 05:25:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A55A44B7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 02:08:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso812782e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689844130; x=1692436130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bn/gEmgkElav34nZl6GYTgEjfOrI0ANk937SmLwLQ4U=;
        b=HjqAtazrfe7K2uKtpNFWIz1velPk9YGobg7wYgYb7O2sEmN+Vi6eC+kkG+aFEu/NPu
         FPyADW5TxFYkFjEgAysshfdt5DxLyB3e40tpQCTPwPDaoMFhCRF+VbHrETARzZGB0hvM
         VMP7c/Lu8tcRIkmLQNx3SYcWoOcNHuXxfr3gUSWuCWckNlZKnkUYvq9Sricy2VEOfU7U
         s1W1dT2ecnFvp4liA3C+NXV6TvE+lzD9TYlV68ezmS/79wBlDblVjDnzmhJchs3+ZO6C
         nR7WDgII8MKbkeuDmYzrWieVZGjf5Hvvv96+YdOQqBqELwtSwaDpew48rst9epD5Cql0
         dsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689844130; x=1692436130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bn/gEmgkElav34nZl6GYTgEjfOrI0ANk937SmLwLQ4U=;
        b=N2WLfyUJD8+TR8oraoczqGigUJyJwCnJd2ahfYJdTrDITCw/1LhdiQyMOIC7toTBdX
         N2TococEb09/zrdSsffSfF1x1F43Al8tKqK1e/FO+asGshZpSjmEMjpYCTEF4FZMsLAB
         CwDhMGs8ikltgF9TGHN6bo4SWQZLNLazj7NVUmp9HFHJWnDrfsK3gToNM2iR0MxrNOvK
         qH+++4h3clhL1IieRHy9q02g8RJ0YtCq2i7wf8Plq50AZ6oXcpcQKKzeibJh+/adupKQ
         thZSSqKdjwrUQS1nyNBmArwFTfYFJujFYqnVViKSQ9JwOi9gJOI2BVux2J9G+rdpRLAN
         JUPw==
X-Gm-Message-State: ABy/qLb4vSBRIMS4ILRf3vF8DsFGuWN7ReDzdTZtyznEZ5LhMtBdtHUw
        YWWqf0TK237icTbTV654Ay4eMMgjFVs07mNgv8Q=
X-Google-Smtp-Source: APBJJlGQGyDb61qsT9vogQ5Ypq5JFWG3JHR5xF35fNkPaFBokYgbAJBkI65o6eXG4YCr9Sb84ptrgA==
X-Received: by 2002:aa7:d80f:0:b0:51e:cb4:2b40 with SMTP id v15-20020aa7d80f000000b0051e0cb42b40mr1504913edq.6.1689843623277;
        Thu, 20 Jul 2023 02:00:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c2-20020aa7d602000000b0051de52f8adesm453867edr.32.2023.07.20.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 02:00:22 -0700 (PDT)
Message-ID: <ebdcd477-5f15-cc05-ec67-42369b23f5f1@linaro.org>
Date:   Thu, 20 Jul 2023 11:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document MP03.6-C2 board
 based on IPQ5018 family
Content-Language: en-US
To:     Hariharan K <quic_harihk@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com
References: <20230720075731.20816-1-quic_harihk@quicinc.com>
 <20230720075731.20816-2-quic_harihk@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720075731.20816-2-quic_harihk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2023 09:57, Hariharan K wrote:
> Document the MP03.6-C2 (Reference Design Platform 434) board
> based on IPQ5018 family of SoCs.
> 
> Signed-off-by: Hariharan K <quic_harihk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 922feb912594..2a18bb881624 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -98,6 +98,7 @@ description: |
>          ap-mi01.6
>          ap-mi01.9
>          ap-mp03.5-c2
> +        ap-mp03.6-c2
>          cdp
>          cp01-c1
>          dragonboard
> @@ -344,6 +345,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,ipq5018-ap-mp03.5-c2
> +              - qcom,ipq5018-ap-mp03.6-c2

Really, how do you see it being applied? You sent multiple conflicting
patches. Now, clone the kernel tree and use b4 to apply one patchset.
Then apply next one. Then next and next.

Did it succeed?

Best regards,
Krzysztof

