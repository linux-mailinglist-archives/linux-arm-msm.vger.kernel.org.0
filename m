Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA0029DC67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 01:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbgJ2A3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 20:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730381AbgJ2A3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 20:29:46 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E8AC0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:29:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 184so1110931lfd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7jNAEm6Hi0csIlAhJak64h6CkXzGG/PjJ55O7rc69w0=;
        b=dVbiFvDr5hJzG53SMPD8precPJBr4LhbfNdzfOWJKKosCPkE3U8Ech812UHrucQHfv
         E6ottCjFlpuwTsu3cvPVUcLBNhLxknUL9qAC1EQEH5lFYv0YOqmeBBkai/fZm68Y1uGJ
         OHmPM76qoxHM+OiAeFY4lENZ6ebZWLhWm47PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7jNAEm6Hi0csIlAhJak64h6CkXzGG/PjJ55O7rc69w0=;
        b=CxC8CZbSrCi8Y4sDeJ7fbAs6U2X5hTALFgcNAoH5FLhxP//9tls0GOqFQEwu0pLmBW
         JbL0r9FcBZTj4pMEoS/2l7GqX23EyL96PF5FmTsCon/LZziHinJvsf0022Eryf7Hug2L
         849ZAyf8P9I6LJcCMMKZoDPmuGD0wPomL1ECfM1a/laj/tSfKFqttPHU1myjhGy86GD1
         ndmTkooMIZzG8M/vVqzhdgaavGd85RFDMOUN5vLHxufyyDbYWOxjK4rFGUlD2OQ6WkRZ
         NiANdboVkLstYGuWNHlAhd1LaXFFBgoayUOn5v2kQsB3SkzTfwyAazcLOloArEw5TsDP
         /oNg==
X-Gm-Message-State: AOAM530GYOiM/0Sf5uogR5685463A5i+7tvui/fnMVTe36AD1uhkPbNQ
        ktwZJOtLJSdsZ3iso9s9rK9qTuc4TEuP9g==
X-Google-Smtp-Source: ABdhPJwPsRzOfpwjtB4DVWVPPpJXNRwduwonXOVCFJpTukISwcMvFYR9iw8CvkAQWpWmzzAe+v+4Qg==
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr537726lfm.333.1603931383796;
        Wed, 28 Oct 2020 17:29:43 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id z8sm130859ljj.49.2020.10.28.17.29.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 17:29:43 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id r127so1064805lff.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:29:42 -0700 (PDT)
X-Received: by 2002:a19:6b0d:: with SMTP id d13mr519613lfa.485.1603931382411;
 Wed, 28 Oct 2020 17:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201016192654.32610-1-evgreen@chromium.org> <20201016122559.v2.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
 <CAD=FV=VyBxXFLGsPZFpX29xFL5p8ZZPQ0uJEku3Wo04VFOEZOg@mail.gmail.com>
In-Reply-To: <CAD=FV=VyBxXFLGsPZFpX29xFL5p8ZZPQ0uJEku3Wo04VFOEZOg@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 28 Oct 2020 17:29:05 -0700
X-Gmail-Original-Message-ID: <CAE=gft5H5oq7pBg7JqRmrLybqmqOnk3T42orFNyY_vGEbXHTTg@mail.gmail.com>
Message-ID: <CAE=gft5H5oq7pBg7JqRmrLybqmqOnk3T42orFNyY_vGEbXHTTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: nvmem: Add soc qfprom compatible strings
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

On Wed, Oct 21, 2020 at 2:41 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Oct 16, 2020 at 12:27 PM Evan Green <evgreen@chromium.org> wrote:
> >
> > Add SoC-specific compatible strings so that data can be attached
> > to it in the driver.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> >
> > Changes in v2:
> >  - Add other soc compatible strings (Doug)
> >  - Fix compatible string definition (Doug)
> >
> >  .../devicetree/bindings/nvmem/qcom,qfprom.yaml      | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > index 1a18b6bab35e7..eb1440045aff1 100644
> > --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > @@ -14,7 +14,18 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: qcom,qfprom
> > +    items:
> > +      - enum:
> > +          - qcom,apq8064-qfprom
> > +          - qcom,apq8084-qfprom
> > +          - qcom,msm8974-qfprom
> > +          - qcom,msm8916-qfprom
> > +          - qcom,msm8996-qfprom
> > +          - qcom,msm8998-qfprom
> > +          - qcom,qcs404-qfprom
> > +          - qcom,sc7180-qfprom
> > +          - qcom,sdm845-qfprom
> > +      - const: qcom,qfprom
> >
> >    reg:
> >      # If the QFPROM is read-only OS image then only the corrected region
>
> As Rob's bot found, your example no longer matches your requirements.
> It needs an SoC-specific string plus the "qcom,qfprom".  It's always
> good to try running "make dt_binding_check" to catch these sorts of
> things.

Thanks Doug, will do for the next spin!

-Evan
