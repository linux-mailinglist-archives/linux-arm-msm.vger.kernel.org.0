Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60FE3705397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 18:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjEPQWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 12:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjEPQWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 12:22:09 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE71CA5C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:21:22 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-559e2051d05so202105687b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254081; x=1686846081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=19hkvJ7fgHhDZLlkvTOh9DvAb7xhG5L7qlm1/9VUcW4=;
        b=W+YHl9nb/oFb5uIjwuAFSTxIHn4Zb7W+fyN54juZXmqqjl74thB2SpEQuPC7xyvyCB
         lcEYML0JETAxTpINRmpjwlqGr2uYlGmK1cMfRNK1Ue6r+cg+XkVy41uE5FGgFqeyR1KH
         4+nerLJRBpcx/ZrGWN5M/KQUengFRskezey4DaeSTNGm5kCVPGWDtNoee2QHCuwQzWn6
         xGx7gucFKTw8LMFcSqNZW/f55Etkxt2OOPq0vYQJFac4xu4YyT/V89av2AUNLlKFHkE7
         4X8Q6tiRaSj906Qh0dZbc6/whjbw7g6G2pVU9IQ5vOr8xcDouwIHu35pgyu3x8fK6i3o
         tL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254081; x=1686846081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19hkvJ7fgHhDZLlkvTOh9DvAb7xhG5L7qlm1/9VUcW4=;
        b=KzCnvfOhJ1lKhBOCG3DBj5W1X3vPFidq6be1awnp+C+KsWJZs4R6E+dGYrKwj1Vvux
         fav66dIMHC9X21lOwB3FwSefQhFSZVzLZ5MOJ9VTs39TMMkbNegu3EG9bUTWPp9g3pNO
         Uh6EqUqNkKJQoTdeIMum4LZXYIV81yp4g774JNzPisqyWHY+YKPpcG+jPo9r8kUzSkyY
         1pd8wYnsWOoYqO2ukw/TXcvPTKEnUkoeGJzN9L7AglEdvABrCK3I8t814HcuZfJ/g2vt
         xSVEwS0FUnI+Qo4SHDR3gT+2hZatgwDZTq57RQ5Ls1s0u287wvZqMSY20mI6xo3mtGoq
         F18A==
X-Gm-Message-State: AC+VfDx1DnFicWIPeQnWI73+1oEObEhcbizQ+5J4FI91Xtz10KtMLYqX
        p/kBBCy2VZjRmf4UzD4zuYXt2/+rFc1Y6tuPStGi4NDfxrxkR4AF
X-Google-Smtp-Source: ACHHUZ7jmCCaR1uEX73wgBbW4Pkuq/7SvITMmqlaR9/8hfMB+pRc9qZCLsWoSIiqq+x63Yrfsxdnsc4M/fq2Ef7+OJM=
X-Received: by 2002:a0d:d583:0:b0:55a:f400:5087 with SMTP id
 x125-20020a0dd583000000b0055af4005087mr38444426ywd.27.1684254081673; Tue, 16
 May 2023 09:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 16 May 2023 19:21:10 +0300
Message-ID: <CAA8EJpq7EOmwUjZmSzMScMnoPs5RhKBCWSqaAmnG7J9aYEf=gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm8550: enable DISPCC by default
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 May 2023 at 18:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enable the Display Clock Controller by default in SoC DTSI so unused
> clocks can be turned off.  It does not require any external resources,
> so as core SoC component should be always available to boards.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> ---
>
> Changes in v2:
> 1. New patch
> ---
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 4 ----
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 -
>  2 files changed, 5 deletions(-)

-- 
With best wishes
Dmitry
