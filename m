Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B50486B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfFQPMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:12:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59652 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFQPMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gFDqpMSmeHyT6ITB2jLJUyTPILStKOxXOJUQOVeCQ4M=; b=V7ezCG0OtfQrRMFQi9VmWFChY
        57H1ODyRgfh98JattwiP7pVmEdRt7aldBFcweXrFq5R4luw1yxhugQQQE3KPAnI0pyHNM8cpoAMof
        tbH/qmrhYuvbJLjKrQJSaUq+P280I9cq6292wEUlRWr6UQmnbtUkfKvcYGfD8bPvNiyBY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hctJD-0001v2-FU; Mon, 17 Jun 2019 15:12:35 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id C74DD440046; Mon, 17 Jun 2019 16:12:34 +0100 (BST)
Date:   Mon, 17 Jun 2019 16:12:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] PM8005 and PMS405 regulator support
Message-ID: <20190617151234.GV5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190617145853.GT5316@sirena.org.uk>
 <CAOCk7NrSBjbyJ3YJoF22i9ysxVTw38SvsaSi9JwVrj7W8er24A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m5R8f+g8StfRwQ/I"
Content-Disposition: inline
In-Reply-To: <CAOCk7NrSBjbyJ3YJoF22i9ysxVTw38SvsaSi9JwVrj7W8er24A@mail.gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--m5R8f+g8StfRwQ/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2019 at 09:04:23AM -0600, Jeffrey Hugo wrote:

> Are you ok to proceed in the review, or do you want a repost?

You should already have some review comments.

--m5R8f+g8StfRwQ/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HreEACgkQJNaLcl1U
h9CHTwgAgY/kBE0OcbbnXxZ4z6u8NtNVTaMA2j9N2m8jgf5gQhWnF0k9oQ43mj3E
Tm//b3mQr4h8hGwft0OQFGXFSfAtCzVyxgTn7FevnxhUZ73b38ZXm5ME6vElJnod
LdZlycPDtZO8HViyuWC01+2NFg93TPBWdoxblbohqMlkozXhmEoHkh9tO8ZA7Rfo
wEeHDJ0uNphiKu3e5gIiV9vyva4aoNTKSsJYXZ8FfUglIzzG3mXtuQF6VROA6BHT
tLNIgxJD+r6jnqhZjyKjuD35zk2TfqtyQzcuKAq+wfle74xypBCIvOyTsBFF6Pw1
offiQ5cHCTOdT/bjFetjABUmqwAmpg==
=Rw6d
-----END PGP SIGNATURE-----

--m5R8f+g8StfRwQ/I--
