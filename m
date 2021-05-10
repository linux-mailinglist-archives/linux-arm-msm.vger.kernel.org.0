Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E32C378E96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 15:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhEJNa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 09:30:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:54420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245594AbhEJMN1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 08:13:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B980961421;
        Mon, 10 May 2021 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620648743;
        bh=D19dJUNiBTvN/hFsW3CWbmJozdGfHg/SsbXpY1WSHaw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ngspuHHUSu/UJ/4VvJjT3eVhfR8+cBf4fyc1CAD8hwKeOzTYhCnuAnmHcd00pu0py
         AwWr0Obopov3psEyE4zDn6bgOyxOmYTZ+Pw613LC7Cvj5KjceRvyDvv/BWJi6XNGkb
         jENS2nNvSfwSeaNFGYBYrYedDh8VgT4W+ETzf7ZfIwsoZ55q5KMcYm6S7cEyeIggyN
         A5i8uChLGAyfeRe2jRgCqcg/HSsTzFnPH0Vfp7lgYoXOyjHQvgc+phA3BBO8By7UN9
         dGaGwGLnN9XRNbx33Sl2IiEocarx3wVDn4kFsh7bPY9ycenpy1mF3Ofvt7JmC9VPUW
         pRrH7ra7d2a6Q==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Free gadget structure only after
 freeing endpoints
In-Reply-To: <20210501093558.7375-1-jackp@codeaurora.org>
References: <20210501093055.1468-1-jackp@codeaurora.org>
 <20210501093558.7375-1-jackp@codeaurora.org>
Date:   Mon, 10 May 2021 15:12:12 +0300
Message-ID: <878s4mhjoj.fsf@kernel.org>
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

Jack Pham <jackp@codeaurora.org> writes:

> As part of commit e81a7018d93a ("usb: dwc3: allocate gadget structure
> dynamically") the dwc3_gadget_release() was added which will free
> the dwc->gadget structure upon the device's removal when
> usb_del_gadget_udc() is called in dwc3_gadget_exit().
>
> However, simply freeing the gadget results a dangling pointer
> situation: the endpoints created in dwc3_gadget_init_endpoints()
> have their dep->endpoint.ep_list members chained off the list_head
> anchored at dwc->gadget->ep_list.  Thus when dwc->gadget is freed,
> the first dwc3_ep in the list now has a dangling prev pointer and
> likewise for the next pointer of the dwc3_ep at the tail of the list.
> The dwc3_gadget_free_endpoints() that follows will result in a
> use-after-free when it calls list_del().
>
> This was caught by enabling KASAN and performing a driver unbind.
> The recent commit 568262bf5492 ("usb: dwc3: core: Add shutdown
> callback for dwc3") also exposes this as a panic during shutdown.
>
> There are a few possibilities to fix this.  One could be to perform
> a list_del() of the gadget->ep_list itself which removes it from
> the rest of the dwc3_ep chain.
>
> Another approach is what this patch does, by splitting up the
> usb_del_gadget_udc() call into its separate "del" and "put"
> components.  This allows dwc3_gadget_free_endpoints() to be
> called before the gadget is finally freed with usb_put_gadget().
>
> Fixes: e81a7018d93a ("usb: dwc3: allocate gadget structure dynamically")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v2: Fix silly typo: usb_del_gadget_put -> usb_put_gadget (brain fart
> when manually recomposing the patch)

I thought I had acked this one already, looks like I missed it:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCZIxwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUg0aQgAhppvQHl7rZw7/RT99RwfEviuO0zJqkny
YXR3Ob3UKwt9baLUv9lV4ePCEWa2a3szgewCk3jxfiP0RRoOVpWyXgsmUK8LKGig
25pW8Z6kfC/lIstEVynnujCUuupeGHS0a6bGY3gdAffIyrAkrOes4qhPpYoPSfP1
u3J9qVzL2uAsjmjaHwJVT15dfNCkBtVNCUDfzndeGHWcBw7EtOfxlFCDwuKbBxsx
7rG1P0LmZy5Nb37M/S2r21Wv99MPacsJ785cLI4242usxvbFAAknkIxczS1XPFys
MhORFaOq4noAbsajKE/KBfDHREj7yOFpHWvUiPXfBTW1A4OA+0nUpg==
=BBVy
-----END PGP SIGNATURE-----
--=-=-=--
