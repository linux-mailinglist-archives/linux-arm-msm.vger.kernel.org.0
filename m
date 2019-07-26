Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E9C7690B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 15:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfGZNsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 09:48:51 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:57024 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbfGZNsu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 09:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=htfhLWZo77GI35WrasDZvyZIUNtrtd28Pfw24aVqO8Y=; b=oyvoqopAJAEKIZxWMVJWh6bib
        XdDilmXtqJcZJbrrevFZkky2ixNq0TZ3WuvR+OAS6S0m2FybWVn9XDYYg7HaqoDokpkiRsPcdgBz4
        tpBazO6n0zmZGZpKY2Ukv/QDBnf00FOYzxLgWtFhXbvAyZlZFPSMdVOGf5UE9Okb+hFqM=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hr0aS-00023k-Uf; Fri, 26 Jul 2019 13:48:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id DBD182742B63; Fri, 26 Jul 2019 14:48:43 +0100 (BST)
Date:   Fri, 26 Jul 2019 14:48:43 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: next/master boot: 254 boots: 16 failed, 231 passed with 4
 offline, 1 untried/unknown, 2 conflicts (next-20190726)
Message-ID: <20190726134843.GC55803@sirena.org.uk>
References: <5d3aef79.1c69fb81.111b9.a701@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <5d3aef79.1c69fb81.111b9.a701@mx.google.com>
X-Cookie: Think sideways!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2019 at 05:18:01AM -0700, kernelci.org bot wrote:

The past few versions of -next failed to boot on apq8096-db820c:

>     defconfig:
>         gcc-8:
>             apq8096-db820c: 1 failed lab

with an RCU stall towards the end of boot:

00:03:40.521336  [   18.487538] qcom_q6v5_pas adsp-pil: adsp-pil supply px not found, using dummy regulator
00:04:01.523104  [   39.499613] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
00:04:01.533371  [   39.499657] rcu: 	2-...!: (0 ticks this GP) idle=9ca/1/0x4000000000000000 softirq=1450/1450 fqs=50
00:04:01.537544  [   39.504689] 	(detected by 0, t=5252 jiffies, g=2425, q=619)
00:04:01.541727  [   39.513539] Task dump for CPU 2:
00:04:01.547929  [   39.519096] seq             R  running task        0   199    198 0x00000000

Full details and logs at:

	https://kernelci.org/boot/id/5d3aa7ea59b5142ba868890f/

The last version that worked was from the 15th and there seem to be
similar issues in mainline since -rc1.

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl07BLsACgkQJNaLcl1U
h9Cizgf+Me4RzqbuEHdvW+EQJup+d34Qw3wZ0/GAFQhI/JjOpNk7MyyppherGwDv
WfQkX54QZ+szqipujtfsM7BOHn6WrY5yl7vWF5PNmBaKnq2COZkqIDMvP4tOLfPd
Ni5U/6zJZu2WPGtV+W4stbGKfJJx/4M+LOl8+94bpr24aXrbt4LzoPHQlpBofkoe
fO0qvOy6gwUXntL8TLMPz8WxXyCsfkE7oZ+9xfVpS2tBN2Qbzrf7AxB+dls80iB6
DJUm4/2vxP9KdpwFCAA/gdBVgAdIqhlKwNyL63wral4HsM6jijAKAp61MV3dIUfG
I+gyLOxXa6nCzfuq9L4uIxE1pVuwIA==
=AiHc
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
