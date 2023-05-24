Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C913970FE23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 21:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjEXTC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 15:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEXTCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 15:02:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B87113;
        Wed, 24 May 2023 12:02:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 839C063807;
        Wed, 24 May 2023 19:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E06C433D2;
        Wed, 24 May 2023 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684954926;
        bh=VNKHn0SZDqR/mrYPz6QqnCj7r2lNBj8zwgfZHkp0CuM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kMbzMl/hL5vDTI4it9QSvuQd/E6w76q86NL5BcQnqwFlgsvC509EvVKAMHSt0G2+B
         WcaM/aDRavm78j8cRafF5WpxsWB5zyutFCflL8WfHujEqoE/44Kt02Lsg+7a5r5nUB
         WRcXkUT3kf6ztPgfwyihUQc9QH8c2m09aPB2Y5qrgCafb5HyB+nRGZ0nQjuiltUgVb
         nGMdJL98A4rqwxmLzu6lr/XCR2cAkO3wBipJIPELqzoirYRtY1UmIwj1y6aq46Mcps
         +pfRIhuIdKfaKJQ6RhZfVOuzBmwdw9aPbfU2KEPaNb0fV5W4uSvvHZ5NrybbJmQvTs
         hE3JLDHzw7HTg==
Date:   Wed, 24 May 2023 20:02:02 +0100
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
Message-ID: <20230524-cache-gonad-fde614bbea50@spud>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CsWgg3ZzuQdgYD9J"
Content-Disposition: inline
In-Reply-To: <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--CsWgg3ZzuQdgYD9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Caleb,

On Wed, May 24, 2023 at 06:38:52PM +0100, Caleb Connolly wrote:
> Document the new pmi8998 charger bindings

This commit message looks a bit odd compared to the contents of the
diff. Did you forget to git add something?

Cheers,
Conor.

>=20
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/=
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 36de335a33aa..44590dc112be 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -133,6 +133,7 @@ patternProperties:
>      oneOf:
>        - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
>        - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
> +      - $ref: /schemas/power/supply/qcom,pmi8998-charger.yaml#
> =20
>    "gpio@[0-9a-f]+$":
>      type: object
>=20
> --=20
> 2.40.1
>=20

--CsWgg3ZzuQdgYD9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5fKgAKCRB4tDGHoIJi
0snHAQCM4EF5bqKKng3sxE7RhYKI/9QBS836bM5s+fVa395qqAEA4haUQTItWb4j
sVpajXnQV4aUxn6WtGOprJtPYUUmkws=
=skOs
-----END PGP SIGNATURE-----

--CsWgg3ZzuQdgYD9J--
