Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE175278A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 17:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbjGMPnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 11:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbjGMPnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 11:43:20 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C431E2680
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 08:43:18 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-cb19b1b9a36so814470276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689262998; x=1689867798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=91vNV3YrdzSjKOSREPIs1wSiF2NAZ5QLx0dAx8l+9Cs=;
        b=rDxvl6mZuriokxBHc27a1IvWgQXE5WtWQswiLsM4jHgQP7vkELi7SgUvleLqEdYIIi
         B9/qrxBoc+4j0fCZdTZIhjUHaRaf40Fse3iVbhOvpxTQxsHQgptK4AL7qbTv6mB/8g98
         4kd0ufDwOyI8auYr+orVFJKIBCOxqO2WwlCZwsEpqVtWc5lWRgcC3RRHlwfWeecgV38y
         nGBAe6NgwdEV6LivipYtblUKtzZmvJtqLRDZx3WnJBwQ1N1inP+HXpt4X1iLE6Vq6wY5
         G7s/7BE9oCLkKLnlY2c7E2dPVpBKOHQ2ES1DRWo6GHXAqteGNAQeb4eyzFFVI9vySks/
         cdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689262998; x=1689867798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91vNV3YrdzSjKOSREPIs1wSiF2NAZ5QLx0dAx8l+9Cs=;
        b=bHHI17WFZi4gukzWSlGmu4rjBrMIK4MvbfVcmONqqIu9QKnHyyNareNuAhw7iDxnF4
         YAvnNcNFG+YwBh8mv459H4Qu957mA6JNI+/dmIVl0FAArNndP1FfIaUFKMEGYdDyifjG
         lQc5dBOY1ZV3EZmK7SrBiK73hyoXo+Vqphh6XGjvvXhpscr5/11yyZIJie0ZrqxOA6IL
         hDmAmdA3kviZZM8xVXb6ISwfaNj7u/AqA9+GliJv4ljiioNM7mHIbisP7uZdquaP7KcA
         VEjExNkze6lYwa+mrDiiXiiyeFS86BsaFcElWB+EDYpmL0Q855Z4ZXvz96/BCZ0WVxEd
         lfVw==
X-Gm-Message-State: ABy/qLYtSV9/8FdB76yHlgVly4sx7dxvF5uscBLd+Q8DVZEuuurWuZMu
        3+dKMJlUt0LKhYhg6urGJe+6GvSW8SSTuJR1Fc5oPg==
X-Google-Smtp-Source: APBJJlEzqkIycBpd/dk78rxLiZ5DOQgoh2uewJ9I1h61UlwEZbrwkONkI8ayCwX25DFG4WRdWqcFsLGGtlya5l1nooE=
X-Received: by 2002:a25:c0c8:0:b0:c4f:43d7:7daf with SMTP id
 c191-20020a25c0c8000000b00c4f43d77dafmr1554760ybf.1.1689262997949; Thu, 13
 Jul 2023 08:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org>
 <3b677200-a201-680b-391f-fbf73064496a@linaro.org> <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
In-Reply-To: <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 Jul 2023 18:43:06 +0300
Message-ID: <CAA8EJpp6yprRL3qzM9pHt2uJ6sb-nPhwas5qm9aDthegSaw7DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: qcom,sdm845-mdss: add
 memory-region property
To:     Amit Pundir <amit.pundir@linaro.org>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jul 2023 at 18:34, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Wed, 12 Jul 2023 at 18:45, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 12/07/2023 16:02, Amit Pundir wrote:
> > > Add and document the reserved memory region property
> > > in the qcom,sdm845-mdss schema.
> > >
> > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > > ---
> > >   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > index 6ecb00920d7f..3ea1dbd7e317 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > @@ -39,6 +39,11 @@ properties:
> > >     interconnect-names:
> > >       maxItems: 2
> > >
> > > +  memory-region:
> > > +    maxItems: 1
> > > +    description:
> > > +      Phandle to a node describing a reserved memory region.
> > > +
> >
> > Please add it to mdss-common.yaml instead
>
> mdss-common.yaml didn't like this property at all and
> I ran into a lot of new dtbs_check warnings:
> https://www.irccloud.com/pastebin/raw/pEYAeaB1
>
> I need some help in decoding these please.

I'm not sure what happened there (and it's hard to understand without
seeing your patch). But after applying your patch to mdss-common.yaml,
`make dt_binding_check' passes:

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..924fe383e4a1 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -77,6 +77,11 @@ properties:
     items:
       - description: MDSS_CORE reset

+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved memory region.
+
 required:
   - reg
   - reg-names


>
> Regards,
> Amit Pundir
>
> >
> > >   patternProperties:
> > >     "^display-controller@[0-9a-f]+$":
> > >       type: object
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
