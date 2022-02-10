Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B82E4B08AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 09:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbiBJInq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 03:43:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237761AbiBJInp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 03:43:45 -0500
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A9C197
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 00:43:47 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id B254B2B000C7;
        Thu, 10 Feb 2022 03:43:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 10 Feb 2022 03:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=CElJlaUmn4kDx8P/hMZmLBQKvsN0etoJK6/v6V
        2jv4U=; b=D7oVB+GlFiv+3Sd2ajlPF1H8CKaY8ICLjFdPyIEg1b3Vp29swBs/io
        2TIuSwjMFQ2470Ursxavl4HouynhJwc6ojAqne6V39ef4eyyPOeA7zDK9pte8LRX
        bI46xJP1/VUQiAEw6v1BG2A3BZapT4TrDzA+jHZRb/XwoJw+pctDJYnWyPmKzU2H
        nBPFdDe3ytSCsIaI7e514jvD1H1co4GgI0AHX9FM4JL3nRHnwJWTX1Z55AeZHEtK
        eftkpZNv5VM517UdHjbpd9Nk25+zutwsTf+36m4XM85OKHpTqrSYpSBEICs/mieu
        hNFXsvKJ2hT+/1HTBRLvqCy3+EQl57GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CElJlaUmn4kDx8P/h
        MZmLBQKvsN0etoJK6/v6V2jv4U=; b=ScInbgWHocqSmLVIxdgXmwZa54ICx9CUn
        FWVEgDmDCai/tlvVtVQtC9+zrdGH8BE7peybgwG4D+6IYhuU8B1VKmwtH3vy7eZp
        yoSrqp8QzjliM0S3NlcEAtJux9POyt0QQ6vs465HcanyNn9gvrn2XrocEWK6Rwsb
        HQ7AgrvK97Rf/NHu4/5bKrCA/LHwQZt5ZdRTqXNGO46tAiz9J37mImTAjFeP8gDv
        Z1N5k7NUpbPkz4FQLkKHXE93z0zZL4GnFupqH9jCExJ1XHit1cwX/PvYuwARBhYa
        dhwk0pIENIAz3NPEeIe2thud2o9kFjECGVIDi/lvEQKkg/S7WQDxw==
X-ME-Sender: <xms:QNAEYog-cChLXyQdSDi7MDzyLVzzSWQmkqyZ9kNPOGYjZSzwkEt6aQ>
    <xme:QNAEYhDsTu3IS5_JhpjGdhLP6FJTFwkm_Ho2RvudnYUMwRp3VX1C9T89mZKGyOVEK
    WegB2HdtS1X-qaLXF0>
X-ME-Received: <xmr:QNAEYgE70Wid1240IPLqPm_ls-oL-SqeCPW3t6C9fIlerUghpLF5ax6wi0l6WSH7nzdsavfsIkLF6nrSmg8CISiruJqDsy8gglZQz3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedtgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QNAEYpRx6CN2tS7jivSYvQLpx9M5VxBlUJMQjh2bUStMM58h7zcC_w>
    <xmx:QNAEYlwYt2gx369yR-94jT4DD_4fFcuEFOsiUW_ZcG_9XlO9Cpr08g>
    <xmx:QNAEYn6jjtO1l2cpxf8Nw2zkLHJdUpUIX7Qln44intbeGa7Lo6hLFA>
    <xmx:QdAEYlgTSsVTsYjRVQeToip2x6Or0BTrsdXItawYjCm2niB03keFF-5dJr0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 03:43:44 -0500 (EST)
Date:   Thu, 10 Feb 2022 09:43:42 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 04/23] drm/msm/mdp5: Fix zpos initial value mismatch
Message-ID: <20220210084342.73n5wqlxsujfvqxt@houat>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-5-maxime@cerno.tech>
 <CAA8EJpr-dx5So=w+NvdtSeB4KBVMySc+KT54bMX9p_0ZV52jAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kogjopekdqrw73cf"
Content-Disposition: inline
In-Reply-To: <CAA8EJpr-dx5So=w+NvdtSeB4KBVMySc+KT54bMX9p_0ZV52jAg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--kogjopekdqrw73cf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 07, 2022 at 10:27:24PM +0300, Dmitry Baryshkov wrote:
> On Mon, 7 Feb 2022 at 19:56, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > While the mdp5_plane_install_properties() function calls
> > drm_plane_create_zpos_property() with an initial value of 1,
> > mdp5_plane_reset() will force it to another value depending on the plane
> > type.
> >
> > Fix the discrepancy by setting the initial zpos value to the same value
> > in the drm_plane_create_zpos_property() call.
>=20
> Could you please squash two msm/mdp5 patches into a single patch,
> making it clear that the code is moved.
>=20
> Also please add:
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")

If we are to merge both patches, we can't have a fixes tag, since it
relies on the other framework patches that won't get backported.

Maxime

--kogjopekdqrw73cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgTQPgAKCRDj7w1vZxhR
xeY6APkBnuF983kLttuIYG6T0lANfZCiQtji+Fht5kfy41O0pgEAy8ld1LnDQKqW
qkrSTB+KLWOS9/f3fUatpCxB38gJxAg=
=bSaB
-----END PGP SIGNATURE-----

--kogjopekdqrw73cf--
