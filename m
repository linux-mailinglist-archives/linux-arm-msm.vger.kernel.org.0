Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307C85B3CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiIIQYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiIIQYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:24:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C780931DCA
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:24:38 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 9so1553569ljr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rzXnDRBhQrdlagfEMgUHb5R5QV+2jyePX4TB3bmFQdI=;
        b=L+e3T7XtpJuAvdddya/Cvv7qB8f0UKIRH5aemmYf9zTR4NLtbJtBgGmvxstbXcqUXX
         iIgd5MoPBSoHbizybQJUruYMQ+a9Ku+s3sfKR7cs8IH2VF1T4r+Y/6zAJvlTdyF2F5lr
         cRn7/DKzvHfYclpNn1/3fFjQGMsmvGHcCNv11rNA6Dy9XV49FXxJ51B7Xs0hnj+LV7FB
         gnNLGXLtXwUV/LVAKmzo3KmXjrsI/wXjl2FBFMbgwKZEjP3wv+Gx3kZtBpEKhfSWgg56
         hSc6w0TGmEAkCyOBHIHiZuELsW1lFfkJeJtwn1smw9O4fRxqCGyISuWGmginPITLbXkn
         1zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rzXnDRBhQrdlagfEMgUHb5R5QV+2jyePX4TB3bmFQdI=;
        b=N1NFCTJAGtza57y9gRc+Rj5gUabWPkHTGtgqMwgxLshUDJjhfVoK3jpJEwkrAM5htI
         8DxGDyMsemp5vh6A2oP7LQuouD8DfFiykMUaYC+213Z0xxC18Niv4cukJZNSHMmoxyTS
         GYH7exZ9uihcc/W3GHb8lfWqVdb2fCKhC0muvK251VCSekmqM8cjQ6F9GZKeJbSRHooq
         NLQWoycN+l11vqjg/J9O8NbtvZzlxCBedl9//P7ogJRRFw78YEF4kQJfjG2805s/49z+
         TD84SG/We3i2HCg0ngZ505efiC6m/828z3DY7FjX7OVot4+Wn1FSqHWZuBad6BXkQwki
         xbcQ==
X-Gm-Message-State: ACgBeo1byqbRTdsNoVvX8gJy0WAf/VrI3w9XkTHMzPXA3Qvg94oDIbPd
        JdwGl12CEUcBC4Itj8yCQXZ9OCYLzDDVJg==
X-Google-Smtp-Source: AA6agR6xWKMTkNfDpXKsnH7AM4roxqoxiMxN3LL9SZngzpAaeGgvsaqDvj43cXQhyDTUAYAg68+Scw==
X-Received: by 2002:a2e:9604:0:b0:25e:4ed7:ef45 with SMTP id v4-20020a2e9604000000b0025e4ed7ef45mr4061749ljh.389.1662740677196;
        Fri, 09 Sep 2022 09:24:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s26-20020a05651c201a00b00267232d0652sm138012ljo.46.2022.09.09.09.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:24:36 -0700 (PDT)
Message-ID: <4ba4e3ed-385e-19d7-ae6e-6a7e6eca73c1@linaro.org>
Date:   Fri, 9 Sep 2022 18:24:35 +0200
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
> Since qcom,fastrpc.yaml only exists in Rob's tree right now and
> a similar change for qcom,glink-edge.yaml was applied there it is
> probably easiest if this patch goes through Rob's tree as well.

I forgot you sent it, so I need to rebase my series:

https://lore.kernel.org/linux-devicetree/20220909125403.803158-1-krzysztof.kozlowski@linaro.org/T/#t


Best regards,
Krzysztof
