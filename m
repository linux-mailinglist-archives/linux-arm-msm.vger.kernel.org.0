Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2F88A563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2019 20:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfHLSIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Aug 2019 14:08:48 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34354 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfHLSIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Aug 2019 14:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jMh85WQgxIdcz7yd1BWSn2ujSLN3yCFWRbvzn04j/60=; b=tGt0eNbG4+SkPkLXOUgPm4pKy
        WVySWGw3MzdYRSARCh6IKpb09zogVVtk3jSkDv2lQ9tQi95flP7s+UlKxq6JyowqW9pG8QO3hpW2K
        HtOe67xFnI/GoiriCY0pHL1UQyccdnNry3AgcOJcT2hPCt9mXOI22GwO+GDARxuAAuu58=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxEFs-0002Ty-I9; Mon, 12 Aug 2019 17:37:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 9E08E2740CBD; Mon, 12 Aug 2019 18:37:11 +0100 (BST)
Date:   Mon, 12 Aug 2019 18:37:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: next/master boot: 254 boots: 11 failed, 227 passed with 16
 offline (v5.3-rc4-5755-g8e72ac275c63)
Message-ID: <20190812173711.GN4592@sirena.co.uk>
References: <5d519859.1c69fb81.531c0.088a@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Content-Disposition: inline
In-Reply-To: <5d519859.1c69fb81.531c0.088a@mx.google.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 09:48:25AM -0700, kernelci.org bot wrote:

Today's -next fails to boot on qcs404-evb-4k:

> arm64:
>     defconfig:
>         gcc-8:

The boot appears to suddenly drop into a bootloader near the end of
boot:

05:14:44.500307  [    1.886858] Key type dns_resolver registered
05:14:44.500345  [    1.892544] registered taskstats version 1
05:14:44.500382  [    1.895502] Loading compiled-in X.509 certificates
05:14:44.515903  [    1.916067] hctosys: unable to open rtc device (rtc0)
05:14:51.562124 =20
05:14:51.562251  Format: Log Type - Time(microsec) - Message - Optional Info
05:14:51.562306  Log Type: B - Since Boot(Power On Reset),  D - Delta,  S -=
 Statistic
05:14:51.562383  S - QC_IMAGE_VERSION_STRING=3DBOOT.XF.0.1-00080-QCS405LZB-2
05:14:51.562427  S - IMAGE_VARIANT_STRING=3DQcs405LA

--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Ro8YACgkQJNaLcl1U
h9DSZQf/bKwhCQ1C3b2g6D9QdwqB6vbUt9Wg0E/+9Th2rg+WR98nT9yHXhzYLpPP
8KF1isnSnh1bQMivHodQzHRjgKqexOsG7WNI79x1XQbsqURFcIwNm2UFIJq5gkXF
9Y1YedRKyy+pUT17WRNRpZk1lV9r+LTND8IObYOzRU9rZxCpA5wXSGVz3imh+VL5
eXcublPQWwRUSccn479DylpZQSzCnSUtHVCwDN/ti09FXIa401d/Zpije+9NqJjb
+kycjvuSQK0hfdI4U2WlNivIlqqVakvx6ihtvRQaIbhXgkboIjfeLRv6Au5+olWx
2vEU0ix+a1mUYvvMiLtJFwkbSALDyw==
=FI7D
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
