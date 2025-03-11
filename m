Return-Path: <linux-arm-msm+bounces-50914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004CA5BAD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBA9018923F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E372248AC;
	Tue, 11 Mar 2025 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl9CboID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCED22259D;
	Tue, 11 Mar 2025 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741681709; cv=none; b=hlvu+UK2yi+SddJh0J3hRm/Qa6pmNEcD34IsBrtGrOMsgDmODOCrnqI4xjMFQzNkvjJ3O+aY2RcgJtLInrpDJFGYwSnjYAQCIiohBddOyelE0aJj/CaaIVYhICYWCxJ3tb9a+37iLuXs4CHPyuqIuprUvN82DoYqKuJwim6iNnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741681709; c=relaxed/simple;
	bh=7ZwpmjJZnpXO5LGEbzV1r/EFTliKGVJ1yxIMUn7Wtik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVIdmXfPUX9w1oObu6gXmhUaapz4ujaBBeEVr2WhBz1e3w0lNW1JOsJQj5lVJoRkDBe2mAgnnQ1Hh/1YaNXUJJ0Xfmq7/r6fEQjlIgPT4c3/EVOnF8TdO6Z3nNH4ZRaDfBfByeN2rvl5lzSXBd1EvyrmZ/UBPbgflaTXKkVVipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl9CboID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43464C4CEEB;
	Tue, 11 Mar 2025 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741681708;
	bh=7ZwpmjJZnpXO5LGEbzV1r/EFTliKGVJ1yxIMUn7Wtik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fl9CboIDc/cKyNQHJ2awS1S6wbFQGeZmp6w12zghNyj+TjyihMuXMKhWJHk7YhxUe
	 EGYTz/gteoipus7eSqlmrhaSQxW+3SZH3MgnFjn3FIZP3oJCP6jCEE/P7gNlyLhytz
	 IlPJWtWuCCoeJLJeoWOTiD2httqwg3jchVIGI01ZWAFWo5XgG3Ynv3BdFLA8sXkMGz
	 ATZCqG5Ok7Sg7Q+zGtqB5ZgEIbPkWWDvAvCTYK3tbxj+8i35TDZ/CqiyeSej4o2jr+
	 SEDvjM/RgkmQgOUzX920ZTfYnLBcaTCBpj995q7vezHkRjr4NHIL1djyYyd3GqQWmE
	 fTqXZzslbriAw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1truyM-000000004Mn-2Dgn;
	Tue, 11 Mar 2025 09:28:23 +0100
Date: Tue, 11 Mar 2025 09:28:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, abel.vesa@linaro.org
Subject: Re: [PATCH v1 2/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Message-ID: <Z8_0JuNTDpgani-d@hovoldconsulting.com>
References: <20250310211039.29843-1-alex.vinarskis@gmail.com>
 <20250310211039.29843-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310211039.29843-3-alex.vinarskis@gmail.com>

Hi Aleksandrs,

Just a drive-by comment.

On Mon, Mar 10, 2025 at 10:05:52PM +0100, Aleksandrs Vinarskis wrote:

> @@ -1084,10 +1091,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
>  }
>  
>  static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
> -		u8 pattern)
> +		u8 pattern, enum drm_dp_phy dp_phy)
>  {
>  	u8 buf;
>  	int ret = 0;
> +	int reg = dp_phy == DP_PHY_DPRX ?
> +			    DP_TRAINING_PATTERN_SET :
> +			    DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);

This is hardly readable; avoid using the ternary operator and split
declaration from non-trivial initialisation.

Johan

