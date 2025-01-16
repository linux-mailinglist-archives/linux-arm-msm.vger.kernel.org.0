Return-Path: <linux-arm-msm+bounces-45216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9BA1344E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7E8D1887A3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEE01917D8;
	Thu, 16 Jan 2025 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sscXGBS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45CA18C035
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737013915; cv=none; b=gvCofrfjTA/mZ4NplapwrJ+3GNGSB7FZAYnbLDzgNYlr1WXsNITjK0QJNIi0hy/9F3xzBrI26sTOC3+BGro2xoPgW64sZyRiwp1VTZ4/aRACqqYegjgIxktxOaSVwqfUdfF9qMd52nklk4mRtlV6wsgbRkFvuVYHpdrQpsd2Hm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737013915; c=relaxed/simple;
	bh=+DADwMIrlrpTS6slReo5jX5dg1qGz9PLRUs1WQBfy0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKUtaxkJ/UQ4XA4sF/OtVFVfF5RKYJWIDhLHxta+7cq0xT30lOaTjICJxT7XWOWf4U5WU0KqNr1U2lZ/lye5HijuTy7BXf/0z2fiQW3fHALrjOux5uqv+9x/vb9WmeL1dq1Krv/BKV1/LgKq8IPIyttmP9YeV3u4QPtspK5+PbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sscXGBS3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso763848e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737013912; x=1737618712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9KeTcvRzSBRZoETGqvAsD3cwrr3v6t0G+jUydDVDOWE=;
        b=sscXGBS30niiXJDrxg07E8aLWUnJI3AmyE4IRHbwaGSJfR4WohNeID407vW/ROe+c5
         SX/mbn/iKFskyTLKELioorIj5WuowObZ3puEM8qyZ8K/jN5o4BQPuJsqk9w4FLy4cSRc
         77uLJHVx0MLP09beJnY2zraPNMpWfKH7CBknUfUXxvqd/I8VW+Kg/qR81l/yR93bQYwN
         xyqZLsglIb0/U+jjN05DWnev2J/iiz90zQ+4p8zwp5dnrRyzMJYMREnaXrdnt1BFRZ2s
         ks7OeP2Ehtm69UL6qppfTjHeYn9PlpZXGnQfgVRf5TEPTXqKD83NVhjveNp0NFhstzMm
         ENtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737013912; x=1737618712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KeTcvRzSBRZoETGqvAsD3cwrr3v6t0G+jUydDVDOWE=;
        b=YfwJpkrv4eeo8U8/B5WXPIlOi7IgMXKuRbUS32ZyQevleX+Bn0Wbh831vx+qnl7lAS
         WD+2RBfvRjFEOwsBTbY+VZ8y6zDqXk00o7aszd0S9zee7dWlLQjYB3sHg/YNd/VNDgZW
         WEQFpGcijwf7aXcHxKjQKbdG7nYxuY1tDEVCUnDvWb5Aq7EHh0K8qoruukcUJkvIOuQn
         g9prU4N99nHj5o6qbs36I0ZllOop4UV50CqIUeYQdNvXk5YDwFpfQkDy7AlNqd03z5Yl
         ROiY7YVk5FI5o3Xq/D0M1hwJY+1ejpmUuAr9TyATZVDIeJjag6z1R9qJ9JFhzO4/zNau
         MSWg==
X-Forwarded-Encrypted: i=1; AJvYcCXltZqiVMKEWR8uiJSrQwxeE77lXZJvgR+swzaMnHIeOuZngEi71bhDCoGlx46RowWwUhb+mzmZBYAMZM4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJJpG3M+8gZN8K14v5Qxco3zVOlSpPHw75qNhah/12/H7a7BM
	DTKqWr+TX8P7oNplUZAbuNugcuCUbRG6qxS5rOhj98G6E4FNyS0PrYDZsjwTgAU=
X-Gm-Gg: ASbGncvHIN+o5EXZi90ed8xjHUK5Wez5etNpllVhqGSQCnH0jF+oOfo05934jVd8/9q
	IfFFknOjHOk0tx2f1kQFYKSNpP4RMxo0dBr1xx9INWsR5QSe8/yfWNM9LPZRkn1XHFXKLfRrl3P
	eoXAySzT0btJ+hJU8YhlVDbPPI3iHPJRqIQLOfXurBRpLHwjRnNT+tC/6NF+ay637UTsefrv+tw
	LB/omdl7Ky5BwTjM14DNB8hiwTK3l/Z9fxn0UD+qnJQWAEUJvlX+ms9f4BuK72nfppT6BxNlY/B
	FCYQAOodnzoJN9fLA1kLItlJas3MbZgVsOO5
X-Google-Smtp-Source: AGHT+IGPJCJqYj/cimGurDWfRa4t15Cl982J3dR8pYm0UoxlgQOAe+YlDndj4ssRizqsQTlDi67H9A==
X-Received: by 2002:a05:6512:3e19:b0:542:986c:11ef with SMTP id 2adb3069b0e04-542986c134emr6310487e87.5.1737013911933;
        Wed, 15 Jan 2025 23:51:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6acasm2225579e87.117.2025.01.15.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:51:50 -0800 (PST)
Date: Thu, 16 Jan 2025 09:51:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/16] drm/msm/dpu: polish log for resource allocation
Message-ID: <cjtwvbnpqqkcrqs3f2elol5s5wcdxtk5yeevgtf6zj4gvypqth@dcg3ydqk3v4r>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:53PM +0800, Jun Nie wrote:
> Add resource type info on allocation failure to ease debug. Because
> more resources are required in new usage cases, such as quad-pipe case.
> It is more likely that resource allocation may fail than existing usage
> cases.

- Problem description
- Analysis
- Resolution

The patch LGTM, the commit message doesn't. Please work with one of your
colleagues to make your patch descriptions understandable. You are
putting the cart before the horse.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index a67ad58acd99f..24e085437039e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>  		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>  
> +static char *dpu_hw_blk_type_name[] = {
> +	[DPU_HW_BLK_TOP] = "TOP",
> +	[DPU_HW_BLK_SSPP] = "SSPP",
> +	[DPU_HW_BLK_LM] = "LM",
> +	[DPU_HW_BLK_CTL] = "CTL",
> +	[DPU_HW_BLK_PINGPONG] = "pingpong",
> +	[DPU_HW_BLK_INTF] = "INTF",
> +	[DPU_HW_BLK_WB] = "WB",
> +	[DPU_HW_BLK_DSPP] = "DSPP",
> +	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
> +	[DPU_HW_BLK_DSC] = "DSC",
> +	[DPU_HW_BLK_CDM] = "CDM",
> +	[DPU_HW_BLK_MAX] = "unknown",
> +};
> +
>  /**
>   * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
>   *     assigned to this encoder
> @@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  			continue;
>  
>  		if (num_blks == blks_size) {
> -			DPU_ERROR("More than %d resources assigned to enc %d\n",
> -				  blks_size, enc_id);
> +			DPU_ERROR("More than %d %s assigned to enc %d\n",
> +				  blks_size, dpu_hw_blk_type_name[type], enc_id);
>  			break;
>  		}
>  		if (!hw_blks[i]) {
> -			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -				  type, enc_id);
> +			DPU_ERROR("%s unavailable to assign to enc %d\n",
> +				  dpu_hw_blk_type_name[type], enc_id);
>  			break;
>  		}
>  		blks[num_blks++] = hw_blks[i];
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

