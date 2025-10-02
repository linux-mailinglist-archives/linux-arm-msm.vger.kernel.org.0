Return-Path: <linux-arm-msm+bounces-75828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A388BB4E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 20:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5E71894C2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 18:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD3B272E63;
	Thu,  2 Oct 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/ut6hEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81159148830;
	Thu,  2 Oct 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759429973; cv=none; b=pn/hz/ga8WbF8GQ1X5wR4AWUDhzoqGEorgyOSry7GFWy5X4KAJ6PBtKLoVxLC4mUAwDtYBPk8YihtPA0pE6Y7dcfZr1KHrYItgFSDwqYFYK3gHGSRFOWZaLQabmRA7UbqFfLwmq0MLAwHtbf2Kz82uxItqqpI5AnIL7rchAWssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759429973; c=relaxed/simple;
	bh=8/EctaIvBAC4cuOpvHH7s9ZrDbZHwtpR0omC5FZZBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyE3d96xopfbu0MW53Nw5NcjLtUHpglzJ6hxeM21ECVfqPV73/v/H7eNVX4613j6g1alNYsUfGDWAbKxcaVXvGOwnGUYrNRgLmCVDeCAl7c1vfG+kAgAyC7vxs2t2ILZwLwlnhHZyO081teW6nCjQLeXmuvG+s103q304diqkS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/ut6hEz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9772AC4CEF4;
	Thu,  2 Oct 2025 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759429973;
	bh=8/EctaIvBAC4cuOpvHH7s9ZrDbZHwtpR0omC5FZZBJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/ut6hEzMveKDfP1w2YF2/WvXNMyUgcHPL6lK+hHXTgdYeSL6hzlK25tI27Ek0lxY
	 +WuOKlGfs4vaTzEjE33ZoSQJnRI2QV9ZrWsuDq2B2mTrWF1Z48jpuU0DRusRz3Nn3X
	 sd+ceB0d5G0rS8ERJVSqcM9FzN3hwmFVTzFNprOwoyeQ81ftIbze5BVRnLLOdB59Xv
	 RV4RMsmHAgDIflo7o9sxWG0yp71Zy+Y/QhFEmAvY9WQC+742pCNEUOQsTwNnfn2kt/
	 tnnay0NbOFGKQpbxMTkW5vXFGfGwlH5puer2zLUA6/ZwOcDZSh1WzgmMgZ1WubKlSe
	 N07tJypzsRxug==
Date: Thu, 2 Oct 2025 19:32:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Eugene Lepshy <fekz115@gmail.com>, Jun Nie <jun.nie@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Add Novatek NT36532
Message-ID: <20251002-winking-dominion-2494f66a1e3b@spud>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-2-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Z1VwQ8rSct1DuFI"
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-2-caojunjie650@gmail.com>


--3Z1VwQ8rSct1DuFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3Z1VwQ8rSct1DuFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7FTgAKCRB4tDGHoIJi
0iBjAQC5DDfCt/kJwQ2LJdvzcDtHWODcXvYqbKvn4pox8Y/dHgEAqlSPz6kDyXf6
fRIKaTdO3qWuO005Ae9eLxfA8mqhTg4=
=tVsY
-----END PGP SIGNATURE-----

--3Z1VwQ8rSct1DuFI--

