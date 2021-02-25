Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB07E324B02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 08:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbhBYHLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 02:11:18 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41227 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232661AbhBYHI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 02:08:56 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id EE2305803A4;
        Thu, 25 Feb 2021 02:08:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 25 Feb 2021 02:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=AZu9RdHKS45RqbSECTd/B4xBxs/
        yBPCajZ0CCWUQcYY=; b=F2haPlwESmhsHIgpowjFwxWOr0QbuH5RaENdmik2sON
        QjMZqPrwtpfZdxRq7xw4lHg0nVy2vG3PSgw6C/3QSgIdlLwDskdmC37WqJ6P4WPe
        bWY9NiSeayJ1nXNhQ+nDlAhMwGqvu8HDU9xA8/pnebmYc/kXM1bECEvyPSnzFdij
        5lA58RDVyIvHOgzTmDXHHnKKRjLzcge4tucz4CvpV2d0WQQ73aAR1NV6U/l6/cee
        rLtGAKKsqOJHhEKLfqtJ47r8g86uTqunfrZQZYEvgIcOSIZsiICCrK8Drpp4tRK5
        eBH7zwLZJu9jqhjQ6tOABzqctn5AGNQrnTBFmhxph8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AZu9Rd
        HKS45RqbSECTd/B4xBxs/yBPCajZ0CCWUQcYY=; b=UMrinhy+cK61AOhbMKwx9C
        GFb30hWLQw5UdoOx8pxmhiRopiWfTVQ+W6MgORc2dNzTYYU1WI6IIXM7mjhCS2uT
        NgpwsM3cB7R2z3cyoWtYYCxYKzNw9L2T3BhKmEjvRLe/lbocC/deWpG2M4ISoWpH
        tZGqAkretzNg3UPJXEHoR5dNIAZ6/uh4z7OXZ+cM6O6lS9W4LQQwcdzUC1tZBY1d
        CrWappn1PFJmhQFqdA39KdrjTEnKHP8z8ZBOQQeYVv5E7PK+MEe4clZ1VYV/AQD9
        PsTPmXosctM4Z95uA6UTNd1C2MpYbX+Yh43o5S7IiPkDTmLb8G6mmqu0kdGLCqJg
        ==
X-ME-Sender: <xms:00w3YIBdueJnRZlKvFrknRG-Dx_X6lyia_1upL53zyaavNM0cqZDBw>
    <xme:00w3YKjr44wHD-t0zfIEZJdfAb2GMAaj8mTGHDjWkfOtWLsHZnoa07VynCLZ1rhB6
    Z19Bq-QmAMcSUWNg_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:00w3YLmeBKkBcd4aey9uT_4Je4M8FkZmqtWudKoqvLdnTX9jZtDdLQ>
    <xmx:00w3YOw2ASPGv603sBv6tV_PF3vN4zGlFqCO9rrEfpH9vkx7UMooOg>
    <xmx:00w3YNQusIQZcMjJ8SBKhdmUzETfdLV6YaWWy6IHFb16kq7-9yTCUA>
    <xmx:1kw3YOAg1gYFaF7YTyaRoxB9Ry69BXhMUhhYV-ZqyGtr56zAlbI1UQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 11857240064;
        Thu, 25 Feb 2021 02:08:02 -0500 (EST)
Date:   Thu, 25 Feb 2021 08:08:00 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Sandy Huang <hjc@rock-chips.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 01/11] drm/atomic: Pass the full state to planes async
 atomic check and update
Message-ID: <20210225070800.cylmzc4aw4lf64m3@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rlwiyewnrnff76nn"
Content-Disposition: inline
In-Reply-To: <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--rlwiyewnrnff76nn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 24, 2021 at 12:33:45PM +0100, Thomas Zimmermann wrote:
> Hi Maxime,
>=20
> for the whole series:
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied the whole series, thanks to everyone involved in the review,
it's been a pretty daunting one :)

Maxime

--rlwiyewnrnff76nn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDdM0AAKCRDj7w1vZxhR
xXSQAP9UU9PXpkIhgKjNrqj/cEuwE6x8DBwzz7lZblBuahSxVgEAmjXn+ByN2oJW
HFh1nkqeJIGSo3HrbEWp+YkGuQ0BuAw=
=HL4n
-----END PGP SIGNATURE-----

--rlwiyewnrnff76nn--
