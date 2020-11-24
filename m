Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE09F2C1D87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 06:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgKXF1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 00:27:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:53880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727692AbgKXF1G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 00:27:06 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2645206FB;
        Tue, 24 Nov 2020 05:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606195625;
        bh=9HN+v8e9sNlTVb576LTxtJfY5pbnqjzuXozS//Hk2Ts=;
        h=Date:From:To:Cc:Subject:From;
        b=Zg5oUdaWJ1FkaYJQ+VdRf+qRmpBgGxY51zLp7dFrK9T9oh73KMtZvZk3p7haFq9c5
         iELr7t2f0hYcS1KjdkQjzCKGM+Kn0ziQ1fnnPQzucb2C88T0foDT7MPQXge7Y4HrvV
         HuLcG8RF+HP3BvX++j/A0lD3tAnTXQpIWcIpS1FE=
Date:   Tue, 24 Nov 2020 10:57:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Reusing DTS from arm64 to arm
Message-ID: <20201124052701.GF8403@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Olof, Rob,

We have Qualcomm arm platform which uses PMIC PM8150B. This PMIC was
also used in SM8150 board and is already upstream [1] but in arm64.

So, what is the guidance to share DTS files between 32 and 64 variants?
Does a solution already exist which I may not be aware of..?

I can think of following options for this, in case we dont have a
solution:

1. Hack up arm include paths to also include arm64 path so that we can
share DTS

2. Use relative path of arm64 directory and include that (seems not
great to look at)

3. Copy the file (simplest but least preferred)

Or is there a better idea to solve this...?

[1]: arch/arm64/boot/dts/qcom/pm8150b.dtsi

Thanks
--=20
~Vinod

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAl+8maQACgkQfBQHDyUj
g0fHOw//WNvGDIiqgvWNzo777TL88HGKNVrDZZdHNSNVrSKKeOPCntHu94s/VrGM
QayMkLoXuZCkmpo204lpSjwQYrDYKd2ovl9vYuSj5N5N3g4TCAJuoNVZC5oofSoB
QlD3cjVqZSt1p88Jbq/l3BecKWHR2KJlfPOCyM3ulpss8ZBwvM9AOswVNznp+x5T
VEdS6pOiHG1lsXoK/I+F9TWCoYM6j4lYABsPMC34kFC6BZDJJV4h1WGeKQmughMh
hHXAmiqUVzFi4J7gympwPGmX5+QJFyFNRW2QKe8BKTEHlwShy4JGxtArDI/1eLQ9
vTRu+VSLIUKZJyeyFrxrnqNp8DHKDxFc84CTSFWfExT8nN8CrA9TuzRIRqwz7YC3
BlDCjSVd5JFUir5u+YnmpdtOh4NpCKBnliYKWJTJVzIivqYvC49nlWdm/lHFsqq3
kH2SXE16gUaLHejJlkVNaQD3UiTQ86U+8YLBr8lztX0Wkw7KFZE6JwKg1gr6lEJ2
CxakEbI5uA4HuEUk5qpdt6BZpdJEh8YHv2Boapkf2kif05DLnFqBmfCMTe0rVNPM
QvHDTr3e2GJT9RE0A35fnZweajgs7URlFLXL+MSS/OHYzAsOdzSUEO89HPW10xs4
R3yd6IxJ/i0ncVgSItaLzyJjJUsR0DdAgYZewjTB/R+mmIYtkes=
=SGsM
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
