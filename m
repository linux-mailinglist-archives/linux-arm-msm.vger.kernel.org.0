Return-Path: <linux-arm-msm+bounces-81187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DFC4C2BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EFE3189DA82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AE123EAB2;
	Tue, 11 Nov 2025 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoFTKMV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB88221FBF;
	Tue, 11 Nov 2025 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847399; cv=none; b=IRaJBeRiTdD7Rj7qa2mGTj0WlvQjEyoABB2EK2t8Zd1eI7lE4GID3h74sTQgd8YX2qWvwKUY/2cKEDKyEJf8wOkDUtAi2udPzelOo9Q79RXRIst9ZU2sXTYDLu7T5rhvKUAw0SVf9d16RmHkPpimgBQ6m+bgTrKa2i3tTjAFFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847399; c=relaxed/simple;
	bh=LtD7jh1jiHyiFX3iVP+B4S4da4HrLV4LEooD4oBo27c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGVl2ayySlJgalDkvWwwgJBFVPtikmQ98+cYJBJfY0Gro1+1PQZt46p4zu6a/qHOpyXWLb5Zama9Z/uOffhFxfR2nMiNfswbEPRr/GEDbyZkinp5k0VIJsFn02gIN+oyjefoEVrAhL7QTn5BBOZ3bkZFeYghUS+ML7iSX9fIRaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoFTKMV5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B81C19423;
	Tue, 11 Nov 2025 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847398;
	bh=LtD7jh1jiHyiFX3iVP+B4S4da4HrLV4LEooD4oBo27c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoFTKMV5c9VBms5D1QoGJ/1cmQlq6ndI44MgJvLg+2cKTvNT7VCTKai7D8BJaSmsL
	 1lXEZ/4I8pKMhvjzVyTP07+o9t+mBRZzL7jx/AfC5SqyiBA3CYQw1j4mwskoWdsesY
	 FAX1tlQ6elMo6Z2UKve1n3Sb9XIhxk4Vnhok3b1nXsSbEa77ohIzvPU4cbbLgQcx59
	 lmRb1KLQhdPI9nVBwQGBqkglY+ZtLQkcvzl/PyC+3aqowHCzu+pUffziPJsf/4fmSY
	 Hq0aErDgQz7DV6zwmH3X/2iNtV8uUVM0K5DHDOwwZiAbMEA5uOGHP57205mbfEVYFZ
	 iiW/zl9nKuv8A==
Date: Tue, 11 Nov 2025 08:49:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
Message-ID: <20251111-magnetic-jasper-slug-3abc3e@kuoka>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 10:07:26PM +0530, Akhil P Oommen wrote:
> Document Adreno X2-85 GMU found in Glymur chipsets in the
> dt-binding specification. It is very similar to Adreno 840
> GMU with the additional requirement of RSCC HUB clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


