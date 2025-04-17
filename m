Return-Path: <linux-arm-msm+bounces-54642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF394A91E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 15:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 634917A7BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 13:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6673524C099;
	Thu, 17 Apr 2025 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e7V8X+pK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3924C066
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897294; cv=none; b=bI9KUkJZMhTGukm7bcmLIKlaUDBNy9oarLRTCLq4cKZDzOww8pzUUhzUmNhd6vcBRN0Hw8mP6QgpSN0hq80wWzp253RyH5UdECLSbmWwEiNyQS6uXqClf86GZaSjUJWLjj3bTB6YlafbSOtxX+xq4VbbxSCUIQaOT1+/T2dLgTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897294; c=relaxed/simple;
	bh=kuAfYP5UvARagG4xlp5uWE7wPsCM5ITfhZ2pP4vf4pA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Z/d4azugfdRvJglau9aobRW5jBN9dYhqjgJhP+QKpRz1D9tbXrAtBWPN5srMT/ftaSRgV48TejRq4lY3PjQpPQMzP8qmsEyaMXOzWpqUPvOM+kuT1pW0REMj1I6d3PBPbcHUCAiBBltzZdEAovYgIKQLxrumkwT83EViG1EaOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e7V8X+pK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so148597466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744897291; x=1745502091; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b5UBlhI7tagceuxs0zjhouMKp8JoC3Qnn8Fd0hnCOc=;
        b=e7V8X+pKH54rHfUok1XqYDVkfCc0Kqg1XRvfabg7z5wgC4hk4PG0jEERDHtxYc+tht
         FuI8JiTw4Z6wUMwJmM1c2UcWZHunRZI9xHAWJh1aEDNP7Mju+KbBXSgMLl774giDiJNK
         XCvqaqMpZ16jf6cxu7k7DUi064Vo9z31+KQ9FA7mggmVtjxXWSssJFmnYoxFsUVephXz
         Ftt70HTGryZjVDoxwoHxOb1pPGPwOyUezcAJQAbqArakjzuvJJtywcxftjY2zb2RGUmZ
         bOSPy+oGzbWSsOht7feXVQguGxHcAgLPek6omtkAdCp6cHy5UBpAq8ubxAKSSN2AlfYk
         2qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897291; x=1745502091;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8b5UBlhI7tagceuxs0zjhouMKp8JoC3Qnn8Fd0hnCOc=;
        b=gMlwqmrYIBKsJ+3jF7s54pn923+mS/RABioV2efhWrz/6JdCmC9KF3xfHE6wOt+wZ1
         plU9zOEXYw96rsvMtG07vcHGX8N51ZN9fG1epI9Lrs1I7CU8G4tb7CWQ2qSqRXqUWdpQ
         X5Awrlqp9k8m7JR9Fdkjr6BxwTDj6u6YeI5XwOTdLLR1j0eYnZ7BSIPfOMuaYxWuhrWT
         1d9+yhKrZp3IAWyxIZpjocd3X/N9YtHF4XUIxGebA/jvoQYpp0Dq6HtpJJhdCn+o0nus
         RbOjPzwyXprpq3FtdNKGG1/Fw35bfvaJLriMe+11XTPjukzaJWddEFItDjsflW5+62cD
         k7bw==
X-Forwarded-Encrypted: i=1; AJvYcCWXpVDgpmN/xm1dgXgcSUbVE7Xzl23byGe08cp0vPheBHkRGMpHxntmbSh0M1vyKVZWcoPoZvsk7JQ8lhNU@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkrVyDJQwo9NC4NB+CnO8rqxCZINY7/J9Udgv48b+GHvDLu7g
	LFPyOZoZP0fLO3CxY/J5wm+mClpSw0md0vlUqeOZai7rqT2SlehfG51TwugE/Co=
X-Gm-Gg: ASbGncuZnpcch1dThiJA78xo4hqdvBl9zVCGAsA2mMr4hq/mspFPKRzhBjVR9DdSs0z
	WvGTYi4+ehjAmF8tx2nHVIqHUu+UJWCw7U0t5FFDLKJGQXToo8cdR2+6/JvogOI1opDtm481i3Q
	SRtKgP9NCZ7MAaTC7GaK2Ulkfy9CJZwdUCWyJ+YgouMbc6aDFnh8dI1l3xrhahwvHm2/AyD5mOb
	/LoJcCch+NR54bAdGgHnGT3VFua6w27g7atEY7WoQcMWeGWCwLXftyZqK0CuCrKWhANZ+nu6Qik
	7ZGxvUtaz5MjrCthIcF4H/SjBkb0NL/ZNCVg8nmuq7VCswRNGtUq8AW/25BGTCdYioa5nt9iWC0
	8YILKOPdsDQ==
X-Google-Smtp-Source: AGHT+IEJ4vU8prXmzLSN5mk9ksAdjmPcFn2w8rEFHTB4zYx6IwyrLaLSsVIaikyfHr12C+NZTNoQWQ==
X-Received: by 2002:a17:907:9624:b0:ac7:391b:e688 with SMTP id a640c23a62f3a-acb42cc678dmr478100566b.58.1744897290726;
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb608b1378sm97199166b.78.2025.04.17.06.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Apr 2025 15:41:29 +0200
Message-Id: <D98YGSPT9OB6.26E97T9QSD4NW@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robdclark@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, "Rob Clark" <robdclark@chromium.org>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Marijn Suijten" <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "open list" <linux-kernel@vger.kernel.org>, <luca@lucaweiss.eu>
Subject: Re: [PATCH v2 08/34] drm/msm: Remove vram carveout support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-9-robdclark@gmail.com>
 <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
In-Reply-To: <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>

On Thu Apr 17, 2025 at 1:20 AM CEST, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 07:52:20AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>=20
>> It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
>> mention frequently broken and rarely tested.  And I think only needed
>> for a 10yr old not quite upstream SoC (msm8974).
>
> Well... MSM8974 is quite upstream, but anyway, let's drop it. Maybe
> somebody will write an IOMMU driver.

msm8226 is also using this!

Sad to see this happening, but I get the reasoning. Unfortunately nobody
who really knows GPU and IOMMU bits has looked at this in recent years,
for msm8974 we (mostly Matti Lehtim=C3=A4ki and me) have a semi-working
branch but hitting random issues with it.

Would've been nice if somebody made functional IOMMU support back in
like 2015-2016 when more people looked at this platform.

Regards
Luca

>
>>=20
>> Maybe we can add support back in later, but I'm doubtful.
>>=20
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
>>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
>>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
>>  drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
>>  drivers/gpu/drm/msm/msm_drv.h              |  11 --
>>  drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
>>  drivers/gpu/drm/msm/msm_gem.h              |   5 -
>>  drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
>>  10 files changed, 19 insertions(+), 287 deletions(-)


