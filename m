Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE505715F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 11:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbiGLJnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 05:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbiGLJnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 05:43:03 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B831A4391
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 02:43:00 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id d17so2171917qvs.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YoZBYZy41JFnQOGO3Hk17+jt5jdA+Ko/TmjpBwiSidA=;
        b=Mp56ho49ONCB9YdoaKjrcHN9VWBBj/JQHylIy8Y66ZDWzu6613aEVMlt4rXLr4xbnT
         /EAd5UzTDUYiryhZdDscI62gJ5lqGH6tOEoClYAJwYKjdWHqTtnEzRM7gY5AfpO6KvfJ
         IdcWdko+YQZQjfCIa7XmsgynjbgkayMyaVnVEybhLgR0nwoUN9uHpzAa61o2YvQAROu9
         9XKte3wpeBCxjHFQ+HRDKFbY2VKQMtC6xLwMlqGrDUVx79hrhUrjEhCjDMhlgFb5d3EE
         hPb+EZyqgDTxqoG8689V7XSNtZ2AbdDG+swssRacz8vsQ3qM+byfPSmjl+zwRPTsES5T
         C5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YoZBYZy41JFnQOGO3Hk17+jt5jdA+Ko/TmjpBwiSidA=;
        b=ctnKr0+WMNKNDqY0gzX3p8OX+Nx2lzMbWhbl7SPQOvhiS30i/BSdTF167ejBEQIysE
         2efKYGDK7RUfaO4WQZ/gKmElYUY9PFJTZJTVNLzf3mSBy19YQq79voHTBs2BQmv2vh4h
         GyzPGuGW2AtvwtuN8Xe8boo8FrO5ar9Wz3kSUhKyyp58kSWlieYHF+HT1bOOzduqhhe5
         z6799SbFZnVzv3fP7jts8ddZKnFVz7yl/s5PImkWGRNo591XDSyw4lY4K7XXrwdOELNc
         487sdiA4NzzvuKUMzIs2rPOZXwOvvsXWg/2Ympei2CXGRa2Mkp0qSrhRFZvFGiUQ5tz+
         deew==
X-Gm-Message-State: AJIora9H/0VaR+GwFFmTEUxueic6iGb1opOeMKLTvv8octj7K/Ecd+Pv
        izOMBDn7qHgLqvkz3vNpWxvnENAPMqoKgprPoYp0QoF5kyk=
X-Google-Smtp-Source: AGRyM1tHoH02JA0eu1BvlGmolAYocWBMRLvOM+ZDeFF0Ju9sWVnKd2I++G5vKn9D8D1RhgOguQYeeGDqDOcrYk768oM=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr16692462qvb.55.1657618979170; Tue, 12
 Jul 2022 02:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org> <20220711231638.GA449827-robh@kernel.org>
In-Reply-To: <20220711231638.GA449827-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Jul 2022 12:42:48 +0300
Message-ID: <CAA8EJpoHKewcM3upa9GvNhUyKNC3sjqYa2rA-zQk5m1TpZmAtg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 at 02:16, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
> > Document missing definitions for opp-table (DP controller OPPs), aux-bus
> > (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 391910d91e43..52cbf00df0ba 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -70,9 +70,21 @@ properties:
> >    operating-points-v2:
> >      maxItems: 1
> >
> > +  opp-table: true
> > +
> >    power-domains:
> >      maxItems: 1
> >
> > +  aux-bus:
> > +    $ref: /schemas/display/dp-aux-bus.yaml#
> > +
> > +  data-lanes:
>
> But this is the wrong location for 'data-lanes'. It belongs in an
> endpoint node.

Ack. Then I'll drop this for v3.

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      maximum: 3
> > +
> >    "#sound-dai-cells":
> >      const: 0
> >
> > --
> > 2.35.1
> >
> >



-- 
With best wishes
Dmitry
