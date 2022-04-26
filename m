Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C71050F367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 10:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344427AbiDZILH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 04:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344487AbiDZILC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 04:11:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C495F49F33
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 01:07:48 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id j2so31595604ybu.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7eXfscvzQ/SREbBKUsL46BAeK2worrsk0EJPjbY6BoE=;
        b=NVwjFCP3nmryAtDGI/XWoo9yGdR2LHOR7hrXb99eEpPPZXxnoRkBfVSMX5o1EpBW9N
         85KW9o+e+PN1wdyhxJYSXHtQlxBJKn58WRkh/FnEDA5+rwagtJk0QafzoQ4kdUuLAClk
         Yd53I3zeF6LRwhZQZNAMOBPvBDjk+zK+RzByR/mrmaV39Kf5QhkQcaVMWtxbznuSL3X3
         QQ4uVLjlI/HsMNxFbZEmXQtI1OvyYbopRa+Dk/V7u0IFOcDoRIclEMSR2GXyagq6jcmu
         AiTwy2O/jhXC7qlYRF6jZUqHaouIy1GXPMvSFAphLZ7fqEul1GdFT30IzTxSNC1SaRlx
         CmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7eXfscvzQ/SREbBKUsL46BAeK2worrsk0EJPjbY6BoE=;
        b=NA+D+tMcdVBHzkZch40nIU2H/e6qtIJAfZSjH/FSMAH4Xk/wRdJqXhOeBzapnspXmU
         ZI1voBX69Ybnd17GbWudbwiiekRG14N366Q8rfxdf2uGn6ha14mLyWawqqXTAgf/R/yp
         X88lcmO+b/euYraVSUI/zDmzpJeTvKO0xLYN34y6PZpIoD9OWZiAF5Pk8T9AayicC40h
         3uFvycWIJzvzHileAnxNQtRCRDBkaNEfZvynDn7Bw2+md6CfUgOmF79pt2MYeIB8SGft
         lIfwWoIBj2uX48FU6PGg8Lg1hPnhcrNzyAF//mdoEoBu5PYLmi4KqYfkMVvwpNL8SnLH
         OsTQ==
X-Gm-Message-State: AOAM5339GrLNmVaGXKZnskJXLG5DxvgZp3l/ZFiLJ3vYaC592o4ioPVk
        U8nEV8k19vbvWqt56Kesp+PRZgvkgv95vczrnWTgWw==
X-Google-Smtp-Source: ABdhPJw8Nb4/OELQ1EloKACTrcVb3cjGiN56zk1cblqXaHWRBsVlgGKBMOpYuNe3HgpAZ6EMA498escn8zEa4ED5dTU=
X-Received: by 2002:a05:6902:1547:b0:641:fb0b:4830 with SMTP id
 r7-20020a056902154700b00641fb0b4830mr20756038ybu.175.1650960468042; Tue, 26
 Apr 2022 01:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220426072451.2905910-1-dmitry.baryshkov@linaro.org> <6b766f08-5cac-fbda-cdb5-364aabb54fb3@linaro.org>
In-Reply-To: <6b766f08-5cac-fbda-cdb5-364aabb54fb3@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Apr 2022 11:07:34 +0300
Message-ID: <CAA8EJppBAUbT58yFyQTYPou37BquHDjbvqw9ziL4XEz15M4S-g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back
 to gcc-other.yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Apr 2022 at 10:31, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/04/2022 09:24, Dmitry Baryshkov wrote:
> > The global clock controller on apq8084 has nothing to do with the schema
> > for apq8064. It uses the schema defined in qcom,gcc-other.yaml. Move
> > respective declarations back.
> >
> > Instead add what was really meant to be present in qcom,gcc-apq8064
> > schema: the compatibility string for qcom,apq8064 device.
> >
>
> Reported-by: Rob Herring <robh@kernel.org>
>
>
> > Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 +++---
> >  Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 3 +++
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> > index 97936411b6b4..b867da12761e 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> > @@ -20,12 +20,12 @@ description: |
> >    See also:
> >    - dt-bindings/clock/qcom,gcc-msm8960.h
> >    - dt-bindings/reset/qcom,gcc-msm8960.h
> > -  - dt-bindings/clock/qcom,gcc-apq8084.h
> > -  - dt-bindings/reset/qcom,gcc-apq8084.h
> >
> >  properties:
> >    compatible:
> > -    const: qcom,gcc-apq8084
> > +    enum:
> > +      - qcom,gcc-apq8064
> > +      - qcom,gcc-msm8060
>
> This looks wrong. msm8060 was not broken by that commit and was never
> here, was it?

I'm not sure that msm8060 even existed. This should be msm8960.

I can send v2 if you like this approach or I can rebase my tsens
patches on top of your patch.


-- 
With best wishes
Dmitry
