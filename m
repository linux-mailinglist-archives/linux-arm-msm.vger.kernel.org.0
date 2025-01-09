Return-Path: <linux-arm-msm+bounces-44487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9DA069C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 01:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3451888C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 00:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B60A173;
	Thu,  9 Jan 2025 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odkfr45h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4410C4400
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381188; cv=none; b=mM8QzWRkvgtbIOS9jEtLfAeBPfRRYpN2qP9TNW8eeAJqHbWq6b6HC+vbeIvxwrEuoRuXVmdNSNl34VOpCFNyYx8BBPB1x4R7SXtO+i5WP2XrxnjsaYM+uYyEgO4xzDz2lwgaFGe8U0SHjXak9gSXDP841ddE7dGrn4K12J/jDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381188; c=relaxed/simple;
	bh=OlHtHwDwEdJW2kNSI+q8ogVq8iwMKYXaVPfZYfJll1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAoJGM599W01/TaPR/FRuqK6Eei4ozP8Wq6XWZOZw0dEbonjTMUnhc5l4JiwQDzfUKWC2QYoFe39JbV0SDuWvIMrSdxQ/aWUkffzzF1NdbfaTN/bG+A7veqtsAJwoPv3m1deFqU7IXk+AGsvlg0wqU4tvM+yynQQnzw0PjJHNO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=odkfr45h; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso285495e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 16:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736381184; x=1736985984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpDkH3lxJ4g2GFbV3coZXIbv+IWPbixM4fhCIhYbzhU=;
        b=odkfr45hlXXZ44sWmg6v4d3SlH06gfFy3FqUGhbTnCPqXkCk/N/ejD9SQxcdIp8k7s
         H2Lk1hSG1UJkzi3h1xX4NIHi7SCzGVVZIdtSnYUhxfaJx7ej3qZV/mAJVD/2RuXKey0K
         D0JM3GyZbhoaAKxhYH07FKG7CDFFfx0tiHb2X1egB66d8I7e7EPnWnPrJJqJSGP9KDHC
         jt29zf9PgqcUXKq/oJNoszimAe/hyXm3Ts+3q3m0QWbI3kShTf5YiiIWT7HmEVpYkS/U
         KZEWRRVcyJo2fx6rDXjYgbfue9Gq1eewcVmgr7AhKaQJemXP5DwuaTqEdfiQcolck4RI
         mNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736381184; x=1736985984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpDkH3lxJ4g2GFbV3coZXIbv+IWPbixM4fhCIhYbzhU=;
        b=WnuplXKoYzEsq17CPzvOT57MpHsmw66R3oQe1VQWdqszC2Bz3a2Ov7RwWPFBWeod7r
         FKDksf0ilt6Z2FRhieYC34oOThjvXIjTC4DCAJz585VIGVYk7K+ngnzJkEpKYeKRRePx
         LZxlxCbbhM3nbPdJuTkSupDUGipzR6pawFhbp2KRGb4XGlysGzsFy9O3vLfZ+UuZH+Yi
         6tS0iGnyCJlH4rSIgqLEl1gyJaYMrRWBR0Wvng3c4sFbtMP6LGbys91Ncnq8b9KIj3mE
         Z9U0qJQmyMJROGxcMXXMMrUPosFR5COtwqhomIDdS/VCI7+spZupe77EmTnZt00M+uV0
         KkNg==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ypraqr23fFFlWsi9J42kIvGJYHkURNxQHDL+4Zw3rGxV8wgBiRU5ktcmZ4NaoUw8PyKsCZZ/v2lbWGwj@vger.kernel.org
X-Gm-Message-State: AOJu0YyrI5knGy+NklBuwc+NaBlMjz3wiyl5xhoaomf6bM1jhnjG1P2b
	aL9B5m+ESmmGtAHvKO6ZW2ZnZWhfg7PJ/Cq2X5CMMcH09EOD+MlvdpXdRJAJbZU=
X-Gm-Gg: ASbGncui+TZoAttn2n9nxZ9nyu1jmxqYGIxR7WZ3cysoWHJJ6NritYkfnWjjp4jDuH3
	tp405Nn2km1/DKqttXDsm/l9KKIIV3kV75djuojg86Kx8ewt3LWBIj0VuxIA9k+yTx6SuqNtp6E
	00ekt8wFjA8dPTpp9dJh1CHhFJbAq1S2ovuN8X1Db8q3VGMajh0QK8/0xunQkA02xQ/7TeqfRQ5
	m+Cd+IJCmm79I9eifo0sjCgmPc2RgTv5Pj45kVf1GYJpiPJ4UAafZjoGj9hBY8UVRQRZV590ZiF
	TIYcNcgioK+8lafQiL7ZHLVeYphSq8hjgNKo
X-Google-Smtp-Source: AGHT+IF/y9uUzQydethAVpmH3oNgkVrcF2saaYHkqvOZukLpQEeojH3C6FDQnmUp2JA4G+6GtEX36w==
X-Received: by 2002:a05:6512:3ba3:b0:53e:2f9d:6a73 with SMTP id 2adb3069b0e04-542844a8f6amr1336553e87.0.1736381184452;
        Wed, 08 Jan 2025 16:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428beaaaa0sm29573e87.175.2025.01.08.16.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:06:23 -0800 (PST)
Date: Thu, 9 Jan 2025 02:06:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: Drop extraneous return in
 dpu_crtc_reassign_planes()
Message-ID: <5m2t3srguv7vha4e7np2tmd6tm4ajlk2dzc2vruut6krern7vx@ylmjghtj2kbu>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>

On Wed, Jan 08, 2025 at 02:40:48PM -0800, Jessica Zhang wrote:
> Drop extra return at the end of dpu_crtc_reassign_planes()
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

