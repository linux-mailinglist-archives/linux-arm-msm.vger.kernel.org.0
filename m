Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF22B0E21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 20:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgKLTda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 14:33:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:39164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgKLTd3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 14:33:29 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E5C920A8B;
        Thu, 12 Nov 2020 19:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605209608;
        bh=LrGiLo81+yWfEwhJ7Mb3DWrox8fOrg53K1x/vrmEPgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aBCskPSgCcdUNs59Pgegia+K1BoykcH7JuJpGJi3ROox1Ncp+cBEOERlbHxbqRhKk
         B31sBd895pSnQuCKIs5niBy81nuqI5i+4cugmyu0ZRjz2kXw4SC69cNl2nCWLSYGE8
         Qw/TWzeB0cI31hUNIf5AJ9PPhbGvhYYhMj/8n1HE=
Date:   Thu, 12 Nov 2020 19:33:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regmap-irq: Add support for peripheral offsets
Message-ID: <20201112193312.GE4742@sirena.org.uk>
References: <cover.1603402280.git.gurus@codeaurora.org>
 <40581a58bd16442f03db1abea014ca1eedc94d3c.1603402280.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline
In-Reply-To: <40581a58bd16442f03db1abea014ca1eedc94d3c.1603402280.git.gurus@codeaurora.org>
X-Cookie: Danger: do not shake.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2020 at 02:35:40PM -0700, Guru Das Srinagesh wrote:

> Some MFD chips do not have the register space for their peripherals
> mapped out with a fixed stride. Add peripheral address offsets to the
> framework to support such address spaces.

> In this new scheme, the regmap-irq client registering with the framework
> shall have to define the *_base registers (e.g. status_base, mask_base,
> type_base, etc.) as those of the very first peripheral in the chip, and
> then specify address offsets of each subsequent peripheral so that their
> corresponding *_base registers may be calculated by the framework. The
> first element of the periph_offs array must be zero so that the first
> peripherals' addresses may be accessed.

> Some MFD chips define two registers in addition to the IRQ type
> registers: POLARITY_HI and POLARITY_LO, so add support to manage their
> data as well as write to them.

It is difficult to follow what this change is supposed to do, in part
because it looks like this is in fact two separate changes, one adding
the _base feature and another adding the polarity feature.  These should
each be in a separate patch if that is the case, and I think each needs
a clearer changelog - I'm not entirely sure what the polarity feature is
supposed to do.  Nothing here says what POLARITY_HI and POLARITY_LO are,
how they interact or anything.

For the address offsets I'm not sure that this is the best way to
represent things.  It looks like the hardware this is trying to describe
is essentially a bunch of separate interrupt controllers that happen to
share an upstream interrupt and I think that the code would be a lot
clearer if at least the implementation looked like this.  Instead of
having to check for this array of offsets at every use point (which is
going to be rarely used and hence prone to bugs) we'd have a set of
separate regmap-irqs and then we'd mostly only have to loop through them
on handling, the bulk of the implementation wouldn't have to worry about
this special case.

Historically genirq didn't support sharing threaded interrupts, if
that's not changed we'd need to open code everything inside regmap-irq
but it would be doable, or ideally genirq could grow this feature.  If
it's done inside regmap you'd have a separate API that took an array of
regmap-irq configurations instead of just one and then when an interrupt
is delivered just loops through all of them handling it.  A quick scan
through the interrupt code suggests it might be able to cope with shared
IRQs now though which would make life easier.

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+tjfcACgkQJNaLcl1U
h9D4Mwf9GAvnTM5lPHUXGy32dT+1bJ8OVOtn3F7SO7JDh4AlJFKR5bHpc9GJzgMH
7MW3gGLdP9s/5nuCl+jfwGNJLDZMM6Yiuj+4vmnL0CXjWGtmHBArHXUewIYQ8x4H
id5KQ+MW9t0BjQg13z6Q7xwNaWFMyZEGdif7/wJV2JVOMVqSn92EdRm3OaXXhK3V
Ewdkv54z/IbOJLlbTmP8EVJo8FikDZoCDAvfWeRfZDmj97EqykbPSr8I0yiJi1Pm
uyKK8D02j987od7Q4tTP5N7ODMp3265o9rpM7KqQyn22GCC6IcyzCD2hJSzZcvks
eLhpkTAvjEdzU5OnMA9W2dITG2cF9g==
=HvZ7
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
