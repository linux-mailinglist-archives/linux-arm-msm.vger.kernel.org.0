Return-Path: <linux-arm-msm+bounces-86599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF098CDD189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 22:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F4AC301840E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 21:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AB42D8372;
	Wed, 24 Dec 2025 21:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0MFr15+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD11278753;
	Wed, 24 Dec 2025 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766613341; cv=none; b=jroumhNba6oGnaxcPsgUxJ3V/ivMh+uvmu6BViGBPlqdARietJeq068Sgd69m9FPudJ2Ka76+cVx9J5z/gU3bfrPNRoqzUs2+kvuf7gifl6cmLuhkuqQPI5i1kA+3UmS7ijT80wYzWtApHhMpENvj29GFf6vNS83exYTWavFiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766613341; c=relaxed/simple;
	bh=7IYjCwwm1VJE64uY0+VvI0CNAetRZ6wxWGE1IDILpTA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LneG23HKHVFT9XxE/6M4yolag+OdjiLX39ty48qBn1vkKrdbhOJH4DALTi3afwg6skm44XObXgE6NVB6OMS6/DzRrXmihwiMK6Br92Du1cJr2A9oKeaZ9EKCPIpltRbUmAw0VZnJYzTHjPTI1tuXO64AVtTwUgUMrLwE3qO4cHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0MFr15+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EDCC4CEF7;
	Wed, 24 Dec 2025 21:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766613340;
	bh=7IYjCwwm1VJE64uY0+VvI0CNAetRZ6wxWGE1IDILpTA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i0MFr15+ELitFr7bwkhJTpRfJetSCLCDGrP87mqdM5k9w4qbk7T/rgPioPLyzaAOU
	 XjxyykrMEh9C3o5vBc9uedsVX+G0gG8PA/tsXqjuleShzfPOAfswcG5ajjfuKeO9O6
	 snGrYsTQPmfiOf9bqcHGPzuMpAru0x8a9Uofzt/YABvft267y0N65YpcUZe7GrmXPy
	 Pm1gaG935/MnV7YN1HBuQV4puNDM/qr3pt9b7KZ9Evym2YCsr00MX3RA5q54dpoGGO
	 mv9bd3PuF0aHHQc0cVUATgUVgf9edK7VnxnrPz/vRyXWvXAX4dsDZkjwWW/zVTHCFs
	 EKpUQ1rB4jADQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com> <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:55:37 -1000
Message-ID: <176661333774.4169.12534802903262524563@lazor>
User-Agent: alot/0.11

Quoting Bjorn Andersson (2025-12-22 09:09:54)
> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
> > @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *=
hw, struct clk_duty *duty)
> > =20
> >       n =3D (~(notn_m) + m) & mask;
> > =20
> > -     duty_per =3D (duty->num * 100) / duty->den;
> > -
> >       /* Calculate 2d value */
> > -     d =3D DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
> > +     d =3D DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>=20
> This looks better/cleaner. But for my understanding, can you share some
> example numbers that shows the problem?
>=20

Even better would be to add some KUnit tests for the qcom clk driver
functions like this so we know they're still working.

