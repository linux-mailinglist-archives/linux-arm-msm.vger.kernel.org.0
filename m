Return-Path: <linux-arm-msm+bounces-36699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE369B8D4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 09:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CBCC1F2142E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCDD15667B;
	Fri,  1 Nov 2024 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7TGlJKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6A25757
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730451176; cv=none; b=COTxnmXVU43lIktk4J7YhRpGbBRIUUNv77k9CjoXrfsPdgJJnfVm0tCxVglG6X0rINOa9Mnk0OK1BEpxXDevc9h7eHpgm5n8FZ4WOR0CmE6oRr218U9mne4VzW1DBmcwrdhXho86/mdmj6emtGoNpW0GavCw3pQ952JhPeAxNi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730451176; c=relaxed/simple;
	bh=FWS7x7kpWfD4/GL/KsPxp9jGdBMzZDtisdmNOvK2ATY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOcVAnwIpafnOxZYuinzpzYViTG4jFyO1tXdRfi7BI0u7/1spvDBa9OW8re4cHkMC55mBk6lr7AiiFPh1P1AueUK4c0N/BTuQXya3fKtvHTZ6dYGT0XIF0ya2/GSxvdpDlVRZs65yPMr/ydvZHxjLrZ2KEDRyVZMWENiaWgkaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7TGlJKV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e690479cso1928313e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730451172; x=1731055972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wh6N/qMH5HMbHbPdjWapWn7PvZK7521EngYAjwaTJAI=;
        b=W7TGlJKVAmB1Cl8+Z0xdfzjcQLzBPA0tl/+u2PmIEA3K4xsR2ITgeNwMA4oJ8+RhGj
         7tQ+ZM3KyANQllSs6vYPh+ZqQp+k8Xqo+640rZSjf/8/6BxMVSGlwEQzFTgurgBehk7g
         S7QuUz5joaaipe5Fjpzy3ebhlIjyZWVK5WBPUCUOAOgKOnm8EIQbsuQPV9SZfq1WPNdV
         xHSA8BUKiC4/XWepN4SfazAJxjK8KrLsgvoULBCr8aloiCZdqlK+Lw7q8MijqrCUXhx2
         mLuOHbY5C70uNiMWMKDqAbVksF8l3/+goTbWRVg/iVcDZnzUTURnSxAtHTvQxsBcMcBR
         s9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730451172; x=1731055972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh6N/qMH5HMbHbPdjWapWn7PvZK7521EngYAjwaTJAI=;
        b=s/VXTJfGagTdNkOynbSf+bqNLo22bgzdyDGwg8NwOnWRctIh1SA9Q/7P1PNNDyoLZJ
         9lFpHMl8Ss0GB8Ybbc/4NwQCApYcSsCaou/mcOCMacsZ4x3yKkLLmuYR66tyZNvVywfB
         t0I0ZVWfvOZWIpGZ4pLSyjGtUwC0Joyq7r1VD8QHLE6kbTsCAR/ACQPXKZxOOx+4XBmf
         0e5Q83KF8l3y5IrlvqUV8Ok/jQ6BraxFusaU0Kz5FmDY0HFvzsHdtmvvSjV5mZnTifd8
         7nkbKmGQoN5RgvtdachDIei+emCXV70hyT6V1L2l0FeioncP1aLCZhyVQJuLs2I1eFn8
         jf6w==
X-Forwarded-Encrypted: i=1; AJvYcCVgmr+g//ksPaPEY2AEFBQRol6buFMeou+o3sIL2rggi+I8y8QAZXq7XMAssAr6eyWqT7BcVI2F7x7mrBP8@vger.kernel.org
X-Gm-Message-State: AOJu0YxxIV5FayBGmCtpHYfNKLPG2SeF4TGiIQ+IeW5yJ7zpv46KV+Ga
	DZVsn9UUF8YhFs0m7E+xxguZ+x0OC/qhinjzr0fDUCbiPM4R2SPw4BIGGG6QeDc=
X-Google-Smtp-Source: AGHT+IEAeTNqVFeTbtW4niG58QzyiJhhnnEnA7N9JcS+53KX4icxTnUEphIDjaUZyu1A6xjDLlUvQw==
X-Received: by 2002:a05:6512:b02:b0:52e:9762:2ba4 with SMTP id 2adb3069b0e04-53d65df247bmr1561463e87.25.1730451172396;
        Fri, 01 Nov 2024 01:52:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc95848sm484842e87.39.2024.11.01.01.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 01:52:51 -0700 (PDT)
Date: Fri, 1 Nov 2024 10:52:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: simplify SoC-matching
 patterns
Message-ID: <sjayaro5coievz22gdeu6tplzjs6kju333a6womyuk6bsvw2h5@a5ewi6sdl7wj>
References: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
 <20241101-sar2130p-dt-v3-1-61597eaf0c37@linaro.org>
 <pmgutki3fjqbka5ozalevpw7qptmzykhqxiaofqc2nh4gpnn4f@bgmz6fknavbf>
 <iixsrpkyzae5mpwsa2qm5jdyftzgav52ryficoizlhfzw54xbi@gdfxwmjutqp2>
 <80a37af3-ffef-4342-b7d3-f2eb36bb60ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80a37af3-ffef-4342-b7d3-f2eb36bb60ba@kernel.org>

On Fri, Nov 01, 2024 at 09:37:23AM +0100, Krzysztof Kozlowski wrote:
> On 01/11/2024 08:47, Dmitry Baryshkov wrote:
> > On Fri, Nov 01, 2024 at 08:26:04AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Nov 01, 2024 at 02:49:22AM +0200, Dmitry Baryshkov wrote:
> >>> The patterns for individual SoC families grew up to be pretty complex,
> >>> containing lots of special cases and optional suffixes. Split them per
> >>> the suffix to make it easier to extend SoC patterns.
> >>
> >> This is doing something quite different - split is not important here.
> >> Instead you narrow the patterns significantly and disallow things like
> >> msm8994pro, sc8280p or sc8280px, and allow things like sa5200p.
> > 
> > Just for the sake of correctness, msm8994pro is still allowed, if I'm
> > not mistaken.
> > 
> >> I don't see here much of pattern simplifying - dropping (pro)? really
> >> makes little difference.
> > 
> > Patterns are simplified by being explicit. E.g. in the previous
> > iteration I completely didn't notice the intersection of the |p that I
> > have added with the existing [a-z][a-z]? pattern. If you think that
> > sa5200p should be disallowed, I can tune the numeric part of the
> > pattern. And sc8280p / sc8280px should not be allowed in the first
> > place, such platforms don't exist.
> 
> I am fine with this, but extend the commit msg with some good rationale.
> Have in mind that the point of this pattern was *not* to validate SoCs
> names. sa5200p is fine, sc8180p is fine and all others are fine, sc8280z
> as well, because we do not want to grow this pattern with every new model.
> 
> The only, single point of this entire binding is to disallow incorrect
> order of block names in compatible. Not validate the SoC names. If you
> need narrower patterns to achieve that objective, sure. If you need
> narrower patterns to validate SoC names, then nope.

I need narrower patterns to simplify adding new SoCs.
Another option is to define a mega-pattern like
qcom,(msm|sm|sd[am]|.....)[0-9]+[a-z]*-.* . Frankly speaking I'm fine
with that approach too.

-- 
With best wishes
Dmitry

