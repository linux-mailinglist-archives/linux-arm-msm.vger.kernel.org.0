Return-Path: <linux-arm-msm+bounces-36759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C00199B943B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA31282EAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE641C305A;
	Fri,  1 Nov 2024 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBr1idrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AB1C303A;
	Fri,  1 Nov 2024 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730474320; cv=none; b=VGK9NHbp9A1z6llxi6kNpeYg/K30TwCkxE8C/H4YvPJM8IE6RM2ogAJvS5WyAyJ9x3H+MQAEtRl+r2jNQ2Oxgph4Ssm9K2AXf5Katjfxw1+uqFrrXqjtEMd+5ZO2DIwEr/J6iUxwo+eK+E2BihoX4K7bEQSa5nSaTHTwc1uI8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730474320; c=relaxed/simple;
	bh=zuN5R7hbuH1BvhVCVBt/zGaYDCvPjEZM0tpyzDA8ZVA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Cc:Date:Message-ID; b=gW4AsvfJrzwXo4UPb6HKunBEFFmEcFh2gYwUQVcO4Vu0jQ37AwpjlNjLMymywXbeqWxHIgzeCv6PjU6LtwCpyjhOJQo17fPD6MZNA7SKuMY6dzrmCHIn/xqL7k2vsD5y7cfkQLiGl4e6v6Z/xaTPTABeI407Z63mazOdqJQUziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nBr1idrK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5602B3D4;
	Fri,  1 Nov 2024 16:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730474311;
	bh=zuN5R7hbuH1BvhVCVBt/zGaYDCvPjEZM0tpyzDA8ZVA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=nBr1idrKB+P9AyQS+0sPM+y+7bN56hXVF9CuFlueWKUjipSZFbS7lN/BfUDeTnwJF
	 uPGrPgUylvhy8jz0FmPQfT2eAWO5DQJGVCTcVIynpxYP/QlyuoUrDtJtvgnXj8Rr5F
	 BQ/3fYdj9U+abtbwYQJhqqxe8h51my0DbYNHGGeM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGu_qJYV3TnprJsqsWV_GoLhiBFQ8LNwfYDjczDparvZCA@mail.gmail.com>
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org> <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org> <CAF6AEGu_qJYV3TnprJsqsWV_GoLhiBFQ8LNwfYDjczDparvZCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add cma heap for libcamera softisp support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, Vikram Sharma <quic_vikramsa@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
Date: Fri, 01 Nov 2024 15:18:33 +0000
Message-ID: <173047431366.2974136.175546053701391124@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

+Cc Laurent

Quoting Rob Clark (2024-11-01 12:33:44)
> On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > libcamera softisp requires a linux,cma heap export in order to support
> > user-space debayering, 3a and export to other system components such as
> > pipewire, Firefox/Chromium - Hangouts, Zoom etc.
>=20
> AFAIU libcamera could use udmabuf, etc, and there is no hw requirement
> for CMA.  So it doesn't seem we should be adding this to dt.  And I'd
> really prefer that we not be using CMA just for lolz.

I agree here. Otherwise this theoretically locks this memory to the pool
'forever'. It's not something we should define in device tree.

udmabuf provides a means to get memfd allocated memory which is not
physically contiguous - but /is/ managed by a dmabuf handle.

Presently with SoftISP being CPU only - physically contiguous memory is
not required.

Bryan, will this still be true when you have a GPU based ISP ? Will that
require physically contiguous memory ? Or will the mapping into the GPU
handle any required translations?

--
Kieran


>=20
> BR,
> -R
>=20
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     | 11 +++=
++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanin=
e.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > index d62a20f018e7a7e1c7e77f0c927c2d9fe7ae8509..c8507afcd1e0d1f9b14b6e4=
edcbc646032e7b6c9 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> > @@ -9,6 +9,17 @@
> >  #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >
> > +/ {
> > +       reserved-memory {
> > +               linux,cma {
> > +                       compatible =3D "shared-dma-pool";
> > +                       size =3D <0x0 0x8000000>;
> > +                       reusable;
> > +                       linux,cma-default;
> > +               };
> > +       };
> > +};
> > +
> >  &camss {
> >         vdda-phy-supply =3D <&vreg_l1a_0p875>;
> >         vdda-pll-supply =3D <&vreg_l26a_1p2>;
> >
> > --
> > 2.47.0
> >
> >

