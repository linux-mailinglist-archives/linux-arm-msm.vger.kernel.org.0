Return-Path: <linux-arm-msm+bounces-17958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15768AB13E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A9B281535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778611E893;
	Fri, 19 Apr 2024 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JrfhokQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC485C66
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713538997; cv=none; b=DydOmMDG3FLSjBs/3mTLv3idPVbk1mIA7gNRjiqfWi0YWiscyyfgeudlSDu1IrlWG5W9AdN4UKKUJukfOMdQ1Uih/Ow2HH6h4dAW41VCK7xAj92eVOpctT8fXhXsYgYHl9hXCjyD8fcesw8nzzfDrOwz7WVV5+XYnsxChFeO72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713538997; c=relaxed/simple;
	bh=80Y5UxDhz2eRArASdStnYHWihm3PdOVHIlbwHPV6aNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckpVOdEXjWzBdm5vMtrIl6ETIHIa75d3+6SBTbHfc44KsOWkbY+Ft+eb8UWUDLTpc/U3P33P2qydhzO+UmoCxaoq0b5kU5v2mNT7lgo8hljL/+ay0SBZiPCjW39E9zD05UkjxQiezsueG8juPsCA+XGNrt1DKBig4cBrt6lzvFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JrfhokQs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51acb95b892so718815e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713538991; x=1714143791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJfnYZByoznqV4E5LwTYL8ExQfIwOVzSYp6IyIU3pkk=;
        b=JrfhokQscF/FfLc5Mma7GnWbVu25n/pyxCZgm5DLPEEFiaZeDqnQ496WkrGt8cOqdJ
         P9EovMHwzPspt03T/VlWEi5SRl2r/hYYStJd8NM+HiFXJhcFi3X+1pt60boigR+PT3Qw
         9zP0xFlHiY1cyEMYhwSkFNaxsefNDYEHftArOKP0mJG4uhZ+o51w6eT+ZXu1a+bnKRnI
         +ZDnsTWlyvs2VzQzmG2dz4ZfwZCCNPSIhB8FLHVbx62LAEScoYT0qqBzIHz1VNlzle2i
         7JFjHGnYRIfVLPFG/EYimjBnTo1oVUvwik6ZXG0g0t0K40gmrH12vtHkv1c0OQZzX3pI
         8geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538991; x=1714143791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJfnYZByoznqV4E5LwTYL8ExQfIwOVzSYp6IyIU3pkk=;
        b=rrg1b3PeoruRT42jSPt2QooRNcR3wvDOFtdlAk7xxX5InEFgLe93nMT1aYdt4Qo9q8
         snnUA683IFMRg/B2Vayd0Yc5qkRwXuINGVpamBWfxukm6Snh4UCN4WAmvpMwN7vNqUwv
         cxQaxDWQvfHKzJRVu5xvH4Ql3JLcsngBankAsj5Z6aHluCV/h8NROaSPtmpYC70ZASAj
         H9GQXKT8ZxdBIFxcqfliAnNgnngSNcu9A9qXLsxm/y3CdY+2DGOXAHkaYqSaxBkF7Krh
         VglgOl85m71FNaZgpvrPNsLLM8P8HnwSM/UTPh0hdxDe5A8Mc8QuKduvicS3OuUhYo0E
         LzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7kbzuc6ZTtdHV1GQIN9YznO9y9vVPv0GbKCewYOdGsgpm321XTKy2iYdDrWACcY3DbNOPtobOZ6PD11ihsEN5gWp7FAPsY0HylP8jlQ==
X-Gm-Message-State: AOJu0YxxXUCvP3F36dvSeI5UwLZuDULbFU/Gm/vHOGoE3uT/JD+LBGz7
	Uya54JvisCgfykRhT2f9f5fIdtji7UWkK4OEIq5gQAJEPZ7vZE99KijnexiBnzIxI4dlOzdVsgr
	s
X-Google-Smtp-Source: AGHT+IHwq2o3uW4PSBY4kcgDT3W2C9YBTiK8FKFdrI3qyLtn31Z5RjDG0xyVaYRX8cnMM1wh1zOKMg==
X-Received: by 2002:ac2:52bb:0:b0:515:ab7f:b13e with SMTP id r27-20020ac252bb000000b00515ab7fb13emr1993365lfm.33.1713538990549;
        Fri, 19 Apr 2024 08:03:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b00516c077a312sm735082lfk.308.2024.04.19.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:03:10 -0700 (PDT)
Date: Fri, 19 Apr 2024 18:03:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for older python3 versions
Message-ID: <ggnnlu67nsc7szqj2ndvmwtrbuyk3by2ja6ytcsr45q3tswvio@ehgbpnyxmvyz>
References: <20240412165407.42163-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412165407.42163-1-jonathanh@nvidia.com>

On Fri, Apr 12, 2024 at 05:54:07PM +0100, Jon Hunter wrote:
> The gen_header.py script is failing for older versions of python3 such
> as python 3.5. Two issues observed with python 3.5 are ...
> 
>  1. Python 3 versions prior to 3.6 do not support the f-string format.
>  2. Early python 3 versions do not support the 'required' argument for
>     the argparse add_subparsers().
> 
> Fix both of the above so that older versions of python 3 still work.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

