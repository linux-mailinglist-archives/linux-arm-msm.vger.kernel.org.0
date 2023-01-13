Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D64669E49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbjAMQiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjAMQh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:37:28 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225A242638
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:33:49 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hw16so41700914ejc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqeKGktzoNIGOwrepER0jyD6PE6cOMtmNstGP908eaA=;
        b=NwQL5kckEfdBHZ4qB73yVGEtOFmZn8vqkFeEd7OebM+Wx5uXQmrBZ33vmdqZWego13
         go+DgZ/Ez6JszDMCpBjgFJ5Ho1GaSmJN0EewWiLhM/KCSnsdAdOjiJWvyc+DfE495Jxa
         KKoW+t0HNSUkesZsmyviNpMCVFbirCU9D0gSYhiSpWPhLM+CP5Gs5d9XzXwefn4+QiBh
         O69pElJneKAKThWwvN9wU0RNpwojVOjaYSJSFvb/3UeHkZ0c8ZNmz2PXb9/86iJqi26J
         /jwv4SMirYWdRwkiyR3UffnLbo1HYd2OrW6hxsMc4YT5Psa/s0mKZovRPyLbyQFSWf+J
         iMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqeKGktzoNIGOwrepER0jyD6PE6cOMtmNstGP908eaA=;
        b=C3A4s+Yb54UTiZMKY9QP2OMaOMZnla33FmIXUK4oSIQe0z+4/ezOQVaCo/3T1zy4C3
         zdKxKJUa9YDgFFONw8PfJqO/YSTE78V7oEERaR4wxuxeMGTJwzy+Lmv4sGm2ghYwTt93
         NOHepPEW0qMo6PGSyKDOWhQkReWho31+S8/rdb8UAO9dCKMVcxaEMPbQRsQEArN8LxQP
         yKMcobTCqBLRWSnnAcLhCL0Xjmp3FoTj8MSaVanEidC3qD2Z3d0QCcaxZnPQJEatnPDJ
         OO6SzDC/VK/7aAWDldrDHKfQHwlVtT5/VuFk4SNIsOjlQWoCG+m1gATkC15dvik8XLmM
         40sw==
X-Gm-Message-State: AFqh2krvmx7hUB/i46z71o33mnzcAoXgvVzDxB9on8DFM8g6QDlz2mKR
        nMU7aoRu3AEx+nSMzrvCFG1Vxw==
X-Google-Smtp-Source: AMrXdXst7zQmWy3j4LjOtQie1yz7s7RZdUVCsWUjwiH+M3a9RE87PvJHOtGDHHh5td5PcFRPnyJ0ag==
X-Received: by 2002:a17:907:d302:b0:84d:34b0:e955 with SMTP id vg2-20020a170907d30200b0084d34b0e955mr20568322ejc.69.1673627627755;
        Fri, 13 Jan 2023 08:33:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g21-20020a170906869500b0084d36fd208esm7686260ejx.18.2023.01.13.08.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:33:47 -0800 (PST)
Message-ID: <e1782f36-5a28-1fe4-47d5-b3bc00317b57@linaro.org>
Date:   Fri, 13 Jan 2023 17:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] Revert "dt-bindings: power: rpmpd: Add SM4250
 support"
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20230113152232.2624545-1-konrad.dybcio@linaro.org>
 <20230113152232.2624545-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113152232.2624545-2-konrad.dybcio@linaro.org>
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

On 13/01/2023 16:22, Konrad Dybcio wrote:
> SM4250 and SM6115 use a shared device tree and the RPMPDs are
> identical. There's no need for a separate entry, so remove it.
> 
> This reverts commit 45ac44ed10e58cf9b510e6552317ed7d2602346f.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 -
>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ----------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 633d49884019..5bb9f59d196f 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -39,7 +39,6 @@ properties:
>        - qcom,sdm845-rpmhpd
>        - qcom,sdx55-rpmhpd
>        - qcom,sdx65-rpmhpd
> -      - qcom,sm4250-rpmpd

Yet, dedicated compatibles are usually recommended. Maybe this should be
used with fallback:
"qcom,sm4250-rpmpd", "qcom,sm6115-rpmpd"
?

Best regards,
Krzysztof

