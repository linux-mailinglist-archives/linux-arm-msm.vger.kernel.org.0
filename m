Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C944F213A48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 14:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgGCMwk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 08:52:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbgGCMwj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 08:52:39 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F90B20B80;
        Fri,  3 Jul 2020 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593780759;
        bh=tHVvGtkSl7bYJvZhNMXbvQk/XxuWeRiGzO4sWMx9IWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xzoWZVPMoAYAqKrcLiWHawP6a6JjIWmEDh8WUckHT0qumaH/PV2Kk7Yez5ElgcD7D
         ClUTWBsb3WbvJx7pkpcZrDoW+f34+1I+tOuQy4DfgkRaKNROhjd4mbVJr+gGrIWh86
         HpCYn6OAa+bayffklwNrPWTkIVHd/8MR9iwItAyg=
Date:   Fri, 3 Jul 2020 13:52:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     lgirdwood@gmail.com, mark.rutland@arm.com, agross@kernel.org,
        heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, rdunlap@infradead.org,
        bryan.odonoghue@linaro.org
Subject: Re: [PATCH v5 4/6] regulator: Add support for QCOM PMIC VBUS booster
Message-ID: <20200703125236.GA5417@sirena.org.uk>
References: <20200703015102.27295-1-wcheng@codeaurora.org>
 <20200703015102.27295-5-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20200703015102.27295-5-wcheng@codeaurora.org>
X-Cookie: You need not be present to win.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2020 at 06:51:00PM -0700, Wesley Cheng wrote:
> Some Qualcomm PMICs have the capability to source the VBUS output to
> connected peripherals.  This driver will register a regulator to the
> regulator list to enable or disable this source by an external driver.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/KhQACgkQJNaLcl1U
h9DbaQf/Wn1umae5C1ME7+FMgKDOFXFlSpprrYcQpuTvaPIjeXxeKcprAdP+rmS1
C8yCog08z4Oy1H7KoXigS130MBOVajvjnX5lokFDq3ceNKHbO2Jj2qrQFpzlJ4xW
vqbaSDD64DW4qHhqSoKbDAmmtYQRyG4+diCgQuIEkNpwVZxI73AkYpnIqmx9FhQN
KjzXq4rBFdaEqpYfh298Cu/3JZztAHThrwpTFUV3Iu85gHSH4Yem4zZ25adZwglB
xMnd4ntO8SI0A3tI8AXHuux5U7s+cG9XCFYQxd2EOy6px3proHG5+9fvWnPLxTz2
4hQQ8EMqwcCZD0gRHrZBw92i08GUEQ==
=VYnx
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
