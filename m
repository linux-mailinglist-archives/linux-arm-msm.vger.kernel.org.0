Return-Path: <linux-arm-msm+bounces-38317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C429D2760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 14:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F232D1F234D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 13:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E5A1CDA1C;
	Tue, 19 Nov 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDVzOL2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633201CCEF7;
	Tue, 19 Nov 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024367; cv=none; b=KgXkyZVcHioUlr/zzLl3eaH7FIAIXEBo6yDF5l9Z476I5b2XlA2RDhe59jARPX4LwSGPUytgh0fnPMEykIQE+ZdctTwh+utCFSPXnya4OOqtXsJq1viw0hBMrcnLVYT5p3aiky+66qzy74DOTnFsyvc76spvhoZOxfldqJ4bVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024367; c=relaxed/simple;
	bh=1Pjxc+Ys+Og1dQEoe7LKD4sONGdg5iwH6SoYoSWLLhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aglNWB4akcf1f65xSKp5DGmg3NbxE0B1jAL7uj1sH6Q6uQ0a26V5h7CgyRQeaOVLH7IBibjV1oM238YTMIn4sfoo7+Hgvjge0snfF5GaxeN6ZoWiifro8/wGoQt08TL1lUwOtyAdxrJHD3MsZbfPkuhsR/fV5mMJpw6NwuLiNzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDVzOL2a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BF9C4CECF;
	Tue, 19 Nov 2024 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732024367;
	bh=1Pjxc+Ys+Og1dQEoe7LKD4sONGdg5iwH6SoYoSWLLhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDVzOL2a+NXq3DDuDEfG7H9mCnJV9VPjPcUTcHAv6vLtAj8nmbCKKRwmNyOOh4JL1
	 j81sxVPE+uvgioOr8X9OsQJiHup3pJ8GqO92UIV6PNNKsHZQ76GuoUPy6dRkALmnKA
	 9CpGNiJqV+RAuIMYWk0hvu34vPdBd2tiNnU5iVyTEGiIXWUtV3LvRjd1rCrB/wlSuF
	 o8oe2f8Gpo1GKUQAmo4XoCzmQ1aXJSYJ7ZLicz9S5jDWfP+fhmS/h+94uvMHVBfBsg
	 aNK1mur2XHwk2iLqclwIdzCo3l/DZ25DJLS8Isl6M7G2vfnu6EEaiNwAsS4OQNzhHE
	 KOSenjVwLOUEQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tDOeh-00000000856-2jXa;
	Tue, 19 Nov 2024 14:52:35 +0100
Date: Tue, 19 Nov 2024 14:52:35 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
	Leonard Lausen <leonard@lausen.nl>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>

On Fri, Aug 30, 2024 at 07:36:32PM +0200, György Kurucz wrote:

> For context, I have a Lenovo Yoga Slim 7x laptop, and was having issues 
> with the display staying black after sleep. As a workaround, I could 
> switch to a different VT and back.
> 
> > [ 1185.831970] [dpu error]connector not connected 3
> 
> I can confirm that I was seeing this exact error message as well.
> 
> >   	if (!conn_state || !conn_state->connector) {
> >   		DPU_ERROR("invalid connector state\n");
> >   		return -EINVAL;
> > -	} else if (conn_state->connector->status != connector_status_connected) {
> > -		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> > -		return -EINVAL;
> >   	}
> >   
> >   	crtc = conn_state->crtc;
> 
> After applying this patch, the screen now resumes successfully, and the 
> errors are gone.

I'm seeing the same issue as György on the x1e80100 CRD and Lenovo
ThinkPad T14s. Without this patch, the internal display fails to resume
properly (switching VT brings it back) and the following errors are
logged:

	[dpu error]connector not connected 3
	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)

I see the same symptoms with Xorg as well as sway.

Can we please get this fixed and backported as soon as possible?

Even if there are further issues with some "Night Light" functionality
on one machine, keeping this bug as workaround does not seem warranted
given that it breaks basic functionality for users.

The x1e80100 is the only platform I have access to with a writeback
connector, but this regression potentially affects a whole host of older
platforms as well.

Johan

