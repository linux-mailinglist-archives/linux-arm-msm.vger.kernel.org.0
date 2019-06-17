Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECF3489AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 19:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbfFQRHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 13:07:39 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42422 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfFQRHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 13:07:39 -0400
Received: by mail-io1-f68.google.com with SMTP id u19so22750794ior.9;
        Mon, 17 Jun 2019 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rdqUlGrEYD86Fq867n4owt7Wkc9SZCicB3eNXu7fGMk=;
        b=tF6fsaJR87ht7IzZwwSC8c88/y0R77LtePPjIOyUAnN0hDXHQ//VfGLZFw3QSVlK53
         nChEbNxTtrljnaC4bzzGhT/NEbzoK8ewydMfLkGdJoeE7I4XtZcZfDa9wtWBsmyyZyJk
         KtsClCuByzWPxtGg22rsypS65c9Jrn19ZAeCwQ/0cizoXU59JA2fAbW9kI2DIDJxxTiK
         wFvBEpP442ZqNmuuU8jF5tE31F2D4Q+PArcIO1ofOPSgOJ3bYZD32KFE+N20KqeytRCf
         K48Exk7Ef4bOocun0FUjh63zDt7jmicUOgvj2NxbfV23fPIn39ESiXNt2jKioidz3uF/
         sHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdqUlGrEYD86Fq867n4owt7Wkc9SZCicB3eNXu7fGMk=;
        b=pb0B46vfZwv0+1Tmxif+fcUainu9BXAAz1E8+HY5MxiG5fbMKN2sg5Q0O+cmTM/iB5
         3R90IJSCGDrf3vUd15BDB2b5uOvV9blLt0VQ6S4JVmiH36dBdD4ZEhcA62gUK3Rjzif/
         itwXnEUK0QhYi8T8H86x6kj3DxT9fvhtXOyxhhnaqPBpPmklPy8Z7VbcVY5/AAIO0o7j
         iKQ/3aCm7QFk9yp4S9JycIGTY0RM/lEcxyasrBC5e3oVzpZxy5kUDNz58H+q0laMio3B
         rR0AEFTKtsGUzF7Ccjifq9ZtVXgfo5Le2T2dgs1y9Ia7sBNjeJckp5ByT/PHD2synQGI
         KWvw==
X-Gm-Message-State: APjAAAUIIy+P2h9RJ/lTlIa6VgXRI2Ddd9/ZOQwloMjVX58g/nFRb3af
        PCq5E9cnlg/x/yA79XR5cu35t47NHhA1JzYJBC4=
X-Google-Smtp-Source: APXvYqzl4RiKWCnwfj4UX30/hJVWGbPqdCVJBVBlNMZsLLbP/NBIGigkCWb0IC/mzvYb22HsNuPmZJx7LiUmyai28SU=
X-Received: by 2002:a02:1384:: with SMTP id 126mr79262437jaz.72.1560791248451;
 Mon, 17 Jun 2019 10:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com> <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk> <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
 <20190617160358.GC5316@sirena.org.uk>
In-Reply-To: <20190617160358.GC5316@sirena.org.uk>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 17 Jun 2019 11:07:18 -0600
Message-ID: <CAOCk7Nrnd7yJQ=0pO64iT+RfmsKfJW0x0RhrmSLkO_brFqZ2+Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 10:04 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jun 17, 2019 at 09:17:21AM -0600, Jeffrey Hugo wrote:
> > On Mon, Jun 17, 2019 at 9:05 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > > +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> > > > +                                           unsigned selector)
> > > > +{
>
> > > > +     mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
>
> > > This could just be a set_voltage_sel(), no need for it to be a
> > > set_voltage() operation....
>
> > This is a set_voltage_sel() in spmi_ftsmps426_ops.  Is the issue because this
> > function is "spmi_regulator_ftsmps426_set_voltage" and not
> > "spmi_regulator_ftsmps426_set_voltage_sel"?
>
> Well, that's certainly confusing naming and there's some confusion in
> the code about what a selector is - it's supposed to be a raw register
> value so if you're having to convert it into a voltage something is
> going wrong.  Just implement a set_voltage() operation?

No.

Is what a selector is documented anywhere?  I just looked again and I
haven't found
documentation explaining that a selector is the raw register value.

Now I understand why this driver has the hardware to software selector
translation.
The selector being the raw register value seems to be a very limited
assumption that
I don't see working for more than very basic implementations.

We've already figured out a virtualized selector mapping, I don't want
to reimplement
the complicated math to correctly map a requested voltage range to
what the regulator
can provide, and possibly get it wrong, or at the very least have two duplicate
implementations.

The naming is consistent with the rest of the driver, and the name
seems long enough
already.  Lets just keep this.

>
> > We already have code in the driver to convert a selector to the
> > voltage.  Why duplicate
> > that inline in spmi_regulator_ftsmps426_set_voltage?
>
> Either work with selectors or work with voltages, don't mix and match
> the two.

Fine.  I'll fix up the get() to return the selector, and not the
voltage since that works better
with everything else that is implemented.

Again, it would be nice if the documentation for regulator_ops
indicated that a driver
should only implement the voltage operations or the selector
operations, not mix and
match if that is your expectation.

>
> > > > +     switch (mode) {
> > > > +     case REGULATOR_MODE_NORMAL:
> > > > +             val = SPMI_FTSMPS426_MODE_HPM_MASK;
> > > > +             break;
> > > > +     case REGULATOR_MODE_FAST:
> > > > +             val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> > > > +             break;
> > > > +     default:
> > > > +             val = SPMI_FTSMPS426_MODE_LPM_MASK;
> > > > +             break;
> > > > +     }
>
> > > This should validate, it shouldn't just translate invalid values into
> > > valid ones.
>
> > Validate what?  The other defines are REGULATOR_MODE_IDLE
> > and REGULATOR_MODE_STANDBY which correspond to the LPM
> > mode.  Or are you suggesting that regulator framework is going to pass
> > REGULATOR_MODE_INVALID to this operation?
>
> You should be validating that the argument passed in is one that the
> driver understands, your assumption will break if we add any new modes
> and in any case there should be a 1:1 mapping between hardware and API
> modes so you shouldn't be translating two different API modes into the
> same hardware mode.

Fine.  I'll fix this per what you've stated.

Again, would be nice if the documentation for the API modes clearly indicated
they should match to one specific HW setting incases where the HW doesn't
match the API 1:1.
