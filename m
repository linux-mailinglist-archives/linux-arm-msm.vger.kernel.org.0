Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBFA49EC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 12:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbfFRK7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 06:59:41 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47608 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRK7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 06:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Q2jJFJeqAvHW5xjduMI/BTDoLMuuZxXoXruOimW2zSI=; b=ZlTWG/CJBcnrLlZPmdiOAf3yG
        TTqKHnwT2VevOiAAtguh0Qwc/04W2njZ37TI5hdm1YGsBa0qVrSs7qKTF1mayVxVTREfbMGtCPcUA
        aVudYh0OL3vEna9c1pzwa80ChEldhHITnGE3lIP0JUchiMTtNU9Ul09f3agMhxEp2FrjQ=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdBpw-0004vy-1d; Tue, 18 Jun 2019 10:59:36 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 7A4E2440046; Tue, 18 Jun 2019 11:59:35 +0100 (BST)
Date:   Tue, 18 Jun 2019 11:59:35 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nisha Kumari <nishakumari@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
Message-ID: <20190618105935.GM5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
 <20190613172518.GN5316@sirena.org.uk>
 <577d6e90-0bed-ff2e-32dc-e64c3118458f@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sbU44GGDGzBBUYp9"
Content-Disposition: inline
In-Reply-To: <577d6e90-0bed-ff2e-32dc-e64c3118458f@codeaurora.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--sbU44GGDGzBBUYp9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2019 at 11:51:18AM +0530, Nisha Kumari wrote:
> On 6/13/2019 10:55 PM, Mark Brown wrote:

> > > +	labibb->lab_vreg.vreg_enabled = 1;
> > What function does this serve?  It never seems to be read.
> Its used in next patch for handling interrupts

It'd be better to move this code into the patch where it's used then.

> > > +		if (val & IBB_STATUS1_VREG_OK_BIT) {
> > > +			labibb->ibb_vreg.vreg_enabled = 1;
> > > +			return 0;
> > > +		}
> > > +	}

> > This is doing more than the other regulator was but it's not clear why -
> > is it just that the delays are different for the two regulators?

> LAB regulator comes up in first try, so we did not added much delay in that
> like IBB. Planning to make equal no of retries for both in next patch so
> that code can be reused.

Is there actually a need for polling at all?

--sbU44GGDGzBBUYp9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0IxBYACgkQJNaLcl1U
h9DGQQf9Fn7TqN/dXa0DWnKZiNKqKqQOQ0wKS8WelZLNW4v6/5KFIyrz+82a3s8p
r7RFFxI24fxs2p8pztsKCXeh1izQCVTOW/FbP5rML9FGkMVoNeGw7YseKvmiIPpn
vF9XsDTNRe9RIQ4UOMqwMNvauR5eHR9aPtLDtZ0tspewoj2fNtszc40LqZJsA+Kq
pzf6Mk4JZr6ZcteH3fnBoGDsW9mNEYmc3Iq1ypR4nuxcLwOUpilFssOzYAziTt2D
we0Cz/kP/ANEk7/f6YJLfDMKiKJMhddbI37MvIktRpMuLw7chcQJcS9buuvIHAiE
wQNNKWGz/eyWI+Ke81ZfjeXzLO8Raw==
=im0z
-----END PGP SIGNATURE-----

--sbU44GGDGzBBUYp9--
