Return-Path: <linux-arm-msm+bounces-3347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A2803D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8113AB20326
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EB22E859;
	Mon,  4 Dec 2023 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="4L3ziRE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DDBFA;
	Mon,  4 Dec 2023 10:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701715309; bh=2PAcdZ04uUxyJLm0VRzSG1hwJegBDoQrkRkj6wKigh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4L3ziRE//d5LvCE1u1Dd/tyddQCYhOPpiYiJH44uwjkb7Oa02A1Zi9etQELda40dy
	 ih9mPfffEDnnlKCNXDIbo+bu0BWYcUECn4aSKDxbj7Y8SqRsKIP4b9vHz5aMh/mQdt
	 ro1O88u1hgjv3SiJvW/wAuULODgqw2KCzEUaQxeE=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>
Subject:
 Re: [PATCH] ARM: dts: qcom: apq8026-samsung-matissewifi: Configure touch keys
Date: Mon, 04 Dec 2023 19:41:48 +0100
Message-ID: <4877522.31r3eYUQgx@z3ntu.xyz>
In-Reply-To: <20231204094649.10094-1-matti.lehtimaki@gmail.com>
References: <20231204094649.10094-1-matti.lehtimaki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Montag, 4. Dezember 2023 10:46:49 CET Matti Lehtim=E4ki wrote:
> Add touch keys which are handled in touchscreen driver.
> Use KEY_APPSELECT for the left button because other devices use that
> even though downstream kernel uses KEY_RECENT.
>=20
> Signed-off-by: Matti Lehtim=E4ki <matti.lehtimaki@gmail.com>
> ---
>  .../boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts    | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts index
> f516e0426bb9..8a2ba2aadf23 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> @@ -268,6 +268,13 @@ touchscreen@4a {
>  		interrupt-parent =3D <&tlmm>;
>  		interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
>=20
> +		linux,keycodes =3D <KEY_RESERVED
> +				  KEY_RESERVED
> +				  KEY_RESERVED
> +				  KEY_RESERVED
> +				  KEY_APPSELECT
> +				  KEY_BACK>;

Might be prettier like this since it's 6 items you're adding, not one long=
=20
property?

	linux,keycodes =3D <KEY_RESERVED>,
			  <KEY_RESERVED>,
			  <KEY_RESERVED>,
			  <KEY_RESERVED>,
			  <KEY_APPSELECT>,
			  <KEY_BACK>;

Resulting dtb should be the same, so it's just a stylistic thing.

In any case:

Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

> +
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&tsp_int_rst_default_state>;





