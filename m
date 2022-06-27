Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7307A55CD1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241392AbiF0WY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 18:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240399AbiF0WYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 18:24:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2A8120BD;
        Mon, 27 Jun 2022 15:24:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4357B61414;
        Mon, 27 Jun 2022 22:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4264EC34115;
        Mon, 27 Jun 2022 22:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656368693;
        bh=Dz3HpkUv4fKNgIq7sc2kWxwjKmENaIL6SD0TXzXDuLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f0/Y3grrCnDj9Xmfj4ZBk9NYLU6/TA9juRAlfDg3I3ej5CF019Ynei+4RnZ6nsEIh
         O2M3D2VHasM122LfoFnFu+KircbN84k0vX9GCL86lLnTGAZUB+C94ilPJyDVj2+vXe
         cDbHRYw+zjQqGboRLke8eMkd6Q1k8mCKlvlcFvSSAZAxFhmfN/fTmUxt3EeNR6Nqcf
         GU0Tyi3yYiVvhI394Gg93ReSJ4zNTt+5N8i83HmcCRYWdj+KdLcACXfOX+eQWFy587
         hyeK+fO2WfMbMkbk0TfHZ6uKZseXJPktTzye9Q4ifeCAjXGys/yYqRNgFUxdqPhrS3
         xFhiX7bFn90Jw==
Date:   Mon, 27 Jun 2022 23:24:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <YrouMMYhzpUb0JzO@sirena.org.uk>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
 <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
 <YroVtj4zXXcHygxD@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d+VUBwpC4ge/k0B2"
Content-Disposition: inline
In-Reply-To: <YroVtj4zXXcHygxD@builder.lan>
X-Cookie: Your supervisor is thinking about you.
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--d+VUBwpC4ge/k0B2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 03:40:22PM -0500, Bjorn Andersson wrote:

> On Fri 29 Apr 17:03 CDT 2022, Bryan O'Donoghue wrote:
>=20
> Adding the sound maintainers to To/Cc, please advice if you would prefer
> Bryan to resubmit the patch with proper recipients.

Yes, please.

--d+VUBwpC4ge/k0B2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK6Li8ACgkQJNaLcl1U
h9CF3gf/WXKPaL/hczugrKTgYGim6uhugTHPvAP2gc3nBogE2cIhiv2gHJHJsVGR
II6zquLLRRUGD1r6CjN6IOKvtYZ9tAMauhluTfAHclZiLmnv0po28f3wIbVf4zns
ImdPUcJ2ipJ9nKLHl5pi5LDINEmSSbZwj/xehxT8D7JUKleVjq5yElAGLWF6ThSp
Gwe0KbMBI55gDQJgjM6xJrT5mDBC/0Lt6uv6PsD/IDCgjJLuQ5t/O5gRwUKTrJai
G47F8J39CkmhO1u2Tl+McqbZ334I1UrPsG92AH+5FgQSaiGnO2AZayL3IliHL1hW
Oh3oVKv4Qk5QzIGi+FCai8qecbT89Q==
=yy0D
-----END PGP SIGNATURE-----

--d+VUBwpC4ge/k0B2--
