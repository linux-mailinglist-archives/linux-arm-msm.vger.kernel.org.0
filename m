Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA8C274123
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 13:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgIVLpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 07:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726661AbgIVLoN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 07:44:13 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22C62214F1;
        Tue, 22 Sep 2020 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600775052;
        bh=3OhywcltP9VHm6MmXFAi4kj4+8+FaFh5Jl0cjhgWevI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R6seZPA/KYfch3970nAndvescUMM14RveYUo8rkB69y4KfOAWHalRvlDVbbLGz0xD
         xHFTtQR7oplTb/Vvc2IisPURG10cscMznhU8yXAZ0N/mf+kVyArQ5LTW/Ii7maQv72
         JABAfDNdUV2pBtjZaHU/tWkZ9jouuf240imOrPZo=
Date:   Tue, 22 Sep 2020 12:43:19 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
Message-ID: <20200922114319.GR4792@sirena.org.uk>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
 <20200922110825.GN4792@sirena.org.uk>
 <3866ce69-b7d0-5eb5-e0aa-874d150cd47a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TMgB3/Ch1aWgZB1L"
Content-Disposition: inline
In-Reply-To: <3866ce69-b7d0-5eb5-e0aa-874d150cd47a@linaro.org>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--TMgB3/Ch1aWgZB1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 12:22:38PM +0100, Srinivas Kandagatla wrote:
> On 22/09/2020 12:08, Mark Brown wrote:

> I agree with you on this and I see the point, but Rob had a very different
> opinion about the reg-names bindings to start with.

> This topic been discussed in the past with Rob in many instances ex: https://lore.kernel.org/linux-devicetree/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/

> According to him, reg-names seems to be highly discouraged as it came along
> for the OMAP folks and was related to the hwmods stuff.

That's very much specific to reg, it's not true of the use of names in
general - Rob mentions cases like interrupts for example.

--TMgB3/Ch1aWgZB1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9p41YACgkQJNaLcl1U
h9AuWQf/ca9nQ2PmzHcNzlz7TsFIO+ht142QjTqAQlUdhHDiYcPpG9jqzYi81epi
FLGHcE+NK0CCvc7fgnWsPv776/Fbj2+19GtH1bbQxARF2Oc9fkBvzP7x9lV92iUh
KZ7aX5RAgvA+87nDF2jmOgfcJbeTnMw3ToKLbvlEqS4k+zsXhSWFuGbgCogexiSg
TGI8So/Mp296hyFsgLFYIyF4pc2FPP9gulIwzyk+tPanIXZIXMgrWJvGVvq/BXp+
32W1NMxm0HX5mY4vdAqPid7EiP+7wZCp/YtxmoOiY9XhqK38c5YZnqQV8rv+azpO
ffsGe76ABBy85FJ4OdxsXt+7iw3cZg==
=oQkO
-----END PGP SIGNATURE-----

--TMgB3/Ch1aWgZB1L--
