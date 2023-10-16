Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011E17CA870
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 14:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjJPMrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 08:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbjJPMrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 08:47:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05FB18E
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 05:47:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5499BC433CD;
        Mon, 16 Oct 2023 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697460453;
        bh=YdZ/IC4cH/K/iK8DSMpzreTp2d+CY6Vurg5t2QRe3vI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gH0TchFakMHau2l9pLD5LpA5U4mrjbZB0MO5T0FrSdU6ATt18vol282fxJmp3i7Q+
         35WZ3GRlST6pcvKCnrKlyMBwyyLAmxwMVLTHupHiVZYWB21eN6CoFJFR7Jc/b69PkD
         /Ntxuuvx36Llq5r7CQNvmpKjA1TxZq1P73irjmV+/klfyqIraGeozaLYb+o23QNIvY
         ryyIkF3qMDKWdTr/+Jql/aAQQOJcsu4Q1+DDnh/E/DCYFERzox/nGgulTjw3VBnGvy
         EvEX4Jmcbaup2OzEKK3XYEmbic0AjW0etjdjTx5gehDeu5j86fQH+G2FrlFmRHUf49
         3BFW/8ichbUWA==
Date:   Mon, 16 Oct 2023 13:47:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc:     linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] ASoC: qcom: q6core: expose ADSP core firmware version
Message-ID: <6ff78ead-fe41-496f-afdc-a83eee27f652@sirena.org.uk>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-2-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BQn/BgTXOEM+y9sF"
Content-Disposition: inline
In-Reply-To: <20231014172624.75301-2-otto.pflueger@abscue.de>
X-Cookie: If you're happy, you're successful.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--BQn/BgTXOEM+y9sF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2023 at 07:26:22PM +0200, Otto Pfl=FCger wrote:

> +		for (i =3D 0; i < g_core->svc_version->num_services; i++) {
> +			struct avcs_svc_info *info;
> +
> +			info =3D &g_core->svc_version->svc_api_info[i];
> +			if (info->service_id !=3D APR_SVC_ADSP_CORE)
> +				continue;
> +
> +			switch (info->version) {
> +			case AVCS_CMDRSP_Q6_ID_2_6:
> +				core->adsp_version =3D Q6_ADSP_VERSION_2_6;
> +				break;
> +			case AVCS_CMDRSP_Q6_ID_2_7:
> +				core->adsp_version =3D Q6_ADSP_VERSION_2_7;
> +				break;
> +			case AVCS_CMDRSP_Q6_ID_2_8:
> +				core->adsp_version =3D Q6_ADSP_VERSION_2_8;
> +				break;
> +			}

This doesn't handle unknown versions at all.

--BQn/BgTXOEM+y9sF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUtMN8ACgkQJNaLcl1U
h9BmQQf/Tt7eqF9/o/Aud88rJCnftlQCY5L7byWqy2kWjodL0h14ennXe7c8R7zR
1aggmXULvZGMYavDQyshmC4J5b0OGXeaV67/Cm/El2MgNgrzi/cp6M/49DPCIKi9
fFV5OkrdPgPc+AmF0OY1pa4P64E64/4LL78KaR5JY/zBuYE+bNYCJMuVTagHeAcp
sd2nSfEJYgj28dv6chvjjMJ9Z1WO/p3sm6U0CXVu//GbSdWhUMgKIAUoNFfCJ+De
Kg4pf4qOR/viuvjU21yDQBHFjLzjlDFmSpcMS7DPp22E48NGNOOVrM6bMyVOxN2l
UJLvtMe21FLp2ka4HedvxQT2BGduqg==
=Yg2j
-----END PGP SIGNATURE-----

--BQn/BgTXOEM+y9sF--
