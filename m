Return-Path: <linux-arm-msm+bounces-38344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D077A9D2944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968CA2812A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9D61CEAC8;
	Tue, 19 Nov 2024 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2JYLkM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382D1CCB37;
	Tue, 19 Nov 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029072; cv=none; b=efRI+4ePW42uUq9vZl9KD67Z8YeCcKO/3rO940QRgZ1etDUf3KoHD87VF/wPihIWB/V8uqH89PhyWkaTAAjJMbyDxDRT9TV4o/xlpqnagM9VQ96u0eMrcLKUO4QXRBeq8xGcNaD0Log71bRciKzo1xlWoiF0rKoxOQyfMbv18+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029072; c=relaxed/simple;
	bh=u7CYeHchdgH72+HflqWq0W1bzAuufE9hVtAx1Xo/xEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTxPtZO3UDACZAmN53Jjz1b+bP3vP9p+VcnCQbSCsIotnCN4WM4RbgOyv1gfC7lIIpkK0hxMjdRMRmgpnGBTXlZjMoOL9lw9e2mPJzmTMHOfCpL6EtoYgJcqAeuSTHxMpP8zQqhP/53jNoto9gmZ+WqJ6i5HlnWOxnE9Jd14Q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2JYLkM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA99FC4CECF;
	Tue, 19 Nov 2024 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732029071;
	bh=u7CYeHchdgH72+HflqWq0W1bzAuufE9hVtAx1Xo/xEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2JYLkM2Ih0LQl2O/9c4zZ8bzwrlXLqS03NsHezMXXPOgz+eunkVvrEKwqTG+wY6S
	 kuvLrldGErj+pr+IgEZxIQfSV8DqH6g1AfCoEJU5tu1KzqboNp8R2hoQhrHcylraG4
	 wgNKo9wiecdZKVN+cggr/VL8ojURjjuYYAldk5I3D+W48iSAfwKBDajov6ycpDtnnc
	 pBJvBeUG9hSGEyXdVM9xFVH/0ICMt3su13jqZp1VXa+HpSeNqTNQFhjrQHkWOtlN5i
	 D25JXlnaE3i99FIdSG/iIGRfnGzLLRb9KY0qkR0XaB9RJHgs2XuVKiTNfj1u3gWDB4
	 Lz5AKunVAcyHg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tDPsa-000000003KO-14Qw;
	Tue, 19 Nov 2024 16:11:00 +0100
Date: Tue, 19 Nov 2024 16:11:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Leonard Lausen <leonard@lausen.nl>
Cc: =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <ZzyqhK-FUwoAcgx1@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
 <2138d887-f1bf-424a-b3e5-e827a39cc855@lausen.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2138d887-f1bf-424a-b3e5-e827a39cc855@lausen.nl>

On Tue, Nov 19, 2024 at 09:33:26AM -0500, Leonard Lausen wrote:

> > I'm seeing the same issue as György on the x1e80100 CRD and Lenovo
> > ThinkPad T14s. Without this patch, the internal display fails to resume
> > properly (switching VT brings it back) and the following errors are
> > logged:
> > 
> > 	[dpu error]connector not connected 3
> > 	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> > 
> > I see the same symptoms with Xorg as well as sway.
> 
> The issue of "internal display fails to resume properly (switching VT brings it back)"
> also affects sc7180 platform during some resumes. Do you see the issue consistently
> during every resume?

Yes, it happens on every suspend cycle here.

I didn't notice the issue initially as fbdev does not seem to be
affected, and I've been running with this patch applied to suppress the
resume errors since it was posted.

> > Can we please get this fixed and backported as soon as possible?
> > 
> > Even if there are further issues with some "Night Light" functionality
> > on one machine, keeping this bug as workaround does not seem warranted
> > given that it breaks basic functionality for users.
> 
> I suspect this is not about "further issues with some 'Night Light' functionality
> on one machine", but rather a more fundamental issue or race condition in the qcom
> DRM devices stack, that is exposed when applying this patch. With this patch applied
> DRM device state is lost after resume and setting the state is no longer possible.
> Lots of kernel errors are printed if attempting to set DRM state such as the
> Color Transform Matrix, when running a kernel with this patch applied.
> Back in July 2024 I tested this patch on top of 6.9.8 and next-20240709,
> observing below snippet being logged tens of times:
> 
> [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
> [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
> [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
> 
> Full logs are attached at https://gitlab.freedesktop.org/drm/msm/-/issues/58.

I would not be surprised if there are further issues here, but we can't
just leave things completely broken as they currently are.

> > The x1e80100 is the only platform I have access to with a writeback
> > connector, but this regression potentially affects a whole host of older
> > platforms as well.
> 
> Have you attempted setting CTM or other DRM state when running with this patch?

Nope, I just want basic suspend to work.

Johan

