Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3708F6E289F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 18:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDNQpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 12:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjDNQpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 12:45:32 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0451D9EEE
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 09:45:27 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id n203so7744764ybg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681490727; x=1684082727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGC6d8pHkx4LIPUvsw9NY8Blv0Cd/e0UOketkjdE2UI=;
        b=BZcE8fedbi18rtgZPHpt1A5gtRhqA1KWFJW0hZztZLJnmp7/8+45rKQ8SqCQRnkSMX
         OrhW5n8u/jdnVn6kHOg+p4p17zWCP4T1eWwqc/VLUhKHmpPHlbpui+FEKLvL3hr0NJDA
         wJktVnSc0iQgEYc0uf5XaRHWJHYflUEfAAtnJDVHEjc4tbIPkewCWJOyNlFKJCMjN1xd
         UskxIRr2rqYcXu0wE89gsLVcVbkAyPWlCnK+Cae2exfEwEJRrBmXm8hY5VEw8hjcDGp3
         ltnc8RMjfFapmakZhiYxo/6vYPZoDxmTCTxGouXEvJxxGK5P2ggqZeH3usKly73d5kUf
         WjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681490727; x=1684082727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGC6d8pHkx4LIPUvsw9NY8Blv0Cd/e0UOketkjdE2UI=;
        b=c67Wr95viwjfcJCp0un8o2vIzjVBI6+pbd/CqGQdRg8Rdk1HrUHu57Rb5Oi6hfnbWB
         FhI6fIhs1A3uWhwiHCeEYVHANjd13W1Sm8rzSZJkarvLawADtDNbXdbyYkjaCIfI0cAu
         hrbuErGJNK+KiZt0Pq3MHSWl+NFMvUeszeJ3L1f5hA3GETZb+NUpxKLfyA/4V1Jl8+Cc
         SL/MJ1/i+wKKKvMCLYWFHm+GwKuV4k4wQ1NIEeqV0FA46AaYOX06ApGTYHl/TraIIVJL
         fTnPCq5xyiOfdt50DJP+2WKmbMtWIAa1oW47B4GIlinx9x5oW6pwE4iyQ/RCgg0gjf9i
         E39g==
X-Gm-Message-State: AAQBX9cDgx40QMZWPXTUjCufO/fEqNGc4qnuLFJmw+hOpKbFvw/Y4lF+
        eff67ClZ6FGM512IUNVQdLj5mE2JOJX63ybkPVirVg==
X-Google-Smtp-Source: AKy350boKXfRN0EHF9rp1Ah6iMumgNGg0ee80ixDS188j6sNu0vGjqXXrOcozUq0QKMO2Qx0WTIft4lniHatCuhAROE=
X-Received: by 2002:a5b:647:0:b0:b8f:5474:2f33 with SMTP id
 o7-20020a5b0647000000b00b8f54742f33mr4712273ybq.5.1681490727101; Fri, 14 Apr
 2023 09:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
 <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org> <20faef75-9182-6e67-8ac5-c8234318ab64@linaro.org>
In-Reply-To: <20faef75-9182-6e67-8ac5-c8234318ab64@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 14 Apr 2023 19:45:15 +0300
Message-ID: <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add SM8350
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Apr 2023 at 18:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/04/2023 13:26, Konrad Dybcio wrote:
> > SM8350, like most recent higher-end chips has a separate clock
> > controller block just for the Venus IP. Document it.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,videocc.yaml    | 29 +++++++++++++
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Krzysztof, Konrad, would it make sense to split it into separate
bindings? After all, previous videocc bindings used clock-names, while
this one doesn't.

>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry
