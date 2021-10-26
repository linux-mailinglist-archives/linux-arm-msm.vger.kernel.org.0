Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242BC43AA75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 04:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbhJZCsu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 22:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbhJZCst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 22:48:49 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6365C061348
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 19:46:26 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id l24-20020a9d1c98000000b00552a5c6b23cso17725271ota.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 19:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fNJEWmbc5F3iZTFtMpvuRuP6v2KdIvW972u1Kqe/0GM=;
        b=hLA76FBAWKCorHaVgR34RZkpRLv4fqLHBF4RTe+TqR3UxiFAlEx8aRJXKHOq67tZTe
         ep7GMAc3Qviokz3G3gpvTy3OgWAqkJ4ZpvafVJLQ8abzHFztYsWYFIHNHAaQ8ODzB4Ze
         nkI69DUHB+NZjAAYbKGdnGpiCFFUOWp/k5+dhyjfJi1sSrAZbj4m2dFC97SLu4HUI6/0
         4oU6JMtnH+o7KaJWMbijAcmWYUt2eDLCFRyATQkfUIqbtzHFv9ZsQe0cdJNahtUdFap0
         iemEXRRz1F6QEdFA3uKbUiwKdVLDRpe7c2xJoS0P0SDCdcNKuO0iT9KgIpymazWOXFXM
         5oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fNJEWmbc5F3iZTFtMpvuRuP6v2KdIvW972u1Kqe/0GM=;
        b=TyGGOBG+jumpe/C+S7MwTAGQVjeNxmLkpedL17xiIoROn5xw6ucx8ThBlNweR/ux5T
         GIIlpfIIkluM/FNvfjswDtmIx1tv1MW+ZpraDqiwXR+Mo2AZQupkKnNPhfMN6VMuaPME
         OgwQXjDkLSniTmbzeh5IUsl4gF4mpjdIgHJe7d8Vhfe0HoSu/qBpWyRaKKDkq8olUy5o
         +N8vaKtxwemNPx1Ssq12x/EPazbyU7ly+jkhMfo2B0/UEf0yiC4YWihHeWT/26SRjdwP
         W6om+TbYbbL5qtAqpKQRd4Q5i/+A2lkNZCnDU6MWdQmvJpcShtKEfXBK9x+/QwfnnpI1
         AI5w==
X-Gm-Message-State: AOAM532CQVlZBBFmyewqfrEFVKhxisuATUS0b8yWMqb1PuYySlwv7Tgh
        u2c2C6gH0jUXw0CLQKf8n//x1g==
X-Google-Smtp-Source: ABdhPJzZnGPL7jx+BaO7sWh6d98A+NYjtnR3AXtmeSyrTFZYCLlkqdQBDdPoJS6MLunFyYkgz6Jn0A==
X-Received: by 2002:a9d:611b:: with SMTP id i27mr16648120otj.323.1635216385800;
        Mon, 25 Oct 2021 19:46:25 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w28sm3469138ooc.3.2021.10.25.19.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 19:46:25 -0700 (PDT)
Date:   Mon, 25 Oct 2021 19:48:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd
 bindings for dwc3 qcom
Message-ID: <YXdsYlLWnjopyMn/@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper>
 <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper>
 <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Oct 15:41 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-25 14:43:23)
