Return-Path: <linux-arm-msm+bounces-48282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8BA38CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E864E3A80F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE46232378;
	Mon, 17 Feb 2025 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R1VlwnEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7A187858
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821920; cv=none; b=ftb6Z5D4elPJjRLI7ffyVEfK+yW0Q21xX00zJZinbfc8SF1gRIriGZrUoW7J7SfYNgy9J30yh4TUIYyiNwFhGPhW5FBh6sC5WjJju4DS+1lpUeT0cVR+G5SqGas1lH9YgVmzl6zsn8GlUTt0QRHJub7KS3cwHf+lPWVNvMD8qCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821920; c=relaxed/simple;
	bh=Z1UnWnZLxSNI4+SbOFhsVv3Rm88k1kFKTLG4c6e3yk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWjALyJjoSF1Pk0S5HMkl+qZEi96SFXnkvRONj54jtNymdrBzk06dYcScD+MgJzivYFaPm/pOW6RTybLymW7KBRpmm/BEbjHli6rTGp9nkzjcy8t4geecpoDot9SBY8s7h9NNRzqFP+Rz52DVQy+HpVz61E3vqWYFnlqIeEn5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R1VlwnEC; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30918c29da2so37470011fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739821916; x=1740426716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=du441ZCOQupNPXiNMHUbWNZp53UAbJ7rrRkJ3qKot/U=;
        b=R1VlwnECBrhCRuXmeyHvFwN46B0J/+4gGVtdIXkWKvCZX8cPK9T5OmPEtOouLOC0oh
         80K41066YSt/0HPIAvvHDQgOFERDmiIqhkEgkCVCPv7Z3s33OOJLf7SrZ7um0L1kVlRY
         kPMvrLc8BuwaCFeEZowfi8Qn3KYnhS7ymfMmG4+Bk310Rs2M+ZNACjABz/6IL3DrGE/+
         Rcg4umSrjYQjPaYw0LxAv5shPxlDusCYIwNQ2R4m+ekLfHRNXJO+ITAOdvgy7AUr7n/Q
         i6gEw0vnGuP4lN9xPXbNchwktMPjFdAxcGNTsPWpvdz327ORCF6gBu8k1cGQYk55Fg8P
         mURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821916; x=1740426716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du441ZCOQupNPXiNMHUbWNZp53UAbJ7rrRkJ3qKot/U=;
        b=IfTqcnadTKzTV+sR1wfAsenTrYWDHhCHqS/Udev1CDN4v3I6mPSPCnh7XKaWuk97JE
         BlbogxiSXJM1OR9prP0bCKBI73jKMBFnF1lqOoas7nt7RQPw9aJn4SRZHOAmAHfpNoJv
         +div7W/d8Nwo8xVlQ/vE0PhNslYTHDdGlNrL2bHl3FaBcIv0eODm1NX/+/BT2j14rghe
         6yx9FjlDh+VulRFkU1AXQnkDGNk4MAcOoRuZM516EA6fd2mKpyag6vd/pjQDOs5Q7Ni2
         hYe3/Mt2pHPxV1+QDbD/qNNRYfF3lra7zAT0AZwhfLrfXkW0sp9g3GmrfIswAVyGpQyt
         In7w==
X-Forwarded-Encrypted: i=1; AJvYcCV5O7QKZ41fWY2zwnkhrMZbb4EJ/rSmefhWtzqwhUB995CddBW8Ce4Kxxpke1EkEZFWlYfmjjH5+HhzM3TT@vger.kernel.org
X-Gm-Message-State: AOJu0YzNGfa/QPAKQ4dioqoMye5laxgX3v2Z2hAehpO6+PO7dDx+ttSO
	jjaEzLO3aTDJWYcnL5dNWpcR2+vkwM5STjnz2nUwwvS6PGuj/vM2Q5FFsg6TADU=
X-Gm-Gg: ASbGnctndrtPhlJq2q4I/Vi2vayJxCszHsXvHVswvuXwpOQ2pIQ7xL4iVT342Y49Bb6
	mvFyK7V/pYf5eOFS+k59k/0wsnGAcN36p1LZMxhzApvRd1ECrMvhi4MlmyBL71t7WGbZgv6/HjN
	v2y/LXH+XJUt1MzQOhpuOq8ylithH10wo7s4SKBB6wbHUeF0NeIWatZ8FRCTIYVkbyNa3qUqrKM
	xZa7qhOHzMi3dWWY6gIlZpRxP91rXMPODdntHljHg0MboW4XNpN3eBXIO0YmEuGPK70zSJvGabw
	XPd6eZu9XEZH43lhnva0mf4MDA8yJPvOz0KMVRSaPmCG9FDJK0Axcs11GdXOzthli0cQH0Q=
X-Google-Smtp-Source: AGHT+IH1cgaF5tU76THnhAXO4GxVx1EqnJgKWJ8zkZhai7T85xKUgyK77lVetaexQtb3yZ7M3uAvow==
X-Received: by 2002:a2e:8657:0:b0:2ff:df01:2b43 with SMTP id 38308e7fff4ca-30927a6f5bfmr35430101fa.18.1739821916381;
        Mon, 17 Feb 2025 11:51:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a3a6d3dcesm1478471fa.67.2025.02.17.11.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:51:55 -0800 (PST)
Date: Mon, 17 Feb 2025 21:51:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <2gpvg22nvrmcm5ln3ft4oovt3xy5uedvw5oehb3odf74mvvhkn@hz7wwy7jf6cn>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>

On Mon, Feb 17, 2025 at 10:15:55PM +0800, Jun Nie wrote:
> Current code only supports usage cases with one pair of mixers at
> most. To support quad-pipe usage case, two pairs of mixers need to
> be reserved. The lm_count for all pairs is cleared if a peer
> allocation fails in current implementation. Reset the current lm_count
> to an even number instead of completely clearing it. This prevents all
> pairs from being cleared in cases where multiple LM pairs are needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

