Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09DCA4CD3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 13:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfFTLy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 07:54:57 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36060 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbfFTLy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 07:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pC92AbMeAeuM1T81sizF6eWRPi6h6pllvejcDmmv2V8=; b=TrRakVNmkK/8YPkzBbNp1pB1m
        qge2i4Bqb2TIMqS8mc9jmF0NEgMLOuUpVBGtPHfx0knv7T91/rD8+4fwQ5GpX6QSxkpRx8jEp0BhC
        ND7BpEpnbkojnfb+mmjaw3ekmrw81dVvyJDxsAoqHqETMSTr5LaS3jzgPNvczFxn7jOdM=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdveZ-0000Lu-Su; Thu, 20 Jun 2019 11:54:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 609C2440046; Thu, 20 Jun 2019 12:54:55 +0100 (BST)
Date:   Thu, 20 Jun 2019 12:54:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: Fix math of
 spmi_regulator_set_voltage_time_sel
Message-ID: <20190620115455.GD5316@sirena.org.uk>
References: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Aqxj+GViP82BhQLt"
Content-Disposition: inline
In-Reply-To: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Aqxj+GViP82BhQLt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2019 at 11:56:36AM -0700, Jeffrey Hugo wrote:

> Fixes: e92a4047419c ("regulator: Add QCOM SPMI regulator driver")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

I remember pointing this out during reviews as well...

--Aqxj+GViP82BhQLt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0LdA4ACgkQJNaLcl1U
h9CHHAf+MbuHjo/fmQnkrr8EoGybxlSgiwHosHysxcF574SNmSBECX7MrC4zr/ah
McRp1zyIZVHiy2LNPj0atyiNqDLA6kfk6gxJdfaPNhMexDH3CNu83ndN+eNnryuQ
nIwMDkX4Odh+MQPJJURibRivDu+htY88bY2thwt71C4TvwNXEvXtKHHlhYPuijp5
K9vMP6kO/QeHOX2LAct6b5EnQMA7TcZba0T+ZODxmNECH9BDa0PDdGEnUobGMwXe
h6HYDysrqnQArJA2qyCXe8IASf3NEkYiW0rmarGvGmnquF365NK9amuj7BbLXrOo
yZy5FZRifFZ62ubKZQMqXTMTRH1xzQ==
=shEP
-----END PGP SIGNATURE-----

--Aqxj+GViP82BhQLt--
