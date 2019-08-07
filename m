Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1C5841F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 03:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbfHGBur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 21:50:47 -0400
Received: from ozlabs.org ([203.11.71.1]:45685 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729968AbfHGBur (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 21:50:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463Dx02dC1z9sDB;
        Wed,  7 Aug 2019 11:50:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565142644;
        bh=Vm8iaukqOL/IY8DFFB9QZrcBEKE3k7jhZco/mWO3qdA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JbhrSn2jDqXOMaEdaPcHTnaSpvnLAxHqcrsUtR8zCo+OJfCC4llmm/Ljk0c/fUGOw
         YD2igJWbHFhCRdF9gLa/9SIokSYPFZ2fxGS9Ucy3KzCGBsRHM+W/220cYDq5Xbf+YE
         uTWFbsHl7PTMit0KCrjfFOg8Za3fObTKaJzocLDPvmF2fUJVRbQ+CkfjqMXCKr/oeb
         jSE70bTTcwxitHdB+jd7d9IID32+pl6DBKIBczrp8g0SCj1ikYvp8wQHfFYckojgLi
         ZHny7Z+M6Nf8348vaZSh4DMT0hkYKh6hYEKtNCcC525syK7QoOdfHINqLIpdv/C0xi
         N2CsDNCh3CyBg==
Date:   Wed, 7 Aug 2019 11:50:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: socinfo: Annotate switch cases with fall
 through
Message-ID: <20190807115043.2ff429c1@canb.auug.org.au>
In-Reply-To: <20190807012457.16820-1-bjorn.andersson@linaro.org>
References: <20190807100803.63007737@canb.auug.org.au>
        <20190807012457.16820-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//799VrEy/0lurErM4DPjHtu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_//799VrEy/0lurErM4DPjHtu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Tue,  6 Aug 2019 18:24:57 -0700 Bjorn Andersson <bjorn.andersson@linaro.=
org> wrote:
>
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.raw_device_num);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 11):
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 10):
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 9):

I don't think you need the comment between consecutive "case"s - just
where there is actual code.

--=20
Cheers,
Stephen Rothwell

--Sig_//799VrEy/0lurErM4DPjHtu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1KLnMACgkQAVBC80lX
0GyYUQgAgzzUeMJddV/IvgpdCqEA3DrLLwJkuL0zJW6B0gG6S6UusJz2JnB8oEO+
fN5N0Pgva4PpbOV//MBuaC3ITwQBW2mTFAqysPl1dhQaQYRA1R7EvY/wbqZ2vZB2
VOS4KyggeFeFe4PAVvhfzFp0BYUI/u4n4ZCCAhr5EMHgBnv4BXRpno2ufy9sQi+A
7G/pnMqIBhz7p5JJnz2G3QQpFfohrM0ewG6gezNf0toi9Wxyes32+GGVRXWjeQ3H
PWGJSvdZnrMAprePhDrcNzUH/OFlj3DnYMSTqA+JFoOK+bIVh5rfX/juSJ6tGzSx
2G5iR0mdMAAPfXqrg58w3vBXiA+PXQ==
=+k0V
-----END PGP SIGNATURE-----

--Sig_//799VrEy/0lurErM4DPjHtu--
