Return-Path: <linux-arm-msm+bounces-47531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58BA306DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E676C1884672
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8826C1F1512;
	Tue, 11 Feb 2025 09:24:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E21F12FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265847; cv=none; b=ms9F2yTQddMmYjRCHQGT12t6Do5wApLMF8B7CS6TPrrDOkWvxdcIgRch1QPP8ddTYEZmQYkZ5+vr2ef7HlwnmyFFx9sxAS7zXD5aq+LB+Hxps9IEQs/g2ZYevLuULdu7igfW/cqSGiiWVAOZlamcetwb7BO9VbaQW+NvyTPYuRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265847; c=relaxed/simple;
	bh=Rk5U0Rep1F3kms699juI2A/b9Wt+dbddkVp5SzapCGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5Gi0hoKHWdcVvIe/lXw5qkvJyENHGtnkkOypvDJikqeCwAvCNh6JEf7xodBv+77B8ER1w9HKPd8cOgdILIZG2IqEZtMB03+OkucC8kSEyRP6sdriWa0//4AkKDDLvE5n8c7mQdQc/bp1SGjwx+qeatm7To7a0+hfCYjpxJ1di4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B596D20113;
	Tue, 11 Feb 2025 10:23:55 +0100 (CET)
Date: Tue, 11 Feb 2025 10:23:54 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
 <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>

On 2025-02-10 14:14:14, Abhinav Kumar wrote:
> 
> 
> On 2/9/2025 7:51 PM, Ethan Carter Edwards wrote:
> > There is a possibility for an uninitialized *ret* variable to be
> > returned in some code paths.
> > 
> > Fix this by initializing *ret* to 0.
> > 
> > Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> > Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > ---
> > Changes in v2:
> > - Return explicit 0 when no error occurs
> > - Add hardening mailing lists
> > - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> 
> Thanks for your patch, this was addressed with
> 
> https://patchwork.freedesktop.org/patch/631567/ but since this is better 
> I am fine with this, will pick this one up

The `return 0;` in this patch should certainly fix this issue entirely and we
don't need to inline the `int ret` for that, which I think is against mixed
declaration rules anyway?

As far as I understand that's what Dmitry suggested in v1, but he r-b'd it in
this form.  Dmitry, was that intended?

- Marijn

> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >   			       unsigned int num_planes)
> >   {
> >   	unsigned int i;
> > -	int ret;
> >   
> >   	for (i = 0; i < num_planes; i++) {
> >   		struct drm_plane_state *plane_state = states[i];
> > @@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >   		    !plane_state->visible)
> >   			continue;
> >   
> > -		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > +		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> >   							 state, plane_state);
> >   		if (ret)
> > -			break;
> > +			return ret;
> >   	}
> >   
> > -	return ret;
> > +	return 0;
> >   }
> >   
> >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > 
> > ---
> > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > change-id: 20250209-dpu-c3fac78fc617
> > 
> > Best regards,
> 

