Return-Path: <linux-arm-msm+bounces-47347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A241A2E2EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C42164906
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0783F9C5;
	Mon, 10 Feb 2025 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="hFTG77JR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48170C2C8;
	Mon, 10 Feb 2025 03:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159494; cv=none; b=pJso35mUXsM5LOnFQku4tZOFOGtuFm64raQPyuAe4ojPDygbFrtHquhV1Z8ye1t5oWx4qh5nw/xUYyKrJKR0I9rC3BiLPkE4rbBzXBz5d/1keKHAWKSHjH1oMR21N61O/kbhVICLJFxxFizRFxJyLR+cXRrA51coQRaBR8zeips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159494; c=relaxed/simple;
	bh=/PFtgm6HF2RDDoDcQABIGvWvhYsO61xo4pVLmqIwCpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5QExVLnvFMausH9LSr9ag+WpHAjQ3KyMNLn5SAb/eOhdTG/m+4O8zOEioN5Um3XwyPjyR9q5E6BL+LAMCLghxZYKMo2MCJaEDj0nq5POR+fdDQTGQlPAmw8v/lojGnvnCeVIJgHp5dldbVK8Ur62SSdv98HOlA8PKTmqZFSrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=hFTG77JR; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Yrr4C4hG0z9sc4;
	Mon, 10 Feb 2025 04:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739158939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V9z64xaAcptd3m22dbWB7eghov4SGAeR/tFjHud6L30=;
	b=hFTG77JRQ2XMSvS6Ohuu2Mq/JN0NYyUaJMbDj7PvF8vkosVh/hZ9cnqZD9SssHW9JtchFM
	MsxRXIK4WKWCUX9Ycx9Fg31jb06SLk41R6w0Aqxvk2dHV1WT4Z3LBCNWK6e+5p4s9CC3eP
	GZEsebw7rKPjAXTItGCUqHK50zfwhwOVgW2+Ljd7/ZFZ/lgdo/azqCZ31vm0af3OjgTH9T
	QBYMno8tTkt/nIYZ6bPcnU8GRDFi1l3PsikTHGQnU2h6Jxvv2sGVu38hraiaW47ekS2kBO
	9IsLVGY7tXaBD9k8J5+In5hGacRprkCgIiIp/74IX5tPjbZn06nzVwqh5HNfUA==
Date: Sun, 9 Feb 2025 22:42:16 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix uninitialized variable
Message-ID: <ycd7uds73swh2ql42455ifv6fmdpa5sklmldgdfk5y2b5is6jk@etmnysxnenn7>
References: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
 <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>

On 25/02/10 05:41AM, Dmitry Baryshkov wrote:
> On Sun, Feb 09, 2025 at 10:32:33PM -0500, Ethan Carter Edwards wrote:
> > There is a possibility for an uninitialized *ret* variable to be
> > returned in some code paths.
> > 
> > Fix this by initializing *ret* to 0.
> > 
> > Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> > Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >  			       unsigned int num_planes)
> >  {
> >  	unsigned int i;
> > -	int ret;
> > +	int ret = 0;
> 
> Thanks, but I think it better to make the function return ret from
> within the loop and return explicit 0 if there was no error.
Will do, v2 incoming...


> 
> >  
> >  	for (i = 0; i < num_planes; i++) {
> >  		struct drm_plane_state *plane_state = states[i];
> > 
> > ---
> > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > change-id: 20250209-dpu-c3fac78fc617
> > 
> > Best regards,
> > -- 
> > Ethan Carter Edwards <ethan@ethancedwards.com>
> > 
> 
> -- 
> With best wishes
> Dmitry

