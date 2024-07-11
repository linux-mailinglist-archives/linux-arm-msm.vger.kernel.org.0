Return-Path: <linux-arm-msm+bounces-25948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1989692E4F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD11B280D4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7A415748A;
	Thu, 11 Jul 2024 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzDk7b7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F7156225
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694536; cv=none; b=GzFFccXLrJ+D5jbB6XPFlMZl8G2Vck7ShragyCszxLplYcZHen9DW5v4gMtpV31mSv9kUrraQM9JPUfCwvHKT0XgOYxvVJufCMeIN0eIEikkZtEZGy4fAY5Fq+qilg5IdAgPCJSfC91X0Z9pW536WWTvR9DrAqMxOtpWVJruJMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694536; c=relaxed/simple;
	bh=U96uAEEwrb/sj5LnOKS9rX/+t0nhVAh5wKtzNWTuP0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqnywqvzSy4XkfPZrOvxDbUwv+z+6LJubc6g8N0kFsYPM2FVZRlFe6q8fNhRxXlrYZD0il/2FE8gcOczOZwmExLIl2wmw7PzUy2RKLu7qBS8wNC5JKkrLPlMytih+j9ruhASCGC/BEHoh2rzkLG3cbQIbhp2zDbgcQlMHdz0qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vzDk7b7k; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58d24201934so1277561a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720694533; x=1721299333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PtxqIAWIiTUKLX6AXhXVggOKB10pYOSotqE522q5edk=;
        b=vzDk7b7kjO7Rv/QifSKEEGNb82fgT7sRjGucVwW3WZqxR7EgQxDYVN+kMeIai1PGue
         HOTCeErGIAA1g9qetcmoCwv53BZJAddXxBXvp0IxseQZ34lgmLPoxuoU/V9s8KG28Siy
         xvaYZVhWV/dO3pw9gtZMJxVF/F00XDvF2cH4itb38S3E97s/UVMU00ba8t31o3CGSgOz
         qJeEPK9hQo0bYyV+4q2qJeCtH9qyDj/2YHBZHrydAU5VkUY5k1rBOzHZf96t0G1d/ARZ
         4NOfsbOt1MCgcxgxkudOMhVGhVnajrLN1ZAxO9/wOUOTTz4+s/4pQzd51MmSb3sDGG6a
         CaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720694533; x=1721299333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtxqIAWIiTUKLX6AXhXVggOKB10pYOSotqE522q5edk=;
        b=txSmkK510XZ0pvCBqpETqJIcQtTk94OnQaxfYrOs1M6pPm6L9diuq+nBOGA+wWUr4d
         60ux9LWpGg95ju/Oh4EK8nU0F/8gD3IM7eJxu6fQywLPaC4jjGdsaCBxFW9lkwd2BZNQ
         YXSC57ci1d6/xfGQAOMy7Bv+3ZuvIei3FxaAuEtUJ2dlZUJJVkbVDuzf3TbUOyhqEw8q
         bbUTC4ptRA3UmQmrQ7fBecaaS61D8cEiyjn9gYFzcd/gLBDTgIr7Cm6Xp94GNv934IM7
         A2ABqPrWZ4ddJUMY1hcD5TYzdreK/2Vj7wdEt6+49ScQPt7i9pPVTV5qFkGSE025eSii
         m6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXGXr9p2YF4ps60wn8Nkmf03SUViwFEYR95JNv//X9IxjhgHvhK6C14oMjX+qLPtBCK7+CsKHaF0hy6h2vzc4cD52wGpyo6JeNajomNWQ==
X-Gm-Message-State: AOJu0YwWLKtdgyyUxk3WNAU7QLf5sis0WIbE5cqNjJnDQvh66nDy7dsh
	GaBegjxUMSNjEsZ4XyVB5ZAfxNdKn6MrGCDWo74+YAZqOmxBEyXg8AFFDAy1FSk=
X-Google-Smtp-Source: AGHT+IHk9aH+XY0uDq3os2yKd4DG51Hj7jKRYmxb0lTlr5Pw9fdKfxrwFD45/AkbwDIihG4ST2Px9w==
X-Received: by 2002:a05:6402:50ce:b0:57c:c171:2fb6 with SMTP id 4fb4d7f45d1cf-5980c8f9a89mr1901423a12.1.1720694533179;
        Thu, 11 Jul 2024 03:42:13 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bba54b07sm3293826a12.14.2024.07.11.03.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 03:42:12 -0700 (PDT)
Message-ID: <5c4b7519-50e2-4de8-baa6-39a328886d34@linaro.org>
Date: Thu, 11 Jul 2024 12:42:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on
 resume
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-3-vladimir.lypak@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240711100038.268803-3-vladimir.lypak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2024 12:00 PM, Vladimir Lypak wrote:
> Two fields of preempt_record which are used by CP aren't reset on
> resume: "data" and "info". This is the reason behind faults which happen
> when we try to switch to the ring that was active last before suspend.
> In addition those faults can't be recovered from because we use suspend
> and resume to do so (keeping values of those fields again).
> 
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

