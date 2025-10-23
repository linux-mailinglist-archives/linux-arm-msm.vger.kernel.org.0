Return-Path: <linux-arm-msm+bounces-78487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B1BFFF4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3EBD3A42F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26363016F1;
	Thu, 23 Oct 2025 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="e963kVyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE762D29AC;
	Thu, 23 Oct 2025 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208611; cv=none; b=ltPDLBmhRXyYzSHzhBnnsSv56jef9OVKjo0kH/EHIoJCGfUVgqbJsxjn4P9IapNzTK51imwR/DgKXSW6Kq81laBZPZH4+i6o6mTfqxnAsTOKFa1qxsjoKN6mFwyIV8nHHXuErZvF7qHqAQwklL12IfSTfrC6lsGzrPGL+s3sHj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208611; c=relaxed/simple;
	bh=53IhXrKwh6V2faXP+mdySTS0lXyEHg+fHqtxQ+YtdsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpLsyysRg5HbofQ7T73DfbzJ8qvAED6guBOJVAeea5vGyPPRFZan2HOsOaQmxO21y1CqgVH5VdO5hvHqN6G78ivQ9PxMq0qNubmGsmXkwB6Ho5REV89GRXt+3Y7R5nGTX7xp4gFX98ow7T34kOoVjObeEHUiYwYWnNb29vIW/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=e963kVyX; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6C8CC1C008F; Thu, 23 Oct 2025 10:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761208604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=53IhXrKwh6V2faXP+mdySTS0lXyEHg+fHqtxQ+YtdsM=;
	b=e963kVyXtB4Ti7FWGfUJOTbFu0XmIkQYHm5rqM3/EgiM+CLRPEzbWmG94f+5ZqPK6lL2pL
	2OGXCLe0IRoB6ngjlS22szympnmLe/ylkIOqhAea5F1JnG7VLVVZbGF3NLV+GG5mY4GJ+z
	lkRyPEmD+hHZFxR9o8maqlVp+cgdjtc=
Date: Thu, 23 Oct 2025 10:36:43 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
Message-ID: <aPnpGx33hVLrPKOb@duo.ucw.cz>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nVggqXiqE37t2wu"
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>


--8nVggqXiqE37t2wu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-10-09 11:06:35, Luca Weiss wrote:
> From: Luca Weiss <luca@lucaweiss.eu>
>=20
> Enable the RGB LED connected to the PM7350C (PM8350C).
>=20
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--8nVggqXiqE37t2wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPnpGwAKCRAw5/Bqldv6
8muiAJwN7vi1mW/TPRqWswjYtlmCvGCvXwCgsQ3xWR9U3w6+LJiUYbqiF2xQjGA=
=P7pp
-----END PGP SIGNATURE-----

--8nVggqXiqE37t2wu--

