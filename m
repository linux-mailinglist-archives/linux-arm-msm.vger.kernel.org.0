Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9E13A3C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 08:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhFKGdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 02:33:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhFKGdS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 02:33:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 511E761285;
        Fri, 11 Jun 2021 06:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623393081;
        bh=PfVeZdUzqyZAR9tvZcZMZCoLd7mr/+lgF4tzHnZz75A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CLNlkAF9ElMfjXC2ffx+zqz2KN1seF2OP+wocbO4/hd6/GU6tDSmXZg5B6l1vcpco
         sYrJ5xQ7KCZvs7d4OAa1T5qgW37KILlgETMZjphZvawdF352114lFkFryW7XpShplP
         LhaJl6tM7qWfMusY9qoXqo5VdxZ40RzDizjil2WfLYAg8L8b/bwSJdYxDmE9zrMgQU
         ZLCMW94HVa07XaWPzOLROIH2fimuVng6JrRx6FOMR1aQ6Bq5rKoIZEe5g2VPHlvZ7f
         G/qvFJ5nBBqq00fRgsJGoVSDQaT6dIsFgA/SZvog4a6rqunoPa+bUVQ+8DVL0OXOIO
         3SYOjj79ECoug==
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: add initial device-tree for
 Microsoft Surface Duo
In-Reply-To: <YMI5F5cskjXuCcwm@builder.lan>
References: <20210603122923.1919624-1-balbi@kernel.org>
 <875yyl28bp.fsf@kernel.org> <YMI5F5cskjXuCcwm@builder.lan>
Date:   Fri, 11 Jun 2021 09:30:38 +0300
Message-ID: <87zgvwzze9.fsf@kernel.org>
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

Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> On Thu 10 Jun 07:49 CDT 2021, Felipe Balbi wrote:
>
>> Felipe Balbi <balbi@kernel.org> writes:
>>=20
>> > From: Felipe Balbi <felipe.balbi@microsoft.com>
>> >
>> > Microsoft Surface Duo is based on SM8150 chipset. This new Device Tree
>> > is a copy of sm8150-mtp with a the addition of the volume up key and
>> > relevant i2c nodes.
>> >
>> > Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
>>=20
>> Gentle reminder here.
>>=20
>
> Sorry, it's been sitting in my local tree for a few days, but now it's
> pushed out.

awesome, thank you

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDDAw4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUg+nQf/ew361XEAkicS1SWrdRpbcZv+e3wSxHu0
VwLEGodXIyny0hoC4XbkU93vuOVWS/zqYtSS64uPfkKdm8gvACdOS1QmwrfN1vFn
cdNJYOzLbkdriHm3dxgxBv3m4FDYbTYuo3rc08ZnKZrHGA1yUsqXrJipI+PzrlsI
TI03fEancJiTo0k0eik1sBIkXHqnqcC4xglmvyeE85dTaJQYp0ezeVwGcbRiwyhn
mrpoUebHwlUdFgc7CR1bnVAZGnQ1V6T2fQi3qh8JOr2TpUMLqpjAoPPgexy/mumf
Kle0VWBlyXcCxIEp6O3ZFkVQqUgZA7aehrl6YYm1PyTwmci7WQHfuQ==
=Q8jJ
-----END PGP SIGNATURE-----
--=-=-=--
