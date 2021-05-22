Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014FD38D638
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 16:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhEVO6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 May 2021 10:58:20 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:53592 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhEVO6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 May 2021 10:58:19 -0400
Received: from antares.kleine-koenig.org (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 340FEBA731A;
        Sat, 22 May 2021 16:56:53 +0200 (CEST)
Received: from antares.kleine-koenig.org ([94.130.110.236])
        by antares.kleine-koenig.org (antares.kleine-koenig.org [94.130.110.236]) (amavisd-new, port 10024)
        with ESMTP id 0W5ZC5VCjR6Y; Sat, 22 May 2021 16:56:51 +0200 (CEST)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5c8:7b00:dbda:c056:f5db:7aa3])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Sat, 22 May 2021 16:56:51 +0200 (CEST)
Subject: Re: [PATCH] clk: qcom: Simplify usage of dev_err_probe()
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210427164522.2886825-1-uwe@kleine-koenig.org>
 <20210427165612.GH1908499@yoga>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Message-ID: <6137d093-7b63-aead-e94d-548b70c34b7c@kleine-koenig.org>
Date:   Sat, 22 May 2021 16:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427165612.GH1908499@yoga>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0MBJHBZwzPGENCIYSjuON4oJ54LNvT0gB"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0MBJHBZwzPGENCIYSjuON4oJ54LNvT0gB
Content-Type: multipart/mixed; boundary="Ga9Xhj853vmYjKG2VhxJRCmmvNLO3fTnL";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-ID: <6137d093-7b63-aead-e94d-548b70c34b7c@kleine-koenig.org>
Subject: Re: [PATCH] clk: qcom: Simplify usage of dev_err_probe()
References: <20210427164522.2886825-1-uwe@kleine-koenig.org>
 <20210427165612.GH1908499@yoga>
In-Reply-To: <20210427165612.GH1908499@yoga>

--Ga9Xhj853vmYjKG2VhxJRCmmvNLO3fTnL
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

On 4/27/21 6:56 PM, Bjorn Andersson wrote:
> On Tue 27 Apr 11:45 CDT 2021, Uwe Kleine-K?nig wrote:

@Bjorn Andersson: Your MUA is broken, it misquotes the =C3=B6 in my name =
(in=20
the mail and the To header).

>> dev_err_probe() returns the error code passed as second parameter. Als=
o if
>> the error code is -EPROBE_DEFER dev_err_probe() is silent, so there is=20
no
>> need to check for this value before calling dev_err_probe().
>>
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

thanks.

This patch is nearly a month old now. Is drivers/clk still maintained?

Best regards
Uwe


--Ga9Xhj853vmYjKG2VhxJRCmmvNLO3fTnL--

--0MBJHBZwzPGENCIYSjuON4oJ54LNvT0gB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCpG64ACgkQwfwUeK3K
7AkGUQgAnLol06BKwtGCxgtikEEwwXgUC2F4MoktyUyRAlG+bBPqRsYBbnbvagOL
gxK7X+jn+bk/22F2Sf75GOzsH7pP88FkVAdp3sZgQ1Y+nsy1B2PzB0pGYi8qWtZS
6qOckKRN4KRZQpVtHiYO9mIZ1cDtSRru7XQ6TnKpdso/JpVe2qV+kan+NJd71d2l
YDNaPYlvV/JsTZAGMU8Pg8oOkhQwgkCOKrU8aaorrAcNiXqtYhSgVumMlVjlhm0c
mUOsz9ul6Kj61+anD9KpmPPI6SUqZaVVkicGHxnTlZaeXnx+ls/Lqv8xn7na3kqE
igi5SrKFm3GuxIWzJcFnFyyUraKyXw==
=aCV9
-----END PGP SIGNATURE-----

--0MBJHBZwzPGENCIYSjuON4oJ54LNvT0gB--
