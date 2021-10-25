Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D4843A4A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbhJYU2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236857AbhJYU2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:28:06 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF29C04CC9F
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:17:01 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id o4so17218221oia.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=sFv6oulnfVWm3KV24cqy4zkMNUKjR06XXY8InDqsw00=;
        b=QDiai+q8Lqf5LMBLx2DhWGQnvq0RMrH2tHpBEgbx3rXXJU1etaPCLUki3NvMOiiWf8
         t/1GJIn2IejrRZjvkeRoV8LAE3d9Ps01FqQmrkk6U7FEf8+OVU2HXp50V9ve+WZ9Tyf1
         1JunLoHzZAAYHRpEGHajeJ3/3EhrykIaRZuIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=sFv6oulnfVWm3KV24cqy4zkMNUKjR06XXY8InDqsw00=;
        b=G9NbcegxAkg5GeURFmJ0aQUiLRK8BC+cZPOPz6AcmUwqEuKqRbVWw9YIEAKUiRbUgS
         UkUuQ3K2eLrt9RR5HBa/KYWW6HuL0AoO7aNM8oFv9eXpHEkB+N2ZbOap1b/NBi2iD95/
         dfa6yjskBvmB2FmPCJ94xiuXWbOFweb0AaNCUZrVv8zv7t21EUAQuf4KXD6FxYzeNn6Z
         Bnl3fa700qN3v4DTFyG9W8BhG9TnpAZsrGvdf0B5sGROrpTolRTMomj1Wem5sxpjGyvL
         UzSKVMeolIvjeTmUDz2Dgbyhr7tSS/+b94U7/AV9SrJhblJhtO5fjzdPHxM/e86kPv45
         eziA==
X-Gm-Message-State: AOAM533KBlqkZSg8uyGYDLZB+LAtz07F2D80zm1frk4m0yI/npg5ii1q
        Szst4E+N0SK2RtW6QRgn4oqBCcFIeCi4/hQS/hU+Vg==
X-Google-Smtp-Source: ABdhPJwhdypNNNtSLateKcvC+lx++2bCS+2MH4BP5EkkJROEF59u9EHq9c5I6//07zar4ce5AtumC4etyH/4t4KQ/Xc=
X-Received: by 2002:a05:6808:1d9:: with SMTP id x25mr12912230oic.64.1635193021348;
 Mon, 25 Oct 2021 13:17:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 13:17:00 -0700
MIME-Version: 1.0
In-Reply-To: <YXcBK7zqny0s4gd4@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com> <YXcBK7zqny0s4gd4@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 25 Oct 2021 13:17:00 -0700
Message-ID: <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-25 12:10:35)
> On Mon 25 Oct 02:07 PDT 2021, Sandeep Maheswaram wrote:
>
> > Add multi pd bindings to set performance state for cx domain
> > to maintain minimum corner voltage for USB clocks.
> >
> > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > ---
> > v2:
> > Make cx domain mandatory.
> >
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > index 2bdaba0..fd595a8 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > @@ -42,7 +42,13 @@ properties:
> >
> >    power-domains:
> >      description: specifies a phandle to PM domain provider node
> > -    maxItems: 1
> > +    minItems: 2
> > +    items:
> > +      - description: cx power domain
> > +      - description: USB gdsc power domain
> > +
> > +  required-opps:
> > +    description: specifies the performance state to power domain
>
> I'm still worried about the fact that we can't just rely on the USB GDSC
> being a subdomin of CX in order to just "turn on" CX.
>
> Afaict accepting this path forward means that for any device that sits
> in a GDSC power domain we will have to replicate this series for the
> related driver.
>

I suspect the problem is that it's not just "turn on" but wanting to
turn it on and then set the performance state to some value based on the
clk frequency. Maybe the simplest version of that could be supported
somehow by having dev_pm_opp_set_rate() figure out that the 'level'
applies to the parent power domain instead of the child one? Or we may
need to make another part of the OPP binding to indicate the
relationship between the power domain and the OPP and the parent of the
power domain.
