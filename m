Return-Path: <linux-arm-msm+bounces-82949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C89C7CDA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 12:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97153AAB66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 11:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1522FE058;
	Sat, 22 Nov 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqP+NJq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CF2D77E6;
	Sat, 22 Nov 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809396; cv=none; b=onXnCWeEsVFjxfCRNMM5O00zaVNJ3/Ei1pWb6quS1WHVjmmtKiPQ2B3a+G1ktWhY32lEQ3W24p6zm95jNn6dVC+EYt+j7+Q1ueIoDWMTp4pQu8HKdUVs0Nhmp37Svw+rZ1AzCKsW88yhQdWFIyUK84k7IICldg+ev4eom5cSk0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809396; c=relaxed/simple;
	bh=0DMcLICAtrc9uXC9WUUyA7qUt6f/1V2goqvqubrmE60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtaUDGTamhL7LhJtwXFOJIXRvhfCMWOddlbtADLxvsgFBP6bF2Rqby7pOVnOyUF9vT5ax8YqIyJWzV+XXjBhN6CRducXZWQsNxa3vz/Rh/Dyt9NcMLUcFNE0zPt4GTQAfoCgHL2VJXbvotH9ErowPItOipffoEYupavZLTxt4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqP+NJq+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD48C4CEF5;
	Sat, 22 Nov 2025 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763809396;
	bh=0DMcLICAtrc9uXC9WUUyA7qUt6f/1V2goqvqubrmE60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqP+NJq+gUuYdw/RUTgMGNShL+AibwOFyVqRMRsFXmCMMC6X86RlgCkWn1im3lqip
	 x/PfKlwI7gY4EpqCG0qjJw/IPlan2Yg4OG2rm0qk78T9IO/4gniW2LC+0J1IK0ObuP
	 2amjXXFk8JgJoOiM61xSBoeY/3sYlZ/UxrhSenYH4Z/wknk+00ruHwrrXaj62qQgZU
	 fkRyibqPkQckodqNrzb2kKJrpmd83VMmtqgqiXzFaaLxXxKAwvC2F9sYSiCSeg1bJ9
	 E/Q9ICbW8+utfxYVfi9b+XNcDanR8tUNBZdzZoH4ihYdw/Zctu3bSID9jBURH58Wa3
	 UZfFrIw2IAoxA==
Date: Sat, 22 Nov 2025 12:03:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
Message-ID: <20251122-clever-ambitious-mastodon-8b1a1e@kuoka>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-3-9f4d4c87f51d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-3-9f4d4c87f51d@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 03:22:17AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> support. Compared to GMU, it doesn't manage GPU clock, voltage
> scaling, bw voting or any other functionalities. All it does is detect
> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> it doesn't require iommu.
> 
> So far, only Adreno 612 GPU has an RGMU core. Document it in
> qcom,adreno-rgmu.yaml.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 127 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


