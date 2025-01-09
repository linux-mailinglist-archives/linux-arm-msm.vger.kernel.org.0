Return-Path: <linux-arm-msm+bounces-44555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57503A07578
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EF393A0FA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80922165FB;
	Thu,  9 Jan 2025 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOL4kP0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC020551B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424956; cv=none; b=miwlytsg9J8Cjrb362Pm4umG9HAlUNwtK6MPyV18ZE76eZPlCiHUcU9505qqXsgwshQ6lmkxU3NYPshNt4LeIEAIC3+PuiIb8aJ4Mr/fYJOFFe1afHH1RgceghTSSeqj553H22r8KdRUB9ccGHgyjZjKDIKS/4YjBicvZtrlVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424956; c=relaxed/simple;
	bh=PZaCPZE4IjHiYzm1V9BkbhSbXHgxWosYufRiW/gqbK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJgFIfAH/QvMrbt6sF8/i3M7ZiKhImg+SS27qlbuEqe6H3JIrO6ks8To5ACQEPmdibvLlllzvQ0HvKJ8jRa+5y/VtG7akSRWoFEs2/HkxD8qFnoF1L+CVDUihPE0ryXzI8CRUpPWGS3RnDr2wKEgYsMj+GxoHHEp18JGSsn43AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOL4kP0O; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so843994e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736424953; x=1737029753; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51fiBQGJpPcUuo5vlJJmT51EBH56olvKE7bUWMTUTdc=;
        b=wOL4kP0OJITkN5wZpM+QhjduqJmt3oYFTjkzIFi6gObP4qCEKGlQdcycMLqcXjyd59
         MBc8mKzF+dsawBwgl0nDEqnPBplxpfqJPeb6lWXCCxY7ObtS9kKRvuI9L6uISa/4ZSpm
         ocbWXJk2ety5BuGApGzUybEX2V7b3ye3bxsmAJekNUrQdBLaQvxL3kXems0liCO/+e64
         kti94QHobQwZGRvrfVnMf0JripnhLG0CfVo1j/StrbXVZj5zHFQxkvK28Rh+bpWmv3nG
         F7COuD1POVYTMWIHCJaH115uZvlVU7kyOcbp8kFHCXJYG7xwyUnQnMbXsptxlg4XH0NB
         KkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424953; x=1737029753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51fiBQGJpPcUuo5vlJJmT51EBH56olvKE7bUWMTUTdc=;
        b=QEUvMh9CUD9nYUE9JaneK4kvRnQs6FceCPrj9s1Yq91BRQ2uV1SQXXbGn3TY2XYvwF
         NJ/bLAq+fJ8BPcuNjAnqpmWIYc13W1I45+L2pWNuJor4wFd2eiLwXkHYNghQhICiNq1R
         ubCIIg+LT3FJZkL+KNg36qF1T+JkZwS+2cxyQnuZVDstEX9AS+8tsBzwylk+AlVa/dkv
         HMKvkvdiJrQJhrB4MGGtgOpYFecC4NsrtgT+4bjzJHNHEmMwCF1dIe9R2e2ER16ZwZKI
         Rp9Yldjuv+j2M5z3OUeI7Z2vBmOxQzVlDBaJ9Y0JRbLcqQy0hJScWKmSoZCcuZ8qmIoU
         g5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUjp6OH0UbnoLw+K4w9kCqaM1HK/HPVpRq843E1o/dG6yk5R2SDu+HgiFj8qhwhGDfJCEvpxitRspUkv8/n@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3MnS90z4Vb1NUWb7UqDg57EU+BcFCGQD3DespH5ja4HKmCJ5
	Jde54Jgi+Ag6irV9P80dQekxwe9vvWQrc0C9aWGb6dxpjpF4PSV5Ls1faS8v05E=
X-Gm-Gg: ASbGnctMcA9PTyjvJakBGaE+o3iw/OHA8qEuo5IjUveG8eTlA+lIWkeYisFx3x4fqqZ
	l/P+cXeHM0gh3ac9byCrhNII3N6Qe4afQ4lWhYy7qUJcdxusuTWT5rnH80ASgTNFXMK//v8gtl8
	bmyVWBE0jhqEyRui1a/9L0zTqD1qYE1gRVKvMF16uNPYVlFIlRMnsIfRcRlirFeU2I0kaSMICHu
	qtObHryY9eitu7C6VujbdFs6TjaWm9hCZu4n1O+XHUkC3zhdg8aGKo42+/GrndjIdnUAMI+o73G
	WSiVsnH6wypPJMb3Tm7RRihDilXD9eTpz8SQ
X-Google-Smtp-Source: AGHT+IH5j6fZ8mHbuQ1cCJLcbUHN8wITNN/T+GeApB/Zpmg3LUDNE3p8F7Pix0g3oCHAp6x7GNOU5w==
X-Received: by 2002:a05:6512:2351:b0:542:2192:3eb6 with SMTP id 2adb3069b0e04-542845c08a7mr1977249e87.52.1736424953245;
        Thu, 09 Jan 2025 04:15:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be4996fsm182328e87.56.2025.01.09.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:15:52 -0800 (PST)
Date: Thu, 9 Jan 2025 14:15:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <k2tf3tnaquagm7stxho7lrqj5oylbti4jisenm6t53hj5kvyhs@degtp25bmkj5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
 <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
 <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>

On Thu, Jan 09, 2025 at 12:40:23PM +0800, Jun Nie wrote:
> Jessica Zhang <quic_jesszhan@quicinc.com> 于2025年1月9日周四 09:29写道：
> >
> >
> >
> > On 12/18/2024 11:49 PM, Jun Nie wrote:
> > > Add the case to reserve multiple pairs mixers for high resolution.
> > > Current code only supports one pair of mixer usage case. To support
> > > quad-pipe usage case, two pairs of mixers are needed.
> > >
> > > Current code resets number of mixer on failure of pair's peer test and
> > > retry on another pair. If two pairs are needed, the failure on the test
> > > of 2nd pair results clearing to the 1st pair. This patch only clear the
> > > bit for the 2nd pair allocation before retry on another pair.
> >
> > Hi Jun,
> >
> > I think the commit message wording is a bit unclear. Maybe something
> > like "Reset the current lm_count to an even number instead of completely
> > clearing it. This prevents all pairs from being cleared in cases where
> > multiple LM pairs are needed"
> 
> Thanks for the suggestion! Will adopt it.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index cde3c5616f9bc..a8b01b78c02c7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > >               if (!rm->mixer_blks[i])
> > >                       continue;
> > >
> > > -             lm_count = 0;
> > > +             /*
> > > +              * Clear the last bit to drop the previous primary mixer if
> > > +              * fail to find its peer.
> >
> > Same here can we reword it to something like "Reset lm_count to an even
> > index. This will drop the previous primary mixer if ..."
> 
> Will do.
> 
> >
> > > +              */
> > > +             lm_count &= 0xfe;
> >
> > Nit: Can we directly clear the first bit instead of doing an 8-bit bitmask?
> 
> Could you elaborate on it? Or you are suggesting to mask 0xFFFFFFFE?

I assume it is &= ~1

> 
> - Jun
> 
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > >               lm_idx[lm_count] = i;
> > >
> > >               if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> > >
> > > --
> > > 2.34.1
> > >
> >

-- 
With best wishes
Dmitry

