Return-Path: <linux-arm-msm+bounces-18207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323668AD513
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 21:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 560DA1C21015
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 19:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C49155356;
	Mon, 22 Apr 2024 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gelMmyJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502615533B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713815090; cv=none; b=lPkOtnu6H4sly0PJs1xI6a5PV9Oz8lABqz3/sEebmbyKlOnR7QppEXPfpQ39OQP3NxANdu0zLiJoaxnaImIQSL7xaeEb2euhONrxJC1exBAaD2pqfvLgGyNKcPefVPxEJ/pf1C6FZupgTMZzs9JgD8L+9Mi4/HEJp3Q0sTR6LF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713815090; c=relaxed/simple;
	bh=9Nx8Aoim3ajZIbu1UpzqCFqC7ex9zJqVAjHbfqFAjec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McwBsC/qY9kXkz4MjnEMC3ir+1C7rD6n+EMWDD6sYPZUaPl4E5XY3BK8HcihR+hgm/bRoNro9y5pPAZEbhzqXSSqlgKMy42I5mkC1GoAFkj8Ro8foNLf5R28a9p7PHqfivgbbSkx/TYsRs9HkeGiQVnQ7g/m2i7BcOU/H8Yden4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gelMmyJQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51acc258075so3805069e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713815086; x=1714419886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5xyyivQsMTHQ7dLcNsluj0Jp99yRb62wMbu9zf5p5s=;
        b=gelMmyJQcKALWwhKJj9/ckv7vWNIkD0wVzZUcfU/o6RQiRHdoRksHtLuvS5RD+eyYS
         bcxM9tiT8zNfkzGCmRrG3AGaYAl40dVSckOjfvKpHNQo17mbeBx7PSxc5Ni6BIbn6JEX
         LPEcW7OpilQhB8KHu2Z6cStQ7TZpP0TUMW907kO7CVkHjIO4rF0At33a6h+RzOH0BgAC
         tLusNMwXIixRCEV6cape1TX1Jm5WfB2HFV0vRmVkL8CcjkB3lBu/iZeaUKiRq8Y84v+5
         1yWA2jpclUlVRw23UfCB0T3BTbDTKNQilxrVGTrA0xtJ7Pmwgy1gsvMjuXzHB7kzEPVr
         wp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713815086; x=1714419886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5xyyivQsMTHQ7dLcNsluj0Jp99yRb62wMbu9zf5p5s=;
        b=N9rGHxgHPGfPzMvbzvBg2QhwaEiRQMsrho1ClTmCja1wAUZeUrYdqx41huTOrP2psU
         8qgNXUPOYLX2/WHIUj4HN9hd2VGAyv9FIJJdsq0Ca3F4YnzAx1irJJlsZ+9yIog5nkkv
         QrXEBghF8zRElAe7Kd0cUOTud1SAAoK6OvDL8D7GcXsKcRm4U4aAad60QHXswruebNQw
         n/xj9IGKdKU6JwOtjtrGR54yizBzJGM+bvTv+I+If/ERJ8QLz/8Ef3Gcc4E/lwalwlf2
         FT/WJsemqXJlsBAj+SiOWDNiL2R7fpJY23ESHdF2oSZ+5fdHe3ckY4fyQtygWFmeuXXU
         puQA==
X-Forwarded-Encrypted: i=1; AJvYcCWiuGnLQkSJ9J7bw4ljs7ftBOBkjum/tZVyBCw4/VOpqb8NifjQ9kEnmPTeQgFMhf5zoNhBk1McvtuPS4DC9wUPWvYjGCEDzb4YIi8OiQ==
X-Gm-Message-State: AOJu0YyDyYZWfOn71mxaKy0eBvA9HExzRK5wsVcJ99CUM+zzTaeT1YEB
	S8Ev0pc4mRojlSYM1DcEpqt41qZAUM9LGep3+0i7MgwlNMsn+kT6GjOdNgACL2g=
X-Google-Smtp-Source: AGHT+IFB1Kv7g4uVpDs46ZAzOEBDJZtGjxsU0UGxK762fiEgaJ1n/WHkpnV0MuYvu79JTdl4W3x0SQ==
X-Received: by 2002:a05:6512:3af:b0:51a:d7c7:769f with SMTP id v15-20020a05651203af00b0051ad7c7769fmr4830577lfp.65.1713815085997;
        Mon, 22 Apr 2024 12:44:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id r1-20020ac25a41000000b00516c1fa74e3sm1824681lfn.207.2024.04.22.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 12:44:45 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:44:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Message-ID: <ohzwt5llvvogo46757iemkrnqwdzwqldi3bhbgvk4pxsp3wpuo@enc4bzir3uur>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
 <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
 <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
 <456bb6f6-03cc-aae1-b7d5-9d97300ba383@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <456bb6f6-03cc-aae1-b7d5-9d97300ba383@quicinc.com>

On Mon, Apr 22, 2024 at 09:12:20AM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/21/2024 3:35 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 20, 2024 at 04:02:00PM -0700, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> > > > MSM display drivers provide kms structure allocated during probe().
> > > > Don't clean up priv->kms field in case of an error. Otherwise probe
> > > > functions might fail after KMS probe deferral.
> > > > 
> > > 
> > > So just to understand this more, this will happen when master component
> > > probe (dpu) succeeded but other sub-component probe (dsi) deferred?
> > > 
> > > Because if master component probe itself deferred it will allocate priv->kms
> > > again isnt it and we will not even hit here.
> > 
> > Master probing succeeds (so priv->kms is set), then kms_init fails at
> > runtime, during binding of the master device. This results in probe
> > deferral from the last component's component_add() function and reprobe
> > attempt when possible (once the next device is added or probed). However
> > as priv->kms is NULL, probe crashes.
> > 
> 
> Got it, a better commit text would have helped here. Either way,

I'll update the commit text with the text above.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

