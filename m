Return-Path: <linux-arm-msm+bounces-77974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC68BF09ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82C1B188D306
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721702F7AC8;
	Mon, 20 Oct 2025 10:40:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521252F7AA8;
	Mon, 20 Oct 2025 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760956827; cv=none; b=n2+OHq/TwUObgv7NUEkCK5KA7RD8L96jzfOKTv18QdmVX6r0sy2W54ENG/mRFXnABRniJ1XZchHVu+O2Neu6jOpdAuFu5Tcm6tj+86XFAWHFITKRggOefWo+VR1U3XNfuU0RykMwL8DZ+1+eyvou5WGH/2vk6Phr8EpBUX89ZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760956827; c=relaxed/simple;
	bh=kiPZ+Khxgjazou/YY1KzYm6Apt7J4+uFy00Fw/XzBn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnZGXAKxxw5CPwToSLp64HHmaxu9wSm+69goRj5tFshM3F0NleBa9nUIMZ1125geiTzCaKt2JEGXsugkoGiBZeQ5JwgqOR9vdEJbp5Y6Pxad9AdgW3w2XIQ51X6kHWK5eKgK/Mx/4FjYfqCGl9tCxEcvrk1xohOibd2KX3JuEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBD0C4CEF9;
	Mon, 20 Oct 2025 10:40:26 +0000 (UTC)
Date: Mon, 20 Oct 2025 12:40:24 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Message-ID: <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>

On Tue, Oct 14, 2025 at 03:38:25PM +0300, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump. Differences are mostly in the DPU IP blocks numbers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
>  - Picked-up Krzysztof's and Dmitry's R-b tags.
>  - Fixed the bindings check reported by Rob.
>  - Fixed indentation reported by Krzysztof.
>  - Re-worded the commits to better explain the incompatibility
>    with previous platforms.
>  - Add the UBWC config patch, as suggested by Dmitry.

Where are lore links? b4 provides them automatically.

Best regards,
Krzysztof


