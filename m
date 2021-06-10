Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5F43A2BF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 14:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhFJMvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 08:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230366AbhFJMve (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 08:51:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA4F8613F5;
        Thu, 10 Jun 2021 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623329378;
        bh=g/k5a+HWZi4gjwq6dC6MPwZkE4Zc5XUfJZ8mY+gSKEI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RWI6SyGJH8vMo0wt9MmXaOxfX51Twwgz9Wo6GzzFdPLODubOeWOm3ccOsdqOniv62
         IC3bROhj1zWXvuj13WwkGL6JVAOogfML1A6RHEgnCEwIxYd+dqkRrjyg3t+pq/MaDT
         bz38XxPFNvpsgc/yt/BZCwE8mjeTGX0yKd5caQxN4SBpDNW1Lte72VLuzGHPchDoCH
         MRCOIj0jbnWvt7X0Uj9k2aFgxG0pc9cV39fuKTtk+uTbvHke5z95/qh4QbLCZ+Fiab
         aFPPbExK+u++LrVVd1tZTGDYT76+0oTWW9Seqnzg/9z6hoRj7M/MGyVhkgSgyg6qiq
         PP263w/r9i5tQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: add initial device-tree for
 Microsoft Surface Duo
In-Reply-To: <20210603122923.1919624-1-balbi@kernel.org>
References: <20210603122923.1919624-1-balbi@kernel.org>
Date:   Thu, 10 Jun 2021 15:49:30 +0300
Message-ID: <875yyl28bp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Felipe Balbi <balbi@kernel.org> writes:

> From: Felipe Balbi <felipe.balbi@microsoft.com>
>
> Microsoft Surface Duo is based on SM8150 chipset. This new Device Tree
> is a copy of sm8150-mtp with a the addition of the volume up key and
> relevant i2c nodes.
>
> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>

Gentle reminder here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDCCloRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjJBQgAp74X8taoyOhOtiHtax6RAbX0RAv/eIyT
ca+YAny2wf7h7bE56eNkaPqGkOCV2TPMmeNQS/4vpXB9c47jMuqz8lwfor+6/jkZ
wBjZDtIMb94C0/Q8MC4nGrZXw1D0NL8HvdH450zBRVwSidz/cT975O7v7U1Nn4My
vgHX4/xIO04KTiTw2Vkann+GKHUek7dx9VC4MSC38MB9rYmu3GrC4SfnZ4Gwxv6K
T/nRIGe1dTAXLFP9lOfqbuevigVh+joy6HplipIpq+PxqYCy5VwbnK/zSbFZFf6h
49znpqcVMx3eO4U8aI61kh2SCOXOglEtHNKH2htXKr+QEqz8FGe7+Q==
=mrDY
-----END PGP SIGNATURE-----
--=-=-=--
