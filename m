Return-Path: <linux-arm-msm+bounces-46237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CFA1D6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E743A4454
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E1C1FF7C3;
	Mon, 27 Jan 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1PuhvsZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00471FDE28;
	Mon, 27 Jan 2025 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984466; cv=none; b=dwNb/kFbVKWreIXsbj0qwnh/UKf1HdGfXkF1pAuDXo/n769e8OwbnbetnPEMmM5i9tQxdsHpq0IwSMRQcm17a0gQ+gDEU1Xo3SyMM1CrTLnSaWm66jFdPjE6fP96u2E2jFWUbCGW6aZkcZysq/acDHATA6uyFGVWz7hiEHR7keg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984466; c=relaxed/simple;
	bh=3awZN8qD+Wh3DklafvAf15nuwxXe2cj/fWUxMcYVaOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSPRIbULQOauUjTxAI3OkcrzI8np9N5lfX16j7l+zrgdCdSgkyeIsUl3qKSEGzN73IBsVMlLW2PFbRzYS37ixSgRByElY4A4rxDESMQLSU1PYOdq0wi01afiCkdrH+a3KYNfUIIMnZb2t6NLPIvIJIEjBgMbU10D6zMZ/3HaExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=1PuhvsZ6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737984463; bh=3awZN8qD+Wh3DklafvAf15nuwxXe2cj/fWUxMcYVaOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1PuhvsZ67iPyoQxp/pmMdD7lKAmQDc5EzU/yKSld7Q2z9FiDtczEM482jDvSih0t6
	 Bo1A6AfdEE9TETnNF3sdzi9LbmvfX4yWAMxjNDOVFoCBvg3hWDGVsyGhzT/hZjq9k/
	 pRhKk5lYPPWsVJ0braKeyMjYtTiKBkNO0TCYSJ/A=
From: Luca Weiss <luca@lucaweiss.eu>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matti =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] ARM: dts: qcom: msm8226: Add modem remoteproc node
Date: Mon, 27 Jan 2025 14:27:40 +0100
Message-ID: <3779260.mvXUDI8C0e@lucaweiss.eu>
In-Reply-To: <Z5dPmbZY6h-7LGqS@linaro.org>
References:
 <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>
 <Z5dPmbZY6h-7LGqS@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On maandag 27 januari 2025 10:19:21 Midden-Europese standaardtijd Stephan=20
Gerhold wrote:
> On Sun, Jan 26, 2025 at 09:57:26PM +0100, Luca Weiss wrote:
> > Add a node for the modem remoteproc found on MSM8226.
> >=20
> > For the apq8026 smartwatches, delete the modem reserved-memory again
> > since they have very little RAM in the first place anyways, and all of
> > these devices don't have functional modem firmware anyways - these
> > watches don't even have GPS.
> >=20
> > Co-developed-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  7 ++
> >  .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |  7 ++
> >  arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  7 ++
> >  .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
> >  .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
> >  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 80 ++++++++++++++=
+++
+++++
> >  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
> >  7 files changed, 109 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arc=
h/
arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> > index=20
a2ca456012f1a070afc2805ae71ddbf6f5aac607..816b61ea504ee80d86dd4ccd1a15db687=
f6a91ff=20
100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> > @@ -9,6 +9,8 @@
> >  #include "pm8226.dtsi"
> > =20
> >  /delete-node/ &adsp_region;
> > +/delete-node/ &mba_region;
> > +/delete-node/ &mpss_region;
> > =20
> >  / {
> >  	model =3D "ASUS ZenWatch 2";
> > @@ -82,6 +84,11 @@ bluetooth {
> >  	};
> >  };
> > =20
> > +/* No (useful) modem on this device */
> > +&modem {
> > +	/delete-property/ memory-region;
> > +};
>=20
> Rather than putting /delete-node/ and /delete-property/ on all devices
> that do not need/use the modem, I think it would be cleaner if you make
> the remoteproc related reserved-memory status =3D "disabled" by default
> and enable it only where necessary together with the modem. The &modem
> itself is status =3D "disabled" by default, so it makes sense to use the
> same for the reserved memory as well. See e.g. the existing usage of
> this pattern for &mpss_mem/&wcnss_mem/&venus_mem/&mba_mem in
> msm8916.dtsi. Then you can drop the /delete-property/ here.

That's a good point, I didn't realize you can disable a reserved-memory nod=
e=20
like that. And since often even APQ variants have useful modem firmware (e.=
g.=20
GPS) I didn't find something quickly I guess.

>=20
> It would be even nicer to use the dynamic allocation
> (size/alignment/alloc-ranges instead of reg), but I'm skeptical if this
> will work properly on such an old platform...

IIRC I've read in msm8974 docs that dynamic allocation should be possible, =
I=20
can give it a try some day, both on 8974 and 8226.

Regards
Luca

>=20
> Thanks,
> Stephan
>=20





