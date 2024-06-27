Return-Path: <linux-arm-msm+bounces-24409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DD91A0F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 09:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30FD51C20C1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 07:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB606F068;
	Thu, 27 Jun 2024 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="KGwGJ78C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE50288BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474966; cv=none; b=lGkMADx3wSgoAvuEOglxLHKt3/x4j/tyir7/eh/0V76eQNc1vkvIfPaGeZ50kEGNrTH0Bl9rWNS56ejVXEvXgN7h1sifZl3qEUp6aHn+8susuUd17fBvZuTjmWSktxcMYfgXI0xx9SGB+WfKCAXOR8rgHk0aDwkGgEuybEZdFrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474966; c=relaxed/simple;
	bh=mxaHLuDbWoxsjLTUcF/2qW2G/2wXCFMW2eh4Egw0AgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgn8ywoGFZirzXNUEqSJUVF9bRYuIjamhdJCSi/hn+3AzMmVCC5AvcNBhHrmdmb85rgdEvqFpm3rqjQ2tQqCd+sNIrvlyAkNxikplcl2fqLmNFNZdFQUuxIsEJri64HlcpsWjN9Nmddr/M/rKxFM1lP2cKL8OCn/6aNnKzFEuv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=KGwGJ78C; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3674e209ad9so15636f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719474963; x=1720079763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbRRYSMsE3x7jzz+DuxS0/G+PVyj8TpMxMrZCFeJdO8=;
        b=KGwGJ78Ca5722GTIpl6s2Ei/ig57uZOG/lzsmyTjNDIbX/o2fr4nF99yvBNPbDerF3
         iCWWgoKg7FGwOe212dmE6V3EFTTZGO3nVzl/ru47orFUSfa40jOBYPh+LhQgSCAYK+oB
         Lawqdb8JtEsoFZ8NBT77FEZcDqJSI7CR6K4yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474963; x=1720079763;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbRRYSMsE3x7jzz+DuxS0/G+PVyj8TpMxMrZCFeJdO8=;
        b=jva0/3bgnU/ukWR6h8PqgpZKnZ4WqqVGLxZhQHGooPMxixYQg057VseDDZZwl+TqyM
         QabUIWZMMnXMluw9QLR24IhwKau62W+/h7oIxnG7DSCuXyF3FokVKHE6YGntSnkKqCgQ
         lnZEU6gwWEj3DztoVLakqk6hoE5LmArPw+x5a/+o+InErTa/GEIlJ7TLNQy0/W07OUQx
         YH58x0oZbzAZh+pdeTqy/owj4yyFw6Sz1AVGfcEy9BYwgV5/aHfGW/Qms4hkVoh3KXxo
         yvlOC8mYoezzcA3NTQ6lEQNu3u325Szj3ZglSaYFLxm1UxREf0tx5LhSWceDzVHtaTsu
         ebMg==
X-Forwarded-Encrypted: i=1; AJvYcCUjcydNQIuLrbfMFwBdgq6cnlOYB3GaUReMmP6OxrGYwx+J3zCh9Su9tOZKumM0Pbuo9WUqisOjdhYh//vXV7aryLF2w/BNixtetzEaZg==
X-Gm-Message-State: AOJu0YyBaKfu1qqfqBUzm5ARPYLiiAyIFbItLRTSL6GkUTLvJQpyflEu
	5YA00wcR7AE4ApKi6NW4mc3FiY7tXueWPm5Vf2poMeQWyYZtkosSCNtGlH4ffdY=
X-Google-Smtp-Source: AGHT+IGQvxwnr72q9jrzc9pPl4mSFg75qw0sFbnT2gJfss9vVHp2SS5JoT/Ulnrj/rNfl6IeiI3z+w==
X-Received: by 2002:a05:600c:5107:b0:424:7876:b6ca with SMTP id 5b1f17b1804b1-42487ea6784mr111875865e9.1.1719474963385;
        Thu, 27 Jun 2024 00:56:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82519b0sm53017765e9.14.2024.06.27.00.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:56:02 -0700 (PDT)
Date: Thu, 27 Jun 2024 09:56:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
Message-ID: <Zn0bEMMam4_VPFoc@phenom.ffwll.local>
Mail-Followup-To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
 <ZnvKa29EceUyZ62U@phenom.ffwll.local>
 <20240626212457.6io63avdbncuq6hb@hu-akhilpo-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626212457.6io63avdbncuq6hb@hu-akhilpo-hyd.qualcomm.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Thu, Jun 27, 2024 at 02:54:57AM +0530, Akhil P Oommen wrote:
> On Wed, Jun 26, 2024 at 09:59:39AM +0200, Daniel Vetter wrote:
> > On Tue, Jun 25, 2024 at 08:54:41PM +0200, Konrad Dybcio wrote:
> > > Memory barriers help ensure instruction ordering, NOT time and order
> > > of actual write arrival at other observers (e.g. memory-mapped IP).
> > > On architectures employing weak memory ordering, the latter can be a
> > > giant pain point, and it has been as part of this driver.
> > > 
> > > Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> > > readl/writel, which include r/w (respectively) barriers.
> > > 
> > > Replace the barriers with a readback (or drop altogether where possible)
> > > that ensures the previous writes have exited the write buffer (as the CPU
> > > must flush the write to the register it's trying to read back).
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> > Some in pci these readbacks are actually part of the spec and called
> > posting reads. I'd very much recommend drivers create a small wrapper
> > function for these cases with a void return value, because it makes the
> > code so much more legible and easier to understand.
> 
> For Adreno which is configured via mmio, we don't need to do this often. GBIF_HALT
> is a scenario where we need to be extra careful as it can potentially cause some
> internal lockup. Another scenario I can think of is GPU soft reset where need to
> keep a delay on cpu side after triggering. We should closely scrutinize any
> other instance that comes up. So I feel a good justification as a comment here
> would be enough, to remind the reader. Think of it as a way to discourage the
> use by making it hard.
> 
> This is a bit subjective, I am fine if you have a strong opinion on this.

Eh it's up to you, but "we don't do this often" is a reason to make them
stand out even more. Similar reasons why cpu memory barriers must all have
a comment, to explain what they're synchronizing against.

Up to you if you just want a comment rule or make them stand out even more
with an explicit name (and still have the comment rule) that's different
from normal reads. Again comparing to cpu barriers, the nice thing is that
they're (in most cases at least, unless you do really scary stuff) very
easy to spot in the code and the ring alarm bells when doing reviews.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

