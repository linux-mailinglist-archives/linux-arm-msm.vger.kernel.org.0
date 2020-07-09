Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C946219DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 12:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgGIKev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 06:34:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:54088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgGIKev (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 06:34:51 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02AD7206DF;
        Thu,  9 Jul 2020 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594290890;
        bh=Ve16z8d0/OmeosfL6WB4kROdn8JZr9L6Cq+RoMEYqsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aVwvYBUwBUuEW0pkIHTrs9bE3A4h2qeVhqqez6sjtu2k5HzziDf3u5+O3IDo3PWMl
         P60+jIRnglEr37wZtmpDJTj0VQ4BN8AG3boz+joAmCDx943/KIvU+mkDgy17J+lJdB
         0D+MKW4LdlmlWtN9ZR+T7XdnLPKPQD20C+isnMkI=
Date:   Thu, 9 Jul 2020 11:34:44 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rohit Kumar <rohitkr@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200709103444.GA4960@sirena.org.uk>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
 <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
 <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
 <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
X-Cookie: You will be married within a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 03:42:38PM +0530, Rohit Kumar wrote:
> On 7/9/2020 3:38 PM, Srinivas Kandagatla wrote:

> > May be reverse the order, Convert to Yaml first and then add sc7180!

> Actually Mark suggested to keep yaml change at the end of patch series as
> there

Right, there's a huge backlog on YAML reviews so they lead to all the
other work getting held up waiting for them.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8G8sQACgkQJNaLcl1U
h9AnEAf/YHvrShAx1/pj+fdRXz49S71JBPuvSBgRcSqt4qlyV3PrDCkwNro0KXYy
IWTh+2YJGdiJ9yNIvnrKIpIg1g0Lu96uSCKTa+uKHA8obTEFV/ko5+t6KrhJXv6B
6ISMw+pInNBvj7moHWn+px9+JZw6ygIxro9okvk7pCu9PA4nkpHWvCrzNzlwMVna
yElISmNvkpgWsg1eqlpOu78MD37akxzqPm9mrPzrq/ge2ktcM+ivm4qOJmBdnc23
dIES/kgmWtEq6jnuzwZ2cdDn/1FDbKpllkPtj4Q3Ymvz4sGxdlgE8SlyQXrzl/iU
l0vuLU8mntAPLdpRb9s4neWhCYl7cA==
=bZZZ
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
