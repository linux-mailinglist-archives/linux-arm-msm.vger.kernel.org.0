Return-Path: <linux-arm-msm+bounces-56962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C944AAC836
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483751C43984
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3AD283686;
	Tue,  6 May 2025 14:36:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DBE27FB22
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542203; cv=none; b=g59cCO7Ui612q2Fzu6eY4uoTlyctA8ymEiXNHYLdwNu7N0XwnXZ8BFTN5VwGHlsF9wKmeNThoR/F6n6+ec2VuBaUi/Le1RYLmTmAn0OdMltQo76WEnhQ53j5VPhQWfoUHvpDvcsXg2oOeWY0PNJSG7EEtguTMwo90Gpp20xpZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542203; c=relaxed/simple;
	bh=hLditJZa7MGavYgGYe17flZFVSO2XBEWZd7ZbJiXuc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2zJA0n92TqW4KfBllnaxqSnSw/DxbCpGjBIHs8GgzUW7RCZnu7MfYi86njAZAA3oYUptx9PU7dRv+xRLMZtELb2g8KNdCum5PjWzFtplth7alFLiWqaH8olu7w4BjwHfIaW25JVm+x6ZOiIlGGrozipuycRFKexYJtmVu9VObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EC610404DA;
	Tue,  6 May 2025 16:36:36 +0200 (CEST)
Date: Tue, 6 May 2025 16:36:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
Message-ID: <k4npgl5v3qqdzqytiwesqgs3v362mr27mtvzfbvp6ugm3mn4qr@dxquxscqjqme>
References: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>

On 2025-05-06 15:53:48, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
> DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
> DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
> Single CTL is used for all interfaces used by a single path
> 
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")

This was probably more of a "developed and merged in parallel" problem than a
faulty patch, because a2649952f66e was merged first. Regardless:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sar2130p_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> 
> ---
> base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
> change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

