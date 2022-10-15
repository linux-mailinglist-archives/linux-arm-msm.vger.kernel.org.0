Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31F75FFA2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 15:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJONJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 09:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJONJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 09:09:58 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49431CFE5
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:09:52 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id y10so4894817qvo.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1/cUmV6R/jHFslafG7oDUe3cJlRn0gYx9gwOcGAp+Y=;
        b=fj84iPYvS3dKrBv12CBz4D6819U6wie8wKBahSWA+ynUe6yK2jjofeCDJ/GnewkGtE
         y4sRbqj1kCUCpqlwOu68puxWFhR0WY5lhcfBJ33FwTMeBQCD39P/uJQl+m9T49VTjzR0
         Lu4jaVkcm9NHhEepAUNxd0RMO6MicIUkjF2gL4XY/mpYe8Yy5vpZZJFb9mOZuC3BUlgM
         Oj2v1HSfOZyZ5adYk6V4shFtc4K7/iE3UOo6w5Y2xvSZsgYaZ/gCDtqqEOxARVMj3D45
         qF/0EJqMQhAPc8QMaHxtnO8VVYmk0Dt0gkgaxjYVFu619ytgn507zs0sSR5mjqlKbUe5
         87LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1/cUmV6R/jHFslafG7oDUe3cJlRn0gYx9gwOcGAp+Y=;
        b=29rxbg9zDVrgO5eJO1YycJgBOXQAnAbLKZ5ZtgBF5+Yz44y2De9mQDLn4by14vLXc0
         d19JKDkvBVFwC8FTvepOADxpxhTn7Zb2dRVWj8wRrtkAWEtwgfXsIHry6eGjVxdxsKF+
         9821RoqtS3uNpo5R5UA3uFQ5pxjudLzzJQ3lX4sFWahJvpNRTTCBtRJJnVbx64vA8W1G
         PL0BnzstNRwyxR7MU1E7PRUIlKP7n8vrrqwFIBM+vCgto2RJwzOXSK8KgrUefVBV4qRg
         OlOhdVGWvuIkzcRX+KTYQkbyjWQSQCSrrpqsQ67yPiEj6fTSsQZUXDT50GIzIRbWHq7B
         nHcA==
X-Gm-Message-State: ACrzQf0j0w/7Pmn28sMHN4HSjKiAAGIQTLHDSDW1dMwWW620DgaNC8lF
        EqZvsAZyTwabN4rVU/gmTIvpkw==
X-Google-Smtp-Source: AMsMyM7V+DRZfXsN62gpOeoEpyHzJ57IvuVBRG337kIHMMObXw2LDT1j7njm1fzu7TKAaNaW2dExnw==
X-Received: by 2002:a0c:a711:0:b0:4b1:8816:4168 with SMTP id u17-20020a0ca711000000b004b188164168mr1872868qva.46.1665839391985;
        Sat, 15 Oct 2022 06:09:51 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id d3-20020a05620a240300b006cfc01b4461sm4841906qkn.118.2022.10.15.06.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:09:51 -0700 (PDT)
Message-ID: <871aeaa1-5c57-4958-cf93-b51da1d71cd1@linaro.org>
Date:   Sat, 15 Oct 2022 09:09:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] dt-bindings: firmware: document Qualcomm SM6375 SCM
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221015115535.150037-1-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221015115535.150037-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/10/2022 07:55, Konrad Dybcio wrote:
> Document the compatible for Qualcomm SM6375 SCM.
> 
> SCM consumes a single clock (core / RPM_SMD_CE1_CLK), though it does
> not matter whether Linux enables it, as one of the billion levels of
> firmware ensures it's on anyway. Still, mark it as used for the sake
> of correctness.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Add the compatible to allOf to indicate core clock is used
> - Rewrite the commit description to match changes
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

