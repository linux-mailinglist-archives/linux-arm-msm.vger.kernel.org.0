Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C316595B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbfGKOuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 10:50:52 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37458 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGKOuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 10:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Gsyd3BVYBKHHuqTtU8Si5TwOMYs0YHflhumMkSpsWz8=; b=abIjBhdhQHG5fF3QMgDo3bBn0
        gsx4nTm6PFNW5T3bhzNJH8WC8W9MjCoWKhX/NTHqGE2jgLt4rues1e3vXtg3TZlaEwIQI0893S9tC
        TA65kPIByTxyxaOQvkLNOjMUmI7sSlkKP7xjotTj9M9IM63CCWB19DcBWvUSdtNsXK1/E=;
Received: from [217.140.106.52] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hlaPG-0002V8-5h; Thu, 11 Jul 2019 14:50:46 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 5FEC5D02DA8; Thu, 11 Jul 2019 15:50:45 +0100 (BST)
Date:   Thu, 11 Jul 2019 15:50:45 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
Message-ID: <20190711145045.GI14859@sirena.co.uk>
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk>
 <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k9xkV0rc9XGsukaG"
Content-Disposition: inline
In-Reply-To: <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
X-Cookie: Visit beautiful Vergas, Minnesota.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--k9xkV0rc9XGsukaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2019 at 03:11:56PM +0200, Andrzej Hajda wrote:

> 1. DSI protocol defines actually more than 30 types of transactions[1],
> but this patchset implements only few of them (dsi generic write/read
> family). Is it possible to implement multiple types of transactions in
> regmap?

You can, there's a couple of different ways depending on how
exactly things are done.

> 3. DSI devices are no MFDs so regmap abstraction has no big value added
> (correct me, if there are other significant benefits).

There's a few extra bits even if you're not using the marshalling
code to get things onto the bus - the main ones are the register
cache support (which people often use for simpler suspend/resume
support) and the debug and trace facilities (things like
tracepoints and debugfs for dumping the register map).  There's
no real connection to MFDs, I'd say the majority of users are not
MFDs.

--k9xkV0rc9XGsukaG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0nTMQACgkQJNaLcl1U
h9COWwf/Sq+8m5v5HZV9s4Y2bMQej7xG12IRt++iYd71CPndpoCN0S7TYrkCXSA4
WlzXW7E6jgYQEkk1JB1NDuwsgknq28mrWy+K/qCYRCF+V4xoRyKZM30gvXjt+2Jk
bgCYj9df40V+IgPwvtwY6gmry8XdyGT0Ps9w2kHmO/mvcQJja6GsJQHZ/xNBdPDm
DympAQuAa/c7dEh/147U1OiWAnLenr2aVD4JzztuVQzphIosmjd8Q9HCKUDwAubq
xcUOLg3nkJ5S7tEtLiTKnQcUjTvpCrQA8n/6/rMOUv8FKAjHZxiL1xBw22j4ueoP
uP8ZYMKLBefiJQen3owvVaLCUFHAfg==
=NDQM
-----END PGP SIGNATURE-----

--k9xkV0rc9XGsukaG--
