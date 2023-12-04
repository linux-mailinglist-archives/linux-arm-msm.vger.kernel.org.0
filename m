Return-Path: <linux-arm-msm+bounces-3230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5831803133
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D715A1C20998
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB64B224FD;
	Mon,  4 Dec 2023 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgZnrUzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9427AB9
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 03:03:21 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1b68ae4104so126936266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 03:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701687800; x=1702292600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/V7/qttpYUSVs/dqMEkEMSdP8vUt/vCkEeFP/v6WMb4=;
        b=qgZnrUzYUJy4mLYvzV58hPdSRzdh8ctilo8RkZ7HdGIoHSfIWhsLukcheuJevzHomQ
         IbIaLOscK0lYc+gP0k8Edxtq0Urnc6TkLFawdiKAChjVyqKbIDD8yi2Y0tpSZ3vKQ0QW
         rANTzCmd9kWtnCWj8Poe5rO6yPQUZgl1/Tdt7VxtpoIAgrkwyX2UtXM63nSD4K4XK3KT
         JwHJCUUOel2MfnyP92eIyvKJ7Xhzerr50fLtcrhVI9CZH11KSZHgVpkuMDs6HMjSCvfk
         NRglg8agQqR1/YSgrdIQqvHYisMuVjeTLfNxsG5K2lWgEMkgy+p6JpLU5+46Ie7uQ694
         3UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687800; x=1702292600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V7/qttpYUSVs/dqMEkEMSdP8vUt/vCkEeFP/v6WMb4=;
        b=CUFqQfNtxA8ra8YpoglUByUkSZc5qaNGPSt0TsHGrvuPac4At385qGglqG/HRAEgt9
         2kV6o16qKczAdCIaERkZ+MPk0BOQXiskavqLTGstY8eOQHrwu+6948E9yQf47DV0Z97K
         HMT8VX9amRJN/1ZI4NDC310SmtrfIqeDL83gb9NQ2IFrHD/RMc5KssVOMaRjrbjKg7lx
         1oqs/Vg5y7vaipnonNStbkJWOQVIuxEIbKetZbQWGLogdCQtSDxYsmgrHV7X86jHU60N
         tidxpGR8FLBc0SFvT2vZLr9M12aIaRcZYkzuQXko1QYRTkFlVOKrzE3U50uszx2hy/R6
         BkCg==
X-Gm-Message-State: AOJu0YzCMAWoxHSvEAx+t94xSZmooiydrvACKsqkFU6ERlpl3mtpVXMU
	zMBNO9ITviXkPSeYqWqvxQIH3w==
X-Google-Smtp-Source: AGHT+IG/DZ7DWecHguhxVyCpS579WAetX8TUEe0h6ckVQp4TLerxiS6L7i+ssFEjODGt+cWbzm/NCA==
X-Received: by 2002:a17:906:7152:b0:a19:a19b:78c9 with SMTP id z18-20020a170906715200b00a19a19b78c9mr3388627ejj.140.1701687800185;
        Mon, 04 Dec 2023 03:03:20 -0800 (PST)
Received: from [192.168.209.83] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id sa12-20020a1709076d0c00b00a0a5a794575sm5124335ejc.216.2023.12.04.03.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 03:03:19 -0800 (PST)
Message-ID: <05d9194c-beea-443a-823d-b98213c63760@linaro.org>
Date: Mon, 4 Dec 2023 12:03:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
 <20231202224247.1282567-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231202224247.1282567-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2.12.2023 23:42, Dmitry Baryshkov wrote:
> There are just two places where we set the bandwidth: in the resume and
> in the suspend paths. Drop the wrapping function
> msm_mdss_icc_request_bw() and call icc_set_bw() directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

