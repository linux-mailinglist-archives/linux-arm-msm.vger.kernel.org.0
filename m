Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC824864B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 16:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfFQO64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 10:58:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36616 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfFQO64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 10:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KrQp+kHGo/s8VYNxSYJcNa3J6gA8cYR0tmZplHF5Dfw=; b=oJd2LEYu9LVw8yHwIIprxwQot
        K4fJL9MOSXojhTUAcRT99AUXtqYnTjMiaybDUGAOkCcATtGdYG59fNIX57WtSUuWjTMbuFjSQwKI3
        m5LWmuYa2HqBZURiLF4RZ9sjngucE+phqpi5dbFG/1u1RM+rG0IS1cd5xFBo3GSyKFAf0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hct5x-0001sI-Oj; Mon, 17 Jun 2019 14:58:53 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 448F6440046; Mon, 17 Jun 2019 15:58:53 +0100 (BST)
Date:   Mon, 17 Jun 2019 15:58:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] PM8005 and PMS405 regulator support
Message-ID: <20190617145853.GT5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NZ00oluAJr3A0NMv"
Content-Disposition: inline
In-Reply-To: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--NZ00oluAJr3A0NMv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 02:24:36PM -0700, Jeffrey Hugo wrote:
> The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
> pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
> to bring up the GPU, add the support for pm8005 and wire up s1 in a
> basic manner so that we have this dependency out of the way and can
> focus on enabling the GPU driver.

There's something really weird with the threading in how you posted
these, a few of the patches are in reply to the prior patch so indented
a level down.

--NZ00oluAJr3A0NMv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HqqwACgkQJNaLcl1U
h9D8RQf+OxNLRt9KY0qAKM/axbtNoK16v0PmHjNYLhYl5yBMi63SehdoXh1DkZY5
pBVOnlHPnB3usazND0knM12bH9x/qWXJZeA4PPGCDwUz2SOJRxIYr7wsKNmNjV/u
nZwsZ0dCbIFjRTZ8YCrc2FTsjCUVylqDeHzFJJ/I9nstD8POAs043rd5FIuNlGGS
sb2Qhu94o6C8u7YUjWciJ3zjXtQM5rfcuxVpMpxX8dg55PPvk6cTeSnQwto+lpeU
HypcRzk7F36tl5ElZPhf/WkPycNHdx8h+0oy85CVQ4/bqNb8rNDUFymfDE5qGI4o
6qoIyaY8tuzHoiLnJNXFhtl6YzjKbw==
=dHUK
-----END PGP SIGNATURE-----

--NZ00oluAJr3A0NMv--
