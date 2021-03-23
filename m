Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6FC3459E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 09:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbhCWIhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 04:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCWIhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 04:37:10 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D86C061763
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 01:37:10 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id l123so13565168pfl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nJ49K0Y3pc/vXvz/MndKHeIP8eApFdm0tvtyJXXJc4M=;
        b=bDOGPvAeLeCdI4C/k38kkvfbz9fXXt1xc0yrKayV8taQLf93FDl4YJMl+26PM30Q9q
         yDBnqP7miYpbw+biEcxk+I62t5aib0Vt9+77b7X3516cgQE3obpYN4Zj7GL0tmHvfoVu
         h47XGGW0XX3At7qAUrSKpYspp+VBelGiSEqN8xHLltcrezDis3ugL9W8aVMAeLO4VwBv
         6n0wBMEH7sQLYNxTWChdcJ8LKqQy3byhvC5LgsSLcuoWSVYy2MTnhMtcJQSC0o0p8WuH
         gXuVCIbk4Ug6HaKr3NQ6qkwtWJX/oj4nUAWcHf+GWkrD0y3wY/ewCrETqFO/j1Fwfbn1
         c4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nJ49K0Y3pc/vXvz/MndKHeIP8eApFdm0tvtyJXXJc4M=;
        b=qLwQVnmujAI2jRPDY1a4tlZftravu0svHkmJekLcovoAwWeCQmnT0ESEec2eDK6HhC
         seI/PGnpVuVBsDjulpNCUmSuNbk5x3Ej5rQElrIkE7FIjEIUnjDoTQA/WNRm5ID6zgOr
         il+fHYRscweXRWSeJnO5uED2/gN3cC9FJdHK+orGlmzflTrOEM8SYN+o0Asj955fs5HE
         fDkFuxdoamz8tmxU0awLEBTZ+vD1mQ8WeBN/PIjufxhdZFCyqKq2RA/3VXCikOIy8J0N
         tJstQ4yj0cson5wH4VSmMYGWa9dsIqG7C8tNMehYITG7Bx9kFivCpndOajhI1QtybDfy
         OMQw==
X-Gm-Message-State: AOAM532wz37gUQz3qbWJxNVvO2/v6u3k4rmTBxhS9Xua0xAt9YwgAWu8
        gJk9WjEUsw6SrrbWtsOH18mIcTYJAUGZtW8TEGRGZg==
X-Google-Smtp-Source: ABdhPJwTzKZlfXnOfsWp9P6XVptQULaFAqOpbq72bJOqIMs1aR5DlqdyZC28GcSCMl/VJcnM4gObI+jgJVzhfDk9NVo=
X-Received: by 2002:a17:902:7d8d:b029:e6:4061:b767 with SMTP id
 a13-20020a1709027d8db02900e64061b767mr4342010plm.32.1616488629727; Tue, 23
 Mar 2021 01:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322100420.125616-1-robert.foss@linaro.org>
 <20210322100420.125616-2-robert.foss@linaro.org> <b3f17dd3-d4b3-930c-db02-9f67748e4427@somainline.org>
In-Reply-To: <b3f17dd3-d4b3-930c-db02-9f67748e4427@somainline.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 23 Mar 2021 09:36:58 +0100
Message-ID: <CAG3jFysRW7ObLONrcydYKk6XLetNkR1vYfqGNXL=gTdL9O4zhQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add thermal zones and
 throttling support
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, amitk@kernel.org,
        rui.zhang@intel.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-pm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Konrad,

Thanks for the review!


On Mon, 22 Mar 2021 at 18:27, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> Hi!
>
>
> > +             tsens0: thermal-sensor@c222000 {
> > +                     compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
> > +                     reg = <0 0x0C263000 0 0x1ff>, /* TM */
> > +                           <0 0x0C222000 0 0x8>; /* SROT */
>
> Please use lowercase hex

Ack

>
>
> > +             tsens1: thermal-sensor@c223000 {
> > +                     compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
> > +                     reg = <0 0x0C265000 0 0x1ff>, /* TM */
> > +                           <0 0x0c223000 0 0x8>; /* SROT */
>
> Ditto

Ack

>
>
> > +                     trips {
> > +                             cpu0_alert0: trip-point0 {
> > +                                     temperature = <90000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "passive";
> > +                             };
> > +
> > +                             cpu0_alert1: trip-point1 {
> > +                                     temperature = <95000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "passive";
>
> Shouldn't this be "hot"? Possibly ditto for all cpu*alert1-labeled nodes.

I based this patch on the upstream DTS for sm8250 & sdm845, and this
is what they use. However, if you think it is incorrect I'm happy to
do a little digging.

>
>
> > +                             };
> > +
> > +                             cpu0_crit: cpu_crit {
> > +                                     temperature = <110000>;
> > +                                     hysteresis = <1000>;
> > +                                     type = "critical";
> > +                             };
> > +                     };
>
> These values seem, err.. scorching hot.. Are they alright?

I agree :) This is what the vendor ships in their downstream DTS.

>
>
>
> > +             // TODO: What is the NSP subsystem?
> Please use C-style comments (/* foo */)

Removing comment.
