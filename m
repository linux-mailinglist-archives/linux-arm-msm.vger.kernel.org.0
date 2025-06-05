Return-Path: <linux-arm-msm+bounces-60424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E7ACF9B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 00:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30E2B7A4EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74C527E7DA;
	Thu,  5 Jun 2025 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwqfEgAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AB17548;
	Thu,  5 Jun 2025 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749162782; cv=none; b=B1eaVSLnCyYtMW9yAR3CQPa+s8kw2A3gvLuexIVxu8MjcZnU+HRek2ash9YMkv7VAeSjKOaR9XaTSNcCf99GVyfskGTbpmvewfUKWpbv7W7ZMv8NHS5gXrwy+X5TYQ9+SqESl5MogEza/uSTlDQqZ19rKxm6zJ914nY0oiGAe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749162782; c=relaxed/simple;
	bh=EiZr8n/BGt6VEah20sbpc4UIdBvd2SKgkI9EPu73p5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFesOKcci1sk+YLA6nfs/G1ERqEKem46tvCAqpM2zrHpxKeCIfFXkJ1sLShAy8ByMDWiieBOdOoostZzAYsdgm5apv3G82ZPL8azZ0cEsFM9HE0P0h4CZGhvhFMGVrn9ghfJm7OpZBVYK7hfn1+GvYVQf+2+WNO9uotW6Po4lhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwqfEgAy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A251FC4CEE7;
	Thu,  5 Jun 2025 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749162781;
	bh=EiZr8n/BGt6VEah20sbpc4UIdBvd2SKgkI9EPu73p5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwqfEgAy9QYH0rJ6lGdgxwju69/4Ue8dnzDJz3s5CdXUuPCmmNxwXa+kq6VqM5rLY
	 JrE2c2qn+LifQFYb+q9yrI3lMmjSwjII56ltq7KQ0oeOmZBKXtY4ma486A+kxpVXet
	 sEIXWmkarEBa5+gED2SVq/3HxZ8rP1cScbG4OaUvB8Wa54y/WRNFXNU4AmSQPs5nKq
	 VKxXwtskjR7c+1VIZ+F5EVlqpfufp5t2SnACf785vdNGXrXnTfgbZMO6BkjZ7vufii
	 yJGXMDu0CUDqqZ7RydPryKE3b/MjN9rgnFkONktpGEXdNkLomXixt0KDNMRhuFrPKZ
	 x+d2s8cuL50bA==
Date: Thu, 5 Jun 2025 17:32:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Stephen Boyd <sboyd@kernel.org>, freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Simona Vetter <simona@ffwll.ch>,
	Yongxing Mou <quic_yongmou@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Message-ID: <174916277679.3373425.11793137630921424183.robh@kernel.org>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>


On Fri, 30 May 2025 10:47:25 -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


