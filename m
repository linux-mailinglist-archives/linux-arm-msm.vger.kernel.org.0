Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EDD337CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 19:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhCKSeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 13:34:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:33860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhCKSdq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 13:33:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 128D064FBA;
        Thu, 11 Mar 2021 18:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615487625;
        bh=UuAGM0Gt3Xfbl0gOtHDiItqylElW5b4tuS7aBiHOlMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EBF4ybHteUqHU+SkWpUIO4Jrz4NGI53Kao8vuFthSr/m++IElbjxPhfSeab+kFI/q
         dINts6q4cDCSPIv8xltU7hY2ZTkBJKlbDnl6kAtHVZ+iy8Hu7uytQ7VhJzewBomZf5
         LBMk2IPdEKhIYwvSw3n9fWoD5v4+tpXx/hHhwTOOGWhTHW4p+WfDBED3OrlebTV/0u
         kd96i1z19rZO4xX/oULiSPNzL/mZpRBgTUCZ3sDNOSry2pNuMun3e/dc2LeCxh9emM
         fcNiqEn8TEFu94FQjhzP5Dekvp944iuv2Au8ZO06D8AJ5SXcxqXbiZ9BAcQ+63Zh8f
         iacuToYkDxQFg==
Date:   Thu, 11 Mar 2021 18:32:31 +0000
From:   Mark Brown <broonie@kernel.org>
To:     skakit@codeaurora.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kgunda@codeaurora.org
Subject: Re: [PATCH 3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515
 buck
Message-ID: <20210311183231.GI4962@sirena.org.uk>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-4-git-send-email-skakit@codeaurora.org>
 <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
 <51390b828a5d534e308460098f1b9af0@codeaurora.org>
 <CAA8EJpqN-jb3b3yHTHwrQQj_h3M-yxAvX7Hz7bNSV3_NBCJEwQ@mail.gmail.com>
 <da15c05877c345f2aeb51649c075a95c@codeaurora.org>
 <CAA8EJprc24gTfLaffsrKeJ9MOv2m8B1L168VV4uNm=xsjnF5ZQ@mail.gmail.com>
 <189b9f1cac1b52241c199e541f0d14ba@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Content-Disposition: inline
In-Reply-To: <189b9f1cac1b52241c199e541f0d14ba@codeaurora.org>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 09:45:41AM +0530, skakit@codeaurora.org wrote:
> On 2021-03-02 19:51, Dmitry Baryshkov wrote:

> > I'd still prefer to have two different regulator types (as we did for
> > pm8009 P=0 and P=1 variants). However it's probably up to the
> > maintainers to decide.

> As Mark already picked this, I think we can leave it this way.

As far as I can tell this is a system configuration issue, the board
constraints will ensure that we don't try to set a voltage that the
system can't support so there should be no need for this to be handled
as separate variants.  That assumes that this P register field just
extends the values available, it doesn't have to be tied to some board
setup or anything.  If it is a board configuration thing it probably
makes more sense to add a boolean property for it, ideally something
tied to whatever the board configuration is so that it's easier for
people to discover.

I had understood the pm8009 case as being two different parts with the
same name rather than two different options for the same part.

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKYj4ACgkQJNaLcl1U
h9COYQf/biFeYWkuTQsa6ND/FAhYd+og1KhsxXWai18EVpf99Za5KuiJ3ztC+fxE
G0IGMZq8h0VDgaUFibJRg04ZsYf/qYHmB+k0+lqEUamSR/Kq+KkTztdM1LXI47KF
fcxwq6+J/lWYBH9p2jqAtiv9hmOYTV2iDeiUAt0IUWwDcs0N5nH0OP4Tm7lqEOiX
YsMv5gEtYoTeXSWkzHOlEMVEPVDbDweHetN0LjKSJFVAcNnn4IxMa98g8n5MG7tT
nxq+PcmWIMDOn4v0ghM+qcPsz+8UGMmUqGxwwHobLHxwEaJ63q6xCE+j05X3A3q8
4gTkVP7D+i2HF9BXvKU4Qf941LUY0Q==
=cYYL
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--
