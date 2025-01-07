Return-Path: <linux-arm-msm+bounces-44064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1326A03436
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 01:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC818163A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC268208A9;
	Tue,  7 Jan 2025 00:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkAjYNMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D439FF3;
	Tue,  7 Jan 2025 00:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736211308; cv=none; b=OMixlbxf6BeSxM3R6bEwrgx0rZmM44T5L8Sywvuhfa9bcMhxyHsQnvTpxkbpOtC9Qg2wBFchmFot8d4iw0uNaQ++XKySv0y4AJ241LtR2Y5+KZ7GWPyrb06y0hMRK2KekPKpF9H/8NDl4KYv+pRyKzVIXqozLXdrjfABYdweUM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736211308; c=relaxed/simple;
	bh=itpT8lj+lNIgywLNl4oQSfKmBGz6ZnJFx9B6ZC+ljLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EINVSvCR+DsEgKL5nqbHntpor3gXSRXeSHxPcMFZGwDNqEfvzlnOJuoUB15h31vravxk9c72Tnz1mVUOK4jmMTgSlKjjRgaLXBEtei1bgX4f8hMZPAX2osEOg1n7iNalpmb1i/NrFC9l9unD4Aac2qQekC19ydbiD9K4gHnx1JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkAjYNMQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F408C4CED2;
	Tue,  7 Jan 2025 00:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736211308;
	bh=itpT8lj+lNIgywLNl4oQSfKmBGz6ZnJFx9B6ZC+ljLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkAjYNMQIt1Y3Disc0kT2+T01kw3dPkZz/I2a11LIGWqBNwTcgc81F9rHcmshaVkY
	 xzXN01gHUYajLV8UJRAObHhUP1TS4EoJzc84u2dN9VL8xGIqiAmZUzNuz+VMu0KXSx
	 08jgASgpWlyMv6UE1qKFoSlPrb0lQT4XY5m8bKnGb8jeHbMywYWxIRlcEfBf3XHLoC
	 XSvXM/TiqvzB8H/9nlFgn0c2cJXO02QwCTN8ZPrzFI7sYXVMVy5b8rH4vKz7RNnu2K
	 Jy65E6HRDlLHw1BEtfKaza9flEh+iKKLqS2H8aN9FUswErs+t/bdqrlG+OlX4ZR56U
	 HvAscmUEnTiiA==
Date: Mon, 6 Jan 2025 18:55:04 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 03/45] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <da2aviya67nogkkkhsbvqcgo3gvmk7uv5vb2dbdemzh6xonoo5@oqtgwgwgshmr>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:34PM -0800, Abhinav Kumar wrote:
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.
> 

Wouldn't it make sense to introduce this later in the series, once the
implementation would actually handle this case? Or could/should we have
left these INTF_DP from the start?

Regards,
Bjorn

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..2509e28e3d6b582cd837c6aea167b3f4ad877383 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -375,7 +375,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_3", .id = INTF_3,
>  		.base = 0x37000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> @@ -393,7 +393,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_6", .id = INTF_6,
>  		.base = 0x3A000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> @@ -402,7 +402,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_7", .id = INTF_7,
>  		.base = 0x3b000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> @@ -411,7 +411,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_8", .id = INTF_8,
>  		.base = 0x3c000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> 
> -- 
> 2.34.1
> 

