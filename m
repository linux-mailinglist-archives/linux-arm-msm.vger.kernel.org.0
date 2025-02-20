Return-Path: <linux-arm-msm+bounces-48740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA7FA3E1A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208E2166E44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1003220D4E2;
	Thu, 20 Feb 2025 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imxWhsdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05A1DFD85
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070678; cv=none; b=umxkeXbwvEcgLRg00jQg7JlWx/4yo9KEQCEXbKOqZqX9xm3nJVT6GMoi7Zy1qwepBRvqO0mbVoKoEnk/woWzwta2day4QJucgSeAY66JxlqV4xt+MwQxwvkJ64ACkuBBh/ssZQcd5vTsiug8wX7kD+3U9XsaIqqZ23avrU7CBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070678; c=relaxed/simple;
	bh=5JtfmGOicW04al1EGAJOYw0ML135NPF9yS3PcFGnjN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4IkgG2E8SXUvb1Zp2bN2byY1TPtUap1rw4Ib8afDdhRL0CrhB/T77cD8MXg24BGozqWuLf68eqErBGm843dPVTMAs7J07XXNlZBu93YHmOIAvdPO6uH+Ur/i1oT2rrXOqFE2GZ9AeHtsADJJgD5VW+xLBwurWdl4GvdpZWAz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imxWhsdc; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f8c58229f1so10932497b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740070676; x=1740675476; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQNdnw8eZcrMXGZ8JezKGVHSn8lKXmz+Y4gt/ozVgyY=;
        b=imxWhsdcKPmAfS0pvHjf7vKwBi0OSZxi08cTK9hPdblU8Clo7MQwv0k6XWZFDO4F9k
         qCBC/TswOy14n8hmy5XkKDhNRE//wqqFALVEQQc/hv7eSYBTJuCthhWErQd0lHLGuTon
         7aaWHoLbCR59y78X+MNM/Q3SBZLaxUteffUXyD91a1oNsy063Zh62n3pg4cojasCoKRH
         TJ4wHpr364v4deD+ZFEpIW8kWJTnxOc1f7Bn2/q4VNZEk2cQpn3zNjlpTHxp3GdP/viP
         ogcCONmFnIQYZx00IE5c/X3Xlx/eH6tmONCQvpCo6P8+NdHVGcHKKOt33mZYJ3SFgOBh
         moMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070676; x=1740675476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQNdnw8eZcrMXGZ8JezKGVHSn8lKXmz+Y4gt/ozVgyY=;
        b=qpCxSBC11WlLsibFyewvu70lBfivFndPi0ttfyDe5+4g74l7/i43D2HHGdPxz/ZD74
         ksFnr02pFN1lPcQiRBqOj4339sVw+hZ5YWAA32yjCr+9pBmNqiVjsxYp01RD2+KA0b1n
         Ut4lo1E36fZG8Z2dXFVjPlbokTBEiCM8Cj4IBs2N+kUmtD8t7pnjr84shSnC+eWIIZ+l
         JHXtzAMzu7mR55hsLOMGWpiS93f0On3kRtz/Esp+0YGrkoeB4JYZfNbf5pkfTPjI9LY4
         vBbj1bMVwf5aSU8vY58XG3DSVT00H+h5v7fzV9L0/mbiWj4/Y2iXxlHonTJfk4tNTb0k
         v51g==
X-Forwarded-Encrypted: i=1; AJvYcCX/GM/hZ6ui+fPpsKI5gpB5Rk78tQ9LllJywKGkYuFhYquLGeUyu/Q6d5LOp/ky6FNtV0cINITZJrpzPzXF@vger.kernel.org
X-Gm-Message-State: AOJu0YybYoqIp75Z2kdg+ukIA+M1+ovn4aETplYywk7lmyHqazKLljaS
	34/Ic55Q7MhVv54nMWGDKNzvOZ0s9VvXinbs4z2MleqasfvGhohw/rZVFWEWoek4nulnzhu3TR5
	YOUXWhH9+he9587an/8El96napjoPOZN7R6PBLQ==
X-Gm-Gg: ASbGncury0OgfciJCV3Son7SZlIZr4N37z3ZaI6w4AqTFe8QqqDh8mfgiM/TyXr/Niz
	FCnri2ttvRINjTYRG8owGXlQ0IYl807ILSC0i7aC3WcZgnwFVqz4KGgj4A/P3CKJjHEsLYXnEAd
	HmFeHpHV6uBbY=
X-Google-Smtp-Source: AGHT+IGTzwdM7XAGbT4Wb/bnOnPG0YkAOA4aOQm7K+g+wi5SiNeO8OVb3mOzmK0qbEZl7WVYr9JV+AZdIttBgIk5bNc=
X-Received: by 2002:a05:690c:4d42:b0:6fb:b38e:2076 with SMTP id
 00721157ae682-6fbb798d491mr39535587b3.11.1740070674841; Thu, 20 Feb 2025
 08:57:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org> <20250220162847.11994-5-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250220162847.11994-5-srinivas.kandagatla@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 18:57:44 +0200
X-Gm-Features: AWEUYZmKSThXa-h2i8izvX0JkpbHRtsDXDUdPOdCOOOy3PX0YOtduln-ftn-Tik
Message-ID: <CAA8EJprX9j_pTXxC9o0RGTNgos6ao2aLcRKsgv3pfNAQOrbChA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: qdsp6: q6apm-dai: set correct period size
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 18:29, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> For some reason we ended up with a period size which is less than 1ms,



> DSP does not support such a small fragment size. Adjust this to be in
> the range of 16ms to 32ms.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fixes: ?

> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 7466fe0c661a..049b91fd7a23 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -21,11 +21,11 @@
>  #define PLAYBACK_MIN_NUM_PERIODS       2
>  #define PLAYBACK_MAX_NUM_PERIODS       8
>  #define PLAYBACK_MAX_PERIOD_SIZE       65536
> -#define PLAYBACK_MIN_PERIOD_SIZE       128
> -#define CAPTURE_MIN_NUM_PERIODS                2
> -#define CAPTURE_MAX_NUM_PERIODS                8
> -#define CAPTURE_MAX_PERIOD_SIZE                4096
> -#define CAPTURE_MIN_PERIOD_SIZE                320
> +#define PLAYBACK_MIN_PERIOD_SIZE       6144
> +#define CAPTURE_MIN_NUM_PERIODS                PLAYBACK_MIN_NUM_PERIODS
> +#define CAPTURE_MAX_NUM_PERIODS                PLAYBACK_MAX_NUM_PERIODS
> +#define CAPTURE_MAX_PERIOD_SIZE                PLAYBACK_MAX_PERIOD_SIZE
> +#define CAPTURE_MIN_PERIOD_SIZE                PLAYBACK_MIN_PERIOD_SIZE
>  #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
>  #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
>  #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
> --
> 2.39.5
>


-- 
With best wishes
Dmitry

