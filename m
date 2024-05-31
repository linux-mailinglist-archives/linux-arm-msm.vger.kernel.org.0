Return-Path: <linux-arm-msm+bounces-21202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8F8D5C9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48AAF1C20922
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 08:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F2A74050;
	Fri, 31 May 2024 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLT05/e/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57638762D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717143561; cv=none; b=eOB8z8ZVZcbjPjkJXk+VJstYvm96l9i7w5Gg0a5t9B/w1x7VUSGtCu4hGB4bBt+y8yiGfRSaL6SIAr2UOre/hCKsIVmVoX1o3xrRLCGek0kosZGZfrEfTLIx35xaZgHifxDvHqR3qV7fY3DNU9zZ4gEMODxdKspyoXa2+rFsBjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717143561; c=relaxed/simple;
	bh=VIyW05HPR680xsdAyc17DLcbKTw0GIh7anAY56xOnYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXQAeON3lR22JFrgXBuGDMC9DEClP9lMXgvVD1xKYR9EL/+FWvpSl0Yqeg9VydYy8WBJ80YaKH7f1vxSatwAOEK1pW7NK+NLeyZhKHfDP7IT7J//zB+R4oeW8He5SLO8iFzfTSvOxc+zHjEr1NdBlgTVeLG+61xONAF+S5J/dhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLT05/e/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b894021cbso425591e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717143557; x=1717748357; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
        b=SLT05/e/ZQf0BRCaC2enKdtih9mT+wKFUhaeG8VR29vrG3eun6Ye5lcj9msi29OIVk
         6ds/+iozABXm23zSWd+g55C/dYKjiiT2IDu9/Wk9rh43n8EdnomUVRlt9nwRT+cNTPgn
         Ma010g66Dw2bqRNc2uXHZoxzX3gC0mpxwYg1tm0PgHBKs3EGlL4dfCLxK38X29jL2dt2
         C4rjMS+h+Y+rwJnmUd75isVDjEr2ON2sAl0lc6O+QgbHH2RrniugNSU8EabrQlxEiXp5
         Kclr2pfB92u5DD2sg7sC5yZtD9o8cdTkft6HrjTATSt1PGTfT9V4FTllafqge5ydestW
         e5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717143557; x=1717748357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
        b=TNOVR8KVTLxV+fm5mLmj2YmhANtbJY8MNnUhlwlVk+sOhOQq9EG14rItY7+YTZ8a/5
         MBkALWW2fifCpzW+2euDlOydYSgtpJp4a9RVr0rQ/ZKEIK8d7qsx97gVJXKK0FZFBFu7
         6zQAD3wBSomRztgyZXb5+pfQa7kf1gm1GME/+L8CmhIHcv9rwW+gUzi1pZGMt4xYrV9y
         bt7+gJRDlLwGLea9NDMw5JJKmOZ34EDCihMiPJhA5eTJ/3+hA+IRcCSja/qdJEvAntKd
         aeCV1vohtxP7Wd0hnfzw3TgdgqCnMn618fZUEgQa5mBfXJkXREiIP1rayQgYpMyfbp3y
         1GmA==
X-Forwarded-Encrypted: i=1; AJvYcCU0d5MmIKDdZCe4jl5B5ETe/bNROVbKSmGS+k0CStXMJKJ/R7pM2Arv4796Pdtwi0lKx4ei1ARZHzG31ZRY1WLjWAzKRqvObKulDFUS7A==
X-Gm-Message-State: AOJu0YxRzpfdlpsaNNVCF6BNt57JdSJpLyOVdRfAG3PIruKk+HBAoMPL
	lgLKb7xMBRB7P/SZBsjaAaHu3oJDmJ2N1q43PYkErC9Yf+XpAXUL+RLCOjLRgBc=
X-Google-Smtp-Source: AGHT+IHKOALBvpP5h0AiQmZTmJVgPq3q/lJ+YsJBLy9b7uGY4oRPAaR9D6pdKC0bm/RzqJYNRG+OLg==
X-Received: by 2002:a05:6512:70:b0:523:9789:4c8b with SMTP id 2adb3069b0e04-52b8957ff6cmr664063e87.5.1717143557411;
        Fri, 31 May 2024 01:19:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3450bsm254800e87.45.2024.05.31.01.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:19:17 -0700 (PDT)
Date: Fri, 31 May 2024 11:19:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <dz23snvzifgjc5dktv7sckkumpudjkumf65bc66eler3xm4atf@37nypjcwyxef>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
 <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
 <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>

On Fri, May 31, 2024 at 09:33:12AM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
> 
> On Thu, May 30, 2024 at 7:07 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > Alternatively, maybe Kconfig could be taught about build dependencies?
> 
> git grep "depends on \$(" -- "*Kconf*"
> 

I'd rather not do that. The driver option disappearing just because the
pythong vesion is incorrect might be misleading to the users. Anyway,
with the Abhinav's patch the issue should be fixed (and I'll take care
not to break it again). Sorry for all the troubles.

-- 
With best wishes
Dmitry

