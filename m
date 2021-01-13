Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61112F46A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 09:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbhAMIkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 03:40:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:41016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbhAMIkx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 03:40:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D762320719;
        Wed, 13 Jan 2021 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610527210;
        bh=XcCuiJ1t9jecR1iasm+dpOPuMUTkNlkATUZZmTYh84g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ekx8KlMCJEAWd+0dWZ0WIKrXa+c64OSvb5Tv2VlMAuLsRt5Jumc6weGYU1aKFk3Vn
         prdt4vtbYHdLsmw7GS86SQHK6ad5EDzz56KnDeB0O2ri5XxyGoAjg5YmkEA1Hsz9OD
         On/PeioiHN/6m7c2/HG4uUqdepC0o+9P4k67DdonziiQdPS7CRlg34wuEV7vX03DuT
         5+CdNSpwLAwZouKCwpXo5EYe/3NdzL3LrVl+tfl9A5tr2V9rI+cyxz2wezjxxshm3N
         Rlji+Kg6+XhkZl4pQj2bKcLC7Unkj4HKbdaRC6MktwaYsjJpymRH/+Yh6DKWq7hMZ2
         uVof5MKJFMr3A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Add shutdown callback for dwc3
In-Reply-To: <1605162619-10064-1-git-send-email-sanm@codeaurora.org>
References: <1605162619-10064-1-git-send-email-sanm@codeaurora.org>
Date:   Wed, 13 Jan 2021 10:40:01 +0200
Message-ID: <87sg7544da.fsf@kernel.org>
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
> This patch adds a shutdown callback to USB DWC QCOM driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

sounds like this is fixing a bug. Do you have a Fixes tag for it? Should
this go to stable?

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d55..a930e06 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -790,13 +790,11 @@ static int dwc3_qcom_probe(struct platform_device *=
pdev)
>  	return ret;
>  }
>=20=20
> -static int dwc3_qcom_remove(struct platform_device *pdev)
> +static void __dwc3_qcom_teardown(struct dwc3_qcom *qcom)
>  {
> -	struct dwc3_qcom *qcom =3D platform_get_drvdata(pdev);
> -	struct device *dev =3D &pdev->dev;
>  	int i;
>=20=20
> -	of_platform_depopulate(dev);
> +	of_platform_depopulate(qcom->dev);
>=20=20
>  	for (i =3D qcom->num_clocks - 1; i >=3D 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> @@ -807,12 +805,27 @@ static int dwc3_qcom_remove(struct platform_device =
*pdev)
>  	dwc3_qcom_interconnect_exit(qcom);
>  	reset_control_assert(qcom->resets);
>=20=20
> -	pm_runtime_allow(dev);
> -	pm_runtime_disable(dev);
> +	pm_runtime_allow(qcom->dev);
> +	pm_runtime_disable(qcom->dev);
> +}

you can make the changes smaller by adding:

	struct device *dev =3D qcom->dev;

The nothing else needs to change in this function ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+seERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQaHDw//VzCLAhbS2V8Dlea71pWG0Y3mHVJ7c8Iw
D0UNsS4VetXQGi45dmY3O1aIjCpCvL9JANBpDk891MCzlrL0MHkrEmvLPJ3F4X/K
VDWPVSISoX1m3SnAiI36PBQCMKMgxkyn7czKCur0moWKflzjgStfdYKccIZE0U+g
6mSxUmmm1sl3cCMa9hcQ1SrwcuORP9bbZ5AlGk+M6xgbJoyKsrGUrPf4HV/PapKr
FMcuDcpMv0UKghEeHg5qRy0u8+ox0rAViT9dV2vpkgNarePaLh9DM0W8oDDlQnWs
Y0sNePKnFFab1zugfXAemrA+kotIq83WCejY4m0VTiilmuY6j0FBK0JGqGVNJ32j
3+Hyr0XiSwEEFj0EOLqZdr5tWLvUve44rsHDhTFGYPLam01AuGqa9Q/fzm5cJgAj
9LieeFX/ESST61egkrqGnP58NbhJM7rp4Pri6z2+mcZ+GX2TgskpYnLg2YCqfoLf
dYxPfSzWAZGJz3xqNM2kL0tM23FWdqGyaUGsUvga/Wi2hwp8LtVrheF9RLOaeLwP
fXdgFh73lsRbdaXWSF87nQHuYEqN+3nYsqo8TyAudOyzq6+hOy2I0lb86/iz/JpK
az5Ao0QAFuywtWcnyjc4fuFuNEeFxekVHfE9tur19yP5uEpdoPpoo3FJXr1lMpse
Klo+fcPmwB8=
=7Ebv
-----END PGP SIGNATURE-----
--=-=-=--
