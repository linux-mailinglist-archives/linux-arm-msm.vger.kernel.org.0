Return-Path: <linux-arm-msm+bounces-73217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C911DB5422E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13AEC1B274CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 05:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E8270EC1;
	Fri, 12 Sep 2025 05:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTpXSTCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421A214A9B;
	Fri, 12 Sep 2025 05:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757656305; cv=none; b=Rwuatu/4fqpOG4g0c4EGiOt3+yYHPmjkHZMgJlRWqnQOiFbQhNuX0CaxBviMltzjjyb1A5IOQj4UIjuy+CQ0KHixdfsNcfWa8XVaNq+tNB1R3JNbbGO7dcZ3A89ANTq8eOM6OTjQg4ZF65dVkWgNz8RJ+hXXAh+NV8ZC+79BBy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757656305; c=relaxed/simple;
	bh=70/n5jSjmOfMt6dRAtLd6hOjKJMT+ZyDSrpU41o+FpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxczzqGW3deRLHRNyfYZa8QKJvTUGCAqh76GGfSjciSaXBEbDbP3OhvPlzpBJbrtr8jjFzZoJN+m+M+nhHHepRBXPr9nRjlJ7UUB9a33883aPhJkwXkQfZq3XJyFfj/hq7JD+5dcYte9/Bejx2qx/TG1RFpYLgCDSVd6EOMwJow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTpXSTCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283FAC4CEF4;
	Fri, 12 Sep 2025 05:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757656304;
	bh=70/n5jSjmOfMt6dRAtLd6hOjKJMT+ZyDSrpU41o+FpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTpXSTCO9xqDCirBxjn8GXY7UlPgIIbIMV4TugAAHq7wx0nU2SVXIXbNifTH8ffT1
	 j89mm8ZIuvk6eALdYGdU214+j7pUcFK8RcyTpj2E3D6wS32perRTee/OI5Ch2zIBSR
	 44rPRyrmb7J4pDvv+8UYp0u5PrW32ygz/hdR65auDZppUB0wSSHMvYSH5oOsDi1tJZ
	 MnB+W1ktFuV1baElPPw4Tu4f5vP9C7S3L5hfhforNR4Hz7AeGbvxvcx2mruyUllG0Y
	 wZUer7giqLdUXSS6xyvPISluwmb4/+3w2Ba8jK0egBsZTg+SKiLTJfD4+x7WGyY0rd
	 BbCMcQbksNxVA==
Date: Fri, 12 Sep 2025 07:51:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <20250912-jasmine-chowchow-of-security-0cecc2@kuoka>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>

On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,

Base address does not matter in compatibility, it's just an offset.
Registers layout does, so I assume that's defining factor.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


