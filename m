Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65B22F9F22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 13:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391343AbhARMHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 07:07:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:45028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403958AbhARMGM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 07:06:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C810B222BB;
        Mon, 18 Jan 2021 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610971531;
        bh=Lzm0BRSPRh6hdv3HRtMexM0LcDTwJy2kZUXSLb2saBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=psaRCDOFpGvW4U/D19GI5blrsYUQ3xjIhj8we01ZTwpt0nYzBUxMPdwrpxz56ySU/
         wHTGJIwabtWA0oinSG6V3xhuG0pXGqJLxE6Cdxoh/0/wYFD/t3gDgjhfWuVdOKInWl
         ABWAJy13NIrp4i+y3tW3jtalxIt5kH/BFrHxr5WqJDzfEPTtmW6vIWXsKYr9dwAMRg
         D+a48KLDsJKyHnsJD117XDUzu1F0cWmY9HWmiM70iNi7tqQ089V8BPNcoisOSiatAW
         fnMKMtF4GqM1B69HYjBSyvu/CRg9gH9palkwuVHyLiDgZRwn1pM/FSnf78lWTFTyAT
         73qzfRXGR+Pxw==
Date:   Mon, 18 Jan 2021 12:04:54 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v3 1/7] regulator: qcom-labibb: Implement voltage
 selector ops
Message-ID: <20210118120453.GC4455@sirena.org.uk>
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
 <20210117220830.150948-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
In-Reply-To: <20210117220830.150948-2-angelogioacchino.delregno@somainline.org>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 17, 2021 at 11:08:24PM +0100, AngeloGioacchino Del Regno wrote:
> Implement {get,set}_voltage_sel, list_voltage, map_voltage with
> the useful regulator regmap helpers in order to be able to manage
> the voltage of LAB (positive) and IBB (negative) regulators.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFeWUACgkQJNaLcl1U
h9ChhQf+I84AxaUISvCxfDx9zsu0Oy+N1I0gO7//RG7oyTwhUfw8jWyp6jVqXapv
iL+DD+h/sdD5p2k/gli9USjGQryOhhNmhSYTL9KDIs9Q7tLDb0np/vDPrJ1tsvpT
nlAT0Tw2Vg/gozbfVbI9bp3iKH1aTIAYBD0dLoc+mx/IN8XZK8Sfh1RKq4dGDy67
3ibSJ7yMxAZGm7JB9lHhq+X5ZYjhQ4JbT9pTkNzX+RqkzGQDkK96oFJv+6P88qNX
Jg9qgdwml9Yj4LBkXnDXr38y2TqD6ERPpPbs9AmyliM//zSLNQEr99g9XLhaQsCd
oBD1Huu6CQJ8H90pum4sL4c0cRs+bg==
=y1H8
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
