Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4F475274E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 17:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbjGMPe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 11:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbjGMPeo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 11:34:44 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E428630D8
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 08:34:33 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-440afc96271so367458137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689262473; x=1691854473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8yGwM2jMm6HeybAOlBLR6sZSi/DPAG/Mi6HWsPsP/EI=;
        b=lOgFlERPhwtGjicLF2QHVlqBk2xSDjijmmistC6wxT3hqdtQKIp2OgtKqSDsPAiizS
         wYQJQbXgXaCcxecOQofQ0NQysSDneQdw+H/6NYICtdMdrXApRr/VJmoKQm7+lqxz5CU9
         7HKYEPG6Y7/vU/zy5asXo1RDZ57mV1rxJ4y90qbj11a79ceBVOuzDB33KSgDy0rN+mwi
         0a9Ii2XIlGFExp3+2n6C/bBF8rtotem8PhWb1HeJSt7j+04dznqXCjeaK4i/v9L+b0pf
         7gqFXvkVYT0gF2Gi1kf5amM7r4mq+0iDjg8T1vwPyROs/edZA8/yCHdovfdf9v1AbJiH
         JfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689262473; x=1691854473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yGwM2jMm6HeybAOlBLR6sZSi/DPAG/Mi6HWsPsP/EI=;
        b=WnjrQAwJgVnkS0DZM7aCdrZtg+HMKylRO44++DhBWS9HMaEDIzEGtwsXwd35F65sbc
         dTonUwLVUXLKnI4dIxXdr47HWH4VqpZ3im406GS0xcZJQfn4IRy++kuDmmsSv1mqe3JU
         h19BCudHZQX+G8nYik5IM6AUvNvbLbse3sc6woy8GiqWwO9CPhiPzs/vXyg0wBj/LZUK
         0D8pu5QRp6gbxEV+yhAhi9oyaDke9dDAEsooJIGA/2TmPKDOVHEIAZaEGW2CtNdkfxXZ
         hPu5X483EnovSxPXS6vm9j09hLF/1K+TNVADKyadlr7BZtdVu4tIMML28upMUr+Xsh5A
         BVnw==
X-Gm-Message-State: ABy/qLbR6ClyMoa4vuOobbk7FNwr9cbrZ8T9f2IueQsg7Yka4tag/XOS
        qlLNbcXXCzm7Eu2kCtNakJx9Dv3pumqRHyBbmpRwRw==
X-Google-Smtp-Source: APBJJlGb1jVO/ngXjXmOiFV9ZYbghh/vfhZZW7PYWNC1fUiGbkak2hA/lfD7wwvwjJJq8+zZv1gdSRqmyIer2LH0nno=
X-Received: by 2002:a05:6102:389:b0:444:c7fa:1aad with SMTP id
 m9-20020a056102038900b00444c7fa1aadmr1171134vsq.17.1689262472963; Thu, 13 Jul
 2023 08:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org> <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
In-Reply-To: <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 13 Jul 2023 21:03:56 +0530
Message-ID: <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: qcom,sdm845-mdss: add
 memory-region property
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
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

On Wed, 12 Jul 2023 at 18:45, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/07/2023 16:02, Amit Pundir wrote:
> > Add and document the reserved memory region property
> > in the qcom,sdm845-mdss schema.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> >   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > index 6ecb00920d7f..3ea1dbd7e317 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > @@ -39,6 +39,11 @@ properties:
> >     interconnect-names:
> >       maxItems: 2
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to a node describing a reserved memory region.
> > +
>
> Please add it to mdss-common.yaml instead

mdss-common.yaml didn't like this property at all and
I ran into a lot of new dtbs_check warnings:
https://www.irccloud.com/pastebin/raw/pEYAeaB1

I need some help in decoding these please.

Regards,
Amit Pundir

>
> >   patternProperties:
> >     "^display-controller@[0-9a-f]+$":
> >       type: object
>
> --
> With best wishes
> Dmitry
>
