Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A3F70FEF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 22:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbjEXUIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 16:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjEXUIT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 16:08:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400EDA9;
        Wed, 24 May 2023 13:08:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6E486375C;
        Wed, 24 May 2023 20:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0DFC433D2;
        Wed, 24 May 2023 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684958897;
        bh=vLNOrr9KtK13EsyPAoxNPbdjki7pxd2ahqV7MFBJb7w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hE6v6J+hcose52hbKZmzV1IqIJlSqe31BXIOzcdC8O/XkdaPQdcwR648HYs3CL1Xz
         6+eEUU/LsdjDN6VfyZGBeUQW0VW22KDV5ibRWr00w7HjjuATAVHW5HJb+swbfIRn47
         kvzxX+qoqIhW55gTF1AxmwwC3iDZyw7GrOTdu0EQG5jh+KwDe0YXYyIsg9sooft9ud
         MgkwZVeZ4/vK1DJyfXamegYpi7ANNYwllADNYkt9mXV4uz8jLEbpr2RiJ68IsqXGTO
         ftQHHySi4P9bhkiCInPGePuO0IScCWAjT6d/xfRgwVgkqAtWK1zbNyASP1+34S29JR
         wn9fT01dwwwZA==
Date:   Wed, 24 May 2023 21:08:12 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: qcom,spmi-pmic: Document pmi8998
 charger
Message-ID: <20230524-kudos-contest-0d9d3fa97b49@spud>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
 <20230524-cache-gonad-fde614bbea50@spud>
 <221cbac5-c882-0f5f-0b5b-d1fc9cadc2d7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZO7Aic4ya8ZfXIqY"
Content-Disposition: inline
In-Reply-To: <221cbac5-c882-0f5f-0b5b-d1fc9cadc2d7@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ZO7Aic4ya8ZfXIqY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 08:53:27PM +0100, Caleb Connolly wrote:
> On 24/05/2023 20:02, Conor Dooley wrote:
> > Hey Caleb,
> >=20
> > On Wed, May 24, 2023 at 06:38:52PM +0100, Caleb Connolly wrote:
> >> Document the new pmi8998 charger bindings
> >=20
> > This commit message looks a bit odd compared to the contents of the
> > diff. Did you forget to git add something?
>=20
> Well, it's not my finest commit message... The binding is in the series
> linked in the cover letter (or [1]), I missed this addition when sending
> that.

Ya know, I opened the cover to check if there was something more
specific said about this & somehow did not notice it. I guess the commit
message & the bot report from Rob addled my brain. Sorry about that.

> Would it be better to just squash this patch into the bindings and
> respin the other series?

I dunno chief. I am always loathe to tell people how they should submit
stuff in these kind of scenarios, as I don't wanna send them up the
garden path. But, that said, if they don't go via the same tree you're
gonna end up creating the issue that the bot reported in whatever tree
applies this patch without the other. =C2=AF\_(=E3=83=84)_/=C2=AF

Cheers,
Conor

--ZO7Aic4ya8ZfXIqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5urAAKCRB4tDGHoIJi
0k9EAP4xno8EQFW12XAGE58HjyY9RKq33aS/dq8i7nPxPlx6AAEArgFfqjfWGj7F
bcvRpsY8W1vMWujY9XpEdlrMpaynCAk=
=vWok
-----END PGP SIGNATURE-----

--ZO7Aic4ya8ZfXIqY--
