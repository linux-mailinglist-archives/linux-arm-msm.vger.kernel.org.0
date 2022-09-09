Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE7A5B2FA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 09:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbiIIHTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 03:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiIIHTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 03:19:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7440F1F1F
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 00:18:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f9so481245lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 00:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MpCO7BR+w6iE4SzjoN7nooygSqdz+4X5UW/iYZDVQn0=;
        b=SfKcKnUjdWdPIaNa1tCSJfrIT0+RyQlmTWDphvQX9fVRwEGWWUjh2wYNsFIc/ZY1Vt
         NTdx0lRNDGJp7QqFm1ubFdtHgIUlAT8F+7SPS7urC4EQK17SYbACI9kkVyCzEi3lOW+x
         1MHO8vdLnFn6hctJVaJCyxb5lSrb6n9zdTk0WZpsjjcDuYMqqiEG01YVnrBsjcg5rEtc
         VTJUAVsVdQVRjVIf7a68b60q+NNWcWMFMR9an4TQlagzMLkU7Bkf+WXn+5aStOWeZ27u
         76e45N633vmaPkaW4PuStIpnC5y/xBS/LqabwRGszVmOkjp+vrhdAYuGVQn/lNPkJ5KE
         E95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MpCO7BR+w6iE4SzjoN7nooygSqdz+4X5UW/iYZDVQn0=;
        b=dZTYcSwuqVmqsnAy5Y1jsT04pjdwBd6aWIr2W4Hf6BlUaVb3DTGQmewWLzvrRIwtAo
         4VgUpy/vmQDip0RIuQ02Ds2DGrgYB5owhjD7DHtitbT43BgAWdH8fms47rYs5AlW02ve
         DpnCa4Atl6kX68djPEAb4uj1ZtpfPfs5rRKPvdFq5L39LRIAWzG8L7/heFkSpm1FEuCl
         3ZXasiJ9GfSHLQl/MFOaEHPy0aNtpocPepsI1tKFEOr/+qE0SbpJQXEpDaQcwfHnB3Wb
         KKyJu0trR2BjVWXGHbd81Rq3L5M0WEEwDa0gq++p9oLY8tayR3XEqtZ5VVkV1r1YkULH
         pYpQ==
X-Gm-Message-State: ACgBeo0U3tMdscJiKJuespgji8FlIMc3bMu3dgmDRJffSfx9zhRsZLap
        FvtcULMz8DZHxq6qaPOnuUGniw==
X-Google-Smtp-Source: AA6agR4TAElNS30Ue5OHuULRKoI8NRB/1ncveqn+M+HWXuHUhQFFi7AYEDJKKGgipcKmzFhKxJ6cRw==
X-Received: by 2002:a05:6512:3992:b0:493:e8c5:638c with SMTP id j18-20020a056512399200b00493e8c5638cmr3856800lfu.492.1662707934683;
        Fri, 09 Sep 2022 00:18:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o26-20020ac25e3a000000b0048cc076a03dsm149768lfg.237.2022.09.09.00.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:18:54 -0700 (PDT)
Message-ID: <578eec5b-e1bc-6e5a-9f98-222288dce2e6@linaro.org>
Date:   Fri, 9 Sep 2022 09:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 20:14, Stephan Gerhold wrote:
> Similar to qcom,glink-edge.yaml the smd-edge can also contain
> apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
> 
> These nodes are already used in existing device trees, adding them
> fixes the following dtbs_check warnings after converting
> qcom,msm8916-mss-pil to DT schema:
> 
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
> Unevaluated properties are not allowed ('fastrpc' was unexpected)
>   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
