Return-Path: <linux-arm-msm+bounces-64027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D7AFCA85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0EB177235
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCD52DC32C;
	Tue,  8 Jul 2025 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6LiEwqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FC2D3219;
	Tue,  8 Jul 2025 12:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978319; cv=none; b=e6rOj/iXhJDulLzJbbOr/m1FbKBtInF+o2qmizR1nmrykXjE9tYogDwbciXZii5L8ijCtfRL51QnzeMxvaaiemJuBhouc3iLbQ5Wozes5In1Pw3hOigRsJG7Qsut8m1R7r90M7jCxSGmyXA+eeyvcOCR1roUJPjwypvcj+AYUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978319; c=relaxed/simple;
	bh=o1yMC5yXvwyxJVQqma6R4l94Mpchdk4qGZQH8FaZxec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9qRG010OAMZK03j+YuBkUubKr5JqaJ4vWsXYvFicopur6FS2ov1aajW0Q0J4p5bRjwE858Gg1B9kVbc4vbytRlDE2dveF6ciwGjrsvcatL3Ms8oj85Iab6OFDilTY0XIrgrAPA7hWyw12iTYlO5vt6wnn92L8ks/S0IU3b9dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6LiEwqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B82FC4CEF6;
	Tue,  8 Jul 2025 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978318;
	bh=o1yMC5yXvwyxJVQqma6R4l94Mpchdk4qGZQH8FaZxec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6LiEwqF6FaN9IXz8lNDLsB3htj7RSJw872o53SIKiNlPo+7so1DHD5Novsd/rRg5
	 RqZRO/plEhi891sHReCbqNLRtjjWijvNXygSZ9vpzcgwWnnegwjF7ylyaSOCzFb0RP
	 ixwcZuF3FWxuxN6prinmKxLPf8pklF5ji8tXorxikMgcqNGVFhA2Rnf2rnLeqeXmsr
	 nyehTX19f18WalhPxjNtX8QR7vl6iqiGWtrc3CkEWXB0Jt/ccrTsFv0tT9ZqqPdd7S
	 vxq1KfKuvEwD/7gt8/VamU9zbBZHjtyNxTWySZtRKVqEyICwjbNQrremJcbS2O8Med
	 X6B1qEaIj7Uiw==
Date: Tue, 8 Jul 2025 07:38:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
	devicetree@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	freedreno@lists.freedesktop.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs
 in clocks conditions
Message-ID: <175197831620.377179.2786690071719623703.robh@kernel.org>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>


On Sat, 28 Jun 2025 06:02:35 +0300, Dmitry Baryshkov wrote:
> Handle two cases for Adreno 7xx:
> - Adreno 702 follows A610 and A619 example and has clocks in the GPU
>   node.
> - Newer 7xx GPUs use a different pattern for the compatibles and did not
>   match currently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


