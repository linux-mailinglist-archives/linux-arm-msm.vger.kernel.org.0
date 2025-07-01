Return-Path: <linux-arm-msm+bounces-63286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F5AF03F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 21:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B528B3BFD68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5539283FEA;
	Tue,  1 Jul 2025 19:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="axmLaA6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936A2283FDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398730; cv=none; b=qgyXZByn2jNdXmHeMDeafFuCmjChAuKcxJwPOfjmC6fdEVDXMVyyIGfbvxBDbV4o493ZD9ik5JiadhbjYCn4ngs5gmpW9+LpcMF/tisbIKbOxqkOtvYqlDftnDiAtQ3s1kifep23ipFo/CnAtQaX1VONIJf6wZxxMyjFbuxzZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398730; c=relaxed/simple;
	bh=jdSJbsMqXjRs6rof0VNrFHkz8yb0xjXpNi8/6LiUtHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZeBCU3y6UPwGTNvTOP9+dPPyQofyghb8ZRq6o+32cEgaxqSNi53FloWldAvUsEcLQ+Ed7cX52Ew1w+13eXM/sMYH8t23CGzdC82OhKqdUSS9HHSkMp+Xroe/SV1YPoEnWhox1ocsNn7sGQl6ul13owqU/zyPfYY04EGviYg6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=axmLaA6D; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-875f57e0cb9so545643639f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751398727; x=1752003527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
        b=axmLaA6DB3mTphLIx4PPP2+/qWYKOrOtKm8HHAbXn8gGF9iyGlVlH7JD1GcUFVdCrz
         ratib+upR2bTw7chL2QN98nA7sqvNEWxxa0QnogZSMlCQ5qxjlpY9rpGTzDiCIVZzr/v
         1Qpz2h/MUZKrPSYEPTs3bpduAru2xraEG5+W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398727; x=1752003527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
        b=DUIQ3oWuLjOEidw5K/mmCjNU7zSX2Oh4ivj+m6bN1vwLZiyQdTT0ycK+2tXL0IMeC5
         Qn5NKLt4Cq0YdsIlGo76x7T2UjHIG9FTUpzIhKNBVDso+22KDOGkyKVxgkT+fx4tgXgB
         ZDYGYcEzSEkEiH+BgoIoGzhCDViyaJejZJSbZNhXFp/jJFsF+NQ75PyA3/fgJQcgw8HE
         MCQAVRIHcpWiuOLKDcIa7g0ygzdUfw5+q8W7ak9LV4wsw2oGm2ZiSfyTVa8SrcMbnPxZ
         T4GAeWDaAZnbh3safAkA/c/PnUZU5gr/ZZvj53yLkNkw6Xx5kVmhydhWt59NH/wVUWev
         NBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEzYNiQGhFpFMn5iBa4hY3aYBxOh5JVlsKbYkHIz8e2cdt1EPPqmiTTmlqFnMUzShO3HryMcWOvmxNJQ5h@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZuMFTQ+NqDwJ28m4tEOqoIV+gz2TWAvxavuXYXF9SF6xTGEz
	GX1qU8aAKZZqobzrLNJdgJ48m646eV8jPY2iafWOyRfUAg8rDo6B4j+dQZFMHEzK/FM=
X-Gm-Gg: ASbGncu0rmidx3ZRujbmLyVHZZNsxQtE46fSjxOx/7/lgHLh79MI53v7Ti9vCsWUpNY
	obVuiqIe2k26d/ifTX/Z1NUkf1zcUTOmyuCQSjj0LuDKcDhDex8GSyKSQ9MZfnHal9vP1TXoKVy
	b1+8lUzIER6DppJEu2GL+uLJ8hDOevEyybPvUYetEmvUucxtLdtDmjZ+Trsi6ioXRuU3T6iFecN
	AlJRYS17Xp+Cd8Oh/0s1u7kPBGJtaW47Lnuc4S9em10WavPRR/a3dVVOpMDTUFX5cauXSW+IJWT
	zcJFICVV7qhh6LYtkkfJAgQ6RJrRypcew+THF3PfbY0/C9MAj4aJ9Y7J8Ga0lPmFVMNnlyOQGeo
	kI1NymYmM
X-Google-Smtp-Source: AGHT+IGvl85HXknFk5WCMqL3KGp3aOWaEvzVt6Rqv1FGK+Z9f2Q+2wtZthqKmGchchXpQiY+DMOzSw==
X-Received: by 2002:a05:6e02:74a:b0:3dd:b5ef:4556 with SMTP id e9e14a558f8ab-3e054a307fbmr3075225ab.18.1751398727532;
        Tue, 01 Jul 2025 12:38:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5020486ba41sm2570574173.28.2025.07.01.12.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:38:46 -0700 (PDT)
Message-ID: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:38:46 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: I Hsin Cheng <richard120310@gmail.com>, robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250623184734.22947-1-richard120310@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623184734.22947-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 12:47, I Hsin Cheng wrote:
> According to the report of Coverity Scan [1], "sync_file" is going to be
> NULL when entering the "if" section after "out_post_unlock", so
> "fput(sync_file->file)" is never going to be exected in this block.
> 
> [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d4f71bb54e84..cba1dc6fe6c6 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   out_post_unlock:
>   	if (ret && (out_fence_fd >= 0)) {
>   		put_unused_fd(out_fence_fd);
> -		if (sync_file)
> -			fput(sync_file->file);

Are you sure you want delete these two lines? It might not make
sense to check sync_file inside if (ret && (out_fence_fd >= 0)),
but it is ncecessary to fput.

>   	}
>   
>   	if (!IS_ERR_OR_NULL(submit)) {

Check the error paths carefully to see if this is indeed the right fix.

thanks,
-- Shuah

