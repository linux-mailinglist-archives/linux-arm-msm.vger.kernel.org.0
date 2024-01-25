Return-Path: <linux-arm-msm+bounces-8328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE8183CE7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E0FCB2524D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F16413A242;
	Thu, 25 Jan 2024 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KytOvXOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7D45951
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217926; cv=none; b=Dv8FJPhrqeacxdKv5caBxRZYd7G+IsnJQ+5apfC/ROXG5NQbypLqxHRTlJ5rAJLZblX7PJNVfExfHWNJGNu9q2A1GrQFpA6Vtd2v8BZIAxK1XQasjKOxVGpdIUuN68KWY9gFCNAMLN2Gtv9B+R2WY81T3V3h3GMXdB8AsghGcNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217926; c=relaxed/simple;
	bh=C1v9i/iEF/1SJ1D2i8eyOWyg1oNEQJ7dxCByIh2Jcrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jY4ZFT21si9FD6FHthakAQLjDB2cCOZzCDve5lqneMCbFY2CPjfKAJzgSiIFm6SSOMQAtN8hlaJ367YXGFNuGdt/GqeYtvqS6pyP9zlXuqXjQcOyjH8mZVnU3zReX+9FS+P240xDTnoTes2sgBOuiO7ChvZhmDF8Z3DfIUIYaGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KytOvXOC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so9192068e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217923; x=1706822723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elhkM67Cs41lqcgNbIlfKX6XP6h0qgN3PQBjLF+ju3A=;
        b=KytOvXOCYyEUNc2VPbWebL43I1oe2leQ/d4f2rJGpEBm2d69V6XQhdpE2RQYo1NjWM
         Liw1fdHBAdCqx3sZydt8C+C+CSrsu+Ey/rgZGJtk5AkXipX01i75OldpG/nZWy7a5Y5f
         0IPqTD8VkmEps0sEGMReOJyvy46MY/nCQfTAqVi8II0eMt3UBA6A7oI/sqQca2Ev7noD
         DeQyzkqHFM7HNb97dCTdSSJfbEa+qSzjymSff95OxcXZriMxJKE+4nIhHHChfbrG3gS3
         GjQpkZ/o2Lcw++mfwW+6yhsg326Y4hl0BtnFTE3oaLa/jY0F5Z/hAo+SLx3FSx1aQFUg
         YVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217923; x=1706822723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elhkM67Cs41lqcgNbIlfKX6XP6h0qgN3PQBjLF+ju3A=;
        b=Lcr4KGbZYcmle7KljtoPqIoIyjIF6wO6adQx5euHLYeyatHA200pgwUbALoxgf6+1Y
         Yj79ohJwQiKu8V7Y8C484mdhyHITX3iR5tOkABgShywkmFC9mpP15Nul3rUYHf0etKOu
         QyrscKDwsMtGC72QWdrKeAYvdyjxWBSzl88bz7A60LKwNINumolsKSYDbUZCb4TOlMeh
         qHlmRKjs8keES1DGWGUrdG7WFCbpyIE8XUGn0Ho/fDdpJGJfrq8sg9DOay9/fiaBFUKx
         4FSi7vLkebQk3zHbvkJ1S0aDYWofRyfStMh0eEE8QCJUVLsAKXHcHnxMv6VtYSizaDFt
         W2wg==
X-Gm-Message-State: AOJu0YzV/zoeKHTj0Brtzgo/J6CZLxLypUBoKf6c89zHPGKDWEm7P48O
	eFV+ZG6NnNY1PwZPq4DSshSpvR/DmUcw3bWCOCsIR6D7KQRxGffXdMBYUNycfVF+fJZz+cxjpuj
	W
X-Google-Smtp-Source: AGHT+IEOuxkztSIJnYC1jb08/V2RQZbS0ao9mVzPOrthmoCIzMInt3pHZk0TJDqBccE0bfSeSmnxJw==
X-Received: by 2002:ac2:4342:0:b0:510:13a6:8af4 with SMTP id o2-20020ac24342000000b0051013a68af4mr219125lfl.122.1706217922701;
        Thu, 25 Jan 2024 13:25:22 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e22-20020a196916000000b005102196b586sm131568lfc.152.2024.01.25.13.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:25:22 -0800 (PST)
Message-ID: <9061c7ab-8166-4d8e-b706-9f79474aa97f@linaro.org>
Date: Thu, 25 Jan 2024 23:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] drm/msm/dpu: move widebus logic to its own API
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-7-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-7-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Widebus enablement is decided by the interfaces based on their specific
> checks and that already happens with DSI/DP specific helpers. Let's
> invoke these helpers from dpu_encoder_is_widebus_enabled() to make it
> cleaner overall.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 29 ++++++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +++
>   2 files changed, 20 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


