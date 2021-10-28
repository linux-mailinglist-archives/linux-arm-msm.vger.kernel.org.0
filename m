Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1ECD43DEFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 12:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhJ1KiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 06:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhJ1KiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 06:38:16 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D126EC061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 03:35:49 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id n7so9864232ljp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KeoZAGDMBIfW4HtbIuTMUQfmtCFV3DmCcorhp6614FQ=;
        b=fH3Tsu/PpGaoLtxaztT9fAAhsO81SkYA4w06HUdu8zxHRzt97+3rdla0h0VE4VfEhQ
         uzpz2P+v8kPlE3Uz2zTboRiGnSUiBZqxpZ7Yk+U+QaSRcPjpwibXHHH7fkDM0oV8JHvX
         G3OKBVxIe10IzLRXOSZ3Y97pWzT8uMTSF8dPnSsydTpvcLq7VOxtekI3ZyjzbX20x2y2
         MADRjnQxgvVhPRQydDfXgw/r1zeRF/Flwk92cvexhKO6iqo09uVnY9n5xTo3YxBi/oEc
         3p5wOhC9CGlPDdixea3JKevsVO6JHEKpFq+EwpTOWCHYUTlQVo060qQRdAyH+VMJE7oS
         XZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KeoZAGDMBIfW4HtbIuTMUQfmtCFV3DmCcorhp6614FQ=;
        b=dAAwVRlaDQq9eU/UQBljAUKu0ba1P0DSxWKe5Ac3QfByI2AonAXOEw5GRWwjOWZs8H
         ZxSGRwEM1E97U9G/HyJMhhEpmgamNtrY78DxL4fhPZkeFawczHCj6VHe9KJY3GSlE5oZ
         /G9B8lEQjm5J4m4enqkPtg1S5oRRmG9Bbrwc+uBLG7Jk0cWQYK5/iXxEph58uD8Hkh9J
         wNrBzWg9SIUoEFFni9zGl0GyNR1b8LlaI2bf00w05CxI/ghSE5eY0cqvRZa1oGVbWUv/
         R5+HOTmpHSkF/jSJNMelP3M0BRFYGO9iNiXNEOQBGSGQA+x+PXJBOqDF9SN81CW6+Mwb
         saWw==
X-Gm-Message-State: AOAM532hua37fDaiWMwOvv85eRypM2FnkE5nJVkywUufO2KbPBRv1UER
        w+o9kFrQqFfzFrG3/zIXs7aJ1dA1hr4cuH94hRa62A==
X-Google-Smtp-Source: ABdhPJyY282+s+lXBMxNLUwSJyE98SfhS+h4D7Wnd+KSEcWamg6Summ3m6dw39C3xli52H6jhv/ka8yi4wSOENfCF9o=
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr3954838ljq.300.1635417348240;
 Thu, 28 Oct 2021 03:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper> <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
 <YXck+xCJQBRGqTCw@ripper> <CAE-0n530M3eft-o0qB+yEzGjZgCLMgY==ZgdvwiVCwqqCAVxxA@mail.gmail.com>
 <YXdsYlLWnjopyMn/@ripper> <CAE-0n51C4dm6bhds=ZZyje-Pcejxjm4MMa3m-VHjFgq7GZGrLw@mail.gmail.com>
 <YXjbs3Bv6Y3d87EC@yoga> <CAPDyKFrWQdvZX4ukHZoGz73JPfQSgqVrG_4ShMp_GrxL0NKLvg@mail.gmail.com>
 <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org>
In-Reply-To: <da877712-dac9-e9d0-0bfc-25bef450eb65@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 Oct 2021 12:35:11 +0200
Message-ID: <CAPDyKFoMpmkHgUbRN4pxgW2Gy=aZpS=eVwQrg0ydFbh9_GFG6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[...]

> >>> Got it. So in this case we could have the various display components
> >>> that are in the mdss gdsc domain set their frequency via OPP and then
> >>> have that translate to a level in CX or MMCX. How do we parent the power
> >>> domains outside of DT? I'm thinking that we'll need to do that if MMCX
> >>> is parented by CX or something like that and the drivers for those two
> >>> power domains are different. Is it basic string matching?
> >>
> >> In one way or another we need to invoke pm_genpd_add_subdomain() to link
> >> the two power-domains (actually genpds) together, like what was done in
> >> 3652265514f5 ("clk: qcom: gdsc: enable optional power domain support").
> >>
> >> In the case of MMCX and CX, my impression of the documentation is that
> >> they are independent - but if we need to express that CX is parent of
> >> MMCX, they are both provided by rpmhpd which already supports this by
> >> just specifying .parent on mmcx to point to cx.
> >
> > I was trying to follow the discussion, but it turned out to be a bit
> > complicated to catch up and answer all things. In any case, let me
> > just add a few overall comments, perhaps that can help to move things
> > forward.
> >
> > First, one domain can have two parent domains. Both from DT and from
> > genpd point of view, just to make this clear.
> >
> > Although, it certainly looks questionable to me, to hook up the USB
> > device to two separate power domains, one to control power and one to
> > control performance. Especially, if it's really the same piece of HW
> > that is managing both things.
> []..
> > Additionally, if it's correct to model
> > the USB GDSC power domain as a child to the CX power domain from HW
> > point of view, we should likely do that.
>
> I think this would still require a few things in genpd, since
> CX and USB GDSC are power domains from different providers.
> Perhaps a pm_genpd_add_subdomain_by_name()?
>

I think of_genpd_add_subdomain() should help to address this. No?

Kind regards
Uffe
