Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF5E2C4088
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 13:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgKYMty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 07:49:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:49672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728237AbgKYMty (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 07:49:54 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B894206E5;
        Wed, 25 Nov 2020 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606308593;
        bh=TG3UpeiHbWC57NXnHtKT6Q7HjbmbKGepoMAsuPbYhgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qA6Yjnk0W6zCUTsY9ibqshuDQiyuMajOgBuOizLAck5E9ZE5L+x+V2bYY6fA0yzhP
         xrJyA9k5kSg27ql/IPPknP/v+4uxJ4vosi4p2FhH49/Imm/qZUyNXz/o2apsCdUSEv
         3nynnNaoFfMST3otOGu54i2pO5tWIalKvxy47vR8=
Date:   Wed, 25 Nov 2020 12:49:28 +0000
From:   Mark Brown <broonie@kernel.org>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc:     linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org, cychiang@chromium.org,
        judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        zhouguohui@huaqin.corp-partner.google.com
Subject: Re: [PATCH v1 0/1] Fix 32 bit format for adau7002
Message-ID: <20201125124928.GA4489@sirena.org.uk>
References: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
X-Cookie: No foreign coins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 08:58:57AM +0800, xuyuqing wrote:
> the microphone is attached to external codec(adau7002)
> instead of rt5682.We need to always use 32 bit format on sc7180
> to meet the clock requirement of adau7002:
> The ADAU7002 requires a BCLK rate=20
> that is a minimum of 64=D7 the LRCLK sample rate

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl++UtcACgkQJNaLcl1U
h9BXsAf+JbAuQvpTNdjb5/LUqRdyuTd2UQmI4XFbgJUpmVe1dh0IbCc5pqQg/DXU
/Wl7kSPW1BB1dgiEpbf54AcEQedhpzJggccsH9tWbLyLvC6yVksQc+PU3dxf8FbC
d+O/GzA4WlIomYE7szH8rvTLcBG8FE37F5qT7zADGhDFA4yjXNhmEOBFQQQsIzRR
gemWP64PSv4ekoI7Kc9k8VXFutE67I7cPaL0uHEnaDzUcbgkompnweXA8AApxTTq
PkxAlknTOCQQlkUQH+TgFi00oJlyriAJ9y1ua9le7GoFNRva07aIo9cehika7qTT
CxonbnDUtgpR5DZnZ5cUXTBJkby3EA==
=3C6x
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
