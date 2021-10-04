Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE95D4218D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhJDU67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:58:59 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174]:35242 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbhJDU65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633381020;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=E0qdQBxjh9+IrFGfHN0IpBEDVrfru3woX63k95iqOrg=;
    b=UUkwpl4uMSW7qvBwP3il0LDXLMawYRybT+N/HqGSxWmjQaH/ISNfwRWoL4e66IoYc5
    VVEhbfDhF0uZ0p3T5WbtMNVaDVRFRW95//3jn1F8NYuG9D4mIjC+/bpiee+pdHhMFwmX
    lL56hXz/wO3mAfBTnaxYjgMWLgioUNEtu+oq6JBpZDk4VJgxXokGBWxARueLIBTq8q/i
    5q0/QArRdXLnBmoDt1T2V1zONfby+ocBMHjxHnY/B+bk8YUnseF8YYAtKJSfWKNtvvmK
    /4ybXntJFgnPwLNO/FNeAR+qclwc2s6Vtwj/WQwnhfxbRAj0Id1ruWlSRgOd+FhZjWnv
    Cg1g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pWA8pmE1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KuxKT3
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:56:59 +0200 (CEST)
Date:   Mon, 4 Oct 2021 22:56:54 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 08/15] dt-bindings: arm: cpus: Document qcom,msm8916-smp
 enable-method
Message-ID: <YVtnfNA1yF3uB35Q@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
 <20210928171231.12766-9-stephan@gerhold.net>
 <YVtJIm6Tu2z+Ph/V@robh.at.kernel.org>
 <CAL_Jsq+nJH8WgSL0S4LAW6Ru_W-000+AxGQrtxskrPWViRqN5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+nJH8WgSL0S4LAW6Ru_W-000+AxGQrtxskrPWViRqN5w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 01:37:58PM -0500, Rob Herring wrote:
> On Mon, Oct 4, 2021 at 1:34 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Sep 28, 2021 at 07:12:24PM +0200, Stephan Gerhold wrote:
> > > Document the qcom,msm8916-smp enable method. It is actually just
> > > an alias for qcom,msm8226-smp since it should be implemented identically.
> > >
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > index 11e3e09da2e5..5602a8f3c513 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -211,6 +211,7 @@ properties:
> > >            - qcom,kpss-acc-v1
> > >            - qcom,kpss-acc-v2
> > >            - qcom,msm8226-smp
> > > +          - qcom,msm8916-smp
> >
> > I thought arm64 is PSCI only.
> 
> I see the explanation now. Please add that to this commit as well and
> a comment here that this is for 32-bit only.
> 

I'm not sure why this is literally the only patch in the series where
I omitted the explanation. Sorry for the confusion! :)

I clarified this in v2 and added the comment as you suggested.

Thanks!
Stephan
