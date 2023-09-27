Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8857B02FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 13:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbjI0LbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 07:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjI0LbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 07:31:20 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EC7FC
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:31:18 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405361bb93bso106295715e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695814277; x=1696419077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Cttx4wy+RtyD3bhI4AcUfgzla5e7qptgXHb9CsKrSI=;
        b=MFWUw+wuChHsXuCa+64K15akSIt2elqeTWZaRlJatr/G6nUhv1qv1Legtz6U4022DU
         Iv1eh0MEsAJX185/5QSfom6T/BnXyeXZq7xB0s6CX61tMiQ6UUkq+7ndv4MfyIPDcqiI
         pVc5zGIhEiT4XlDF1vyZfnsMGiRaUF5IzpF0764mG8u3I0pK8VvPolaWtNtHh6YZ7nmP
         QuqrNOCOYYPr5c+6JUpc91z7iR8zf6gbhDyBXOG5nZfVRNOthN+FdzJ8F4I8hB6HtTl/
         TgQMvao/u7Hgx4uK9WHTNZVrnVpjF+Abk/Q8zCnaJzGGYuMrfGJ/CCUnX2EmPFiO8Mfh
         ylHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695814277; x=1696419077;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Cttx4wy+RtyD3bhI4AcUfgzla5e7qptgXHb9CsKrSI=;
        b=Dj46+g6CMkDZFFBmy3ICMXRGvHSOugATN2ZQyNIC21rA5bLKm8eDI4etAa3U9rOk/0
         raLIq65Vl83dXXS+yTRFc8UNfjBywKqsn3m3HG0NTvDYQIhstEwkb3zjM9guPsLIinYx
         RsoOGVZbq+EgpfhDmtoj+9fxIe7kg3m5+dDHNcYbqGQwSCVGblro1yLvdJmSC2Gr5mgB
         pcczfJc7oOkMDdxft7w6ocBAGnNyvquctR3j854Pj/HyEGSN2GUTtREBDznIKT0iHy95
         S0YoBIqroAeUfaJfRVPFPw9WJtxVqKu9Mw+99wTnKxPNVcTMa64cYu+dhVN5fnBeXSq5
         LbGw==
X-Gm-Message-State: AOJu0Yz77aAOvwvW2QHn2ijek9CkLYKZWkZjk7tSGeqS0Ol9hcw3Vziy
        gQkHmmDjyQY0ikU+ixXlik+Utg==
X-Google-Smtp-Source: AGHT+IGiMJxv5MldFpzURf1bE7TOb01VZpsp4SX7KUlILbcUlw8Nw4K+r2oYFiflHcNQPk6PUmh0cw==
X-Received: by 2002:a7b:cd89:0:b0:405:3e92:76db with SMTP id y9-20020a7bcd89000000b004053e9276dbmr1656437wmj.5.1695814277037;
        Wed, 27 Sep 2023 04:31:17 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l7-20020a1c7907000000b003fef60005b5sm9876510wme.9.2023.09.27.04.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 04:31:16 -0700 (PDT)
Message-ID: <3b7a6266-e2fc-4b56-8b41-a26042248c64@linaro.org>
Date:   Wed, 27 Sep 2023 12:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the IPQ board types
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230927093130.4098385-1-quic_sridsn@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230927093130.4098385-1-quic_sridsn@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2023 10:31, Sridharan S N wrote:
> IPQ bootloaders do not need these information to select the
> the DTB blob. So dropping the board names from board section.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom.yaml | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 7f80f48a0954..5b56f3d90d4d 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -91,24 +91,10 @@ description: |
>     The 'board' element must be one of the following strings:
>   
>           adp
> -        ap-al02-c2
> -        ap-al02-c6
> -        ap-al02-c7
> -        ap-al02-c8
> -        ap-al02-c9
> -        ap-mi01.2
> -        ap-mi01.3
> -        ap-mi01.6
> -        ap-mi01.9
>           cdp
> -        cp01-c1
>           dragonboard
> -        hk01
> -        hk10-c1
> -        hk10-c2
>           idp
>           liquid
> -        rdp432-c2
>           mtp
>           qrd
>           rb2

All bootloaders ? You are 100% sure that all versions of downstream 
u-boot don't rely on these strings ? Upstream u-boot too ?

---
bod
