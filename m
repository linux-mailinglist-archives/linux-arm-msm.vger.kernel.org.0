Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFAB55D336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243923AbiF1Kyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 06:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiF1Kyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 06:54:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5BD31902;
        Tue, 28 Jun 2022 03:54:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A022361978;
        Tue, 28 Jun 2022 10:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC517C3411D;
        Tue, 28 Jun 2022 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656413693;
        bh=Fs76fzPiX5CmqDm7rtqXmeYxffdzK/gh1PH56GM7A/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWxnowEIkHAserwFzSMJCMqahu7NvtMa9ZpyTfJPzy0/5EOwwdrKlYBA4KDNjd46V
         6S1Tq2iGDWKNvPZ6gZGFpir1kicU+VCDnJL384wniHm/3rGpl+mv0rJFBYI1HtFFSk
         NMvpc7/d15Xsltl4uy9/ig5oYPM80xVjhK9/ZUa3d2Tf581X27Dgub0Ms/s5bsNIZG
         75kvBcnUVSTN3at2IaFuOxmitya78R4qdZ1M2La+gE5sIct0s5IN794dPxMvtdoAcq
         nd6d7d5juLJ9CXedoW9Wop3mvU/RtulX2iWf8WkhpUQ/b0D1w6enipuCnbNyM5RVTe
         wrYwU6Y+3I9Nw==
Date:   Tue, 28 Jun 2022 11:54:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     lgirdwood@gmail.com, bjorn.andersson@linaro.org, perex@perex.cz,
        tiwai@suse.com, srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yrrd96ecPni13xq2@sirena.org.uk>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iQPZ8z0FvK3SbyzZ"
Content-Disposition: inline
In-Reply-To: <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
X-Cookie: I like your SNOOPY POSTER!!
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--iQPZ8z0FvK3SbyzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 01:28:57AM +0100, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the oth=
er
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
>=20
> We need to fix both the driver and dts to match.
>=20
> Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")

This isn't really a fix and it's breaking an ABI which has been there
since 2015.  By tagging this as a fix you're doubtless going to get the
stable people trying to backport it which will most likely break some
users.

--iQPZ8z0FvK3SbyzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK63fYACgkQJNaLcl1U
h9Antwf/Z4Ctein0L7OvsA9zHtMBH5LNxHlRKyTZ7Qgkg2kL3u1J7fDIF0Rjp66f
AS5fRMXIOUSbzij1j1jO4EbNXVQnFOVyGgFKzv4L8Dh3ZGtEAzVglWEIwrwvdaif
yEJYlGnoa8ERRMAeujuWAaXvRbGT2YLs5Naf4NG1x8oUqy+U1Ze+CuwE4Pi72HNC
oe+D059bZrbD8YCdNOCoPkIYYliDDftskW0bqmBAuW31d0G8UtnR8exoLdiVEeGO
5/KGlLvgpbx5CArLZ8jKTUm8NwYr/1OskTYM5PV3LzPyeKGIucy5HbeWAYQz0K0N
8fW13yKwgi0yVHSI/ScHiWP8sK8EVQ==
=gOCL
-----END PGP SIGNATURE-----

--iQPZ8z0FvK3SbyzZ--
