Return-Path: <linux-arm-msm+bounces-60066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73064ACB4FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 16:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 422033BC1D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 14:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8F3225416;
	Mon,  2 Jun 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hTyfh35n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DEB1FF61E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875422; cv=none; b=aLNpSKzW5y7YUtK0LK3UdN9s+XBJwmkmb6uBP6YvB7uzuybvPdkleumVx3b5svsCljbne0GRrN0sL2LIGMnJLZufA52TFTAB1v1DdWV2J2+WAf45P1joPVqAVT5yz+H0XYP8LA0My9PUx13pTxHfMXs7eFL2lq6CbkLf0E+9fwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875422; c=relaxed/simple;
	bh=9uPgMtAnZipSnUOnQ6ViA1kNw5mhDfNib0To8+rO9Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6jmIuj5dYdLPK3m3DDDyfHeICBK4QjXTBiDviIQvxC0RhwGLXwqeQvrdOq7Puk+ZjKoDz4DMjoztENLimmBFsgiXTGKsTtaszGxTIoXlQJ7BfmJguv3OTh+n2kc1O1HEx147XSfitu7I3YGxcYLwNBVB0OKoDIN2LdwHglxdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hTyfh35n; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso37011905e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1748875419; x=1749480219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmRnOjxFQaT42NxVRt03FTSH3KzxlAbjYGkqubhhB6U=;
        b=hTyfh35nmW1ImZF9ZtFB5tU7ZV6xzh49ivx2L+NoO3W2AvrktlF/kAoCsQp3lbzCM1
         ztdSArAdnlUJ4YsqurTULE4v1Hcrpt0iTHCWXnqG8lRIYOPVrESY70zmsETCVrM4cl7K
         mLu04UAp6qY/dSrCVaB6micESckfBAyXv8J00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875419; x=1749480219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmRnOjxFQaT42NxVRt03FTSH3KzxlAbjYGkqubhhB6U=;
        b=JD0zwmpXcCOJGcpZHorXdxbuWDG72YTI+w8dHHiSD9XtdgUJC5hmQj/TCh9fKQyTCb
         JqoPq10bGJObI9vq9znhWkSGa0aGULU2vVqJamvkrx2waKwD/A0OQtvxDBrWFtY3xE4n
         wa60r6dYSV/XEyngFejiYHBJpxAdBRDmmpmar4Qz7N7gWFZDQOPdqB1LRYZdZHdPYPKQ
         RfxcFaSPT70IH+bbaNmNzcsMB5ApmIxBWgt6OVqf2ru5+jjWk8FPIk0wbF22z3WvHaHy
         ZsJF1rsmFMqcT1k9SpHbFp1v82UQQt8ox1+ZA8sdVpiu6VZPazuONDZ3tl+RJP092tZe
         dvDA==
X-Forwarded-Encrypted: i=1; AJvYcCWC51HTGKvMR3SGmxkEedCLIlYo5l1/xSpOfhKIvB15SA7Z+1r3kdkrhWCKnqStM1AVtcZqDeWOllVHyFnr@vger.kernel.org
X-Gm-Message-State: AOJu0YxVevrs+O+47z+mUjAhdCFHPHKkWrMyjfZbdq45kx1X5wEdjuaX
	yS9pwA4q5SlrI26CuFbSmi2GkhawRaLb9zqtHEaJdJJ0W7qHuydKCoDUl13DtYVYSRM=
X-Gm-Gg: ASbGncvSPXdy0BfmX/bN0DrwrefvjbM4dum10DwN/lG1ShsQiN8VYIIsA53CXhyixlb
	ArCKlPZTp3ewpdmvxg12eucEHFsZucX38I90vbVSBisPOFQXhTFRWVF2j5LUKE5TcDmreAM840A
	4c35ol7+Msb+FpN72x6a1k32iC/MGzfvf9c3w3waLeBwSNfqZogEbX+z68u+RW+VkUNMF0S7Gjx
	qmoI9ObenA8v+rM4OGy6qgCO5K0q6jkN2DNUnIE14Y0irEfHfvdvqerNqDEJHJ2ctWNALgPvurl
	kSSSw3ZV5WVsGpzHgOf884k3bjL9wp3OTLdInuuiZxjppJpE0LpWTLATBT/Vyfw=
X-Google-Smtp-Source: AGHT+IFo+Z0NR0XEqF7bGgCU/zFo04aIkuwKr4I5i9fvBh1/D97TYslci1leA382fPNo1VYX/jntFg==
X-Received: by 2002:a05:600c:8b34:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4511ecc2a30mr78544895e9.13.1748875418792;
        Mon, 02 Jun 2025 07:43:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm15380816f8f.65.2025.06.02.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:43:38 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:43:35 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	intel-xe@lists.freedesktop.org,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
Message-ID: <aD24l3NoZWWwScx6@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
 <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
X-Operating-System: Linux phenom 6.12.25-amd64 

On Wed, May 28, 2025 at 09:15:22AM -0600, Jeff Hugo wrote:
> On 5/28/2025 3:13 AM, Simona Vetter wrote:
> > Handles are per-file, not global, so this makes no sense. Plus it's
> > set only after calling drm_gem_handle_create(), and drivers are not
> > allowed to further intialize a bo after that function has published it
> > already.
> 
> intialize -> initialize
> 
> > It is also entirely unused, which helps enormously with removing it
> > :-)
> 
> There is a downstream reference to it which hasn't quite made it upstream
> yet, but tweaking that should be fine. This is clearly a problem anyways, so
> we'll need to find a solution regardless. Thank you very much for the audit.
> 
> > Since we're still holding a reference to the bo nothing bad can
> > happen, hence not cc: stable material.
> > 
> > Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> > Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> 
> SOB chain seems weird to me. I got this email from @ffwll.ch, which would be
> the author. Where is @intel.com contributing to the handoff of the patch?

I work for intel, so I just whack both of my emails on there for sob
purposes. The intel email tends to be a blackhole for public mail, which
is why I don't use it as From: for anything public.

> Overall, looks good to me. Seems like either I can ack this, and you can
> merge, or I can just take it forward. I have no preference.  Do you?

Whatever you like most, I'll resend the series with the wrong patches
dropped soon anyway.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

