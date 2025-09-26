Return-Path: <linux-arm-msm+bounces-75244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F12BA28F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A73D7BACF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6ED27C842;
	Fri, 26 Sep 2025 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2yuv8wA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9152623A995
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868981; cv=none; b=SvzCaQrDA++PIH9pGgC1JdhpbUQnvQBJ5SfGY3HY5ENtMACbW8sAyMPcbFSpkjavl2RxfDQpPAteOQbjJ+ZPH5HoF55BILxSq4FdaxJGQMkrW+PDfJ0lEr29Q0kh9X9pXzUEmPghtz96AC5T8Rw9E4B9HxAdYdJJEtHr0OX71ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868981; c=relaxed/simple;
	bh=a2iqlMlXKulAVhFK87LDpoqYm2gEJ7HHVf64+tU+tC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYzaxJVOMTSYOEyShm0Q4SGgJwxfVRopTeTp03iDvDApqsIhhqsXkN/SmshuRPzwMwiATCVGXynmIksR8qzM4GqGhS86vNqBkvqZ5FlcvIGE/DhIY6vE03gAOkRQdKK9i/5M5TOxRfN/Oq+68AYMl58Gnc6EpH68PTeQordbMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2yuv8wA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e317bc647so11818925e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758868978; x=1759473778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hPWagNOQmEjTvnm5Z1LNkDjaoDSty3o7kgmSw7FvY0=;
        b=y2yuv8wAhanxw8nc576nze2PTG3YMJ157vT58IewakguxRSNEGATKXsdTaGgxr9W0N
         zkcUdaYbrRc/Ax9AhsoXjWxawxChPzZ7d8Zv7IZYNm7/jmwp8lhnexnl7sNsJDRuL0TN
         7edx+QJlQv4CaYQkIbvzl8yGUAmaFde0SXgkPKHMU+lzo8SS67F7UkiVG9Wg6OrAtdJt
         MFkQkY1pS7QsNapX7BI6CvDui3D30t3KwMWK6MeRLtu5rOz+u5esv76t4eY0ijzVAe53
         rAtXjNXZoTz5EKovuVnIS5VZMa5FetDhUKTNZYve8l9ikTHLhboofHvtlOJ3GfQzizdd
         1HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868978; x=1759473778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hPWagNOQmEjTvnm5Z1LNkDjaoDSty3o7kgmSw7FvY0=;
        b=IwKRkac2281NeQ5LaFhnIkwcvX5cpT7AB0l0GH1h+xRXwJ+tF751mlhXCAA3iYOkn7
         PIXzGG+e/vt8ZYn3Lv9aRhFzwxWvlzPmuHOrCKu7AqU6+zp66soK5JLEZqXWF5abaRXm
         e+3Lyzv4GJQBpyzr/mVd6LVbzaT9r+C5dbQpc3XFB8gOHN/NdBomGf0Anij20FuyyAKv
         WaYnQt9k/D9odZNkldb1KHsbCYOUzlV9aLQSweCHqzfjyfbHudBZ7zW4GEJDXcyHkTrz
         2eFIuaJonGJXY0xvOT1sbGumogb84sMvbjn+ewVCBVRDBqs9y7EOVjaTt1LD/p0T0dKt
         L4RA==
X-Forwarded-Encrypted: i=1; AJvYcCX62Oby1SRFw3NdaN2VCfJpOdAfh3bhJFbL8/Ic0UFNbObsjIP5y9NQHYuDnZuleqFVUU08sQC6TgKH1FTt@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhLYv74mM9i53UtYhExoLi1MJMRZqFvw+8h8P+v0VPjMmeMcW
	RqEGTITy1cwBKH5bFKq9LOpZDaQXDPA8VVzzRz3zqUSgOcx7K45kFAXtCGkF9b8Q47Y=
X-Gm-Gg: ASbGnctbRFT3UeFEK6v71UzKZhVLNkqla+VYsBNBt6TFH3ziAPUhH7i0vzC1TRHETun
	BGaqKGWCZfyOwiJH3ZeU9n4XX+sLpFAXOxy9BHt+1ya2FiTdBjr7NWs7+HY9p8ydWQCoDpN+E7O
	N4efPdeZAehZHyY4WFFr0T5mIf+66bikltA5opz9avaeiFI76CnH0pO1STy78wLGE573RN5mV5h
	2bu+ABd2bh4VB4pUNHkrXEGQRw7lxRUQtHjPo1u8SBjj297Ju4eWJNksVIDb7VratEyzsen5l1N
	G4JUIesAjJzPUajzaUnxUnActXaV2XQKay8Y6up7GGqJ69DnH0kEXpCz0xWPo/eu0/K3PqQlBQ0
	GFYUFvVOUeogCV96ZuC57lkFdPUEWjlsC
X-Google-Smtp-Source: AGHT+IE4RNDa+SBbyedMcpjrMBUEZfbXwj+HO0zplrjXyPKT4StsRppVNBzD/YjIofvWgF+YJsMPMg==
X-Received: by 2002:a05:600c:5297:b0:465:a51d:ab with SMTP id 5b1f17b1804b1-46e329bbf5amr63328455e9.15.1758868977931;
        Thu, 25 Sep 2025 23:42:57 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e332070e5sm30629935e9.8.2025.09.25.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:42:57 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:42:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d
 merge
Message-ID: <co66vf57i4od7bpd4gwv5ztonjecvpp4nzkrvjjuwkwvp3xkar@3zatxwnwpzp5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
 <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
 <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>

On 25-09-26 01:22:07, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 09:51:28AM +0300, Abel Vesa wrote:
> > On 25-09-23 16:03:50, Jessica Zhang wrote:
> > > Since 3D merge allows for larger modes to be supported across 2 layer
> > > mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> > > supported.
> > > 
> > > Reported-by: Abel Vesa <abel.vesa@linaro.org>
> > > Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Is it also a T-B? ;-)

It will be, by the end of the day. 

