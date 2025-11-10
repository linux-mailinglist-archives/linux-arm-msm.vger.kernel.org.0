Return-Path: <linux-arm-msm+bounces-81003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD73C46732
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B6E01898F0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62EB30E0EB;
	Mon, 10 Nov 2025 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="veg84874"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F530DEAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776123; cv=none; b=hb5wdniU+OcSdKiD4CzJVYrGbMD+Nzf+9lzbs4xN5F5Emzwi/Y8ScMD9Z9ztVkSLpUN/vm5lMAUHeKVUTqBsudsaTtbudzQX10HH+Z2MdnxcWaEji2meaZu1lxTVJp5951wcuwd9TVJ8rvzDTn6N6oF4xIm0Kmb8cKH/lreo35k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776123; c=relaxed/simple;
	bh=R1mxOWXIIHZVpeY7GEK4rrqOcBJZ0s+UaScSfVpSNjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lM8lenjKHHkm7U4oqpi+7lcLyLFtpczL7clDZmpH+l+sdd8Vz6TLOL9Yg1WflHwSCYnTWbeisvixz02YKZxuw3iOLrxNVilo0R/+hzOip7pjPCT3LaipmzIsv4v+4UvJ6KWR2sKoaFCCFp7f/8kyyqw2r/1ohBmR1yHqvzRUbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=veg84874; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso14755975e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776120; x=1763380920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3dGLGxYb75dt+p1VA2IIKU+V51eTF4ZAu4Ldai6/tk=;
        b=veg84874JRCrqQOED6mCrcZg0aCLpzqAaBPsgza7dLfHJY+X8T0JsJFUskyulzli/u
         VYVsIRP4avESvllRcQQ5MWHKLLRTCn7Hqe9i6bDkNJhzvtDURAg+t76okHiqugGil3Xj
         llWAWZzyL8/yp65SrlAJL0nBxiV9sy1+cTACJYr2/SWKjieKflEGRAR40aDa3QISEvCJ
         iIzOkvf+ZEu8HU3q+lIGXlAUmsrfxIasa8i1rq7ivFSWILTAUa/6jxV9aVmUcqICocPc
         pSQ262cbnk4D8oH/wOUqWXrGpJlHasaj1y0Ih+d4QSS6uNN5qSzNVqFf5j/n6h/8kyPN
         YEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776120; x=1763380920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3dGLGxYb75dt+p1VA2IIKU+V51eTF4ZAu4Ldai6/tk=;
        b=OHQrPN3DC0SN7ICwGPErTmVS7td5qL7BkG5CeHWIswzHFGJkuSlLMcfC0TF0zzaXk6
         TFHcNpuxwtmSTKj/3ybDx5FI2R6uDAIRmKbcovEttd18jsI16AFQCU2qEaBMVlJKYZLg
         Iz37uWxjYncbMKVwEgyUOLKXAJDYmo11DX4hVhnBITrY6+OHiXsjD6cptJn4jqlUgcmM
         Jwl1oS7Qac+IWaa4bjQggz0s17ZB/u7Xm4JSjE3o8V7UFO6/yBTJbkZmOjWhOm1Mxkma
         FBW+a8W8H6yH9lp+ypM17hbDizwDFUBuugKuFXhBzcPgLYwny0h/pCaWrwzDJw2S6bPN
         JO3w==
X-Forwarded-Encrypted: i=1; AJvYcCXPAi581H56YxPOe3Ci/Ymc087COVsV0VyOvfkuRNFdrGDJE8yOHveLpDQWc7/mRoT5xlS+uwZ0YhmXrkOf@vger.kernel.org
X-Gm-Message-State: AOJu0YxIV1rGetrnjnZgGWNZWJL6tc8sHKsQUN5jeAhUmVsC5lehSRaq
	CNyg91xFT2nQ3WuYw/6WXqrpLYdNsGGIxGUTLVw5C+mDwPvGrf5DUY3FAd5JR8gKXkg=
X-Gm-Gg: ASbGncuBaZENDMSYTVKQhNRoaD+Z1QgK15frMubosEy7DsdvgYL4gi479VhZSEfgbUa
	/uuZiztsUqffJsRuwWee24mJoMYKCXDolTUhIDyVHNM3zPtOhXps1K3aeaedXqXK4firAgupb/b
	FNzssG55EWnz4/WJyxUFB5VboswWJY0VFwE5W3BDOA8/cf3lSr8ieDC2Qgp+sN90AnmSq7OFbCX
	ldllXPpslmB0p5ScIE2Z0xoKRpp0hYZnCKL5Q5Vki68i0Hm2Y1CCqqbpmZQYJskEAWyk/9WawaZ
	gd1bw+SJjinjTtFhTgFmWqvO52CTwRvsjQ7ISSdPC/Cj1O3tHc0eiEKlDIfrH1KyEmHFv/vbZD3
	Sf2dvRp1jZnffm7fQmXCoINwekaUnbVNACM5qd8Gc8aaZNbeM+loIkfzNOnQTDVbJAEqGxptfRa
	cs9/bFZOMXZbya4cR3/acC7gkKEOWPwnsBOIBZmWBx31VgGDFheqqDKNOu/ijSPIpCYg==
X-Google-Smtp-Source: AGHT+IEuXvUd4mQiwgIBRjH8HevykiS903r/9YXM9xJPpZueBNtxg+p5dyA7/57VwfJY5ispV8CnQA==
X-Received: by 2002:a05:600c:4fc7:b0:477:6d96:b3dd with SMTP id 5b1f17b1804b1-47773236f6cmr57947655e9.1.1762776120364;
        Mon, 10 Nov 2025 04:02:00 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm126952925e9.14.2025.11.10.04.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:01:59 -0800 (PST)
Message-ID: <d1f95863-ac7f-4a89-8429-b8d684258c3f@linaro.org>
Date: Mon, 10 Nov 2025 13:01:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: qcom-tsens: document the
 Kaanapali Temperature Sensor
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20251021-b4-knp-tsens-v2-1-7b662e2e71b4@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251021-b4-knp-tsens-v2-1-7b662e2e71b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/25 08:23, Jingyi Wang wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> Document the Temperature Sensor (TSENS) on the Kaanapali Platform.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

