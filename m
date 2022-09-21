Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F9A5BFBCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 11:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiIUJ5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 05:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiIUJ47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 05:56:59 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FF612D25
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 02:56:56 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a14so6310315ljj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tI61eVwJdBieaBYvkvELSMLHZiZ48YF79Pb/bU0UBX0=;
        b=uqTjMH8AqyUf6JsW+eF2FBCPegCV7BEdlbTRHJa6AuTbkCDz+ZmJSSDgYe+VCiEqkL
         /J1dLvu34F230CtcJ6rqem76dUS5TUXzOq6rbdE7urpiG8Y0mtUT02R9Hfkb6BF7Zq8O
         SyOj75UU2H/z/11wN0FgO6zcDaTe6UvR3ESMCcXiiTW9VdyK7DQp7JMNqU6B6ig7BF86
         IWgrbo+Zs3OXWqjjV8RDoWC49JKmH0sX46bxqCNe9bsWDRpNyPhkk3Hha26imeooWogC
         IoG8HOk0lDbMPO02MvOmfOmNJa/AluEF2rd3ZyLSYtaN901BOJ3jj2CMZJwad0f/dAjY
         5cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tI61eVwJdBieaBYvkvELSMLHZiZ48YF79Pb/bU0UBX0=;
        b=m/dIms0k4TkxHEywUJq0HVh7WbH97RlYLqMn3kzh7tH3y+irXlyF448BkHaO0B5iuQ
         215QHKlg6FzIj8IvK26M2BVqvTVOd+w5hqi44F3nkPNA9zo/c2B8vjT+hwDfi2EGPkA3
         EA9nbt/pqjSoF2RBCdXCSTxaSBdjLM4IL9HHjfCw2vFQPcWIR4029qlanghQua+Sk6Vb
         x9Iu3rHnJ1Idi6chVSCKXSdOMybG8ZlnF7gT/ztD5NXvDS3SmwvjTHHl9iRLZgI0faM4
         uFNGWAfmi1Aeg7QmYkUyVUrQS4Zu8Z8zjQEdgMMDsXug1crTdXZUUHKDxuwOYFoQCds7
         Q0Pg==
X-Gm-Message-State: ACrzQf002wToNLl8ianCnuTU5NDV70l1DDUh03KaMXDEe36KjrSQ2dT5
        QI1pH1mWT3E0kmHuxxz7adNzNw==
X-Google-Smtp-Source: AMsMyM5ofMX3Eq7d/6O5I3J2DjK9hlvDOTnAWawIVpqssm0rwzE1DLrdD2Dckehn3PQ0nd4RwJN1iw==
X-Received: by 2002:a2e:84d6:0:b0:26b:dce5:2fe5 with SMTP id q22-20020a2e84d6000000b0026bdce52fe5mr8232573ljh.12.1663754214583;
        Wed, 21 Sep 2022 02:56:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b004947555dbc2sm364605lfo.100.2022.09.21.02.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:56:53 -0700 (PDT)
Message-ID: <85a6fc15-dc18-4044-a837-f2280a9cdf43@linaro.org>
Date:   Wed, 21 Sep 2022 11:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] Revert "arm64: dts: qcom: msm8996: add missing TCSR
 syscon compatible"
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220921095258.2332568-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921095258.2332568-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 11:52, Dmitry Baryshkov wrote:
> This reverts commit 8a99e0fc8bd3 ("arm64: dts: qcom: msm8996: add
> missing TCSR syscon compatible").
> 
> This commit marked the saw3 (syscon@9a10000) node as compatible with
> qcom,tcsr-msm8996. However the mentioned device is not not a TCSR
> (system registers, hardware mutex). It is a CPU power
> controller/regulator, which is currently being handled as a syscon.
> 
> Fixes: 8a99e0fc8bd3 ("arm64: dts: qcom: msm8996: add missing TCSR syscon compatible")
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

