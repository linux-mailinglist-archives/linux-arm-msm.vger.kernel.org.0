Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12EE33607E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 13:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhDOLC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 07:02:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231771AbhDOLC2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 07:02:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 974DC611AB;
        Thu, 15 Apr 2021 11:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618484525;
        bh=sVJ/h7zwVZsrrXToGKSoKx7eoaftQOWQsJe3/XUtpoo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HwomBM3xrsxGj7wWKu4c2ubfmvb1SaVDomkKCVp/88u4admbp6kGdsv24B/wrh6UJ
         rFap2WvEpuaIbBzLjJ8Nem1PlaP3WYWY4ihGXhAoQoi1zjby4vtSB9jgISO9LwfVcU
         91jryA3k1OreWbNe24QkBRDAXaWfTMj+hrOru+gS7EMjj7rOYtCQ4z0V1kqMZimCXj
         wIDpXuMOYJE+zo5kX+wuRvu4EaybZavS+pYwBnCpkIRQE04cgrBp1PPMx1JPqzm3nx
         9PPKfXYN5KitByrxVP4sjruBavqeFzLy+Q0zS4CVCo0yJWyhyEoC0AFlsf5biO481S
         SwsBIV1EU1Iiw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Caleb Connolly <caleb@connolly.tech>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: boot: dts: qcom: sm8150: add SPI nodes
In-Reply-To: <CAA8EJpqT-yJwd7D-zzOem5Zj--LbiyjbXB5zt23F7RLfeZhAag@mail.gmail.com>
References: <20210415103854.1810788-1-balbi@kernel.org>
 <CAA8EJpqT-yJwd7D-zzOem5Zj--LbiyjbXB5zt23F7RLfeZhAag@mail.gmail.com>
Date:   Thu, 15 Apr 2021 14:01:58 +0300
Message-ID: <87blafolp5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi,
>
> On Thu, 15 Apr 2021 at 13:39, Felipe Balbi <balbi@kernel.org> wrote:
>>
>> From: Felipe Balbi <felipe.balbi@microsoft.com>
>>
>> Add missing SPI nodes for SM8150.
>>
>> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
>
> I'd suggest switching to gpio-cs as implemented for sc7180 and sm8250.
> At least I'd propose to split the pinctrl into data+clock and CS
> configurations, so that the CS implementation can be easily selected
> on the board level.

I can do that, sure. What do we gain from it, though? The possibility of
using more chip selects? It also sounds to me like this could be done as
a separate patch.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB4HSYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbmqQ/9G46E3gIll+Qy8sQ1YVLcoA1tqAj0m0hI
+CNl+bJnf2SL4Cvvk7R3WX7jIQQeCEldwpS/TMJG4FJ+UC+MQ3hc0IHJWwP5RuIf
hXtqFt01mvKY16+/e2Ns28Ulxk3mwuGBItFMFocKgrbfnDPHWObyXOy+3D6pKF+U
aOfsgD0OovU7J4cDA1IvTjJ8v7Dp2GbJY5ka+e6ORajOGbDwfMygY7XVc79iyP7Q
Jy6jNG1bv+Aw+rH7XH5EQtHtX1fvfwSYKQ5pU8nTuLgunfDye1HB8mkI4rZ2bod1
oVpOQ8+tiq25jZ/2x00fVDsqSFVLVlH17jkNdvrYP2+9/L5NkMD20xI24gy0B0E6
MQPzRChUfVDBYDTHB2/CdIQU6oJg+7ZjOTvRqUAzON1EqmaYA10MU9G56CCT9VNq
3FtcIFATZHjX0OxY2miOXbtsA8Iq8VtGWf7GymxoK2BqwiWillZLVaIXWU43Zhd/
8jcbD+w4FVtz+Xs8kQ6G7ylHA3AQR/h3EIbMOnLOoKsuje4ugzPUSVY/0rRUlRk7
Jf8baNts/m6yEw5m37XZQQM+yzcP4hQwZ5hX3i61+0HgT2eeB9Aa/KDWzYfiI5i2
RKX8hY65V1Z2AIJlwBffRXrayYfvZJsdgmM83RihRuG78gdD3bJYBtMNR7KrBasm
TbQq319E3fg=
=Yeu6
-----END PGP SIGNATURE-----
--=-=-=--
