Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EA132DA9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 20:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236247AbhCDTxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 14:53:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:47638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231969AbhCDTxw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 14:53:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEF1764F60;
        Thu,  4 Mar 2021 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614887592;
        bh=aKfROlW6yt2qNu6xFPea/Qku5lp+xUm/2rId3LuoEoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UpE/cobWrecDZuQKRpqXV7X0Sinqf8F0DcNW2h0Jtj+5dPKmAw1EW/z5QK1Eudyo5
         GyrcYzqNBK/ek2Dk1d6XkALrQ7E0w8Mrbdd4fgT5Bj6pLjFNxMGo/xGKYXUZoQCD5+
         dbg+TKEt256VEckp8XLaNLmmUFcLc9wH91FoO/tHe6W70Dcyki7lUw8Et3lKQnuw0O
         atl098HVyFZj08thgJ+sFz60z5icjvDinYKv/o47uYlDrX2Yhl0q0hwAFsKMXZ7HPw
         LPZFUvxyICXuS7m7mrOpQTgkDN5XhNqwWoSTKp50vLhAFmtfk4kfoQB1LLUgN1zgO4
         Sy6s17ruD03pA==
Date:   Thu, 4 Mar 2021 19:52:04 +0000
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
Message-ID: <20210304195204.GF4731@sirena.org.uk>
References: <cover.1603402280.git.gurus@codeaurora.org>
 <40581a58bd16442f03db1abea014ca1eedc94d3c.1603402280.git.gurus@codeaurora.org>
 <20201112193312.GE4742@sirena.org.uk>
 <20210304182735.GA31587@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
In-Reply-To: <20210304182735.GA31587@codeaurora.org>
X-Cookie: I think my career is ruined!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 10:27:35AM -0800, Guru Das Srinagesh wrote:
> On Thu, Nov 12, 2020 at 07:33:12PM +0000, Mark Brown wrote:

> > supposed to do.  Nothing here says what POLARITY_HI and POLARITY_LO are,
> > how they interact or anything.

> The POLARITY_HI and POLARITY_LO registers were described very briefly in
> the cover letter. If an interrupt is already configured as either edge-
> or level-triggered, setting the corresponding bit for it in the
> POLARITY_HI register further configures it as rising-edge or level-high
> triggered (as the case may be), while setting the same bit in
> POLARITY_LO further configures it as falling-edge or level-low
> triggered. I could certainly add this information to the commit message
> as well.

So this is just a trigger type control that's in two discontiguous bits
possibly in different registers or something?  This doesn't sound like
anything generic with the API you're describing, if that's what it is
the interface should also handle things like four bits (one for each
type) or having the different values mapped differently within the two
bits that are spread out (eg, you could have one bit for polarity and
another for edge/level).

> > For the address offsets I'm not sure that this is the best way to
> > represent things.  It looks like the hardware this is trying to describe
> > is essentially a bunch of separate interrupt controllers that happen to
> > share an upstream interrupt

> Sorry but isn't this essentially the same as what the framework already knows as
> the "sub-irq" concept, with the key difference that the register stride
> is not fixed? Everything else is the same (except for a couple of minor
> points noted below) - a main IRQ register that indicates sub-irq blocks
> that have unhandled interrupts, as well as interrupt handling and
> servicing.

Like I said in my original review it is extremely hard to tell from your
patch what you are trying to implement, and it's now been more than four
months since you sent it which isn't helping anything.  This means it is
also extremely hard to tell if the patch is doing the same thing as
sub_irq.

IIRC it appeared that there was no top level interrupt status register,
the point with sub_irq is that we don't need to read all the status
registers because there's a top level status register which says which
of them have signals in them (including the possibility that more than
one bit in the top level status might indicate the same leaf status
register).  If the device doesn't have that it doesn't have sub_irqs.
Note that sub_irq only affects status register reads, it doesn't affect
other things like acking or masking.

On the other hand if this *is* the same thing as sub_irqs then why is it
completely separate code and not sharing anything with it?

As I said at the time you need to split this into at least two distinct
patches with clear changelogs which explain what they are trying to
implement, I don't think it's useful to discuss this further without
that.  I can't give you any clearer advice on how to implement whatever
you are trying to implement without having some idea of what that is.

> > clearer if at least the implementation looked like this.  Instead of
> > having to check for this array of offsets at every use point (which is
> > going to be rarely used and hence prone to bugs)

> Well, using irq_reg_stride already does exactly this - calculating the
> right register to access at every use point, as an offset from the _base
> register (status, ack, type, et c.). Peripheral offsets would just be
> another way of calculating the right register, that's all. And we could
> have a macro as well.

The stride code is executed in all paths, it doesn't add conditional
statements all over the place.  This helps a lot, we know it's being run
all the time as opposed to being a lot of separate code paths that are
rarely run - the case without a stride is just a stride of 1.

> Sure, I can look into how this approach would look like, but given that
> the QCOM register arrangement of main vs sub-irq is essentially the same
> as what the framework currently understands, couldn't we simply have a
> macro to change the way the right register offset is calculated
> (irq_reg_stride vs. peripheral offsets)?

I'm not sure macros all over the place is going to be clearer than
conditional statements all over the place.  As with what you were saying
about sub_irq if you think the two things are equivalent then why is one
not implemented in terms of the other rather than doing conditional code
on every single use?

> Also, could you elaborate more on the genirq route? I'm not sure where
> to start looking to evaluate one route vs the other.

Register a separate regmap-irq for each of these perhiperals in your
list, using the same parent interrupt for all of them and setting
IRQF_SHARED.  They will then be handled like any other shared interrupt,
if the parent interrupt fires then genirq will go through and call each
of the handlers until one reports that it handled an interrupt.

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBBOmMACgkQJNaLcl1U
h9Ci/wf/YdAWi2sLpT85ZACdQRt7UQEBt6s5oCAHS4JkLd3uk1MHLUDAmQbpxbZw
sZyBtxUiALtcItac49fePucY6fBs1Ad63NP+7oICKszol3wBfzlmUHi+U3mWUqgT
ZjTQ3J9hPSuzLWWZNhK/7noyLZXxWe0YRmQy8HkHCfB0wyrfC9tPtccHhVnUzuhV
yy84zXU/gMaYcxwse7vs1K7MnQQLz2CR6leKSlwOeVhA/qi5X2wxCThSEVflyJYK
RTNaQ0Cj+6BBTUeKHYC+15IRr02KvaSZQF09K7dXC8zj0cVHaMnAQ3GwWjsPf0gw
eHPLtI/R4kNoFDCzioIf89dHcHBNGg==
=SQVA
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
