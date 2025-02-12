Return-Path: <linux-arm-msm+bounces-47666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3921A31A40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 960FB166261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78919A50;
	Wed, 12 Feb 2025 00:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tS4P5P3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87592442F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319246; cv=none; b=QNd224P+qih39ZkO7CWncAEMBFRlkoIJfyNPpqk75gcm3/Mv3DTlwf6GfszssuLsTfboladhHOef7OAsEWG1fRjhlHVvXMjXOmBB6YKiuqtKBUe4rVSBs+VugMENxkrEdryOD64cXtUTeywqeOeM/rDXpThsqti5np4UGkPb9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319246; c=relaxed/simple;
	bh=h2Pmuf7NB5Asy0O/Q6i3f+ho5B9g1fnPw+zYjgxb/uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7SIfk/SyBU3dUfiB33AtRx5EPaF0uWuH8oqY8eYSBEy8v2jPhEVq+kSE3VSYUoHzkVuuHZIch5nq0jCBcjLfr16fcAPjQQERND/6pyGsVLr+4oSUy5O4BcngPGkVX4lIiDs79T0sc0uQvuWVEMXChr/ByiH2v5Lp9miSNSjKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tS4P5P3r; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54509f46614so3304707e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739319242; x=1739924042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MoiH9kTaTXxwiGqw7nJMhKvn68BG/QNvASYw2+68Zak=;
        b=tS4P5P3rQnSm/Xhdpym4TQp09/07MTM+CJ1TnDdxK3nPCdwkz/cJfrjeMguMc2B41I
         k40ttzkdqax8XVRqRH6/dZ3ePMyXAdZ50QILT3NhYjVkI/HFxvNrCLkk4UoYTQ9UQTsD
         UmpKTHJvlpP7whQS+uOm7wp9E700Txe+evIRd+oHbMvnDZXO5PS5xJH2j5a0YBKI0F1V
         VKhVFxKZbFhXa8PLl54v8RnMDdR7Kr60+vFP5DkOGmmh41ET4z4IdbMSZjArLeTtCGOj
         550U8cmFvL7emalLruUOv5LT8/8VqlC63o2PywjnczVIhRvYRXIb/l/S+P3n6Bf/6zWt
         TbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739319242; x=1739924042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoiH9kTaTXxwiGqw7nJMhKvn68BG/QNvASYw2+68Zak=;
        b=bt2kT4vCIafM71DApJCQxQ4tdpypOO8thfojNh7kvG+GEpmo26Dl15eYLSV+iWesuK
         YjTSLstbKzavCZoLIZiYcaPuXzos3nlUBXuCPvmCMB9p46AVZP1gkoo3uFHbjS+IV9zN
         B6o5+FPVRTQB4iWefxR9n1cbMTPmqGLBgGkly5IwfoqIPJcYau8ih9LMHPjXaeLZQp8s
         zbrHqMTJfepA3E8rJii0PCjdn3aAjcc8ysQ0K9fgFscu4Ntk0ezEEIRYb0omjizqy+zZ
         hvea+n9oDFAMfZF6n2j3X3Dt+HefryUTPmRPJ9JVnwtO8eKXiSY1eZ0vF1ZqzHxlczR7
         dEfA==
X-Forwarded-Encrypted: i=1; AJvYcCXtHfe7EGWhrMEl3dZkE2CbWpMu/NnIOfWPM2jGdMpk6DKm13lRkMz7zSsKlnHElybFUOPgZc3K6qMJvhEN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxon8EHUlSZ+moAp3IunOOtKBAf1OFsdBE7OF/khramDOzLbmZi
	tcgWycpCEhPBZEPuiZgGGjd+ZqMdhRV5ackOMDxce/NKJZv8eZtRACoMCykEo5U=
X-Gm-Gg: ASbGncv9vbzesEioy9nxw+EDLphovRO6B1M+pfD33SVtuVxziyp40AAODAFmDxnYpwW
	oW0+8xLDmqbDZG6TLlfHV71wFgewI9I0hCNM3c+xV27kDTGTFsF0Pc2xz8bfsGcuQtIBVVmQEvP
	nJHHNEr6DvUOttXWPRM8U+kb9QC9w8iQ304eT2sa/oSrdb535U3+iIRamB1AGR8gYITWQaZhMEm
	ly5PtMjR1PksEkRNNoROJT6rzh8JK6xIiqrftl3EneKf/aJACm9NkO5F/1sbdHcHC4B5kIPUZFS
	lx3eyMMhTlfourm0/vsYCRDVg6MLDN8JYolSJbo4oQ/+KRwZzWvOSEy9p9XY4Rmy2Co4AeU=
X-Google-Smtp-Source: AGHT+IH4K/97rcyNCdtxvfzfnC07ftBx9dEMBnJK66j+zVmsXTMBTzg8TyBPDt/3qMe65yIbgIUqGQ==
X-Received: by 2002:a05:6512:3e07:b0:545:76e:319 with SMTP id 2adb3069b0e04-545180e5dc7mr263463e87.4.1739319242534;
        Tue, 11 Feb 2025 16:14:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450cf9b64bsm742565e87.9.2025.02.11.16.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:14:01 -0800 (PST)
Date: Wed, 12 Feb 2025 02:13:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Ethan Carter Edwards <ethan@ethancedwards.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <nllxmdfk4wwm2bbrg5jc4tt7la65rwqdtt4tqjp36j6dr4hgmx@ukszi5llldup>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
 <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
 <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>

On Tue, Feb 11, 2025 at 10:23:54AM +0100, Marijn Suijten wrote:
> On 2025-02-10 14:14:14, Abhinav Kumar wrote:
> > 
> > 
> > On 2/9/2025 7:51 PM, Ethan Carter Edwards wrote:
> > > There is a possibility for an uninitialized *ret* variable to be
> > > returned in some code paths.
> > > 
> > > Fix this by initializing *ret* to 0.
> > > 
> > > Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> > > Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> > > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > > ---
> > > Changes in v2:
> > > - Return explicit 0 when no error occurs
> > > - Add hardening mailing lists
> > > - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
> > >   1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > 
> > Thanks for your patch, this was addressed with
> > 
> > https://patchwork.freedesktop.org/patch/631567/ but since this is better 
> > I am fine with this, will pick this one up
> 
> The `return 0;` in this patch should certainly fix this issue entirely and we
> don't need to inline the `int ret` for that, which I think is against mixed
> declaration rules anyway?
> 
> As far as I understand that's what Dmitry suggested in v1, but he r-b'd it in
> this form.  Dmitry, was that intended?

I think it should be fine, if the gcc doesn't warn against it.

> 
> - Marijn
> 
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > >   			       unsigned int num_planes)
> > >   {
> > >   	unsigned int i;
> > > -	int ret;
> > >   
> > >   	for (i = 0; i < num_planes; i++) {
> > >   		struct drm_plane_state *plane_state = states[i];
> > > @@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > >   		    !plane_state->visible)
> > >   			continue;
> > >   
> > > -		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > > +		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > >   							 state, plane_state);
> > >   		if (ret)
> > > -			break;
> > > +			return ret;
> > >   	}
> > >   
> > > -	return ret;
> > > +	return 0;
> > >   }
> > >   
> > >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > > 
> > > ---
> > > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > > change-id: 20250209-dpu-c3fac78fc617
> > > 
> > > Best regards,
> > 

-- 
With best wishes
Dmitry

