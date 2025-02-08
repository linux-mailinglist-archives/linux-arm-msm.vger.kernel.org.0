Return-Path: <linux-arm-msm+bounces-47245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4DA2D85A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 20:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03BB1629E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 19:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F56719DF6A;
	Sat,  8 Feb 2025 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncY6UqwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B65E241117;
	Sat,  8 Feb 2025 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739043249; cv=none; b=sEDuYEBhX1FDapBqym/sqGrV/7HUjM/7eJgWS6fNMos8aIicAKL0f31cGGQFjk0xDEGg5HvgE6eF5WU+O+csZotA+LJn/5XN2aWxWnPlaZ3cdJOPu8x6VHWxgs0MGGsGEkoYST9Cnk1k6fkQZZFZGunPe1RAHEa+xdjbE5/i6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739043249; c=relaxed/simple;
	bh=qkvgTQQuxFPruc1sggnDJ+9xRdU/zjaKvV0ZAg8Ktuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmNeAycjC7RRjScLM7TkFThSptg3w+17S4AY5RqTEr4h2HUOHSeIVBiLNI/I/j7xwWg56OHP9+8Jp5TJU8sShMg2RkH1+CWrQdrwGVgP02cId9fTYTIL6OUpErB0DkslA9jebI0QypLDkJYCbRNM33bsq+bS64aN+Q0n6GlqyW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncY6UqwZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso20760795e9.2;
        Sat, 08 Feb 2025 11:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739043246; x=1739648046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zTCFimJ1vopwwf/s9XZ/VAGKYCECaIBDkzBMbYiPnc=;
        b=ncY6UqwZDMFmqxX6idvTC36OSe90jVtxSF3zVleni5a6UW53TCFSpmhZsexi0ZUBpt
         o39PRl+MBmaLZnqJlMXJPlUB0QJnRUJWnnAjFKkDq9dSw5ErQUbQHJOdra/Xa5tEKMVN
         TdS/18h9XXX1e3jMowzENLeUkRtWgYDoU1tCHbCW4Ve0AWUGU1Bwf6Rld58FJMpT5ZaE
         CnOBiqjfwBAU0/kxyYgf0ujVZTLdjW1qifbmEAmtP+hIc+AjcBBYJ4GA5RqWbEQAVJiw
         RP9ySNw2Egup+6sZXTCs/Rl4noywWfUKq8NliWBucFRxYOraMULGvMLUH6zgFKkKfMpx
         W+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739043246; x=1739648046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zTCFimJ1vopwwf/s9XZ/VAGKYCECaIBDkzBMbYiPnc=;
        b=NwPMemkJK/DEyZmaNDf+Rg+WLZE7tIoJqwFdZfTEt3Ka7wSJoZtnrHQnjwoOs3sxm4
         hIA+X/VWa7Xprbp3Siuy+S7yOjmXtU73cH7ERrUwDhqV5HVneD/Fgg8KAC59cvrl/Psb
         Iw/KHRgw1w9nffotqlj+/ix58QKNPnvLcQVS6+Mfw+M32P3IribZN+9Y/BfmKwY3hUyT
         I4MUUOEZ2ICQ3t7Mss5fef4pz+3ANemmXwCNK4dY02TFwd6k1OcSkaAEdog7VmrkH5M9
         pOTQWOuSrRLfB0ywQzinap05QTg3dldvUULmuQlkqGaDUY+ek/+cIPA/2rl9sahPksT1
         OIYw==
X-Forwarded-Encrypted: i=1; AJvYcCVTuGj9VYhCLaFFE2a3f/RVfRo6Gwf7RzJSx0xnPFr5wz6FW3+k+Uxdvod9zuIuJ7PL4XzTBHWVL4GjtB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw++8Q5Ca/+MVjF38NOZLVbFn4xtDHS/e0kWQ6QT19Kmbho4jUR
	/tkYzFg6POdI3v2x650KJC75s+vrdZmVYGPSv8aIMiqGrEPPr1XjJjU0qPXvH2s=
X-Gm-Gg: ASbGncuS4w8xLLle1nQIBjMTM5YothW2Zn0Z0ufw2nd5UKADbkkDos1CSbG2CNRnhWf
	UqnyfTCZKKyAqvHL4ik9eVHOf1k0FMBrus0mfD2t0weQ7xqNbnguOEnnzYv8SGs2H/3kjUXDo4B
	RJccwirh5cLqX/lCUhPvo7R7WJCIBIH7vy9r+UK2yW4h4ER14oLegKDDr86U/kGmOsgF8CFLFG1
	e0X91K0iAecduzOJzoSCNT/sxv21m7ywZ5P7K7F4gqEOKhWxLB6//GLa+x7RavPUdg6F1sl7j/A
	FHYpxADAH142EQvT4oSIff9BBA==
X-Google-Smtp-Source: AGHT+IF6K1aGzMQrmgg2BtmlzUAKpwYvdiG4gcqs0vFrqKcS/fziiZZl1Tg4aL3qUHceV0U8RBg6Jw==
X-Received: by 2002:a05:600c:a085:b0:434:e2ea:fc94 with SMTP id 5b1f17b1804b1-439249843b8mr78920775e9.11.1739043245270;
        Sat, 08 Feb 2025 11:34:05 -0800 (PST)
Received: from [192.168.1.117] ([90.248.169.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43936bcc04fsm19994775e9.20.2025.02.08.11.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 11:34:04 -0800 (PST)
Message-ID: <7a370271-1372-4588-8be9-ea7ea93d7a79@gmail.com>
Date: Sat, 8 Feb 2025 19:34:03 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dp: account for widebus and yuv420 during mode
 validation
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Content-Language: en-US
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2025 19:46, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - move msm_dp_wide_bus_available() to the next line
> - Link to v1: https://lore.kernel.org/r/20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>   2 files changed, 10 insertions(+), 6 deletions(-)

This patch fixes a CLOCK_HIGH mode rejection error on the Microsoft 
Surface Pro 11 (OLED panel) which I had previously been working-around 
by raising DP_MAX_PIXEL_CLK_KHZ.

Tested-by: Dale Whinham <daleyo@gmail.com>

-- 
Best regards,
Dale

