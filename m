Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA10C36D550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 12:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238304AbhD1KDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 06:03:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238576AbhD1KC5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 06:02:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D409361428;
        Wed, 28 Apr 2021 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619604132;
        bh=4rKfuNxuT4bY7djH2rV77hgx7bS4JZfyV6crN8ofwZI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=g7Av8htmkt01vAK8/U/9xLLfL9SxwETJSdSP5L/qUByPEVW4ELVrARqQ8unxz3f3X
         3u1CNi/Na1pWw+NeqLvuFCVw2iZTCBo4aqkuUvASUfNzLmIWFX8zZz3vCzdGjeCqRO
         u0ztUqxPs0FU70cPpcnvNNpeah+1P/3D02bOOt6shvDbmYKMUu4gELJTkq5jCG/Jep
         R/vuhQtciHRgJFe7mXSLkNBNw+DY2i5Xax0bHuzXtFaYgE7q0lRcjaNkxI0jSNniT9
         Vg4Ha53dM6yd2K1zI/ZxATSxQi63vpNQWEG/SaYCy/Arx4jvCZk/HPJW+DvDsQZhcW
         29rZ6ZpbVExRA==
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
Subject: Re: [PATCH v7 4/5] usb: dwc3: qcom: Configure wakeup interrupts
 during suspend
In-Reply-To: <1619586716-8687-5-git-send-email-sanm@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-5-git-send-email-sanm@codeaurora.org>
Date:   Wed, 28 Apr 2021 13:02:04 +0300
Message-ID: <87o8dyk9r7.fsf@kernel.org>
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
> Configure interrupts based on hs_phy_mode to avoid triggering of
> interrupts during system suspend and suspend the device successfully.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 66183c6..82125bc 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -316,22 +316,36 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
>=20=20
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);

and who's using this?

>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);

or this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJMpwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY3WQ//egPFZ6rFOwMJN2z28acWg0qrBgOq4+zF
LgHi7jAre4kEFG8383bfpklyCqyFQrtPCvOxgFEMqDUw+OQCMukYX6PTrfJYRjty
L+Yir6Z47XRIaN/Li/AYXaf3Oze2kcsdTEFj0aWhgrd5QCa6q4Yq7KnXiYXQywy/
2fWI5qLLoh9mK6H5RBNtNWv0eb2PFt+IjJz9NHFfVT1l3HvRJ+cxhSR9VGA+3f/n
LqmL0XRfSYhgPWLsAeDDAVO6noJt68Gt4mk/IMD4hU3L5F3hJA5nKzXbgmA58m93
kRbdgl8aY0SwsET1PGrlzstN3nVrMq8KQi7AuXggoRSSbtsshtsnxdZgLb+AYgxX
TjRu3A9y4zqq5Q7g9l9wITsy0QLhUM/I+X5+jG/L3kuMtFaJTIqRMdj2oHpxv/dG
z5725AkG408ZjJpABkGBC67ziWC56AYeRBveddhYgMv/R4rVAkmQNnYisBwbtUGI
1kBehUikeWznIJwqJJ2sfnQlCL7Ji96zJwok9xdIK1CAllwMW0o4C6ouvhUy+c/v
r+D8r/Z/HB7oVH9b6RIzYzQ92KurbcEcFPfgyAHvB8SlPL3UaTM5fb6eTa6Um4Qw
0cBoZFTmMSjrD+tMCnBp7mr4UGQy6yi1RT1l+Thpsr13k8QhQDMeOmlwVhVwNVLl
vqr+Z9xRqOg=
=5e9z
-----END PGP SIGNATURE-----
--=-=-=--
