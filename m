Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D67127C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2019 08:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfECG0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 May 2019 02:26:43 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38698 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfECG0n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 May 2019 02:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4zAV5FNZ7iSvw6XP0dpEY1QjT1Lu6JpO/I5zpIga3/M=; b=TxH1Zfhw/7v5Er9Lx6Kc5hn7A
        mU9sO3BvY4h+O+NsPqPba3lODFPXEQMHkuH1/dssDMcGYntLx2o7cefmO3s/XPsibcKQgfmNEssTO
        UH39HM1pCLtytOrnEb8RMlB99qafmtIOCYzb+B6AJraqCNt4ll8eitDFK5wcUDjyY/TV8=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hMReR-0000qf-KN; Fri, 03 May 2019 06:26:32 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id D019C441D3C; Fri,  3 May 2019 07:26:26 +0100 (BST)
Date:   Fri, 3 May 2019 15:26:26 +0900
From:   Mark Brown <broonie@kernel.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        niklas.cassel@linaro.org, khasim.mohammed@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Message-ID: <20190503062626.GE14916@sirena.org.uk>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
 <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3rxX7Uty8SZY8iU1"
Content-Disposition: inline
In-Reply-To: <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--3rxX7Uty8SZY8iU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 02, 2019 at 01:30:48PM +0200, Jorge Ramirez wrote:
> On 5/2/19 04:33, Mark Brown wrote:

> > I'm not sure I follow here, sorry - I can see that the driver needs a
> > custom get/set selector operation but shouldn't it be able to use the
> > standard list and map operations for linear ranges?

> I agree it should, but unfortunately that is not the case; when I first
> posted the patch I was concerned that for a regulator to be supported by
> this driver it should obey to the driver's internals (ie: comply with
> all of the spmi_common_regulator_registers definitions).

That's not a requirement that I'd particularly expect - it's not unusual
for devices to have multiple different styles of regulators in a single
chip (eg, DCDCs often have quite different register maps to LDOs).

> However, since there was just a single range to support, the
> modifications I had to do to support this SPMI regulator were minimal -
> hence why I opted for the changes under discussion instead of writing a
> new driver (which IMO it is an overkill).

> what do you think?

It seems a bit of a jump to add a new driver - it's just another
descriptor and ops structure isn't it?  Though as ever with the Qualcomm
stuff this driver is pretty baroque which doesn't entirely help though I
think it's just another regulator type which there's already some
handling for.

--3rxX7Uty8SZY8iU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzL3xIACgkQJNaLcl1U
h9CKXQf/Qvobc1RebHM+jpqmN1w+403J3a8AYm+cJYEEi5WdT9/tMTuFx1gdj6XZ
K9nnzqV9352C2R/rWD3otwlV3u+HHMTQVZA5nx021V52khQJs9mNQQKxBcAO1bUp
kou03On7TG8RlPQrCmiHr1YLb63L3WiN/m4ekWUzFwYMbe8IlqV9gNzajRg34IO2
mh9MwIIevGkndKkrk5JTA7oJw7DGWS8lAIc/nS6m85L7K3z9QdRQKyL6gR5kTYMG
uczLsAwmPcdyV5faFjd9Q+hFycqeE+SU5iU9yND7diDPq6p2C4NKyKDl2IFElVgA
xfiLvU4z9kaJrlzB/K+/GBc2IB0wsQ==
=jNk7
-----END PGP SIGNATURE-----

--3rxX7Uty8SZY8iU1--
