Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092853AA576
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 22:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhFPUmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 16:42:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233560AbhFPUmj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 16:42:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E09D061076;
        Wed, 16 Jun 2021 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623876033;
        bh=mhLIWZiGeiG2xrFjpuiGWElCi/uYrQ99Uv8/gqQ5NXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qUajzdGGeCVQE2tR6QDK7HHm3PJpC7IP3CsF2AeFMLxGwLx9Lu4koeza4lUN+j2Re
         RtBQOUSxrAsTw71Op/fXcJFRzkK0e/6eqElJLtanjxwY0ZYvPdKGDMt93FYLNc4w0j
         OZ6XVJ0KodJeHZFSDEU9k6GOs/90t1d7yUPmENmgjnWrEPaYPzmjOrwrofRvVRi01k
         CrxSvL5q9HEfYl236pUogfptpAhUiY+Ayeg+NanQ+jnf8OBgy6Z5OugT1U1Ya2HLI6
         M0EcsUhfOPBIb98K+WfA6yZYB5Ullzn7kgtHwYH7u6vHw8H6L9d2Rl7c9tPJp/A1qO
         X7bZgewuVXBEw==
Date:   Wed, 16 Jun 2021 21:40:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Cheng-yi Chiang <cychiang@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Andy Gross <agross@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
Message-ID: <20210616204012.GD6418@sirena.org.uk>
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
 <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
 <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
 <7748e621-ba54-db90-6b56-23e006eb1dbe@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline
In-Reply-To: <7748e621-ba54-db90-6b56-23e006eb1dbe@linux.intel.com>
X-Cookie: Revenge is a form of nostalgia.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 16, 2021 at 11:23:36AM -0500, Pierre-Louis Bossart wrote:

> > On this platform there is no TDM support, so there were two I2S data lines.

> Interesting, I haven't seen such 'multi-lane' solutions so far for I2S.

They're moderately common for high end systems (eg, you'll see surround
sound systems do this) - it makes it easier to find higher performance
DACs if you can use regular stereo DACs and it helps a bit with layout
if you can run slower digital signals.  There's controllers upstream
that do this without needing to tie together multiple stereo controllers
on the SoC side, one of the variants of the Samsung I2S controllers does
it for example.

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDKYasACgkQJNaLcl1U
h9DJTgf9GVaBIAfl61pF8E56hCwdxoKRTFOYvXMS9Ro1gyi92ejk9latUAcVfHWS
qyfSyeafsZNSMo4/ZHQ6hesfIikj3o7+WDlBf7f74rjQ/2sF2FKVtzqN0CG0/WQ/
3lFWBL+U/OzQUyBp4GzjndcxgiArjFZ4FqQ0gLM/X/H+cSTThEULsPK1YVZKrbZo
2BUv284pzIGcc2+M7eJK/ssifFkGUBkRoBQGb61GKJSFP9JbWCGLN1iDpj+ruCv1
x6noeMrPikdrtg9bqg2B1xos7vBbi8fgRs/J1T6fynimQ/3G7VwBHJrX50aLoBnH
1lN8LTDUGFKCoBTiT5AUCd0K1Q1gUg==
=qHwR
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
