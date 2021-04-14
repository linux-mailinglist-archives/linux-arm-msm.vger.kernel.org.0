Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675DF35EF45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349916AbhDNINT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:13:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349935AbhDNIMb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:12:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF3776128E;
        Wed, 14 Apr 2021 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387929;
        bh=qpvi9YgbSNvAK7mKvo9Ce2AsQoRwog9SLpIlnYd26ro=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Cn9jzUl1j1g5w/52kMhvjpy+gXwxrftO2H7TshFdp9JKTCFTZgKI2wIcki1tTF8T7
         7lNnPaTXfEjpCn7CXUXYXsQp1PqC7+0mZOMAk+E1YqJCS1BtjorZ+wwP7x2SGdcmfi
         cWtdLvApPh578SYlTbygHPvcQ98U+c/Wm2ggP4n2n0OFZQhH6ABPkatFDdHH/zIR69
         xMxLez6nzbP0RWyIe6gbmRBHLLlrb5NtgLCiUJcHrAaa05JMqI6nxx+TZ7c63gOL8h
         0X27EA9R0Dvxg71ByZX1cSqEQTf/PQpoLaz5Akp3UHpbHAbyrDSuaTbocKDFr+aOM3
         yNa4faJ26lpxw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v2] usb: dwc3: core: Add shutdown callback for dwc3
In-Reply-To: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
References: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
Date:   Wed, 14 Apr 2021 11:12:02 +0300
Message-ID: <877dl5p9nx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sandeep Maheswaram <sanm@codeaurora.org> writes:

> This patch adds a shutdown callback to USB DWC core driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB2o9IRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYSfg/+P7+iJzxCwEPMx+ioEmfCiBsenhqHbTgt
w/9Bt0Z3tnGnc7QQgZn4ohQf/hVLWTZyG7+PGgNwFVJJxJx9lqY3U5l+GGpGFuQw
burUM7tYGDuoIwHQfbNT6kNP5Q6xh1gxXOBVXsf0+5vDOgqVIfYDGW49bcNGLczq
g6YsO8cWepCistHlB2i55i40d+GgZgwRGKgpjXKHPMUNzIQlgPphfoIWvgJGqAoG
wTe1IKjuM8cGVYJkDYEzAsU6fons25j22mt5Z8KeN/tfEmzkUdvE2q5P7UyTzXeL
xM1Q8AfzYp4VNbsVU4+VCLS1HfTK5GJMEHHTFuxhKbEKB0vb3xJI36bvEFerf/is
jNPJGD5vSpjaPUXCJwdcXkNSXjSNYVtEO/GqsaxzGBRs1BtHUybSjkMFRtmeZTEi
LNUpk11eXQRymb+XPE0FuuwuxSQtsvkT9A0qOg+Z6yPJM9Kv9XNNT9WY8NAbI/9l
8ty47gH6yz4UXHSU5pDT2XXM/8zdQB69AU15swi/1ot9ZTM5ohqJ2asH8oZ6LTfG
y4hFNZ4y+vbrTuOTbKBe6i6MknrCasVWAGIrJoK3Yvr3Az5PKzR31aNOdbnqw+9Z
zCi/rVxV+itbVzATX9mJx5k1anEoR3bKOcpG52Ah2W2+CuI8VY8FD4AMeb0lf7kp
p2NO7FCOvOY=
=hQbm
-----END PGP SIGNATURE-----
--=-=-=--
