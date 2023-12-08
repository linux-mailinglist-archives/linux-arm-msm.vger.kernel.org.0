Return-Path: <linux-arm-msm+bounces-3801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDA80986B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB2BD1F21129
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3B2EDB;
	Fri,  8 Dec 2023 01:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuF7Njc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C151715
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 17:11:06 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso20849061fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701997864; x=1702602664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
        b=LuF7Njc9/olaMgMGhQBUoHypebXo/IuLosXImsBj/fW9c82Bmrt3ByXfbFvi/QG5AJ
         iX7bO5WajAfWZ2492D/mvRUYekJQcCP/CUpodDecmS4a3QdKG9RwLeNU3dG6MIih6uND
         g5iWJosCpPBxM4e7BOdsX9ZS0hARDdgqkNV2xRmJ5SLNQITopIXOHnUm4n4b2qJSACtC
         49+XMtDDRS1/jFRHchndv+MHMajZvmySCMfFAXbtRsjMr3LQ6HWIC/9dq5UYk+fCAkL2
         Kyxjp50I5tzAs7bzdWull4syDLxcec/ukTlVk/vN8fwUJJcxZXg+6Wk7gZFlbjejbalR
         GZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997864; x=1702602664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
        b=EwrZ2ggeDENOih26fzYYeBijhzIY2uloXj5y5nC6rqaf7OTzN4ajqONUSP+s6zVJb+
         HI+9T3JehXyNPjyHqpHUgRCMbomvntyIr4yO/RdttqtHT1/NQZFzGsOkeUUes/oa4EhY
         r9cAFkMtc4ILGVozr+BPElXkRt8yyxEuEfDSslpcgzgel80ZlWGpwNXU8mDXfKRgIOo0
         eL733dm7Aj7KXNKtwDqRsTOtgGBiflOQ37Yby/fbZ9XBELOUE6dRN7HmS111zLAMd6fc
         IgQHolDPgjhRQhbSKAa4cTS41+eS5G6I62r6RiIhhADA8iF2qKYeSlF609EcdPt8dCkO
         rKIw==
X-Gm-Message-State: AOJu0YykaRLOsCfWhHJ1UkXFgcLIqxq7FtL+KUGKUExaoNjYhQRhTE0N
	UJsCNaWoHrUdFprJaB19lgHadQ==
X-Google-Smtp-Source: AGHT+IEWZjda2fsJ0zD6R8OaPvGCIhuiY+08NdpNxfUAkKx96xvmVTnzBUfNL5Fr1v/oeWTLLPMssw==
X-Received: by 2002:a05:651c:117:b0:2c9:fa20:89e1 with SMTP id a23-20020a05651c011700b002c9fa2089e1mr2063453ljb.9.1701997864531;
        Thu, 07 Dec 2023 17:11:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id r1-20020a2e94c1000000b002c9e6cbf78esm86616ljh.19.2023.12.07.17.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 17:11:03 -0800 (PST)
Message-ID: <22f39a38-6293-424e-898e-77edc071ef75@linaro.org>
Date: Fri, 8 Dec 2023 03:11:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2023 14:02, Dan Carpenter wrote:
> The platform_get_irq() function returns negative error codes.  It never
> returns zero.  Fix the check accordingly.
> 
> Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


