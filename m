Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF9C43A6C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 00:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbhJYWng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 18:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhJYWnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 18:43:31 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1141C061224
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 15:41:06 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so17088478ott.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 15:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rGiovqWqFrjBrCkSq4yv/M/dVdFQ93Lt9w4Vj0XzRp0=;
        b=e5y4X6m/JLEbzzUCH30q0NucRMH75dvcVNtZW7lTlgRhkeI8fDZaI3MwaJ98oHOBF9
         9AON2AohLOTJHPDFqfaXruw2v5cfFjOe9ZHV37z/zWk44BCXzi3PvlehCVP91827441C
         aNRN9n22sKlgYFbllqsXj/Pz7I0B5I8zSrI8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rGiovqWqFrjBrCkSq4yv/M/dVdFQ93Lt9w4Vj0XzRp0=;
        b=Pnrx1r00xtDNXmMIlQQBj2j7Nkm9JBnH6vOfRRmdm+hjY91R112XQVho7IKxU678I1
         mb3hXCPTWbPzXNx6tNngVj8Vp+uXMrxlhbLmjuGLf1CD1pBXs2Vz2XZsK5FrJLad17n3
         3m05eTSOHicFP46Lo3JAhde5OTWfyQIZs8FbEOGUPCeioAVJkfHNUmQOPFRUPcmUY5W6
         CFfsErshvcLSAvDID2gZDL9ezk6iAoEYCX/Tf+ElrIvkYCN65Ff0gld4qeyFbCBYaSgA
         SgQAczPqUtnJhSVd6b9hUKYsaZ1akv8vhRX7K9RrbKGdEaqJPNeOrQO4m9aJWEjNMc0q
         scsw==
X-Gm-Message-State: AOAM531ufzKH32LA0E0y1GCwkzc8NibIKlNb23bbDigexOn8btpq8HrI
        XrIpV7DGOgUeuGR+ZAN401vHfTYygR32OF5TunjXVQ==
X-Google-Smtp-Source: ABdhPJyrcEmmL456GTam14IOSkmcFoh1X4j7JAYEurQdEfb+O2qaOJEmFfFtS/mARLtrHH0V8dU6F38y+oknUnR1nQE=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id f14mr15179888ote.159.1635201666169;
 Mon, 25 Oct 2021 15:41:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 15:41:05 -0700
MIME-Version: 1.0
In-Reply-To: <YXck+xCJQBRGqTCw@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper> <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 25 Oct 2021 15:41:05 -0700
Message-ID: <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-25 14:43:23)
> On Mon 25 Oct 13:17 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-25 12:10:35)
> > > On Mon 25 Oct 02:07 PDT 2021, Sandeep Maheswaram wrote:
> > >
> > > > Add multi pd bindings to set performance state for cx domain
> > > > to maintain minimum corner voltage for USB clocks.
> > > >
> > > > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > > ---
> > > > v2:
> > > > Make cx domain mandatory.
> > > >
> > > >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
> > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > index 2bdaba0..fd595a8 100644
> > > > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > @@ -42,7 +42,13 @@ properties:
> > > >
> > > >    power-domains:
> > > >      description: specifies a phandle to PM domain provider node
> > > > -    maxItems: 1
> > > > +    minItems: 2
> > > > +    items:
> > > > +      - description: cx power domain
> > > > +      - description: USB gdsc power domain
> > > > +
> > > > +  required-opps:
> > > > +    description: specifies the performance state to power domain
> > >
> > > I'm still worried about the fact that we can't just rely on the USB GDSC
> > > being a subdomin of CX in order to just "turn on" CX.
> > >
> > > Afaict accepting this path forward means that for any device that sits
> > > in a GDSC power domain we will have to replicate this series for the
> > > related driver.
> > >
> >
> > I suspect the problem is that it's not just "turn on" but wanting to
> > turn it on and then set the performance state to some value based on the
> > clk frequency.
>
> I don't see an opp-table involved, just the required-opps for the
> purpose of turning CX on a little bit more. Perhaps I'm missing
> something here though.

Indeed. There's only one clk frequency for USB so only one performance
state/required-opps is used. In general that isn't the case and so we'll
eventually need to map some GDSC on/off state to the clk frequency of
whatever clk domain is associated with CX for a device.

>
> > Maybe the simplest version of that could be supported
> > somehow by having dev_pm_opp_set_rate() figure out that the 'level'
> > applies to the parent power domain instead of the child one?
>
> Having the performance_state request cascade up through the GDSC sounds
> like a nice solution; I've not looked at the code to see if this is
> feasible though.

When the binding was introduced I recall we punted on the parent child
conversion stuff. One problem at a time. There's also the possibility
for a power domain to be parented by multiple power domains so
translation tables need to account for that.

>
> > Or we may need to make another part of the OPP binding to indicate the
> > relationship between the power domain and the OPP and the parent of
> > the power domain.
>
> I suspect this would be useful if a power-domain provider needs to
> translate a performance_state into a different supply-performance_state.
> Not sure if we have such case currently; these examples are all an
> adjustable power-domain with "gating" subdomains.

Even for this case, we should be able to have the GDSC map the on state
to some performance state in the parent domain. Maybe we need to add
some code to the gdsc.c file to set a performance state on the parent
domain when it is turned on. I'm not sure where the value for that perf
state comes from. I guess we can hardcode it in the driver for now and
if it needs to be multiple values based on the clk frequency we can push
it out to an OPP table or something like that.

>
>
> PS. I think we have the same problem in the display subsystem, the
> sub-blocks are powered by MDSS_GDSC, which is a subdomain of MMCX. We
> trust the parent mdss node to keep the GDSC powered and specify MMCX as
> the power-domain for the children, so that we can affect their levels by
> respective opp-table.
>

Yes, a GDSC is really a gate on a parent power domain like CX or MMCX,
etc. Is the display subsystem an example of different clk frequencies
wanting to change the perf state of CX? If so it's a good place to work
out the translation scheme for devices that aren't listing the CX power
domain in DT.
