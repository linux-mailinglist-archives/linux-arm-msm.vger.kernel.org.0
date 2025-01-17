Return-Path: <linux-arm-msm+bounces-45361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABBAA147E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 03:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35BE7166AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 02:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E9B1E1022;
	Fri, 17 Jan 2025 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOwlnqBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66DF17084F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 02:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737079673; cv=none; b=pmu1Q++oxaJvfPL2/aiYDg1tR3cltk1tkUU9u+NyEZwQ9B+a7aofT6oeF7yLtvtdJyeQ+DDnY8IZSvZRNrLa5xxRoB1QVogl0PCiKA9RXh2TY7TsMfzOWgNZ36AT3+73nnjR6aXeRSZhvRdOU5DUl4iRTdiYN+cD399dTeIeu5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737079673; c=relaxed/simple;
	bh=zRUZWtNVk6J4oeX0It2KSfmevrS5KQ144QULZI/pFAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9J3krFd5c9mVVuD3Vi4w6/u06pO2GEebI/hbzobb5cDrecYgrTmP43vMzqSXlVu7ls91V7+2xq8XdtyrGX34mWzlM3+N8NX+oABlmWLk1XPnAGwiNFnSdFptjpuHr9P8xLvJZ4yXFBUlk7zVHWutbBgXMoqEk8tJEulz5Lgpmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOwlnqBp; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3047818ac17so15047341fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 18:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737079670; x=1737684470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UmNBaJ9flAoGVL3CjStFJ3qiZfXYpirOf7AF7gGIp/8=;
        b=gOwlnqBpc5o235AwLbP5XIptHKO3jd8dQ4SPvU4hL4n0Hq4aGvQQpUqdtOUFRySaG6
         LtcSjM6z13UTrdANpRB7vUy05XqEtJhVLTt2oPTvTrWWH9cArGIDqO1w0hXMjmHReV53
         +cfDCn/0BP/W0LWSbLDgwaQ5JCW5km0GtZoVrbcwiZ2zEjNRW6+0kCj9vUGDNu6m9XUy
         BP/Q0578pscZblzgO2UIBWsZvyK00A4Dvxy6ChV9W72+R7fGVtXHV49MoS7M5RbQLkgp
         Ry3syQ73NS/2J/SPsn8kXP4cq2zeHdQPVQXHaPsSudrnh1+hsamwF5MvC/K1aEH0Tz8R
         KyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737079670; x=1737684470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmNBaJ9flAoGVL3CjStFJ3qiZfXYpirOf7AF7gGIp/8=;
        b=j/ivB6BSryJc5F94QPU6JbLKIgMxCKSGzZnUUfKybiotydw6X7kDHVnE4PPPY7nRQK
         8P8RV22uVou1OjRVla6AiWcYUNJHZFNbNARzflXhko57GPVWqVra9vw3G6ZazAP5N0DO
         c/L9IESXc4NxlJTm+RsTp+xmSkWPo34QoLBavfOn/lfsOn+NFPelxmGl5M6sh7czIbyX
         0bQ+5HhKsYi2S139P7Bh5Oxvi8rJufQyqAuM3c9i0cwiNpPdmTz6+vI7p8eXoMaWUxLZ
         MVaHpB2mnaZx3AR24q3a9aUDixp6DVC9DGlf0U1OBwY2KUB0fPy3ZlwJ1l55BxqU18Ss
         ilZg==
X-Forwarded-Encrypted: i=1; AJvYcCVn8X0/0r3jaskYWRkR/8i/8lY4zli70XhoxbjX+9Tp680FZMR96DXAQQXme7qZtp70uDUlQhsc6qghIIBt@vger.kernel.org
X-Gm-Message-State: AOJu0YxyYnK+EtV/nd034p7h27ApEQMR4UIv0rFNFSo+q+c5PGjVJDVc
	yCNNJ10nyP1z3oraC9LtIVqFf3S4GENEpB1hTXPDsup7+Sz+yoQQ0l0/l6R0FX0=
X-Gm-Gg: ASbGncvfIofVtCp5TilA+d0vx8EK3hsAIgaDKnuO9tnoSrhT8s7a8aeS5po9mxKCJtZ
	aXSOkFvk9hSCwoFgmD1b5hm2axN+3Wu/VX+UC5YnL2wWQzB0HOOODxFZt35WMK5JwoL62UX7p+x
	FAjOiCNksFL2xiRTDCbpbHIkfU/U+bqQt5gQmZGbJDXBKbW7PoGnKFABS12ttEVoJOyS7DebAyX
	JsMYtrnFmQgCJ/uZqhQ7v3B+kBwA/2V9/6ED0q7L+n3a4FVKE9BPyBo4UiaPUmrMRq32nPQGCt9
	LVd6WRZzgBRc0C3w0NnuhuLhId/P/cG4KYq8
X-Google-Smtp-Source: AGHT+IE3mDy1UnCtfClC2GekVgCffh6WY4c88pU3oWTVLE5HIlhZvn/lG3F8S5lbrmtMtSxTxX1gaw==
X-Received: by 2002:a2e:be0d:0:b0:304:588a:99e1 with SMTP id 38308e7fff4ca-3072cb0a4a0mr2949731fa.26.1737079669918;
        Thu, 16 Jan 2025 18:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a331124sm2083161fa.21.2025.01.16.18.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 18:07:49 -0800 (PST)
Date: Fri, 17 Jan 2025 04:07:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
Message-ID: <2mtcnk7sg7zymdbkmucby3q7uwxhb4jde5r3ym5xdwkzjw6jc5@vv6fomz45ltl>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
 <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
 <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>

On Thu, Jan 16, 2025 at 10:38:33PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 15:44写道：
> 
> >
> > On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> > > Move requreiment check to routine of every pipe check. As sblk
> > > and pipe_hw_caps of r_pipe are not checked in current implementation.
> >
> How about this version?
>     The capability stored in sblk and pipe_hw_caps is checked only for
>     SSPP of the first pipe in the pair with current implementation. That
>     of the 2nd pipe, r_pipe, is not checked and may violate hardware
>     capability. Move requirement check to dpu_plane_atomic_check_pipe()
>     for the check of every pipe.

... Move SSPP feature checks to dpu_plane_atomic_check_pipe() in order
to verify requirements for every pipe.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

