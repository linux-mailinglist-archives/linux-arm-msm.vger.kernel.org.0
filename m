Return-Path: <linux-arm-msm+bounces-85377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F225BCC3B36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D34830CECF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204AE2EC0A6;
	Tue, 16 Dec 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXYAPBj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF33271F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895520; cv=none; b=AfAJDNVJWNv5EpDOmGTipxHOQywijf2ECq4tpU0TVNenIKoQUF8r5JTbnAa2v2AXKvv9RVngth+wkHG/VfqOOEiiUAl1UV4riEd9sJHWtm/JTbqCWEWowgwPnYf/Ec08FRbbna+k7O7hFJEfVSJEXiFKY9gfMLyIrGPS7oafFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895520; c=relaxed/simple;
	bh=ZzNov03F7y+cUoSrRCIHW1mWWECeKZAXm94LSetcYY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyTo+kFBQWuaOWdz/YpoHyERhIEY3+7Gw4tjli2Nsq9bhkDQS/DlthG+6h3f02grwbP8p+5RJqeBGChpaMD/JOYLgPdY7VxoDXMF4GSWdkGho1Q5PAWpA6r5BL/+w+qUmA0sHqAZd2ZYGiqfFO9nJnkaDa9MiJV9h8ggy90jypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXYAPBj1; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso35771535e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765895516; x=1766500316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrvW6xI1XkjYJ7Zx47OyO1gNTKJ3KALebK0l5/GjGy0=;
        b=JXYAPBj1jiHg9q68O9MAGEy2jn6xZpaV5INbWT3XfODTgKJHss/iv8huw1EskdfIke
         0TT+Yz0QyHU/Hl97j15umGCQeHlRVGvCrfiDOasR0eoKQxpJyKTYpkpg6O8BDBct53Qc
         /9pBWdjq2r9aaKoDm9JyCrl2enehli/JfI4/86nNQ2sOgXPxI4tmEsOFYcIPCnu7ckNZ
         1Kk2qLzl4tNTRlsJ4v1iNvxoEOC0WjKfqX99IlrAoYnhscI6L5KBmxCPwbc902xD9L2Z
         S6+0jT9v340/TFWixJyQkQqmiYslcInjR+3TFxs1k7p3EPtl6rPGrRZjz9U1XatNIFEO
         kUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895516; x=1766500316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrvW6xI1XkjYJ7Zx47OyO1gNTKJ3KALebK0l5/GjGy0=;
        b=E8tC7z0Vv3n8FJeVh2QCeoKaLXIDuRcMiswUbpK8QIUiCCx3y4i3Yn1UhBQG/a0Scr
         zGKZuFA6r9m0stl1l7b95hQZmuEThHl7SbgOlj84d0Sw+8iUEXnOUVn8Hum911+YA+1t
         jUKoHVj5urAli8zAjslJNH2xOhlFU4c/dcmgS7ThOXc1fGiRlWwdQkFFvUBliskpP85/
         5GBeYBAm9eeQOxoBjGTfCVcPeE/pbYFPLw4CzWveAKuZ4BktHQBVc+bHNjiQ4kkakQwR
         nnbgX/z1TTkKsttKel/skN2ASSC+M5HqYBwZC/0UvxQPtWFm9heTMfeSJEwvj1iNz3WO
         sZWA==
X-Forwarded-Encrypted: i=1; AJvYcCXzteaKLXaEpnsT5ylFfD6GihlMp45QpxrGhih1jRJFZwp+y5ETrmkgUvnrFThIleQt2K37LxxOfEWqyv3e@vger.kernel.org
X-Gm-Message-State: AOJu0YwqP5G8M5pq8Ei6ubP/eiB0HlyVRpI+RQHYygQie0Ia8TvPiZEg
	wuBYjlW9Q84Ec5s7urxp0LzRy5lf2Fu+ZKNUKR7va4WBEAquBBsediGr
X-Gm-Gg: AY/fxX5kq+XfEEZ2OQUVoJFYWL0dlXdjmezZZSeEec3a9neMvGBpXHV8w6PhSYRD5oG
	43s7y1bTpwwMPfmKJbkPYHVTXI9wvwEf7z4su4Eq96o5G3NmvCserRlfzsa2WUvOjbW8YrXqU2A
	obkFDv8tHIKSCiM4fWjj7lFeZUq2A+XmRUiI10oA8D0FrhXDz2UOYuMa2Vw4OcOMimPl1ckyDsO
	wjOkV5/GIsaNjvbxxhaBr+u1NRSF3brvzPBFy3Q62R/iyE/wClZL2uLDNuFUK7urUiRTSjW5KYF
	xNxFxPKrTkZMcNkagG8F4ki1tmrAvXwzz+n7xDjVRQtXcO+xJLdHEiqTCZoKXocDHo+57mqpwTS
	CCxyYy2mMAUymlLwgC0Z37Ov+K7lE1sMjSNWiP6mocdCYSpDop+JiBlmzJbUjGgQ41eRal3S5EO
	NAXOTjuBg9XSjBjQbeVaVtjw0mFKB/IsMGvrACjFyixE5M3riZdf4CikJ6MDAUepstAY4wPdHsb
	frLcmj9yNLlqvy4Rp8=
X-Google-Smtp-Source: AGHT+IGzep9ECZOwaPNpiBb0/p/BCg7/qLnqLf0vDlNHlWftA8GOgxq/kseyAt169pupxPA5dddF1A==
X-Received: by 2002:a05:600c:35d4:b0:477:7b16:5fa6 with SMTP id 5b1f17b1804b1-47a8f89c85dmr179474045e9.3.1765895516300;
        Tue, 16 Dec 2025 06:31:56 -0800 (PST)
Received: from [192.168.1.3] (92.40.200.39.threembb.co.uk. [92.40.200.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4ef38bsm259154525e9.0.2025.12.16.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:31:55 -0800 (PST)
Message-ID: <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Date: Tue, 16 Dec 2025 14:31:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
 <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
Content-Language: en-US
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2025 22:15, Dmitry Baryshkov wrote:
> I'd suggest following i915 and writing DP_LANE_COUNT_SET before
> DP_LINK_BW_SET.

Thank you - made this change for v2.

>> +	/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
>> +	if (link_info->revision >= DP_DPCD_REV_14) {
> 
> No, eDP has separate versioning register. DP revision != eDP revision.

You're absolutely right, this was a mistake.
Does something like this seem reasonable for v2?

	if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
		u8 edp_rev;

		rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
		if (rc)
			return rc;

		if (edp_rev >= DP_EDP_14) {
			// parse the rates
			// ...
		}
	}
-- 
Best regards,
Dale


