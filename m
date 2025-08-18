Return-Path: <linux-arm-msm+bounces-69597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEDBB2AB50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51FC47AD5CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EC835A280;
	Mon, 18 Aug 2025 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8kSAfO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087D261B77;
	Mon, 18 Aug 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755528043; cv=none; b=StuchbqpmILv3T+BU6nJwqFKtFzzxgkFCz0guCIghttNrMwZwlJC3rIzS2KvUY5XJF53BVkoOSKMHTn6/cL3H21+TTaqQYPMLxe71rtWdKwWyZ+DaHd6L/2DtKdUEzFOK15PpMxxjLwGC3l2YOvchEq2zBeVNf8OSprhFnBnVVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755528043; c=relaxed/simple;
	bh=9CAtxwbtKGmS+5sKlkN7xk9e3EehcnWTeVpIrv0+z6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LW3csyQgNIUj177SSv/Nocfty+yYD7igTnkD4sJ53ZtZs42MXJgFqdJ2Ded66mBMSfYt3eQnuXdad5NPUW7dfF/HR0BO1wTLgS1CJI4Yp93g/27hHVF+lAK5vmn4RSdll+rsB7zzaXkQsomEUlZmsb/3eLuERVFtF9zDPGYhlqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8kSAfO7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB7AC116C6;
	Mon, 18 Aug 2025 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755528042;
	bh=9CAtxwbtKGmS+5sKlkN7xk9e3EehcnWTeVpIrv0+z6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8kSAfO7tF8oDKMTfBmkwUFL9rnEO+4zBu9etTY02QRy/73iEW882Z4Ngf5eD0Zde
	 Wk6EE6X6TE+s853gOn0mLf3g2IPVTQsg8sAU/OXyV3ySWW1fsKYtpQJqYXbwxQfY3s
	 +ye6CL1Q+y9PK2/n8YnelqF0iPVfam22hXKKnPD+hufns/F0DQBlpxmkVsSSPVGGfi
	 Rh+KFjxTl/fP2a06p6Arj1LpdVUbPioA5knlRuvmrb6pRBrVsnZbFpPl07NY6CGEB5
	 StEKndYLxm/tyOLOd9hhofJVqxDOS/9Oiz/+Dn/pXDsvxQV2X7hg9r8iAH0CxnEqIj
	 XRvJxRBOVlmqQ==
Date: Mon, 18 Aug 2025 09:40:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
Message-ID: <175552804082.1191734.6799856998719669829.robh@kernel.org>
References: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>


On Sat, 09 Aug 2025 11:36:54 +0300, Dmitry Baryshkov wrote:
> None of MDP5 platforms have a LUT clock on the display-controller, it
> was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
> MSM8956 platforms. Technically it's an ABI break, but no other platforms
> are affected.
> 
> Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


