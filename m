Return-Path: <linux-arm-msm+bounces-6897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB708298FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EE691F28985
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B88147A59;
	Wed, 10 Jan 2024 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mjcGGBYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D632C66
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e67e37661so5023778e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704885962; x=1705490762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukZ4eHBZ+lqRJdXFeiOENdmgYKBt7ZSKa90/KfaTIsk=;
        b=mjcGGBYTilSqgnQc0lWXj4VvAvVBlSWxHnjvHxilMK0XROmZgBMHlChq3+qSTZRi+H
         IqUHAElMlf+/TgjHYq+h9LMkn1LwloK5v5CV8RO2hBx5hFfRcYAbwHiIfxPdjc3V3P07
         Vt8ivt04H4C7M1BrMCR9SGyv9ZHeQ1dscHCmEzlYWa65azUuX5xyZluPV2gSVINIn9WS
         aiyAp1wxw2N0YxPBYi65d2+WYRi+lzluxtjNC2VHF0yMb3FFnGdY+twKjX8Yji0dsbZ9
         beHeTqp+I+2GSeL8mnmKgOJAYtfSddQ7gjvAAcLVf3k3tr1dCsppr8dVp9hiG7OSJng1
         Am/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885962; x=1705490762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukZ4eHBZ+lqRJdXFeiOENdmgYKBt7ZSKa90/KfaTIsk=;
        b=oCFxXS0hCsNn7BORURy8r85G4QWgFht9ZCmEYDJVAu60meDJ2nDDKXA5FncsWqOFL2
         43Fm2L4FFELuEsfBYzfOEnXukGdqub31auHtazGBoghffhBTWPVD0xCny+TKnyeQyKnr
         +rSp6lid0ZseLSs8/hmmmWC2Mw6dZ8XGygEW9bAHiO5SkOF0jtYzokX/vOi7AjYVUpyi
         PmPUdYnwBYQgx4sL4vQSuTh0bxBBwrhiwb8qP8gybYXshIhp1MB7Ps/lYEGiRXzNVqFj
         EkgSkPpEICNJq7Mtou3lhfkDX8Qg/Su5+ZvPxdqeDFeUdhGNJ75DIpvS12dCLu0B/Hnj
         Khkg==
X-Gm-Message-State: AOJu0YzomGQZ9OFxPrCSxSJmEz1FnpVLHb7lj7rlHtXwUSPmTD+xgtog
	Ggv2sca+SGl+2+ha3w64sU2E+tiNoZ5//g==
X-Google-Smtp-Source: AGHT+IHdYZzUKlwAGo0xKf7zZS+FfVCqQy+Pwm2peTl8E/6DsvQMtNRqyGPsNtC9/9+lQE3r+hjjLw==
X-Received: by 2002:a05:6512:376a:b0:50e:8d0c:5eeb with SMTP id z10-20020a056512376a00b0050e8d0c5eebmr319316lft.85.1704885962325;
        Wed, 10 Jan 2024 03:26:02 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x8-20020a056512046800b0050eb7941041sm632908lfd.297.2024.01.10.03.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:26:02 -0800 (PST)
Message-ID: <c4693d39-4ec1-4759-9dfe-74d9556dbc99@linaro.org>
Date: Wed, 10 Jan 2024 12:25:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] drm/msm/dp: move next_bridge handling to
 dp_display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/23 01:44, Dmitry Baryshkov wrote:
> Remove two levels of indirection and fetch next bridge directly in
> dp_display_probe_tail().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

