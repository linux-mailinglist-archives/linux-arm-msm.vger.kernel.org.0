Return-Path: <linux-arm-msm+bounces-3007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04265801808
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 00:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1331C20850
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AA03F8EA;
	Fri,  1 Dec 2023 23:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZd1tuEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88D71A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 15:48:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bdebb1786so1063520e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 15:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701474496; x=1702079296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJVF1ZrmInpC3Gvm7OoxUYxrkOmo0ZmH7AoQY/EPSs0=;
        b=mZd1tuEKRfnRNS0QnROcQtzivqmaGm5La3GJFMAIGcspDCufWl11BE3goa/nC5mDQQ
         YCqC974jIbEYugeztPTDvqyIM+9yXh4wFiRRUcpqLha/OBxP34b+oTw5NS1MUS6Oct+k
         DQyhIpdTHTL8Bau8vQXNeJzDsFa1pELRgdVP0iTkPW7k2yILuwN318fSiM7WiVhcUs8U
         5iv9uDU7/Iq8FoLPv+pd/7A8eIEl++jLsl+XdBHx4RTq9VoAlVMogquSZIXWzWH5ago0
         id71As2c4cd5GqgBlDeiE4fXLzLMtIHPO+j5VVteSSTzYGcMyh0BgXbi7oNt+4cEmfHB
         fNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474496; x=1702079296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJVF1ZrmInpC3Gvm7OoxUYxrkOmo0ZmH7AoQY/EPSs0=;
        b=JUSbLbxbcCSxpq9c4SLiPS/kqMyAo+QoWi75D5jIWD74O+LK0yaHuE9+NwXbZzKOyI
         ZnMHRjCHYluYHxPtCUQ2uisJTxwo6U/OHWLCU2uwXULIOi/KWR5tThjbp/KsURZHZFQB
         kaIA57sgZ48GvWcyqoXEe89rf30anPE61tG57vh1ycAPzrU2W3ePkLu15AHJSecAkRc0
         sT+QukcxqRlnPSY9E5amLyaZEsJdsxdC/W0Or0qD83NM8lG9TZsz98j9GZgAmoRLWgUQ
         qA3a+YCOcdIhftQ6pXq6aYZmnmtr6eYs2+0C5KQkH+mfgpdRaq3pZd1mI7SIP/KktizV
         aUzg==
X-Gm-Message-State: AOJu0YxAkOhyRPtBX7B3bCWX2fxAYWnnq3YZsKV+1M0uBWFMoJ24pYV2
	cJSze3EOotB+gMCwAfgRHRNy4w==
X-Google-Smtp-Source: AGHT+IHTNUQKLLhXANUvRoFzT3r6DBEs/yUnPcAE4JI0ahtu6IrjM/fQLRF3nClcM2LwCY50wd2GhA==
X-Received: by 2002:a2e:991a:0:b0:2c9:b8c6:1a3f with SMTP id v26-20020a2e991a000000b002c9b8c61a3fmr1491188lji.46.1701474496154;
        Fri, 01 Dec 2023 15:48:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b002c9e7c4a7c0sm118565lja.33.2023.12.01.15.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 15:48:15 -0800 (PST)
Message-ID: <e380c8c6-59eb-46c2-8b62-e9cbc4e90752@linaro.org>
Date: Sat, 2 Dec 2023 01:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: add QMP dependency
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231016200415.791090-1-arnd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231016200415.791090-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 23:04, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When QMP is in a loadable module, the A6xx GPU driver fails to link
> as built-in:
> 
> x86_64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
> a6xx_gmu.c:(.text+0xd62): undefined reference to `qmp_send'
> 
> Add the usual dependency that still allows compiling without QMP but
> otherwise avoids the broken combination of options.
> 
> Fixes: 88a0997f2f949 ("drm/msm/a6xx: Send ACD state to QMP at GMU resume")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/msm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


