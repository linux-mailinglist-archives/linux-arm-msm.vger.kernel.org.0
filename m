Return-Path: <linux-arm-msm+bounces-47840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C1A333CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 01:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50E493A697F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2371372;
	Thu, 13 Feb 2025 00:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tR0PgMek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D48EC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 00:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739405240; cv=none; b=VZ9YtTVftkF1TcP2Z2bh/TdeAlV9MXKZfkTrBYYIcBArKDxkITknsnopr8XjAZixoTZ8WjSuEiGTWzX3fNFlY8DKAT/rdxHifpVhs4+Plmly7D8uL9UQ9jZbPV8TNxQwfJLSUQoEOxiR4eTqnPY0CGv+f9hfB12tjvx0PL6UJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739405240; c=relaxed/simple;
	bh=wAQQF2/xUxM6dl/LsVAawc/JJGfCxfKXoI7le3pPCXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLnncXNmy8UJH7ZJDoZcfQl2hJNvxLDwHH7lxjgifh5dMPgVJRXz++QcqAaZ6SccK07Vi1PLavKWFpATza1by35Xn/3NMbMEwX3Cj7tx8er0kkt1o/eyspiSTLNbZvx0yqKOh7QBOz/1Opt/lPUf5ro5RUrgf4aJAu+QzOAvoHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tR0PgMek; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5439a6179a7so304106e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 16:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739405237; x=1740010037; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pf8gs00/4/9w7W7B+PluDcVXqKZN7oOLtPqkB411rw0=;
        b=tR0PgMekS9KUItlPVTPZ/jPRopmyEbp7gCNSvovsQVRU3WNeZp3Lo3KkZnDu0szsnv
         WdFDlKJKsSfQEKdyspkhb6ffBFLzU1rHxngMWWUugHDjS0NaIyBqm7eQ+MtiKw/WEeq+
         c2vvBtpUONtGLLRM+rDlaJk4x/ocM3RIfOE88srufGBP1xCRNsBlaQCVfwR8JKvHrMdd
         fwAmzHGg8hnFFGztaKIIUG6gpcOB+CB4CB8g9mkv1eA85e7Yhh0EZcxeRdFg3VAlo/UX
         RurbmW+aeyEi6+TCBgl08WeicrBR8CKfLmDZfwEXf8tboeDRJ2SusA1xk0ftfrsX6Yua
         Ws8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739405237; x=1740010037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pf8gs00/4/9w7W7B+PluDcVXqKZN7oOLtPqkB411rw0=;
        b=U0OWEMIGBuuM1rIYrlFnfE+8bEikxggcqyhnILiT19SM4wrI2n5SA0wF/WOiCkPEtC
         ErDbjSbxkHzfJRmgdAD9ed/ui+VWsk+SYYjQTdy8KD9rKQyU3VbMKmWoi955ALQHLpM+
         CJD865LuzdUeXosHybgQszotw6Ia/opoLmdTLnqr0/VvOv+sT8K01alnpjTmTvVoVpk3
         yP2z7wwewYLDyzkHUINo6iMwfeY47y4ehJpKZqA1k3SdVgQ72eQkSCzgQqKWFbWUyH7R
         rB7KHrQIx/bbrleWMfOEibVm0XHhIyokKcBtf7gDJ2xxlMAuVgrxMFqcgQT6m8Fishug
         PkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+pqnGCqjHI3xZBp0fw8BnhYFrrW6iA86j8iEYnqxaJ9aMAybbgo08yamFGWQ88t+Q+RgcFaVaY4Q19US@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+p7Xur2nL5W72Pu/cOU9FeSR98l5IGFtpSfR7uM8zqCGU9YXw
	4tNXW3hTn+WK23gUC+5RFc2H/6VYFyM4nef6UNni+U5xqGszmYGlyC6Zj74kEvI=
X-Gm-Gg: ASbGncuR36wlDOmrRBPLD9qRu+JhTl/xCL70RuZABnWRWED6cY6znxdQmL2vO5MDi2x
	T9kb6JpAZfz6u+Uem6kqtqgCpyBuFg4ZUOW09m7VFDKO3N+MCpZF4zFkRvew9F0phr9hePxyDPi
	371SqpEoJsG5W6SCqxXfHffcJl6D9fEs4oOavzV/6oL9X28ni1+UNe0ISZUxDy7dyf8F6ofiHtk
	YULjd9k3XVYcCVOISvrR2vyEUmT2ZnqH1wGcwBOJY/K0ndEYOwBnIX5f13tPJXniNQai7njFmGF
	jw6CBLrwqpEMSKvMxAHM9q7MOGclUWkWOpWZP+FOCzoSA+gM2Bl5XWzWCm3CAFWhHlmRPLg=
X-Google-Smtp-Source: AGHT+IGgaIb79GOenbsc3e1MUpq7bHd0RnhtaMAeeGwuUeOTEKM4SryWszGVytnTQkm7zU/gnhk9pg==
X-Received: by 2002:ac2:4e95:0:b0:545:fdd:9ef4 with SMTP id 2adb3069b0e04-5451e4f0750mr213183e87.8.1739405237077;
        Wed, 12 Feb 2025 16:07:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105cdcsm13282e87.116.2025.02.12.16.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:07:15 -0800 (PST)
Date: Thu, 13 Feb 2025 02:07:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <g2md3uz34tv7atlxm6cvkdwa35pjulwovmlyj4ausoson7wrkw@vjvfpcaejrck>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
 <87tt9pn8uu.fsf@intel.com>
 <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
 <Z601HHdh2Zn62skU@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z601HHdh2Zn62skU@intel.com>

On Thu, Feb 13, 2025 at 01:56:12AM +0200, Ville Syrjälä wrote:
> On Thu, Jan 23, 2025 at 01:05:47PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 23, 2025 at 12:05:29PM +0200, Jani Nikula wrote:
> > > On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> > > 
> > > This might be one of the few places where the old functions and the old
> > > return value was used in a sensible manner.
> > 
> > Well... Yes and no. What does it mean if we return less bytes? Is that
> > still a protocol error?
> 
> AFAIK short AUX replies are perfectly legal accoding to the DP
> spec, but we've not really seen them happening in any real
> use cases I suppose (although I'm not sure we have sufficient
> logging to tell whether something failed completely or only
> partially), hence why we've never really handled them
> correctly.
> 
> For aux_dev it might matter more because the common use
> case is to just dump the entire DPCD, and some displays
> violate the spec by having black holes inside the DPCD.
> What I don't rembmer is whether those black holes actually
> result in short replies, or whether the entire AUX transfer
> gets rejected when it hits one even partially.

I see. Let's keep the old interface just for the dp-aux-dev and make
everybody else switch to the new interface. This might complicate the
patchset a bit, but it seems that's how it should be done.

> 
> The other concern with not handling short replies correctly
> is that writes (and even some reads) can have side effects.
> So when a short reply arrives we may have already triggered 
> some side effects while still claiming that the access
> completely failed.
> 
> I suppose if someone was sufficiently motivated they could
> try to handle short replies more correctly and keep retrying
> the remaining bytes (assuming that is the correct way to
> handle them). Although with those black holes I guess
> you'd eventually have to give up anyway before having
> transferred all the bytes.

-- 
With best wishes
Dmitry

