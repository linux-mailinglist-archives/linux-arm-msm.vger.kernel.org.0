Return-Path: <linux-arm-msm+bounces-81188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0062DC4C2D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA2534E5AE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB2C271462;
	Tue, 11 Nov 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMob0ZfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C722D78A;
	Tue, 11 Nov 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847434; cv=none; b=Zczgly6KN1Nx6eJpFn81vo/WJa/sjYNzeiEhI5xWWK+9hEK1/MxZPq5cTYJCKD/+HEh+tCm9QiXdGujucFAjLP20Vu0ulf8Y4ycgcoR1M/SoXxy8if3OmHF4ZB8UzD4xgKS95VGXtyyDrW/ljfBhktmYG3M1QGvxd+soh8hJQY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847434; c=relaxed/simple;
	bh=oUpC387GOG+scMgq73fcTcbxVzxmSK2/5OLQR2Y2jNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5vX3ZF7Evm/LUUaWgtplSgEiOPCrKvAbiDK+yVcyKJoG0gejqbcfADcCaWLTs8kWfyha/n9Am2WZEzQWS6vWuhjiKXMYpOB+DzBwuRmPht5lT3aCJVvHvXU4fCl0cwjXlagXGJ7mnXsCvelTyrFUmo0IL3zQRn07WL6dGKP0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMob0ZfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9736C4CEFB;
	Tue, 11 Nov 2025 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847434;
	bh=oUpC387GOG+scMgq73fcTcbxVzxmSK2/5OLQR2Y2jNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMob0ZfD44J4BlJiPK4v9d+USC8LaYmuTo2h/N6KUYluazUj4oBym09P3HqQ2GtCb
	 5V2eQ1GAWULEai3y83riVrBFGwdcKzmP2I/aGFo6PyMXWW3YAW/VgOnbaU0I3Ws6RN
	 RF+7xiRK51aGPwh8jBdMYG4O1etN4Mx1kxNbJTBvZEz/+hPfCUKu334GduKC50ytmT
	 2fWvzPwg8OuWussEFBkC0sxM/YqxmVWkvjHB/Bv1uqgFjRYdIAkPp1l3Cg60Ay2RXU
	 5p5AySOeJKt+Aogwv0H8+1aE/pZ83D58JP5ITHvLzbAKzOsZlmbfWJ/BOIGbz/RyzG
	 0ePqZF4epfbrg==
Date: Tue, 11 Nov 2025 08:50:31 +0100
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
Subject: Re: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
Message-ID: <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 10:07:27PM +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to support the gpu smmu present in
> the Glymur chipset.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

So you ignored entire review? I drop the patcshet from DT patchwork.

Best regards,
Krzysztof


