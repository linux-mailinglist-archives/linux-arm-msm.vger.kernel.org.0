Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A82A36D562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 12:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238705AbhD1KFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 06:05:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238345AbhD1KFg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 06:05:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7AAC61026;
        Wed, 28 Apr 2021 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619604291;
        bh=iFzCYsS6n50BVnPR76KE9p0OrirQuVhmOtuaCqfj4yk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=E9PeTrMoeMTDdLMyEnrU5fJPiUmw8hEBRdhdxX6zsYeFu1lM+6MY5SbnNECCRNqHi
         94UEFs9Vy5aokmh5e8WjCrz2A2fVVb393kl7mej6YkWZibHRhDkbbznLzr4cc9zy+n
         7ZxSauru2kO1VjEVGjb1gqnGzl8jHBJ5tbU5TwBQnHnlAhAuuOd5US1GKycT7pJFug
         pDDxTEnSera3KDkSqaGwiqya8SqOFFt8cDuRUjcTDcCYI9VtwCUiHsJU/74310T4+7
         tBnpnAzAnP2b/8wZiwXh6l+py/VKl92jOJaNsqGzxH6OI4RjVm+nnseXnjmFPKnrZa
         SOBqSsio6LnaA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Keep power domain on to support
 wakeup
In-Reply-To: <1619586716-8687-6-git-send-email-sanm@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-6-git-send-email-sanm@codeaurora.org>
Date:   Wed, 28 Apr 2021 13:04:43 +0300
Message-ID: <87lf92k9ms.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Sandeep Maheswaram <sanm@codeaurora.org> writes:
> If wakeup capable devices are connected to the controller (directly
> or through hubs) at suspend time keep the power domain on in order
> to support wakeup from these devices.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 82125bc..1e220af 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -17,9 +17,11 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pm_domain.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
>  #include <linux/iopoll.h>
> +#include <linux/usb/hcd.h>
>=20=20
>  #include "core.h"
>=20=20
> @@ -354,10 +356,19 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
>  	int i, ret;
> +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +	struct usb_hcd  *hcd;
> +	struct generic_pm_domain *genpd =3D pd_to_genpd(qcom->dev->pm_domain);
>=20=20
>  	if (qcom->is_suspended)
>  		return 0;
>=20=20
> +	if (dwc->xhci) {
> +		hcd =3D platform_get_drvdata(dwc->xhci);
> +		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +			genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> +	}

wow, you really need to find a way to do these things generically
instead of bypassing a bunch of layers and access stuff $this doesn't
directly own.

I'm gonna say 'no' to this, sorry. It looks like xhci should, directly,
learn about much of this instead of hiding it 3-layers deep into the
dwc3 glue layer for your specific SoC.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJMzsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYs/RAAo7Ph+w0Vcph7Me0lGNlH8SvYkjZx+0EU
f9OM80JJTE5q+n/MvoyEXLY6b8Yab0lvMR4hhe+f6tvzGtqCUH6M2eA70RQGCVNu
EJ35fOMJqtf0s8ZpswqGZti9S5anyvCJOW+hV95VqMgpFZeepSomHJjYWx7i8F2b
rv7aiKDdxTkcx6zVpcqQCHOwpb5KFX5Lz4ZxqWuULqtS98VLfLvgY8o/UmYqMwW1
QFPZ+ocgQNWUkM00kGEl3SI78ldOjvH1zQ8IELtadDMWwoSdz3ZqvkuBSq+nzg+E
hNkbULcYrxDkI6E+ZR8HVNkKo07sRITrOw3UgOmjYPkdMYoRUcw5mnck4/KXmTE6
gPOzVU3+8op5j9DbNbAcHJhsUypOMuB+hUFqOH5NW3DjAXLaefwEIE57bYWs11eV
EuFSSWjbbAExEO0wCK0zBaZLnytOlwbmsdroyOthjETzX+K8or65JOZ/Sdb9Wvy5
2y7en/vGvntFvMM2CEtThxzuGN9rfPtx5UO2+1V+WxIC7v5olbVCzCyEHdt74M2p
0YZq+RtZqM40hgtFCmBes/A4aP92nwy7pjDiCRzHEQWULo0E05dWYSzgHDZGOuMv
ydLgOWMpeR49uSkpn3ngxae6tvF3LPgyWvOFfsh31Tq+ALRfqQpI5ibIqO723tWd
+5L06YxxMLA=
=lX8L
-----END PGP SIGNATURE-----
--=-=-=--
