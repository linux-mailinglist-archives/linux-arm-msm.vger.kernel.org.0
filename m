Return-Path: <linux-arm-msm+bounces-46559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B76A225E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 22:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E934161E38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 21:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2101E376C;
	Wed, 29 Jan 2025 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="5FofAWJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60D71E0DCC;
	Wed, 29 Jan 2025 21:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186947; cv=none; b=BD5078oRAuLv7/vxLndjdo2of9VKI7BNpzb4dBcvsny7tA3P9nirkUDlY2ihWQ55Hb6zeeSiUdPB9ZAPZ2LJwXh/N93E1y4eG7OcglG6wgRf4dBfVE8FY94SshO2xyKNDRR6EA3RiFjtBlUsciV6cHTkgMihMbJ99rNkbqe9Lvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186947; c=relaxed/simple;
	bh=zvqH8F0yWqzcki/VXOgcFzfEq3i4A1yFyjfy7/4Xs8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MF9ydaQu1JYt0Wx+9ntHgRWvXRhnvaDwDCC0Y5EAPQqvizYVJoF5wl0Xl5HSixkFvyoLuChk009KKdAnWywM2vtC00/KcLcKvmXOX6iVOrmHYmpP0Kb+LSp1NvlITr4tBLnYToJ1Hd7tad0KCFM0Num1czSJOC8+0M/j6Bt9j0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=5FofAWJy; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738186943; bh=zvqH8F0yWqzcki/VXOgcFzfEq3i4A1yFyjfy7/4Xs8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5FofAWJyfXRdG/08Ur/JtrduRFSXGLuhXvoELFdoI/DnE+2a1FTYXag2nOO4yWVYO
	 cnek2aoCkSkwYQXxixfvD74Puq3/8e0VIHQJdorvw/5cISQcNCkNkHYAgGLQ0nPBbd
	 uAahYlMbGVbpYL59YP87B2psmTdtpFiJ5+nwYJBc=
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Matti =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,wcnss-pil: Add support for
 single power-domain platforms
Date: Wed, 29 Jan 2025 22:42:22 +0100
Message-ID: <4981958.31r3eYUQgx@lucaweiss.eu>
In-Reply-To: <9c573fff-31e6-4319-b8d1-527a3487cc20@kernel.org>
References:
 <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
 <20250129-wcnss-singlepd-v1-1-b01a6ba0b1bd@lucaweiss.eu>
 <9c573fff-31e6-4319-b8d1-527a3487cc20@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On woensdag 29 januari 2025 19:44:54 Midden-Europese standaardtijd Krzyszto=
f=20
Kozlowski wrote:
> On 29/01/2025 18:51, Luca Weiss wrote:
> > From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> >=20
> > Support platforms such as MSM8226 and MSM8974 with only one power rail
> > (CX) modelled as power domain while MX and PX are regulators.
> >=20
> > Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> > [luca: reword commit message]
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-
pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > index=20
8e033b22d28cfa8203234f744b3b408e976e20c3..d3c71bcf0f02122eb0dae214f135d8d7f=
71a9600=20
100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > @@ -69,9 +69,11 @@ properties:
> >        CX regulator to be held on behalf of the booting of the WCNSS co=
re.
> > =20
> >    power-domains:
> > +    minItems: 1
> >      maxItems: 2
> > =20
> >    power-domain-names:
> > +    minItems: 1
>=20
>=20
> This should be further narrowed in allOf:if:then per each variant,
> because now you say that all devices here can have only one power
> domain... unless the compatibles do not allow that, but then explain in
> commit msg.

Yes, the compatibles are so broad that they cannot be used to narrow this=20
down. I can add this information in v2.

I'd add something like the following. Let me know if that isn't clear enoug=
h.

"Due to the compatibles qcom,pronto-vN-pil being so broad we cannot narrow=
=20
this down by SoC without introducing new compatibles."

Regards
Luca

>=20
> Best regards,
> Krzysztof
>=20





