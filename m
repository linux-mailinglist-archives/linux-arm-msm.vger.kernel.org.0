Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DD160B357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiJXRFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbiJXRDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:03:08 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B55264AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:39:39 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id o5so6742480vsc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXoecYdGJC2+HYOwpiaqnVwgAvwqsGUF9D69/wSkRhI=;
        b=NyZbVP20rPDepGnbV4uu3v6EY8m6TGiQ6owV05m+b7aGpSMSKydOIRIenlYnKDcMtN
         92nqgn3EfAG3rvUW2nKJDgjqap4Ph6+UVA3Rb4ouirWkfeWybax0GYTN7teugD4g2RsE
         OZyIglRWI1Lo57i02HkqyJLjAz0aMvSLZMwx+KjcVQEHuyYWXbeB7NzoIExp9JBKZk5Y
         YrRbm/syzdFgCJKAK1+Dv+eRhnhCBn0T/imisPeV+IvvKzgjzzBeW8gZ0wzWHTXvzfkE
         v7ePwrOkM2wiELe0ZJVn0vRRtCSkLyIU20+qfUStwClTv5o9vuuw1LMPSEe9Fq+nj+Es
         a58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXoecYdGJC2+HYOwpiaqnVwgAvwqsGUF9D69/wSkRhI=;
        b=NiGEHaACVq9oEgmHpfCGyGfBwocjb3bEZNt7OGK8hZkCyff2qynJJZ9kW1T5oKOolo
         Bc0xH3ZFKXJz22aCFIB8E17W/whF86aw16+yNWFS9FltAQB7bEcz1IDnJ6X1825LPKA2
         +Yn7byrSladF2sKAzt8FsJGQi5lHTZ9eCyOENxV+ti8ebAMzx1XJWLTCqXR/tqicrvAE
         O869yaH/Xr6Ans/mhzc7yHGBnjyKvLDudXQjUNRbuqR5WVIN4Gz8t64VOnA7k4l5d0wS
         DdCFYiIAFoqdlcCKX8sipKAXfJcqIbuJHXL2FjuEEUJV2lH/iBpowgUmlI4orYAscz+m
         RUKQ==
X-Gm-Message-State: ACrzQf2ZwvxqAoUPAkGSMfa5+sIi7xjQ+0ahSp4Q+f8SLlgot3ycuxp3
        Drsp/S6IX+HMbG4Imk7PlXsdwHGGmH06xg==
X-Google-Smtp-Source: AMsMyM4y39uLjjaZ3gT918SpmBGdDRV0vI6kOQrzttG9MnzBiUJO3QTYH6cfUlxXpAT4n9ebBvALdg==
X-Received: by 2002:a05:6214:769:b0:4bb:77d5:bb53 with SMTP id f9-20020a056214076900b004bb77d5bb53mr2697128qvz.118.1666618464634;
        Mon, 24 Oct 2022 06:34:24 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bl9-20020a05620a1a8900b006cf38fd659asm14557889qkb.103.2022.10.24.06.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:34:24 -0700 (PDT)
Message-ID: <94e05a63-e7f3-a78f-d0a6-8efcae619726@linaro.org>
Date:   Mon, 24 Oct 2022 09:34:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add TCSR node
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221024125843.25261-1-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024125843.25261-1-johan+linaro@kernel.org>
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

On 24/10/2022 08:58, Johan Hovold wrote:
> Add the TCSR node which is needed for PCIe configuration.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 5 +++++

Please send the patches together with the binding. There is no need to
have this split and it causes additional effort during review - lookup
of the binding.

Also additional effort during binding review - lack of usage of bindings.



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

