Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C0A5501B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 03:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbiFRBhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 21:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237829AbiFRBhX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 21:37:23 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C63237BEB
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 18:37:20 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id l4so5379951pgh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 18:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KFyKR2rM3JkXVn4xHoMGX6AZ4IrhGWuwaN/v/GhR6IQ=;
        b=VPPs0yoKV4c19tV9MJ58HPZs+pb0u31h4QM2GDymWqU8yoe4Ou2+39nPtyPYK7Bed5
         Vv8Ccs1y1ZbRrwT7VowggO4yWd/CRRlHGhIZIksCH0sK6THmHIoeNqkvIX7xj3DT2I0L
         tOQu/1IkpObsxzhifgskMDWCWi8Tl0D/qwzwxDoWUbIg0FuQQtz7TGtmEWuCupDyjRvR
         lYLXz+v5OG6zELiwTFgnOEnwNMsm24w/9wVAiBU89zCDxY3M1Bvv7tLt0BYW0SLKoAKW
         Qo6kcFZ3BM4RQk+BefKzZ0d/ADeLX/2G3ZbMkiLFYMMplJnCSO43F4f9jeC2rXfwOzcC
         Mklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KFyKR2rM3JkXVn4xHoMGX6AZ4IrhGWuwaN/v/GhR6IQ=;
        b=CTv0ToDwasg724caS1hN0VbQi8OEefSaRLOfce7fpGHgVm2ph2z3kLIW3kO7g4t7oa
         7CbYJZ1C0O/cBoVefLMQcmcY5+tYTEOuVbqCnxe6ZyWF1HDPkOJAeMI5JZmJLbod257+
         bQSeeSanMBtGERh0QyMxCcgg7LKRGhwGvBCJpfR0xtmbiiyZewkcxg1MsjZ6ZKyXioY2
         CyservHuDw2FIQ9YHedSsvLQ0RzHGqEGMsOtoqcuMr6ptBDd110/zr4QN2TcNcWrMwXn
         zfBFiM5j0ko2J0wo2GCypn29kV2sP+1ajJim28vR8WrHowtFsD+QkGpM/jjJdG7mz9e1
         Iv2A==
X-Gm-Message-State: AJIora8piTmqOMPyhqxO73+WnoNKPnDndi+Ae+PnvRxLOplqOk69xiKH
        p8GH7V8h3UNErKIQMYW0/FRuLg==
X-Google-Smtp-Source: AGRyM1uhiZX0JE5UQN9nhLGo1qYuczO8qipfFuOzfGNP2EUSUFviSIibanMAGjidqHaz3D6tzN4HUg==
X-Received: by 2002:a05:6a00:1ad4:b0:51c:7852:2bd1 with SMTP id f20-20020a056a001ad400b0051c78522bd1mr12765207pfv.2.1655516240057;
        Fri, 17 Jun 2022 18:37:20 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id l25-20020a637019000000b003fdc7e490a6sm4412325pgc.20.2022.06.17.18.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:37:19 -0700 (PDT)
Message-ID: <c8787eef-8f5e-aaa6-7d15-c4c5a50a00be@linaro.org>
Date:   Fri, 17 Jun 2022 18:36:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617144714.817765-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2022 07:47, Dmitry Baryshkov wrote:
> Use qcom,gcc.yaml which contains a set of properties common to most
> Qualcomm GCC bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8976.yaml      | 21 +++-------------
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 21 +++-------------
>  .../bindings/clock/qcom,gcc-msm8996.yaml      | 25 +++----------------
>  .../bindings/clock/qcom,gcc-msm8998.yaml      | 25 +++----------------
>  .../bindings/clock/qcom,gcc-qcm2290.yaml      | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sc7180.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sc7280.yaml       | 21 +++-------------
>  .../bindings/clock/qcom,gcc-sc8180x.yaml      | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sc8280xp.yaml     | 21 +++-------------
>  .../bindings/clock/qcom,gcc-sdm845.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sdx55.yaml        | 21 +++-------------
>  .../bindings/clock/qcom,gcc-sdx65.yaml        | 21 +++-------------
>  .../bindings/clock/qcom,gcc-sm6115.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sm6125.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sm6350.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sm8150.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sm8250.yaml       | 25 +++----------------
>  .../bindings/clock/qcom,gcc-sm8350.yaml       | 21 +++-------------
>  .../bindings/clock/qcom,gcc-sm8450.yaml       | 21 +++-------------
>  19 files changed, 76 insertions(+), 367 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
