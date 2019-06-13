Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924B644062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391253AbfFMQF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:05:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45168 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391139AbfFMQF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=k1BfP3/B157lk2y6ylx2EwJnrgPJxO1VUkk949sZ92E=; b=jkH3TRu+zstcpIvrdgfMif11J
        zlZP1iF/JvPfRZohZ8QyAuP9FkTT6xsvv6hAwpQ7+0yLNjuWtgUNiAGsRaBIRF0sU3jKF1K1ddtOA
        F6/ClT0UpEbyRRtrhCP1rQy+AuWXaYWmYnl0pmw7zHN4LBiwz3aPvk6clz9aoymb5ATw4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbSEY-0005Hv-Ow; Thu, 13 Jun 2019 16:05:50 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 2F1AD440046; Thu, 13 Jun 2019 17:05:50 +0100 (BST)
Date:   Thu, 13 Jun 2019 17:05:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nisha Kumari <nishakumari@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
Message-ID: <20190613160550.GM5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1rguoi8KZGYj2k4L"
Content-Disposition: inline
In-Reply-To: <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--1rguoi8KZGYj2k4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 04:30:49PM +0530, Nisha Kumari wrote:

> +- reg:				Specifies the SPMI address and size for this peripheral.
> +- regulator-name:		A string used to describe the regulator.

Why specifically list regulator-name here?  This is just one of the many
generic regulator properties that could be applied.

--1rguoi8KZGYj2k4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CdF0ACgkQJNaLcl1U
h9Chrgf/X5b1ow0UwfKQUAoQ7UmNNaW+VQnSWNn1sjJedj/BegsNd1myeOJCje7k
2ED26OFMqxwVb41tReWNbjdPpToF8AOicHj1O71JXgTogMs2nbiE3n9EMlpIolMZ
Y2wJMwYOSjorIALXWPqN3Af+YS2tL4Qsn736zF+0N8VukEReuCDZCC9MsNL28MkK
UV45QsVBB1ZOgEGXQUuS9a6/f+XM3PjFDXiOMLdIV1INBh1feoxZPLQs/pKXD58A
EVbSe9/AZWIZufMbNDbSxm8lRleSjlhueHPz0eD5zS2Zz1xEHkvNgOGDUsuOWclo
jGPIFi4yXjnaFzot+CMTsJW8I63e9g==
=oJNP
-----END PGP SIGNATURE-----

--1rguoi8KZGYj2k4L--
