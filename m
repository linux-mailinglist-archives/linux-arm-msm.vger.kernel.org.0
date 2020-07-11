Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A4821C1B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 03:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgGKB7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 21:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgGKB7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 21:59:36 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFF7C08C5DC;
        Fri, 10 Jul 2020 18:59:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B3Y4f3D85z9sQt;
        Sat, 11 Jul 2020 11:59:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594432771;
        bh=l+rJw1Tu2JK+3XbtUHCAR+kbg7O3EQjKjtKhEmGOaxw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BKPG79MzuNL9TNqi3N8II5wdHquXF+7x0aqRhOiBKLuiCNCVjDaeID7F9G0Y5UX4K
         4yzwaZe2ho1O2AeLdfFBhvXlkrS5E8XOkU+BLQLdZ7GZGNOK8bhPSkhHaePthx2MVx
         X89Dl6XJfCGvYXCUz9vCl8UEM1pY9XqJqyJm/AMZ/8Ip3XtL0PDpOdGJFQGU5RiN8e
         /Tw3aNcAcofngii4nHzECuyduUPL/YmNLNQfqjM6SitzeHb52BUGTllqh5sx+VLpak
         5NFpne+vzI1f/zXD+wO+N7F+CDFs8O4p1AMnUgfuQR/hRoOgCxmJNPNcmIRMMW7avV
         uxk67gserqf7g==
Date:   Sat, 11 Jul 2020 11:59:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH -next] <linux/of.h>: add stub for of_get_next_parent()
 to fix qcom build error
Message-ID: <20200711115929.4636a797@canb.auug.org.au>
In-Reply-To: <215c3c59-e6f7-1721-76ca-993bbaf91356@infradead.org>
References: <ce0d7561-ff93-d267-b57a-6505014c728c@infradead.org>
        <CAL_Jsq+AWo6xP1vC1NubFcdWzoX4hVvSW4KGry1NhOXUieDrSA@mail.gmail.com>
        <215c3c59-e6f7-1721-76ca-993bbaf91356@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.J4ddMQAHs+RvRstUZxfdIB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/.J4ddMQAHs+RvRstUZxfdIB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Fri, 10 Jul 2020 16:40:03 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> Are linux-next hashes/tags stable?

That depends on the maintainer of the tree I fetch ... In this case the
qcom tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/.J4ddMQAHs+RvRstUZxfdIB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8JHQEACgkQAVBC80lX
0Gx6kgf+ONvw3RpF1fOX3tBI3cbl2ONfD4C/J9u6TLjgyC/vQHIVpTTW2CHgi7Zl
Ibg8lsS3KeYJTdHJccOi8VVAB+HKHzN3AsdBtHyxb6vyuuv9sIGx/Tg1TcqJ5TMG
POhrjwZ7xVcdUHjrMB/yG/3vmfgL8l6v49SetFT9RZ8PfZHVVadsTjjZGgpRB98n
HZR20fbdkEdmjGWy1XgN87lmBIBMm5jZyLyHNyFw+cD4e1QEGBF6R6lOSr/lOfa3
a4oAbwgK6j5Me01ln8tx9/hrdSC4cbspX9BK+FQnXuPUPWve2qdiRGsftNs27rD8
fjrv2Fu9CcsKj+nwBTz9WmczPuoYLA==
=+wh6
-----END PGP SIGNATURE-----

--Sig_/.J4ddMQAHs+RvRstUZxfdIB--