> > On Mon 25 Oct 13:17 PDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-10-25 12:10:35)
> > > > On Mon 25 Oct 02:07 PDT 2021, Sandeep Maheswaram wrote:
> > > >
> > > > > Add multi pd bindings to set performance state for cx domain
> > > > > to maintain minimum corner voltage for USB clocks.
> > > > >
> > > > > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > > > ---
> > > > > v2:
> > > > > Make cx domain mandatory.
> > > > >
> > > > >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
> > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > index 2bdaba0..fd595a8 100644
> > > > > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > @@ -42,7 +42,13 @@ properties:
> > > > >
> > > > >    power-domains:
> > > > >      description: specifies a phandle to PM domain provider node
> > > > > -    maxItems: 1
> > > > > +    minItems: 2
> > > > > +    items:
> > > > > +      - description: cx power domain
> > > > > +      - description: USB gdsc power domain
> > > > > +
> > > > > +  required-opps:
> > > > > +    description: specifies the performance state to power domain
> > > >
> > > > I'm still worried about the fact that we can't just rely on the USB GDSC
> > > > being a subdomin of CX in order to just "turn on" CX.
> > > >
> > > > Afaict accepting this path forward means that for any device that sits
> > > > in a GDSC power domain we will have to replicate this series for the
> > > > related driver.
> > > >
> > >
> > > I suspect the problem is that it's not just "turn on" but wanting to
> > > turn it on and then set the performance state to some value based on the
> > > clk frequency.
> >
> > I don't see an opp-table involved, just the required-opps for the
> > purpose of turning CX on a little bit more. Perhaps I'm missing
> > something here though.
> 
> Indeed. There's only one clk frequency for USB so only one performance
> state/required-opps is used. In general that isn't the case and so we'll
> eventually need to map some GDSC on/off state to the clk frequency of
> whatever clk domain is associated with CX for a device.
> 

Makes sense, just because we don't use opp-tables to scale the frequency
and performance_state, the issue remains the same.

> >
> > > Maybe the simplest version of that could be supported
> > > somehow by having dev_pm_opp_set_rate() figure out that the 'level'
> > > applies to the parent power domain instead of the child one?
> >
> > Having the performance_state request cascade up through the GDSC sounds
> > like a nice solution; I've not looked at the code to see if this is
> > feasible though.
> 
> When the binding was introduced I recall we punted on the parent child
> conversion stuff. One problem at a time. There's also the possibility
> for a power domain to be parented by multiple power domains so
> translation tables need to account for that.
> 

But for this case - and below display case - the subdomain (the device's
power-domain) is just a dumb gate. So there is no translation, the given
performance_state applies to the parent. Or perhaps such implicitness
will come back and bite us?

I don't think we allow a power-domain to be a subdomain of two
power-domains - and again it's not applicable to USB or display afaict.

> >
> > > Or we may need to make another part of the OPP binding to indicate the
> > > relationship between the power domain and the OPP and the parent of
> > > the power domain.
> >
> > I suspect this would be useful if a power-domain provider needs to
> > translate a performance_state into a different supply-performance_state.
> > Not sure if we have such case currently; these examples are all an
> > adjustable power-domain with "gating" subdomains.
> 
> Even for this case, we should be able to have the GDSC map the on state
> to some performance state in the parent domain. Maybe we need to add
> some code to the gdsc.c file to set a performance state on the parent
> domain when it is turned on. I'm not sure where the value for that perf
> state comes from. I guess we can hardcode it in the driver for now and
> if it needs to be multiple values based on the clk frequency we can push
> it out to an OPP table or something like that.
> 

For the GDSC I believe we only have 1:1 mapping, so implementing
set_performance_state to just pass that on to the parent might do the
trick (although I haven't thought this through).

Conceptually I guess this would be like calling clk_set_rate() on a
clock gate, relying on it being propagated upwards. The problem here is
that the performance_state is just a "random" integer without a well
defined unit.



The one case where I believe we talked about having different mapping
between the performance_state levels was in the relationship between CX
and MX. But I don't think we ever did anything about that...

> >
> >
> > PS. I think we have the same problem in the display subsystem, the
> > sub-blocks are powered by MDSS_GDSC, which is a subdomain of MMCX. We
> > trust the parent mdss node to keep the GDSC powered and specify MMCX as
> > the power-domain for the children, so that we can affect their levels by
> > respective opp-table.
> >
> 
> Yes, a GDSC is really a gate on a parent power domain like CX or MMCX,
> etc. Is the display subsystem an example of different clk frequencies
> wanting to change the perf state of CX? If so it's a good place to work
> out the translation scheme for devices that aren't listing the CX power
> domain in DT.

Yes, the various display components sits in MDSS_GDSC but the opp-tables
needs to change the performance_state of MDSS_GDSC->parent (i.e. CX or
MMCX, depending on platform).

As I said, today we hack this by trusting that the base drm/msm driver
will keep MDSS_GDSC on and listing MMCX (or CX) as power-domain for each
of these components.


So if we solve this, then that seems to directly map to the static case
for USB as well.

Regards,
Bjorn
