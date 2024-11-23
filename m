Return-Path: <linux-arm-msm+bounces-38921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193A9D69F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1213AB20E46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978AF86AE3;
	Sat, 23 Nov 2024 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlL8wfQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DC42A91;
	Sat, 23 Nov 2024 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732378531; cv=none; b=CcypNXexEp0+1dbL5/P+TCTkKAsBGFLqp1TF7X6aBUQvvZRJT8YFTK6qEKJLNfA317DnIoCstBY4Sk9TJEgNZEhdf2CoIth/colHUrWJ8SgP0vBeDCJTBtzmI0jtx1UdIkt/klezd3ENo9o6Nzvca49t6csnZM2cqsx72MhYuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732378531; c=relaxed/simple;
	bh=aFqOexa4IuS4Qk6HkPBylQSk76DY92gyVsr7yse+4R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C628+ypIeHKsYh++raZG23s7PUA0mhNwt+WgWxnoJK+F+litXeDRPUn2WhoLmcxzRlIcbR2RRoPP6QaW7HCwdvRekbUgawPZ2iE39B1qzPnz3dNqFkRMUDpfHScmfqDgzw+pBPX+VvdQn8LYVOvXrwSBXDL31/MJVovT3uw0790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlL8wfQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34638C4CECD;
	Sat, 23 Nov 2024 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732378530;
	bh=aFqOexa4IuS4Qk6HkPBylQSk76DY92gyVsr7yse+4R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlL8wfQIQ175OPh+ZQsI3Mbu5COm0FMjfoeeoe8OIAXddyOGZ9DNI7H+Sv2NqnmO4
	 AWw7VHKrl1r1e134LWh6sixEKc+SO/74Ef2Om2bBmqKHN67VJR8ShdoZ73hKYJooWY
	 j4FbxdNFTvcAJcV/0YLjJ4bJwg0m+rlRqMlqbGzfURFhaEC/jz+xjcRqJJc1A+c9vj
	 0MZPozl9ujeR3Mi68h5iSTbMFgcBfKOj6u7996nTYOBXGi9CS5ZlZf9PbUHqrgd5wP
	 QzdUMDD8qRQoX1zvywnF6MXRwiw68cEPPYvAf2MYejUnfFKquR6lbfKRk8oGqvBJB5
	 vdeaoEqkN7B0Q==
Date: Sat, 23 Nov 2024 17:15:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
Message-ID: <2nqtuatl63ajcahsmhvg3bmfipfhppfkygwh6as7zzwgxzipoo@hcvuv57sqpqu>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-3-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-3-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:46PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm SM6150 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---

This has a build failure, but nothing here explains dependency.

This cannot be merged and due to build failure cannot be tested by
automation.

Sorry, no review from me, please wait till dependencies come in or
decouple series. Anyway otherwise this *CANNOT* be applied by
maintainers...

Best regards,
Krzysztof


