Return-Path: <linux-arm-msm+bounces-1532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D4B7F4BFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 17:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED189B20C7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 16:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8346957875;
	Wed, 22 Nov 2023 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONACCp9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB47A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:09:31 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50abb83866bso1018627e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700669370; x=1701274170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLCWxiFA7VVYyF6ZRceYWPi2g1OSM3YQHP6IyA6ESAk=;
        b=ONACCp9/wK3Od6y+KFsy5Hq1EHZWGKas/BW2Z44LBcurHbfQ3oCfX1jxA0/Kv1rRx6
         k3BEhfRSZy/KxCJpkSp98CEuadfGS/gZmx7fdqfH4ZC2yv6y3HTkN32jhNgL+AwXuk+5
         eMeAzl/waL5HT2JDERtSqnJlK48QAZYH352G7JKkbxpO+MOajAREvjfrcK7J+tcpBCAk
         tdtZVpg1cIS6dbPIjBSbpPuwgyjXXpn/j8RCNiRhTyTLulelyH8pyrBMTnSy9EY5mxy+
         WUGNUd0TeydJzP+O6Ou607o4BwV3Texu7I83cQMUv8jH8tbTMKDAJTTYw+HzGz+NbFCq
         7odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669370; x=1701274170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLCWxiFA7VVYyF6ZRceYWPi2g1OSM3YQHP6IyA6ESAk=;
        b=rBt8Hu8mREM11NM/fBfS5tDGlei7BRPhjbghz3x+xp6njb4mKJVkfynrV03idftYYR
         yB4cwmteXrEMNQndxJ5GHrq80HC9lSuwXl/4NLUMng0K9SkVDz/9kqBCcKsn5Z5ZRCPp
         J622150z8KryjkmTZM+XzqnPUAim0ZgkjKcHFAvxBfEWpwhHBbGh+572XBmsIZc9O8QS
         NU05QCcDjT4jBEVNQDpItxyMD/AEGmrxYaZLJUSIZInzDIheRkJxRQm+A7kQcaIEvdmh
         7HLGdoVAYDNSTuRRZEQ1gtF3VvIfQYGcEqsoCE27l1gQrzrg0VC2DU7B0sT2HVe+iXCy
         Lhig==
X-Gm-Message-State: AOJu0Yxhngf5mxODTh+ycLwooB4hhUG/oQW/FDMKrd9Edt8clK3ACZYV
	gNuUnLHjNjr54CW35pLiEAKwjA==
X-Google-Smtp-Source: AGHT+IERsO0nW03FwqjG4/xdsmEc+txIkZDHtnrRfnMv3I/o25pWcNZV6M93k6oa7AovrtcZR5Fl2A==
X-Received: by 2002:a19:5519:0:b0:507:ba28:1bc5 with SMTP id n25-20020a195519000000b00507ba281bc5mr2003640lfe.3.1700669369885;
        Wed, 22 Nov 2023 08:09:29 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m10-20020a0565120a8a00b004fb9536bc99sm1882136lfu.169.2023.11.22.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:09:29 -0800 (PST)
Message-ID: <124fd3be-ac01-4c1e-b9d6-63429487cf1e@linaro.org>
Date: Wed, 22 Nov 2023 17:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a690: Fix reg values for a690
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231121162137.60488-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121162137.60488-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 17:21, Rob Clark wrote:
> From: Danylo Piliaiev <dpiliaiev@igalia.com>
> 
> KGSL doesn't support a690 so all reg values were the same as
> on a660. Now we know the values and they are different from the
> windows driver.
> 
> This fixes hangs on D3D12 games and some CTS tests.
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Very interesting.. did you document how to get these on windows?

Konrad

