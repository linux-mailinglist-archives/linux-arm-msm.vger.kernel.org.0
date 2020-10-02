Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91595281DBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 23:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgJBVjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 17:39:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgJBVjh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 17:39:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECEDE206DC;
        Fri,  2 Oct 2020 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601674777;
        bh=EigpOxJQN1NRYUgWkdPC3dt6d4DG7VwzcQ8x6TXs15k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j4XNicKRslHPHRJomOZpo4tfYRPsNgkvNENfihlL0okeY+8olvMkrycqqhGDtWqnx
         6Yo9s2kFvY8Iz8Miuvb2l51iScLReRb8OGM95aozkkIy81UpQR7FrPKNunB7a+naoP
         zs6wLQCBhunewdyIGVWULGQ6J77qGYbl9lwWj1Z8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201002180430.GG5527@sirena.org.uk>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org> <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com> <20201001174326.GT6715@sirena.org.uk> <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com> <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org> <20201002160324.GE5527@sirena.org.uk> <160166091282.310579.8553391053258607173@swboyd.mtv.corp.google.com> <20201002180430.GG5527@sirena.org.uk>
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Mark Brown <broonie@kernel.org>
Date:   Fri, 02 Oct 2020 14:39:35 -0700
Message-ID: <160167477566.310579.12040108464021349450@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mark Brown (2020-10-02 11:04:30)
> On Fri, Oct 02, 2020 at 10:48:32AM -0700, Stephen Boyd wrote:
> > Quoting Mark Brown (2020-10-02 09:03:24)
>=20
> > > ...and doing this in the dev_name() should help other diagnostic users
> > > (like dev_printk() for example).
>=20
> > Don't thinks like dev_printk() prefix the bus name? See
> > dev_driver_string()? So I agree that having the bus name is useful, but
> > confused why there are testing scripts and things on top of regmap
> > debugfs
>=20
> Not that I've ever noticed, eg on the console.

I see things like this on my console:

[    1.684617] spmi spmi-0: PMIC arbiter version v5 (0x50000000)

and 'spmi' is the bus name I'm thinking about. But I think that's
because there isn't a driver attached. Nothing prints for the 0-00
device by default, so I enabled the debug print for it and I see

[    1.693280] pmic-spmi 0-00: 28: unknown v2.0

Anyway, the device name was written to follow i2c as far as I can tell.

If scripts, i.e. computers, have a hard time figuring out the name of
the device then fix the script?
