Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6CB5EE347
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbiI1Rhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234533AbiI1Rht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:37:49 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A91F3733
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:37:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 10so21457719lfy.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0aztqcNn6LykQdwp4m1RypEaxXnCq8fh7JDHFifhgfc=;
        b=J0xXcMdkx8qNPncfLfjbp0HUbAzXfrf+XjDuMJFwgKXV61vJxqMAgFpoh0uhvAmDc+
         6EzGFRnBnBnwxma7ril5YJq+rnPsIbdrBNQnTEVz3hMiFbBzSRY356eag73OQ7vg0EpL
         v6eeLXyDq8jQn+8aDXySuPN+1yValwFU3eCSQZydOysC7hG6j+LPLa8mYP1Lc7+Xv7kM
         4HHdsocXkJLeOfmBsE2PKh53Qo5AAU0N87+pCoLp1O3nnO269qK1gQqgNoFIB3NQDI3P
         jWXq2R4X1iN+7JJUJiitEFwgpJ5yB4Z3ngtcQzhTQmMjYRyrmk3JC84KJtmEgYXFB8EG
         hG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0aztqcNn6LykQdwp4m1RypEaxXnCq8fh7JDHFifhgfc=;
        b=ZyHY2o6+QdtVmygXGCEk8fkQZWvUzMoTxh6HhtV8svgLgaJFbibHnN3wRc8DMrSXOW
         zoVd8a+RYDA9g+2VG0DfhTG36S+ns5w9ZXFDKGBG1jozPcada+foFn+VUueh++3g+jjN
         Rzme+x1dHulONVzr6xC49UuwDwXf5khTLfQu07i6+TBxoOV5OGjLZxrB5MBWCFS8d5zL
         7UhO7z+2gil0p32oDGGxInrOa1Tq74AVMg9giVGXNeONwsi71DunixSP3Hg7oOU3DAfR
         VolkiJ8VIi19wcdYBMD65dS/VLkP2wlWg7bKM/Iozvdr9uQ6lckH0cJ97ZaNLYLkZw+z
         BUCQ==
X-Gm-Message-State: ACrzQf14paTaUsznQtGxlNPS+3FMyjBeJ6Xc0vwPYPfK35CcR9v6oeJO
        jYwucs0Sleo7xummQ7xXjkxnWQ==
X-Google-Smtp-Source: AMsMyM7YsQDUPkO6r21a9nJydaJNbpzuIJVa9lJwU5R/Q1qeWKdseUnCwVPoGfsdsFQkoibE9Rx+ng==
X-Received: by 2002:a05:6512:2354:b0:49f:585c:a796 with SMTP id p20-20020a056512235400b0049f585ca796mr13070770lfu.680.1664386666008;
        Wed, 28 Sep 2022 10:37:46 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j14-20020a05651231ce00b0047f7722b73csm528697lfe.142.2022.09.28.10.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:37:45 -0700 (PDT)
Message-ID: <fff9d3e8-a9cf-ddb4-f568-3a58622715af@linaro.org>
Date:   Wed, 28 Sep 2022 19:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: move qcom,gcc-msm8939 to
 qcom,gcc-msm8916.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
 <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 16:56, Dmitry Baryshkov wrote:
> The MSM8939 GCC bindings are fully comptible with MSM8916, the clock
> controller requires the same parent clocks, move MSM8939 GCC compatible
> to qcom,msm8916.yaml
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-msm8916.yaml   | 11 ++++++++---
>  .../devicetree/bindings/clock/qcom,gcc-other.yaml     |  3 ---
>  2 files changed, 8 insertions(+), 6 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

