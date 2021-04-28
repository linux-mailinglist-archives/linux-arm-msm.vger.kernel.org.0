Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB7A36D53B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 11:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhD1KAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 06:00:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238803AbhD1KAL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 06:00:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4ABB613E8;
        Wed, 28 Apr 2021 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619603967;
        bh=RZY4Y90izrPgFDz39z3LwccFzaBMQQjh1wGYrsQeD08=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=J4//RRm087i1cit1p2L14QWl1OwvXu+Adu4Q9XNvfyVd9BgokEt/JADHc65/FkYJy
         EyIcqZVyNRJ8E08e+zVKESRQ5y1ytSzhtneREeXraDMEILzArQ4LOvlVDlBHajmNSO
         49HxzhyMsVivdY5DHUZ6vkYResPuB6xhJdWOKCfPOOZMRg7EWV88WjGqe0thNNR0bN
         xSorPemePqx+RHDypah3klI3sfzCQU62Zyh0QUICr43whDVrjiV2ofGp7mBt3HPX17
         m88/JEju+Ohzkvx9IDPA15amY6Fij3H+MvssLyCuxOG7rGiH5BCISDEILZgJCHkBN+
         NRO2G4X5WZY1A==
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
Subject: Re: [PATCH v7 2/5] usb: dwc3: core: Host wake up support from
 system suspend
In-Reply-To: <1619586716-8687-3-git-send-email-sanm@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-3-git-send-email-sanm@codeaurora.org>
Date:   Wed, 28 Apr 2021 12:59:19 +0300
Message-ID: <87r1iuk9vs.fsf@kernel.org>
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
> Avoiding phy powerdown when wakeup capable devices are connected
> by checking phy_power_off flag.
> Phy should be on to wake up the device from suspend using wakeup capable
> devices such as keyboard and mouse.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index b6e53d8..bb414c3 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1738,7 +1738,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm=
_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && dwc->phy_power_off) {

should be able to detect this generically, no? Shouldn't
device_may_wakeup() be valid here and give you the answer you want?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJMfcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYH8w//cXMDqstNhHMVbRO7rVw7mwaHMhZuKzGX
cNG37v9otq21tZ6SjnVOJcvaUR/0LaAWt4sc8dczR/V1mtdRJppnZ2ahFxzEhhPY
cXviGcfRYZ3lNQfraKiCR4z3BtWaVwxbkajFwt2tdKWguKwmUA0S2lyPw5/TzYhB
LUv071SyCvnYhNd3TxXaixIqmATOANjDqflILo3bdLn07Dc+AiyJ7RqMu70Jz2wB
hwpYpYIPKEv9NdgsGm0TtAZU3y1q21kSUxkO3fab6LbphzXSVc66p/YE2KxRQIM8
8jdz39R/RfQp/tf92SV4YhI6R/DWPdVDE+LldXslsDoMdzWNQjHDF4pVxPiav0JT
+s3xreYvPLnQmvEO0czxKBEQmcYYuBP3gYnrzawQoKbfapWoN4BykSaPZ9Y8AaSW
SfoRQtd7jcwELbGT7BBNeYl2iGsq3WKu9AXRnH9HN6X+a4dRojOn23z/e77wjbtC
0cMyPg2HcOjusWuDfF0hW5QX/aU2Yi5xaayxydcqULNr32EFntgC2s2xr/v7YM6t
9iwQt7wx856yokOVrOgHgIevXuIyOXUQUgfd6JRFv6FDH0ZvlmSvVwpn9GhBnA3l
MkQisY9FvZPt9wN2nqeWHIaTM2mgRmT3MENiuUgPkwph+Yob3TMz/G5RwJEFxMU3
vNkhmm2s5uw=
=NdHw
-----END PGP SIGNATURE-----
--=-=-=--
