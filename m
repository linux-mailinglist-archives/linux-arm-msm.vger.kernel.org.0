Return-Path: <linux-arm-msm+bounces-48022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB904A35CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 12:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 822337A0842
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369D242919;
	Fri, 14 Feb 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yl3cW9Cx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F51FFC7E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533628; cv=none; b=bOtlDt5YhenaY/b0p36xP8a7woQh5tnititRrY0GETd/374kpaT4XUieEIaSVhSeRnWE9IgPdmkkOczXD83e8zlX4DTXG6n9UPCMVHvBDUl/CVMH3jMLSkOyIVhM01lox4SoaNcqer0mFNPzRWpmGzRqf3+DCL91WInCB9eMAME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533628; c=relaxed/simple;
	bh=zvtC8/NeTu27X3Ua/YxupAnB5lOUabgNeSPxnOjEGFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/EF/XE5qqvu6Eihp7S2KsVG5gLQc8uVqsdi3+8Tmmr0A8KKNql1acndMcQ6USYyBLvgHYltauPUzLhNHOKj62yFjijwHruUPnE2Cx8g6C1a3JwqEppwealxIF7Enb+60ruLU5VIR0TlMS9cs/7npMDJ9fPMmkIzSMStxNuxrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yl3cW9Cx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450622b325so1963032e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739533625; x=1740138425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+OQLoQ4w2P2wl26RlQhREWTqKJj63sDchzFcZ4MIw8=;
        b=Yl3cW9Cx9CraDeo+7MZHkdbQBSUqEPTqq9Jzht9lw7JqtPZWvDSOj1FeOusgWltUK1
         ylA5wWzAWe9E93w11gZ1+EMKqbg2SrpMTD09XP/byegjJ87FThOm9yXxVwr42xEw8UsT
         /8nhRj+W9O3dbEO7yDydyq5ejGyXjto0ioFVI+SLHIRxakGB2/DX1w38Q5guTG7hYp2F
         g/SEVAzZRcS3WUcdMVzF9IvnH2tU7e3YxXwG2acuV+gpXgExM2lYzgJoR4XfGzJNk+fC
         8E5nlhqgZeS3Js3IlZGcJXdirmcFaJVmKA3I8NVtDjCh5rFX7yVNQZFdZe804uNlIrQr
         XrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533625; x=1740138425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+OQLoQ4w2P2wl26RlQhREWTqKJj63sDchzFcZ4MIw8=;
        b=Bpep+DyzOFEtqM2xCliJDbk+DRM5lz9tnsqjLWj5jX1nW3g7+4N6AO011/hARarkDv
         c4HgKBAEtTvtkQH+qcwDB4fh+h/tGzkHjFj3Wnbu5EauttzQ0RED5idf6u36md3fPBTa
         aKZxnCxhfsMcMXsd5rXT99Jwr+Y9O6nVYaePonmoZwUkLbe5h6/dwQ6fwk47wZPaHdb9
         uktgH1Ue83V8eCL7LO2wNOh94e02EsOi8rSTDMEtcK8ntu4dpZbGJFaKrvLrX9CyfZRw
         USnNU8XkI3iemwaRPBmrX0JbBPGvMGgRor+WWh19o0wbOJe2lW5OvyUqf9fasjx/hm9+
         sPqw==
X-Forwarded-Encrypted: i=1; AJvYcCXjV0f55uSkXuPeSUUGhdgsv1dgdAu9PMwANIXQJo7LB7bCcmMzJb4EkQT/CdrJs4YXxCjLOXlQOxXZHMf5@vger.kernel.org
X-Gm-Message-State: AOJu0YwES7mzh44NV1MNhO7YzvENbreDGe8qSyBoG79UT2UT9C6L4Wrp
	hMZCLNvA5QWnZp9sJoBAYh8Eqsfb6a0jiG8I1wUuRZKTGqjOnOEgJ5NvpanCzmQ=
X-Gm-Gg: ASbGnctZzosr6mm0torpCOu7RMFkvnY6OzIq9xDzre1O/eUDwaBUQEKfoiloe7aHdEQ
	8qmdNPvQGomczHVC7q6zqWtqDY2y6lukobjXTh2hE64abDKsXUtTv2k0AcGgZQIPhA3/DkTAPkn
	4Ps1JP1qK5y2hDCY/V77MBLq3EuvZCNKyx0Jo70BPtDR3Zr5T7dNPDvwm+6DgDG8e0p5Q/GKLtO
	s+Nnydy8zsBQshVHXDlHtLZo5uLKEth+ISmYYn7mMHOcKcWWAc7FETqDre01c8inuqrk2j8V7Aa
	kD0ji8C90EK/kTyLefkYvQZLPO3Ia5WOwqoNPdBCPPzg3V842ctd7zvY3Jnip9cXe1PNyco=
X-Google-Smtp-Source: AGHT+IHKxKT40jo96mqb7NkALHmaQtXaFtWBP2ROk8yL8YBS3KSBU18a4KW3uLJNYHaNWpdoTwyNbg==
X-Received: by 2002:ac2:58c9:0:b0:545:ae6:d73f with SMTP id 2adb3069b0e04-5451ddd9ec6mr1786235e87.46.1739533625012;
        Fri, 14 Feb 2025 03:47:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e44052fsm62574e87.80.2025.02.14.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:47:04 -0800 (PST)
Date: Fri, 14 Feb 2025 13:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Message-ID: <cwzxsmoykpobyn43thiyum7ncurmdhdv7qx5pqo27itls54mqt@6l3eekacxlex>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
 <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
 <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>

On Fri, Feb 14, 2025 at 12:39:30PM +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 12:30, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
> >> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> >>> Few minor improvements/cleanups why browsing the code.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>
> >> 5 weeks on the list. Any more comments from DRM side? Can it be merged?
> > 
> > Are you going to repost for the patch #2 commit message update?
> 
> I did not plan, but I can send v2 with that update.

Yes, please.

-- 
With best wishes
Dmitry

