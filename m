Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 574FE1853B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2020 02:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgCNBPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 21:15:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgCNBPV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 21:15:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 847142074A;
        Sat, 14 Mar 2020 01:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584148520;
        bh=K5BEDgn6puHQRO0je2cYxXMrBtW98BD3fqUabckzk5w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I1134r+WeW0fPSfteZUhZTBJUUswIxI3xGHFaFmklgV841fyHQse4/vEp2Sk/8+jN
         /CxPMJ5i9S4NBggC2DR3/tbk1KjRCV13i55wmMW6DkdfJBr2lL4fvosAVe5b/C9Wsu
         wk7DqbYo7OD2GPl0yi+A3BX+KZJykLpGQatOwxSA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00e201d5f97d$3e76a9d0$bb63fd70$@gmail.com>
References: <20200313185406.10029-1-ansuelsmth@gmail.com> <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com> <00e201d5f97d$3e76a9d0$bb63fd70$@gmail.com>
Subject: Re: R: [PATCH] ipq806x: gcc: Added the enable regs and mask for PRNG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     'Abhishek Sahu' <absahu@codeaurora.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Michael Turquette' <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     agross@kernel.org, ansuelsmth@gmail.com
Date:   Fri, 13 Mar 2020 18:15:19 -0700
Message-ID: <158414851968.164562.17479742036394576642@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting ansuelsmth@gmail.com (2020-03-13 14:20:36)
>=20
>=20
> > -----Messaggio originale-----
> > Da: Stephen Boyd <sboyd@kernel.org>
> > Inviato: venerd=C3=AC 13 marzo 2020 21:30
> > A: Ansuel Smith <ansuelsmth@gmail.com>; agross@kernel.org
> > Cc: Ansuel Smith <ansuelsmth@gmail.com>; Abhishek Sahu
> > <absahu@codeaurora.org>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>; Michael Turquette
> > <mturquette@baylibre.com>; linux-arm-msm@vger.kernel.org; linux-
> > clk@vger.kernel.org; linux-kernel@vger.kernel.org
> > Oggetto: Re: [PATCH] ipq806x: gcc: Added the enable regs and mask for
> > PRNG
> >=20
> > Quoting Ansuel Smith (2020-03-13 11:54:06)
> > > kernel got hanged while reading from /dev/hwrng at the
> > > time of PRNG clock enable
> > >
> > > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >=20
> > Is Abhishek the author? Otherwise the tag chain here looks wrong.
> >=20
>=20
> Yes Abhishek is the author.
>=20
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> >=20
> > Is there some Fixes: tag we can get here too?
> >=20
>=20
> Think  I should put the commit that added the gcc. Right?
>=20

Yes.
