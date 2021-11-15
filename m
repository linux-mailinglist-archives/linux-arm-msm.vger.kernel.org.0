Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD0D44FE60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 06:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhKOFbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 00:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhKOFb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 00:31:28 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C7FC061204
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 21:28:29 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso25462831otj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 21:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pCCwFFPZ5wQ1q6Uj5U8eMPTH+2MMD7XkfKBAmWx8+k=;
        b=v1si72HM1cx9QPQtp+dF30SbbjyJljlqUTHHtXcPLqJenPkit7Ic6L2+iESoX+rj5N
         oy98aOq9vRGOeoKaQey0BsUpGB70l1a2vqkUG2P559Y7lBjlzMPsO9tt4bIrwOiT0Asv
         oj/g3FjSU3eXLYYDHQSFdY4SwhX7Z4eQZwLqgyew81x6NqptsV45zfYoExxvcfPRMQ/D
         8CNfbfTwP+WPFtKa9SH8p4e0cMIeyTVYKvIsyWsb3eWh1IR2ukwCH8pm3foIeGPJLdi9
         PorFn/OhFQAWzHm3BAnjbR+7DAiIl/s68hKoYQM27hUQM92TUfIYKqG/MOEHxRB69bfF
         cGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pCCwFFPZ5wQ1q6Uj5U8eMPTH+2MMD7XkfKBAmWx8+k=;
        b=6LjXsindtOYT3K+xAx4kpdg8gPaOn2piOfwDoJkjRCF/DPKKFgoH/UxJpJ8o5v4QRI
         gM6H742JKrzTIalNpMMRbTgYW9DYizEZKYPvKiY22yUKgZeA7thwqlyjm27saor7rKM4
         f8L+WYWo864hElnsksLogz/bIOMGEUiJ4n5cpFmPS0QByxNbysDeEKrhxm0zeXZtOIib
         z75TXeCK69rq+7zyUpVqLQFB/5rBeY7eDY9jugCgWpE63HXzVvWAYx6oz91y1NJ8jR8G
         dELSNaND32hASohrkYzRBkZRlhGGn7avtRwTafq1ADDtbgUNkjeJ/4ahFk3Umt9Ht7YA
         UyTA==
X-Gm-Message-State: AOAM532ijONRpj42HDiMRGESus/kHDG/yJd4mYPLAkwV0A9ZycGHJcV1
        PXfD3tUwqzWFwD/ToOBwrlEaqj8sZvYbwgP49Ia1/Q==
X-Google-Smtp-Source: ABdhPJzXeQQU8uHExB5pbeDnYDw8mfC9u8nDNKgIP/YoZwxq8B9qsATJeHzbHo0Te1D2hs6ie2Xo4GJPGnCINSK9g90=
X-Received: by 2002:a9d:63d2:: with SMTP id e18mr15505274otl.28.1636954109152;
 Sun, 14 Nov 2021 21:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-12-bhupesh.sharma@linaro.org> <3d02334e-d4eb-499e-7523-cd446ad0818f@linaro.org>
In-Reply-To: <3d02334e-d4eb-499e-7523-cd446ad0818f@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 15 Nov 2021 10:58:17 +0530
Message-ID: <CAH=2Ntwp1_ckv3G8TtdTXU0dVFQJUyx5LpksCABOdPJVQV6ebg@mail.gmail.com>
Subject: Re: [PATCH v5 11/22] dt-bindings: crypto : Add new compatible strings
 for qcom-qce
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Fri, 12 Nov 2021 at 15:55, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 11/10/21 12:59 PM, Bhupesh Sharma wrote:
> > Newer qcom chips support newer versions of the qce crypto IP, so add
> > soc specific compatible strings for qcom-qce instead of using crypto
> > IP version specific ones.
> >
> > Keep the old strings for backward-compatibility, but mark them as
> > deprecated.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > index efe349e66ae7..77b9f544f32f 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -15,7 +15,13 @@ description: |
> >
> >   properties:
> >     compatible:
> > -    const: qcom,crypto-v5.1
> > +    enum:
> > +      - qcom,crypto-v5.1 # Deprecated. Kept only for backward compatibility
> > +      - qcom,ipq6018-qce
> > +      - qcom,sdm845-qce
> > +      - qcom,sm8150-qce
> > +      - qcom,sm8250-qce
> > +      - qcom,sm8350-qce
>
> let me ask you to add at least two more compatibles to the list: qcom,ipq8074-qce
> and qcom,msm8996-qce.

Sure, I will fix it in v6.

Regards,
Bhupesh

> >
> >     reg:
> >       maxItems: 1
> > @@ -68,7 +74,7 @@ examples:
> >     - |
> >       #include <dt-bindings/clock/qcom,gcc-apq8084.h>
> >       crypto-engine@fd45a000 {
> > -        compatible = "qcom,crypto-v5.1";
> > +        compatible = "qcom,ipq6018-qce";
> >           reg = <0xfd45a000 0x6000>;
> >           clocks = <&gcc GCC_CE2_AHB_CLK>,
> >                    <&gcc GCC_CE2_AXI_CLK>,
> >
>
> --
> Best wishes,
> Vladimir
