Return-Path: <linux-arm-msm+bounces-74975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF99B9DBA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BA6619C4188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BCA182B4;
	Thu, 25 Sep 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vB67XJ4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7E1F03DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783094; cv=none; b=cEe9UQMtooy8x6pVn8PVbChBkyHvMTwlUGSSw2UmUDm1nz2qDneK5eFKAKVYVk5I3gqxYMIsrZ7RMrncvAyURgVIx3ijlv4KsPu9IPhHEpvt+63FCd3uqO5pMW7lWDm+XEcuG79UIaz23sw3xqB6Orl/Kaql5FFzF/YYU5CHids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783094; c=relaxed/simple;
	bh=NSqxoegjOQFW6yp782UrcnZZWCicWGaiYJFgtCGtUuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il37OevR517DdaVEQ6Gp0fh0qsW10kVLBYsAdum+Ou73GwVAJBfS2Ys6SjVVhbAwEJDmxgnj+HDPeiOeTrxEI8KbXldduyzCD9gW93fkHapT+eRHWDvCChGh3Tw5NLY8ZbYOnDAw5ihQ/QtHLaDqsDsL0wdS2IJX5EaTsg4PeNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vB67XJ4u; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b29ebf9478bso83757266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758783091; x=1759387891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6VaKrha5Sjvod9ZnLzt7kVvC90hBDHE0UcXwFSsoXVM=;
        b=vB67XJ4u4bstLC6oSAb8efw319lzzEyjj+aYD1dQIsImpUkHYCDVviKlYiPNpvsggN
         Hi/Ca9ClrbLyFdrGaH/ivHLP+PRlS4yFOYNGduycVvvuIDclr82MJ6apRe6KtoXPMK/W
         CXh/n2IejeYz7AixDe/+hf1N7q0XBcc4O/I23uCXA0Zy9xeBtiDmX0JsH3KaOAvhqpAC
         qK1ah/uSIcfm/uieMjmbUzDO6WOUeaBq17fXN3VjxnXB1ySMgzb4de5TMNgqW3JCcYsq
         TAtbUzYNRPtldBpMDo0Fk7C7zYZhuBS6Z4S6SoXbD+xkbA93QhTNuh1y2b+kUL/w1VcA
         C4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783091; x=1759387891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VaKrha5Sjvod9ZnLzt7kVvC90hBDHE0UcXwFSsoXVM=;
        b=rVB/5ZebjL6ftnjzNl0tKc5NqbKcQHdjGPaGsUq9GTbOA41dRFeLSCgVrTAAIjx5sL
         u2J1+yLI2nVEq3RXQ5IXeH8vedQkZyVDjsutHZbJRUiTf557vyLh800dTHIWmi/6KpKK
         ng+6SgX3C/xXn2YTY4OkafkiufiUgowoSRMs08bw+zvkbkBehSxyWN1nT5znpQZLi+yu
         H3o6jTvqevwSHqtN4KdXYAhWsNGUQjH7YnnaOOsEbh7wi2gVfpjp2zVooySJP9G7V0rG
         KcgZ5TQqBhk1f0FkvDJxzXoHjaffXKun6KvE/vptS73EjxUqaz6lXAPed65hRa7PXGQY
         Pp4g==
X-Forwarded-Encrypted: i=1; AJvYcCUKOPQ55n1nOPypMppopsbwGfVM8TnveO6ZzRM8KyplKeackSwwkBWe8A16z9wcoAyL9SxEhyqy6r1j5KbK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77gEULfDRlpyA/aY1KUZHFOO/JFoZuh45ZcEDCvINKNHfQkek
	8rbMDIJAPrpucpr0aKPR3qSRuJW9JEjZC7pXFVGVcdQXJh/TRuxVOxRGDq7N4qMDYAM=
X-Gm-Gg: ASbGncuJyX7auGYbPSXel9Jhc1uDuUAQ8oo1p/dcriik3d7zJt7CiUGalsPZm5qSZrY
	We7jousu+pNkPNZvxOOMw7e+Y3+szylaoXbcIQMa3AK/7jCeRGQSnBNyFLwvqVYwS+/yMHcZTO7
	uWulBMCcdTpgCZe8/5WkFWLZsjJdg2Pee05TadqZ95GUGTSKbHd6vzmGPxfzH6Tsx+yApVphQq+
	sSQNK7ZkE+ysTLB1osuEb+4uYxw0xPqLhSX3Z/dY6uVV6h6QmUFgA7Ytt+YIJVITyhcOXgS/FZF
	tCRo4qYEZojHzTxqQxez3sh5bAJN6pWp4hOTb2HZeFXXgm1Zw3vca1Fkd7NcNXtud3pGFcxA01+
	7PvpaeUZcE5x1sBaLlGl/4g==
X-Google-Smtp-Source: AGHT+IGGfQ8eA5qoYaBx6N30tlw71g0bFTIZMRs/lzQfK9Y0ST7ZgWV3GMVKow4yUGkj2uKHY4Qx0Q==
X-Received: by 2002:a17:907:7283:b0:b31:5c9e:7ad3 with SMTP id a640c23a62f3a-b34b8da5a4fmr250151766b.29.1758783090705;
        Wed, 24 Sep 2025 23:51:30 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d11a0sm102629866b.17.2025.09.24.23.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:51:29 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:51:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d
 merge
Message-ID: <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>

On 25-09-23 16:03:50, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

