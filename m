Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53ECB6CFD76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjC3Hze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjC3Hzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:55:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476691992
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:55:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s20so18703836ljp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680162929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGYTSHL46X7bsDTKLQ+Wx3uN2whDUAE5JW3rEceASdQ=;
        b=Jk0+FrfJqn1tgVh5ejKOGngvHbWs6g9OXXxkDSbw+zlibIQdUIVybm2J3a6+q6/Xx4
         UcLPwmRSX4qBAjXHO2k0Iiea2y0aWPzdxqzGK61fk4UPT9JD++eIXbtZutSMjQN7wLgI
         0hwTtQn14nxEX4DiJWogQjdn9JOUmYrvFb6SLFjXhoy9scbZrPV/GXb0HsWz24r+I4aZ
         KjwgdrhfuEhIeRsMGfNTige0EH4yc95uJ+fnuj+L/Ii7n5ALRzQLMzK7QHXz3D6gaE7v
         /cdqgBB7fXszDeLhEabN8OjQFUYXwnBzrYZFz515Y6ZtN+lU38iIW3IcwDGi0Is9gGj+
         T1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGYTSHL46X7bsDTKLQ+Wx3uN2whDUAE5JW3rEceASdQ=;
        b=WC6f9xVrSC3ozZwWQ3CwC0/BiWxp+nGD3kCkk4Ka71wPK/PdIZBWg6FSPGPHugbK3s
         MYMvAIqCM35TT2ifslCoLI0+fntdT1VcQxMkiTIQkVccnwmLN6k1JumoUTEW53Nm4js+
         LD7Feq9byeDq7zlVy+1h+kRPqgWSFeUbRosv5YXufqcBqFTt02K7zBudwnrQs066mRaQ
         yjoEXFVaHM6m6BdxxDvpSRLB711VI+8Ljhvs3vYpBC7gpnGYoXnKP+pDGiomwCfMV1Q4
         tVFnFEF6RaqU/tnkU3nSpsU6cPBGgGc1FOTERF6APVRFfKLUWH1QB8Pqy8QJVZf5sXbK
         /NUA==
X-Gm-Message-State: AAQBX9e7HTy3WezvmXfp0J6uxmpul5MqM2sA63UUnArrRfc0y0GCkVRP
        QdC4pVKHFc1fvGqYphEzgMt/6Q==
X-Google-Smtp-Source: AKy350YwpSqUYkl+UrlSSuUZ/GJqJNMvJOcPamCCu517TXTO1xYOctGZpA+aNAVDfmgreF5ee1eu/Q==
X-Received: by 2002:a2e:3813:0:b0:299:edc5:9c10 with SMTP id f19-20020a2e3813000000b00299edc59c10mr6930107lja.2.1680162929589;
        Thu, 30 Mar 2023 00:55:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c2-20020a2e9d82000000b002a6007383a0sm1043907ljj.135.2023.03.30.00.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:55:29 -0700 (PDT)
Message-ID: <a65f4aa9-b26b-adac-7e5d-e7a1b6bf4e57@linaro.org>
Date:   Thu, 30 Mar 2023 09:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 10/11] dt-bindings: arm: Add support for DSB MSR
 register
Content-Language: en-US
To:     Tao Zhang <quic_taozha@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jinlong Mao <quic_jinlmao@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
References: <1679551448-19160-1-git-send-email-quic_taozha@quicinc.com>
 <1679551448-19160-11-git-send-email-quic_taozha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1679551448-19160-11-git-send-email-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 07:04, Tao Zhang wrote:
> Add property "qcom,dsb_msr_num" to support DSB(Discrete Single
> Bit) MSR(mux select register) for TPDM. It specifies the number
> of MSR registers supported by the DSB TDPM.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> index d9b6b613..691c7ba 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> @@ -53,6 +53,15 @@ properties:
>      minimum: 32
>      maximum: 64
>  
> +  qcom,dsb_msr_num:

Underscores are not allowed.


Best regards,
Krzysztof

