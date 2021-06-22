Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F9B3B0B24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 19:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhFVRLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 13:11:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhFVRLC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 13:11:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DA5A61360;
        Tue, 22 Jun 2021 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624381726;
        bh=c8HGlAjch/gVhdi7JaBrw2jhwA9rmnpGC/Hcq+DPDdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MqQktpEn56WA/G+vQRSUUQhb6eXMNQ9sMzwGcpbdNN67bMefV2mvku6nYqVArMaI4
         2+zzqnRaWG/+lLqsZ+xaPje1lzJCrsy7EltBUyNgLfY5/+Rk8mtTGz52OvFCloayvr
         sBTKGBR01iTgmPvp2J/2DLEkuv3LYWqD6P70XiLKWM6xJvON7h4Xf6SKdVlIFEVVDb
         GMWWls/1dTTLCMEIMgxpGZ8BCyx5neqQdkhMBv27xf67+dqTVUZK2BFrQn4uOuUPKQ
         G6sUSkEy46GqC5Pw3EJSgVc+cFBxRf4H7K3TmKs98AroQlrx/udari8FpOwucysh0x
         8PJoVkziDTFOg==
Date:   Tue, 22 Jun 2021 18:08:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <20210622170822.GI4574@sirena.org.uk>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <20210622112843.GB4574@sirena.org.uk>
 <CAA8EJpoTdg3O6dzpTaNS5fJRbtb1Fndv0mEuO+e4b6XCmuvzhQ@mail.gmail.com>
 <20210622143812.GE4574@sirena.org.uk>
 <CAA8EJpoeYUOPLKca5oJNKdyOvOmoLX6FvsTbdmC7W9mLsyyVmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k9xkV0rc9XGsukaG"
Content-Disposition: inline
In-Reply-To: <CAA8EJpoeYUOPLKca5oJNKdyOvOmoLX6FvsTbdmC7W9mLsyyVmw@mail.gmail.com>
X-Cookie: fortune: not found
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--k9xkV0rc9XGsukaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 22, 2021 at 07:46:08PM +0300, Dmitry Baryshkov wrote:
> On Tue, 22 Jun 2021 at 17:38, Mark Brown <broonie@kernel.org> wrote:

> > Well, perhaps it should do one of those things then?

> I don't think so. BT part is just a serdev sitting on top of UART,
> WiFi is PCIe device (for qca6390). So using MFD API (which primarily
> targets platform devices) does not seem logical and feasible.

That really does sound like a MFD - AIUI it's a single chip with
multiple interfaces that needs some glue logic to hold it together.  It
doesn't fit well with the current framework that MFD offers but it's
definitely the same sort of one chip in multiple Linux frameworks sort
of thing.  The only other thing I can think might fit is handling it
like a plug in module for a development board (eg, RPi hats) but we've
not been doing so great at getting them supported upstream.

--k9xkV0rc9XGsukaG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDSGQUACgkQJNaLcl1U
h9BJwQf/S9os6LnqYb2q1/RMKcv1FwE6Jze9TX0xNc3AXqXxIIxK4VAQ4mhBf1ne
7j63Gq/t3jtZ1lqGlXj0Tso7CjQgH/UxdqmhzBYRRwDmMKrL6Vr5ON3JvHjjjQoF
N7k2CARqOEAAVMjLkhMWhTblaRuhfLjAe68vR0ZXTttY2ES8n2+Csa5AbEHvOxdl
lHJsSz2C2ZR7nsl0KhmO17w0H3KcHxupzCbh6IqJllXZBy985FDCl8UllCYFL8hC
nqSfXuTXfUNrWnaAlwWAIss69Et/PqtbuGFAUsP6U+OCRSMsQJ2QBAFQavwkHEip
ooGQW6CJaf3Es4RU8JmTEMWiRhiaEw==
=staA
-----END PGP SIGNATURE-----

--k9xkV0rc9XGsukaG--
