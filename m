Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A624B281EF3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 01:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJBXPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 19:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgJBXPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 19:15:04 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F239C0613D0
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 16:15:03 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u8so3825316lff.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 16:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X7v0IguEkfr1cOBmK+SE8+7CIjedoZmEtVTfp5z8yVo=;
        b=FKIIGNm4cuXzs5quW9CEsjwrBj/6hqBDlLAbYlhfvbbn90YZfqbXxeZnjcqGYHc2+P
         DmWhmHUaOnPKYLk5zeuEaxW74SuTqmoumQLo54K2124c58ju5tkmCzv5A856Ncmtf2pu
         89vVhrcPGWaAoE7eOd9ckQ+014uVKwEoEbb54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X7v0IguEkfr1cOBmK+SE8+7CIjedoZmEtVTfp5z8yVo=;
        b=ADOZW5roV4FIRWRpRQsHt8f77Xy9bDxyG+rLNzRlFnpfP5dXx163xJOf7UOLLPFcrw
         bXL1wmJZPhmLx49KowNSfzNqBCG8sN8nkaXId8HdqUL1jC3tshotron7HEspZGUy8n13
         AHZtkSjKc3rdTFlrqcMUfTj7lMz2GzSEh7fGMqpistI/UhGbBmDxgflHpXfsUcwnAYW8
         sD2gb0SvT7EIqc5O5YiXSYHmC/JalAUF7GY2FzvloHzf/iqyA45qyE7WDDlULHq5Of31
         l7y2TUZY93McFhiCMNX2t+pyUmG7Rl/9mz1gHtQCemXrh4QwK/vmKDY0aN3S28s20G2t
         JKCQ==
X-Gm-Message-State: AOAM531xDlwYfoQFeQS169Ze5atj3+ZqMjzYsOQejgXGpF/Xd9cbZ8ya
        eurHpAPWZUVf5tLbjPfENYzV98oUxXCvew==
X-Google-Smtp-Source: ABdhPJxf/qfsa39/IEVPgLsVGZcQrC2oS7jfXFqddox3TvMxAh0CPLj6ROPmWoUmgNNNpU5HfwWusA==
X-Received: by 2002:a05:6512:305:: with SMTP id t5mr1473287lfp.581.1601680501577;
        Fri, 02 Oct 2020 16:15:01 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id c3sm760892lfg.15.2020.10.02.16.15.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 16:15:00 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id c2so2471671ljj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 16:15:00 -0700 (PDT)
X-Received: by 2002:a2e:b4fc:: with SMTP id s28mr1247909ljm.305.1601680500013;
 Fri, 02 Oct 2020 16:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200929205807.2360405-1-evgreen@chromium.org>
 <20200929135741.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid> <CAD=FV=V3+V0uBiC_whvWEnv1TSkXt-MfnK+34Kir_kfTymejSA@mail.gmail.com>
In-Reply-To: <CAD=FV=V3+V0uBiC_whvWEnv1TSkXt-MfnK+34Kir_kfTymejSA@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 2 Oct 2020 16:14:23 -0700
X-Gmail-Original-Message-ID: <CAE=gft6GAYePE6eCPi4PxNoJvc1K=KYCN5U_PvTRNnLdpKmLyg@mail.gmail.com>
Message-ID: <CAE=gft6GAYePE6eCPi4PxNoJvc1K=KYCN5U_PvTRNnLdpKmLyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add qcom,sc7180-qfprom compatible string
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 2, 2020 at 3:20 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Sep 29, 2020 at 1:58 PM Evan Green <evgreen@chromium.org> wrote:
> >
> > Add an SoC-specific compatible string so that data can be attached
> > to it in the driver.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> >
> >  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > index 59aca6d22ff9b..b16c8e6a8c23d 100644
> > --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > @@ -14,7 +14,9 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: qcom,qfprom
> > +    enum:
> > +      - qcom,qfprom
> > +      - qcom,sc7180-qfprom
>
> You don't want either/or.  You want both.  At the time Srinivas didn't
> see the point of having the SoC-specific compatible string here, but
> now that we have a reason for it maybe he'll be convinced?  IMO you
> essentially want:
>
>     items:
>       - enum:
>           - qcom,apq8064-qfprom
>           - qcom,apq8084-qfprom
>           - qcom,msm8974-qfprom
>           - qcom,msm8916-qfprom
>           - qcom,msm8996-qfprom
>           - qcom,msm8998-qfprom
>           - qcom,qcs404-qfprom
>           - qcom,sc7180-qfprom
>           - qcom,sdm845-qfprom
>       - const: qcom,qfprom
>
> For some context:
> <https://lore.kernel.org/r/CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com/>

That makes sense, thanks Doug.

Srini, do you want me to go fix up all the various device trees to add
the soc-compatible string, or just sc7180? (Also, don't forget about
my other question about whether you still want the keepout stuff in
the core at the cost of added complexity).

-Evan

>
> -Doug
>
>
> >
> >    reg:
> >      # If the QFPROM is read-only OS image then only the corrected region
> > --
> > 2.26.2
> >
