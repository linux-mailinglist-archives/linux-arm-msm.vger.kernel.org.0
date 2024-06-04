Return-Path: <linux-arm-msm+bounces-21585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C2D8FB179
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A590283327
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E970D145A07;
	Tue,  4 Jun 2024 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcalEGgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F638145A0C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502129; cv=none; b=jDoGbLZMLZo4z3deIH79FBOivJTZuHoBhoerPqWEXGc4L2fKtpTjzQUCkFpS/1icTkB1iU1LuFO6Bq9rH1YH8XH58GiHZu9gGewHvDSashChoiIq+o0OeToiSxza7odjTnCpDvsLfjUzZTU/f5jzo/g7/gbxjz2VXr5UT86pd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502129; c=relaxed/simple;
	bh=yf+ydN+R982IdKmF4n3pntMyWNKFqfXc2Wo1bpcEdxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgbfowFfReBrntCjUoLeTzt42B4B8b5cVXAUI/nM8GnooemDq7NABzyEb+JsRaR9nAhLuCAJ5hRuICydEh3Japy6FJQ6nYrVeHmdnXLBORkBCHItKUrE6UMHHOzhoKsFmfvKKmzAbQfPD2FB4I4mBDdpa7DGujTfGX3QK7Orcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcalEGgD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so1132067a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717502126; x=1718106926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6VdsvIa8zMQRCvSPBfH+t7XShyheFf7xCTS+iDnU7A=;
        b=RcalEGgDgrN/x75cijpLoGLQrTHBTXBlPsq/r99yaX5Rx4DAsxs6XsUamB7Ezjrbqs
         l83HWWwBZI5A63n49YJvih+DZVClNKXrNTd63pprl1p7gmQGeLsc20DRqVpRAHwtKbVG
         TVUJWeNuDWtp/DzGbHesmxCaC7wTdut3YKo/qjlZQWpowEMKJ9bfm+MDYQ1OkkoyfrPi
         i22tYEGAcHXpPCFIKoyMGoCfkIyRbPGSaB6o8Si9MYHI1DoHzi+eTv/O7Qtzc5wUkNer
         nAzGLX1Zq5FhQX81IfWQlVssBabOz77dfz3V0lesuiJmxm8v9n6WYTn4vA0sDM13QmU8
         wrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502126; x=1718106926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6VdsvIa8zMQRCvSPBfH+t7XShyheFf7xCTS+iDnU7A=;
        b=T4ZAONgG+zUFgxbhKzKBBkZBwX9Xc9tHsjslIGRg05lRZKjlH6ko+bKX87/orvJkOV
         URsaLDAgYLvGSkus9JazYmA/A9fRs8F09YCPJgmShMPUR+d9fUbkeOGWQ9Fh1gPnApZp
         EfzAodF7EKCwOE3Jm1Qggku2M/JrDNjLj4ldK3IhZK+AdDtC2Ia9BAhk2Y0FLQ9Dxp5o
         Ub1Z7b5tHd1HdEZ+iq8zPCxACAMMHUclaZNmeH7kXHPvYPtjutoDq8/qb34cabGA5/BX
         kzMaDExRZZ/Jdf+q8T9FP/n/qLMvLrZ/nbmwZJM8f6UuFeJfgv/xWvnEk6tqknW50HSv
         +nDA==
X-Gm-Message-State: AOJu0YyAZtNrSi2R8+MZQ8Oc3TgQmId4QwP+EULPweWQlN8udZpgM5c7
	14j45StuPAiaoyQYRwHvKS1QUkaN/JmUOuJCr0IHXggC+Ytae0czyx6X8xeF7qs=
X-Google-Smtp-Source: AGHT+IFPMPPfIGwe+ITg80ybaKWLNAXwRZnyLNcFGdUR3AZt9Bjo6BQS8NFYbo5uuwNUOn4vIHjZ3w==
X-Received: by 2002:a17:907:914e:b0:a68:9621:a93c with SMTP id a640c23a62f3a-a689621ab6fmr500481766b.8.1717502126376;
        Tue, 04 Jun 2024 04:55:26 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b0795942sm489469666b.181.2024.06.04.04.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 04:55:26 -0700 (PDT)
Message-ID: <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
Date: Tue, 4 Jun 2024 13:55:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/4/24 02:20, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
> SDM439 (650 MHz).
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---

This all looks very good, just a nit

[...]

> +		/*
> +		 * Increase inactive period to 250 to avoid bouncing
> +		 * the GDSC which appears to make it grumpy
> +		 */
> +		.inactive_period = 250,

Are you sure this is actually necessary?

Konrad

