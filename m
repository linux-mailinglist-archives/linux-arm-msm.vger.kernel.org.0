Return-Path: <linux-arm-msm+bounces-19863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F68C619F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 09:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 630B4281F4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 07:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097294AEE0;
	Wed, 15 May 2024 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUYjWlPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138164AEDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715757763; cv=none; b=M93eo6rKwevqE7Bn/KTvIyPTFMe63FpeVPJhBBlDQzruT1SysfTZE0wQDCFeQ7qFY7gUNgeKzK+6vfiAbiu+M+9W0JxG9rbnQhpz/rSeahi9BLLMaCAoPxOacdB1Oyk6UAgcUt6nvWLa6pSzPi9HdQQv/7OXa8t61zP1Ed7NrEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715757763; c=relaxed/simple;
	bh=/zqmWMpSqIK8w/5CYxrGVps+c5Ka2GSak4daBZvGXAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcRNuldcp37nazPo0NxV5yryjabpmrgDj/b68GqtVs+y850sztCZB+GZuhPwxt5M3SRC/9pcsBpF7bVxzhEs/A0FiMCVayzv2jPYXfePV26NmHGML0IpSepitV6/ocLi/L/xVfkPYjb6ak5zAaA5QY1SJufEHiABs42U9s8LE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUYjWlPm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41dc9c83e57so41978015e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715757760; x=1716362560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w838iTqcEdF/wb4Y5xIa/WPLb8ecXgpzd26gnDTPlSs=;
        b=FUYjWlPm5Md++h9u1FXd4KD7/9DsPp6zKfTjCkq4668W6pu4TgX6CIHhSxFr3V1oKe
         TfbalmxeuUEtQNg97CqR+wcXHL4UVXuhRgs+RGuoFpp3DTlmkfI7ppIXE1wOPT8ZAvLO
         j6f9ifO5NvtXNthLKXZ8s01iWnOvvkeF6mvuiqizq9wBOtyjZFFWhhZuhAqZvtRE3thg
         kS10THRAFBu9mteQNxsHWK076ANwuO4UlstzvKWpdr37MBzF6+Mme2oIUmfI/vhviSu0
         d0k+Gop5HP48F6USVgGIGrm1sR+Yg8pbt3smhq+oBjwdwuL0a+dNx2jOgSdkmdndupWa
         /Z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715757760; x=1716362560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w838iTqcEdF/wb4Y5xIa/WPLb8ecXgpzd26gnDTPlSs=;
        b=VHwKFJjiGCwLlSGEtrqZRENrvok68VfcSPIkOO3VDkqfl41ic8+D90p4Q3kDpuGkVd
         qxAiQewTzi18i0D9sv7gInak5Xqgv41QBw5diRAHppEkwzkPCHnlylFAq1MKxIg6uEEn
         JJD+EVwz1VhMZA1nM/9VCBdnHfMAlERRxwk0bAPybjm59VgyEMhpFdXM+kTisRtA4fhu
         hLki0fA5j6rIjYr6wQ/n7SHIXmOKBBwFDiTFiQ97OhD60bL8QjBvoTvsasHkU5ufT7b2
         wbGxdA8tZBMxUx7cPoV4PpYo9K7XS46/4HB0BGyVnFE0J53rWUdV1rNU9rkUPR3+lLRc
         tgAQ==
X-Gm-Message-State: AOJu0Yy4YH3j/OsNbmfQMl0tkHjVlnKnLhmar5WOG3v8HsMNPDKYliQ3
	jGv6Rs39A3h5VMLxUGxTs0jo22k1iyyRU0Y1Z9xPMS7Nse9kvpsUNLyGK1NnazI=
X-Google-Smtp-Source: AGHT+IHRNvpzKANP6HmQMDSLC74SFWdzuu8uJteTxxXVhmOixHXfwakzFmM76TwcqtKAYC5rdjUpgw==
X-Received: by 2002:a05:600c:3548:b0:419:c9e1:70b8 with SMTP id 5b1f17b1804b1-41feac51e2emr129937675e9.13.1715757760345;
        Wed, 15 May 2024 00:22:40 -0700 (PDT)
Received: from [10.1.3.28] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfd3sm15717366f8f.84.2024.05.15.00.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 00:22:40 -0700 (PDT)
Message-ID: <fb4b166e-2940-4b0a-9ea7-ac8c838ef5ca@linaro.org>
Date: Wed, 15 May 2024 08:22:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: enable adreno_smmu
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2024 18:04, Marc Gonzalez wrote:
> Right now, GPU init fails:
> 
> [    2.756363] [drm:adreno_bind] Found GPU: 5.4.0.1
> [    2.767183] [drm:a5xx_gpu_init]
> [    2.767422] [drm:adreno_gpu_init] fast_rate=710000097, slow_rate=27000000
> [    3.003869] [drm:msm_gpu_init] ebi1_clk: fffffffffffffffe
> [    3.004002] adreno 5000000.gpu: supply vdd not found, using dummy regulator
> [    3.008463] [drm:msm_gpu_init] gpu_reg: ffff0000819e4000
> [    3.015105] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
> [    3.020702] [drm:msm_gpu_init] gpu_cx: ffff0000819e4180
> [    3.028173] [drm:adreno_iommu_create_address_space]
> [    3.054552] [drm:msm_gpu_init] gpu->aspace=ffffffffffffffed
> [    3.058112] [drm:a5xx_destroy] 5.4.0.1
> [    3.065922] [drm:msm_gpu_cleanup] 5.4.0.1
> [    3.074237] msm_dpu c901000.display-controller: failed to load adreno gpu
> [    3.082412] msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> [    3.088342] msm_dpu c901000.display-controller: [drm:drm_managed_release] drmres release begin
> ...
> [    3.197694] [drm:drm_managed_release] drmres release end
> [    3.204009] msm_dpu c901000.display-controller: adev bind failed: -19
>

I agree with Marjin the log of the failure isn't required.

How about this as a commit log ?

"The GPU currently fails to initialise because the adreno_smmu node is 
missing. We require the adreno_smmu node to translate device virtual 
addresses properly.

Enable it now."

> 
> [    3.220381] msm_dpu c901000.display-controller: bound 5000000.gpu (ops a3xx_ops)
> [    3.235503] [drm:dpu_kms_hw_init:1053] dpu hardware revision:0x30000000

I'd drop that, we know the fix works.

> 
> Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")

Retain this though, its a legitimate fix the GPU won't work without this 
change.

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

