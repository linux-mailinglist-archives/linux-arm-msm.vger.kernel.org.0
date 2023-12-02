Return-Path: <linux-arm-msm+bounces-3048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BA801EE7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38E20B20A9A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326F021A14;
	Sat,  2 Dec 2023 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G9+JEoux"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470E3FD
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:06:58 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso6694371fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701554816; x=1702159616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EEqQbM+NDSOnW/8JPVObWqPerbfzPFaOO/AA0Ia5kw=;
        b=G9+JEouxkAouKw4ujbTYvYS89h2dxY6UejhyPP1cOm0Y2Mwk1YDdGSlvKpoiPgl9We
         vRWDt/dg11r9aQ6yB/5zxL8hqT6ojILe0Q4qv4oZWsfwpzIGFQB9+khvStp6zUOqksC0
         0r0Z4ZyElzI29z3gl7MQB+ReJKaw38EV18LvAUkA76urIXT3o7SimBiOGmcblP6PBCkg
         2/u/xbGSjuZEDCrMnc0y4m2a0QCY5bKzRVHnoMOlnahejLapSTgtx+F7C9jyPsBOtZiA
         LeEno1/SN2CWgwaE1DMd1mTujtj3wiZILTyk/jtEGtipker+VOZqT1jrVeS5ukqHceGn
         xkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701554816; x=1702159616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EEqQbM+NDSOnW/8JPVObWqPerbfzPFaOO/AA0Ia5kw=;
        b=JwmNxptCAmbgkXSYdmmz3ltLFL9KfCxIxmivpNPmIs+Ig2eK0BRTV7usXSdOv62hWQ
         MvSll15alxhXNLbmhzNQQCcfV08VAvRdqaZgXZuGQdQnx5dgiW7z/q4KPt7F2bq3GiKL
         YiCi+T26HGskqu4wgfqCpCbTahO98uXCQx4M+r06wUAUZ7bwS5mtecuYxqga7z1NAwF6
         M2CQG9mXqK4cATOtdbFDuh7v0jGwg9dIjrpYUB83Rpd8TC+rxrp8mDadoemnfnnxtBdE
         D7DPL45gy68VxtXzgaR9xlvHm/ZalQM491PsmHldgYk8EJu+u9x7iFZn2reltYeva6oh
         D8Gw==
X-Gm-Message-State: AOJu0Yxc8K5thycL0kCfHDARsYjCxF4K3S5jkXJRx7lROI9DJhPs1GlC
	m3uNiCG3orJzVQIqU5vmoANYPg==
X-Google-Smtp-Source: AGHT+IH126mZ0/iFlCmfP9RcDvlY7iS5lYG457fIONwriSCdsyDra+BvTashg0w9kij8AjWyl3UGJw==
X-Received: by 2002:a05:6512:104f:b0:50b:e1ea:f7c5 with SMTP id c15-20020a056512104f00b0050be1eaf7c5mr929335lfb.138.1701554816497;
        Sat, 02 Dec 2023 14:06:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z8-20020a195048000000b0050be3c0b29bsm165323lfj.195.2023.12.02.14.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 14:06:56 -0800 (PST)
Message-ID: <37daa626-6f6f-4fce-aa35-6e6e8ba2ddb7@linaro.org>
Date: Sun, 3 Dec 2023 00:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2023 02:35, Bjorn Andersson wrote:
> Similar to SC8280XP, the misconfigured SAFE logic causes rather
> significant delays in __arm_smmu_tlb_sync(), resulting in poor
> performance for things such as USB.
> 
> Introduce appropriate SAFE values for SC8180X to correct this.
> 
> Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


