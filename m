Return-Path: <linux-arm-msm+bounces-45365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F871A1488D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 04:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7CA188CCD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 03:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BFA1E1A32;
	Fri, 17 Jan 2025 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcUSrJNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F625A620
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737085197; cv=none; b=qi2x64MAWZT8pR7dwzc4EQZ7Ev2BN4n83zErENHplIUI6ZwjBUpqNXX9GtRvrk4KJFrD03v2YIiYgqfInG4FJN3CBLUQBac3r2pyn6roq4bj1S3E5IT6XalTY+cc2J4cb21ttDTgEF/1H8FOrF6E0aVWQCHOwC1GU9z1yUXu6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737085197; c=relaxed/simple;
	bh=YO3rR3i4AqRQEhLdRWNd1n2F0EvVcKB4ZP0pZMv8aKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9h4cJ/ruWg1LpraxOJWA3uJHTYe5djcuausoyNjqAlnKct655UInZsYtNrUlSiQpziu1GsMmESClZxhG7GhV6MV9igbDxwPkkVdCITWye3zz9r/Yg3XBp1U57UX4yKKzXbXwJQvBeJ+kZt/Wts7Vo4rt26lUgZ5NBNEfI/+BEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcUSrJNP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so1756329e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 19:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737085193; x=1737689993; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a0KmIpWhOnmvP2/79nQLTbunQC6aY9KWQAhT4oyikpE=;
        b=dcUSrJNP88k4DsXEEvk5WYKyB2AniOInEnQhsRQznFrjYF7NY211oQ010cI6tFq8DR
         ssA9ohBhOpxVurDHlHfgihZ5pbPTPkxgaXh58LSt+7/LxZB5U2MZJ3l+2ioMqDaYvael
         PrUBfO7vCv3qMKq1IO3Nwx14IHedR3Ny81RrSNm+BmItqA/PxTk/f3uQzV73WpZM3MCh
         6iJMB4gVTrJltB2YeqbNZnjU5DPZAmorL0e/ZTyv9G8v2OA5ol9cbnsOAoskPXOCCT8s
         vq0mcjIEdiD7IXbPrPiuXgDJ6+K0eJ/sgpEwncfKbmuxWt5w11ZUhHuxOkFtVPQEwOcJ
         z7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737085193; x=1737689993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0KmIpWhOnmvP2/79nQLTbunQC6aY9KWQAhT4oyikpE=;
        b=byVPCy84VbNK4/Hyfw082Vj1rqebaZ0n+r5VGlFw9yAo56m4xj5wYqGhNTvbpKIiM3
         jEXCgu122TDxGKKNeOTQOMkqJnbqABWvNrscCOZDrLKwk9PrPMi9v9bEGnBpwGuqHnSY
         uOk8/X+ttAbE/7d3b9TLxlZM+hMhlitMsUn6YT/yd84Vb0DxinR5sikzNZQC9ej7rePb
         RJPx6aQSplrSCM2z5GxXjeIhvqQy1xVt5XUwwxoX2fBbKy5KhlT3IofsR6tPPpOGiQeF
         UOH5GKwJGKkyVr43BMoIh8me3cH2jtoNQUIttnGZFcmcx35ZrI+95XIOdUJjNlfyonzK
         vAcA==
X-Forwarded-Encrypted: i=1; AJvYcCUx028qJao4BkyFhGhZDXg6smlzi9qDijMwQSsZYcO30FiWGriIAgAIm8df7teQFcdwStsl/me2Ok9ahhHS@vger.kernel.org
X-Gm-Message-State: AOJu0YyXEHcnHE+Bw7qB/yOGUyTW22rtyNZfRJHRwlFevn/Qtoh8Bmgh
	dCAlggYFmBJwPd4L77B1ncnJViB4Y28I2pfQisKAic1ASJbCUWck3Hd0TvGBAQE=
X-Gm-Gg: ASbGncuqiJfcHmJ+p0AcxRgTlmkwYIZpq2snMda8Heluen+cPmirX/KKdIJuBzL28xI
	4IOeGN8XNr+2EebcbayKjIiURVWynXjkseSZsCWC0MEHtiV331l2M7rWdoi3RDY6LVaNH1S0nWW
	LX2QyMzQZBkRJlUNSv2siNoHkx8E27rKCGs4x+qrAD09KWc/KMIkQO7C3oYATXAqnTZ8jrRbzA4
	Qzoj7v6Wk2dlgBH6/m559FMtJaz2gB+ryNWHDK6Ku8bIwF1uB7Pp2lUQnvj1F5saO5cd26BcRMT
	IZPSLwP4ihYjVWYthCkznLB7ePjMD88ulJZ0
X-Google-Smtp-Source: AGHT+IG1i+XsSg4L26hUUv4AYoaCV/mK4bj6NtE/PFeG94iR1Z0kvDv6pvax9G0WjZar1+ZiQ+L9PQ==
X-Received: by 2002:ac2:54b5:0:b0:542:249c:215f with SMTP id 2adb3069b0e04-5439c22a8f6mr186133e87.4.1737085193491;
        Thu, 16 Jan 2025 19:39:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60992sm191506e87.155.2025.01.16.19.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 19:39:52 -0800 (PST)
Date: Fri, 17 Jan 2025 05:39:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <tae55nwbytxtmskvlelwkldy6tkgurr3mxocpfdhvniuiduxb4@qosnxo2dseu2>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
 <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
 <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>

On Thu, Jan 16, 2025 at 10:22:07PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:18写道：
> >
> > On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> > > Support SSPP assignment for quad-pipe case with unified method.
> > > The first 2 pipes can share a set of mixer config and enable
> > > multi-rect mode if condition is met. It is also the case for
> > > the later 2 pipes.
> >
> > Missing problem description.
> 
> Is this OK?
>     SSPP are assigned for 2 pipes at most with current implementation,
>     while 4 pipes are required in quad-pipe usage case with involving
>     configuration of 2 stages. Assign SSPPs for pipes of a stage in a
>     loop with unified method. The first 2 pipes can shar a set of mixer
>     config and enable multi-rect mode if condition is met. It is also the
>     case for the later 2 pipes.

No. It should be problem / analysys/ solution. So, 'Assign foo' should
become a last phrase.  Also please please perform a grammar / typos check.

> 
> >
> > Also, shouldn't this patch come before the previous one?
> >
> Yeah, it is reasonable to prepare the assignment capability, then
> enable the plane splitting into 4 pipes. It does not hurt actually
> because quad-pipe is not enabled in data structure side.
> Will reverse the sequence in next version anyway.

Thanks!

-- 
With best wishes
Dmitry

