Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8691A2F9E48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 12:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390282AbhARL3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 06:29:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:59202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390258AbhARL3P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 06:29:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 985D7222B3;
        Mon, 18 Jan 2021 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610969315;
        bh=c0eIqJRbjT0hCCLPG5GwxthzWmzDFeiFgXMCYn+LmlY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lB1ioYhrWdqAFFmMLMnMvOZr01UynnQXGh6AdayJn9NvgqbwMkjxlnA85qWf6UI74
         WWxPyw+mnPVjMbKE9RVw0CeyX8gGoTtB7gzlccRHSsG1uEUY/S7LR6n1bdJNJr9JhQ
         bsq/JRaowISt1zcs9ZVk5nMLGfEwXcZ65RzOdC5Y98065jkPI6IX9KyfD4XR/Npbxa
         6F27m4IHFg0PKcWENF5OTaws7jPju4payFoGYFxZBC0abBiKHIFuAtnhPIFZv7JtWJ
         4/E7dBwdJPnyf8RJ8oPP4nZB0kyP/T+NQEJpmQfX8gCX1gIxdJddNGMTTY1Gc1siX3
         eb8q1NkXmdZJQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: add URS Host support for sdm845
 ACPI boot
In-Reply-To: <20210115035057.10994-1-shawn.guo@linaro.org>
References: <20210115035057.10994-1-shawn.guo@linaro.org>
Date:   Mon, 18 Jan 2021 13:28:27 +0200
Message-ID: <87bldmwkkk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Shawn Guo <shawn.guo@linaro.org> writes:

> For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
> holds the memory resource, while interrupt resources reside in the child
> nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
> creating platform device for USB0 node, and then retrieve interrupt
> resources from USB0 platform device.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Acked-by: Felipe Balbi <balbi@.kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAFcNsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb8Uw/9G8O+kcOYMlymXXcbWA5asT96XHu4Kmoo
PiApVcFo0+KKMuTjH+MAAo72AjffVcp5fmY5RkbfiSLgdW4qOhZNLF+tkBy1YdG1
pNkvZA+9LhpYFV2U3iAbD7XkZMhhTZrye/GQcyXtRAFQrLrt53IQPg1lR2PRcM+P
vEfuTwZ3rdRqZ/DG00fjSYq5gYcS+pA7fkulCsjOCS/9H+jHlgK5rPocFIvNhgcy
4UBdctmInbKJC5Oh1amGdYAiZ3ij5yAPSPcdZW3mgL4euNFbWAB31cXtA8xDbjGW
/yspgOnr9HFEcTwmuIkLiM9n5cq5iuEnfaW6VMmvualhP5GEZOqZJOB3eaQW+zWB
y9fWpSrl/dUHJROFSWOlissVdbozLGAC3yy6DAHc3dL2/ZY0dXPreyGvbFB9zUj9
r3EMc8vbMk0sbIDliwb10kj8Qjb6nNOcorZuuumi/SXv+4O+pWYRMoJWnAa8IDdz
2QcgKHgxPnjFqknQ3HaB+fAddupbic1NSMbdv9OtqtjuYRjpJfbDTgUXBdq7dh/e
GGRhJaJVyOzbkGSD3pGQoBLhDg1LFldqo+SmxmyIsYQtp3w/ld0axEu7Cs2J0RX9
RXOhjMPK9S8/3Ey55vzEPubYoid1zOqr7ffhIhdpWctg2jj8HnPWFczIKvWdkFqk
TBVE1ihoLD4=
=Y34q
-----END PGP SIGNATURE-----
--=-=-=--
