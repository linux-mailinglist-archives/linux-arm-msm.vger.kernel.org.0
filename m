Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0233D288A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 15:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387569AbgJINwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 09:52:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732456AbgJINwf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 09:52:35 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06B14222B9;
        Fri,  9 Oct 2020 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602251554;
        bh=cwk9i4KBau0qPm27KzJl3XXeYfNbSm1YHxXTzmMkdOY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xYHb+/ddD3CKObc4tAlrPj2U8OIa+LavQ5ml/H3KzlNFr+FetR8wU/W4lEzql2ywb
         9FTBXAY7aE7Ao54UCKQmnoTgMN2Gmd8ov1Xin4z8z1b3MJG7D7bVTD8f6VU63uo5K0
         86m35/V0p1MGv251jWFKJei8tgsXP2s9qeP1ITQc=
Date:   Fri, 9 Oct 2020 14:52:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     linux-kernel@vger.kernel.org, dianders@chromium.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine
 bindings
Message-ID: <20201009135231.GA6655@sirena.org.uk>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
X-Cookie: Please take note:
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:
> Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> for 2mic case.

This doesn't apply against current code, please check and resend.

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Aax8ACgkQJNaLcl1U
h9BLUgf/bL/7/DLssH7LN6HzEKNltT4ltao9sKdRmjuIPgTA9rwYf3cazWimkZoo
ZbecRbpOKAPZ5ymsnWo1QAq9pNJ+ll5EwgqwiOmYPavfKpfNwULh10oE+wokLdJl
+1SuMACMFIHvnKzcwSydpEupP7uFfO01XLpGNoMOvvHITC3vuAETk9AthXKTSD02
N1TpmZdSCEbtfy81kvCk4NFFaTjmm4wB2MT93+uRKbwHVf/Xnv/hpXFsWo1glTfN
1p1K3dQ8V2G2tjq7E7+nKFC5DObjE7wSG0HQHH+8wTt3F2axIuPX6P2Vhjy9ZjSR
NEC32HzNHukUPp0j5dlyUr6izyD8Hg==
=HyGA
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
