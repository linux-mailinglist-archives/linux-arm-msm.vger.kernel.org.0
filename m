Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA617792E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 17:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbjHKPWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 11:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235529AbjHKPWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 11:22:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA542D7F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 08:22:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so3390949e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691767331; x=1692372131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xvhws/g1BZTUGbCqpOulNEVGp43xvK18EOpJG1rCW+s=;
        b=zrszuNYIR2F3efMAp16y0Rt8EbK0h72reRCs+JAH12C1ZFh42ITIA6JhK6U8Shsdzj
         wllOgSx8pj6/bwkzVLtKeLCrXG0C2nDvN2uCxKuX8kTrtuhZtKukRBqZMXUk1xYRAWu4
         QfT9BEH3jtsEIRUuRZuIVi94c78DuXnOF9dvedHytcdPoOQIm1VEx9SRUr6QJvDCpAD+
         gDJIHGJkK2n2iFF65i9pjtUvTPAoe3bLKils+kI5YyfsPYdapDPg0sKPspn5L9Ed6dF7
         clRWDC1LHhVGnscSPZQbm3ROV2KOuIiiRn0MH8DjLie5Drz4C9olS48wgQ7cYI3vaE0h
         eQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767331; x=1692372131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvhws/g1BZTUGbCqpOulNEVGp43xvK18EOpJG1rCW+s=;
        b=ac8vASBUSQy2ZFzAgCxY81RJf611IH0NLRHtaZpDbIyR2LRPNrgnFqi6etlBUEhJSX
         Ys+ips36CM5MwUkqDI8DjFnBI7QjQ3bkcmoAGH7U/GSwp7MoJ1GoRify+9wdXrASfWq6
         DC/06CxCn2eT2uZ77XAU5TAPygkxGCPhpkGanzV8tXBQft1MiD/jdzAMbym5k4u4mqEl
         jaXGGcZgtNARTGlnFMLC0oeh1RMhukkH/fZ/NNyngwA9vmYJNaMpx5uomul0yqbN12bw
         wzq4GNtfXU2M6hlHFxVDoIZ55tX1XAVu2OgEM6q6QlWMlD5WDymQqPF036noENA446XS
         6TqA==
X-Gm-Message-State: AOJu0YyLfR3npWBwh+PTDcw3Qie33aDIxIgUuLwCwsRDJfllgdQXy1km
        UCYpqDLMkFxhSUtqK1gE8iYYqw==
X-Google-Smtp-Source: AGHT+IESFNIZsv/+DbgtyeIyKwfX9aPTj953k72rjW6Q1qwuedS0MpFtmr3tB9lDH+i0QsAQJgEPfw==
X-Received: by 2002:a05:6512:3139:b0:4fb:a0f1:f8b8 with SMTP id p25-20020a056512313900b004fba0f1f8b8mr1209044lfd.63.1691767331177;
        Fri, 11 Aug 2023 08:22:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id t20-20020ac24c14000000b004fe33e05eebsm764292lfq.203.2023.08.11.08.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 08:22:10 -0700 (PDT)
Message-ID: <da7e221b-7392-4fc0-a864-b8a9e490138c@linaro.org>
Date:   Fri, 11 Aug 2023 17:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: correct SDHCI XO clock
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Marko <robert.marko@sartura.hr>
Cc:     luka.perkov@sartura.hr
References: <20230810132904.367418-1-robert.marko@sartura.hr>
 <169176724024.691796.7369934702328451965.b4-ty@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <169176724024.691796.7369934702328451965.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.08.2023 17:20, Bjorn Andersson wrote:
> 
> On Thu, 10 Aug 2023 15:28:21 +0200, Robert Marko wrote:
>> Using GCC_DCD_XO_CLK as the XO clock for SDHCI controller is not correct,
>> it seems that I somehow made a mistake of passing it instead of the fixed
>> XO clock.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] ARM: dts: qcom: ipq4019: correct SDHCI XO clock
>       commit: 43a0ce827528bdc7f4d38d48d13987db24a4e7b1
Please pick the v2 instead

Konrad
