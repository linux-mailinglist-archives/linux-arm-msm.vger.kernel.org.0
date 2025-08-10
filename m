Return-Path: <linux-arm-msm+bounces-68212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E725B1F751
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 02:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79CB81899F7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 00:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD80C4690;
	Sun, 10 Aug 2025 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZpGq0y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D1DA31;
	Sun, 10 Aug 2025 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754785212; cv=none; b=niSEMvYsF0STK6N4qjYKsvH4NVzSwwA5torJ9lvvUXIN9UnL6b55bJbOGg+xPc4Pk4jOdzij/X+/SqhT9t6itT133LMV8yULluub4BJkSq9yqCEJPohcKlOECj9MB+2DNJKdtSUgMtsoPU3gAz3YmyrKt1dLFxXEby2lJpmBH4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754785212; c=relaxed/simple;
	bh=1r9QBkdlJxHLOIMngxodPB3HqG2uh9NJvWAg7gEuBVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/GU8VmV4btOmwzn1xvipkLfsoja1t+ewmyrCpylxozJznZKtyxPyjW6PnmkQ9q1JBPtlwUanxm+jL4/JcXPEWtRZw1agM2KclwwiwUD+OTvSUX266+I/L4ezN7S8l3geNMcwUogAVN+Eicz+zbcw2r7eUxzxSQQXz86gr1bjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZpGq0y8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBBDC4CEE7;
	Sun, 10 Aug 2025 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754785212;
	bh=1r9QBkdlJxHLOIMngxodPB3HqG2uh9NJvWAg7gEuBVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZpGq0y8ckTGymbVQJrypFp6QlCdGRhQX+Jdu4iJkvcEyYCwbDnFSRJCHxM+41KJ0
	 QesYpHwLYSiYyG4DrB/5GA4bkwxfNbh7zocPAcEh5J+O/WEJTHwm8WWgIznk+an7c/
	 RLToUFxFs6wfnQ7SEzhREIe9D1GmjURRzPaRWNC3xLjUiEVwvpnWZqvigSauGa9Ajs
	 BVflgL1+dZb3yUGp2e2QO6dEUs/xasrZR3cYEfcSrdQJ6OXTHvwGRVgzE8aaQlaUdb
	 XqobIv5DBknASyappeUDKDSbh4hzHzSugMUriu7Gw6LT/NTROauD3GS0QcYSnHjXDd
	 JxKcxG1JJUpTw==
Date: Sat, 9 Aug 2025 17:20:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <20250810002004.GA1726533@ax162>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
 <20250807143444.GA1009053@ax162>
 <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>

On Sat, Aug 09, 2025 at 11:20:34AM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 07, 2025 at 07:34:44AM -0700, Nathan Chancellor wrote:
> > On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> > > Having no plane->crtc is a valid setting and it is handled inside
> > > drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> > > false and returning early. Setting crtc_state to NULL is a correct fix.
> > > Could you please send it?
> > 
> > I sent this fix three weeks ago, could this be applied?
> 
> It will be picked up for -rc2 (hopefully)

Great, thank you! Even if it slips to -rc3, no worries, as long it is in
the pipeline to get there.

Cheers,
Nathan

