Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9642A380D20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 17:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbhENPcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 11:32:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:45410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234820AbhENPcH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 11:32:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F26DD61454;
        Fri, 14 May 2021 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621006255;
        bh=Jw5WbrKaK58stPthP0QwAZkov+5hEKRXAOBHxLndh7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QB3622KhuCsNng+oVdaxcDzh2R5t96nGI19NPmYMGLLKmTBXRWP2a6P7euJGePKGd
         1Zv3f5aHzzLvuNRi8vi6fsEMjA8ivVQaVxJ8sXgkeeG9EZnNPcs5O7akVYOy7qGRKb
         CHbTDyD7n13upd0sz1lSzdcTyzYs+yQs6OU0vPMX0koyVZzc46MPa1S8rV7487ypzz
         SsSEfZwWtB9MFGAzpJH7h6zuIUW02jeYToRGRMxnlguDuW2jnNTWcgK+TW7lJo1OsY
         nF5fRj64C8U56hURXnmrX7/66KUqNTpLIgnFUJrgzGgCvTYLJOjMDSGC+l61g3MAD7
         OIQx1x4LE66qg==
Date:   Fri, 14 May 2021 16:30:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
Message-ID: <20210514153014.GB6516@sirena.org.uk>
References: <20210513114539.4813-1-srivasam@codeaurora.org>
 <20210513133132.GC5813@sirena.org.uk>
 <a6649fad-c2ca-1808-4227-8bcb373f66bd@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <a6649fad-c2ca-1808-4227-8bcb373f66bd@codeaurora.org>
X-Cookie: Necessity is a mother.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 14, 2021 at 12:20:46PM +0530, Srinivasa Rao Mandadapu wrote:
> On 5/13/2021 7:01 PM, Mark Brown wrote:

> > This commit doesn't remove the matching update in triger() so we'd have
> > two redundant updates.  I guess it's unlikely to be harmful but it looks
> > wrong/confusing.

> Yes, It's not harmful, as clk_prepare_enable is enabling clock only once but
> maintaining count.

> As Some times in Suspend/resume Sequence not hitting startup/shutdown, but
> Trigger, so for maintaining

> consistency not removed in trigger.

This at least needs some commenting so that it's clear, it looks buggy
at the minute.

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCel4UACgkQJNaLcl1U
h9AtTAf+LYcPOf6JSMImI2cuYbGIbm6pkW/Gx2rR/b2MwTYRacf5Y69rz++r39VM
W1M2i1v9UGvb4CoYMeGn4NMA1m0r94UDo6vRC0xqx+WIbXglUiFmrT/h76K+1uEr
e8jabqpQT3dcdeY938IJ7TFdGCyRafKd/1Dr5nazc7xRb8yc2i5SPV0RRsiFpYO2
otRmdXuyqgNyIV7t77179ZiZUGZvH7/l/Fod8mZXLM9GkpEJkzAe7xIxZicP+EHg
piX4zMQJg2agEhKhFDo9aRTl9erYxOAoMTXIcrBAuxG4JJLnF0sEOhhqCAcILPqm
r+qkC06Hv8IgT0CVDC4yDXiM3b7dMQ==
=D5DP
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
