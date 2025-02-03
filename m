Return-Path: <linux-arm-msm+bounces-46781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E1A25D66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F233AEA75
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE7E18641;
	Mon,  3 Feb 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GrgjwQkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC433CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593522; cv=none; b=dEaSC+NSdz4+GA4i4TKEIMuiFu0HGM77EusMbOFht+95reAv/SyVmaEa4p659b4q6LlPsQhkqkAOOZ1EQku3Rp0RkG1KpRLhRyWVIkZ+WT2kpA67YG5kdb0s6zI4khH6ApsoFvk+tNEzljcYXyreXS3awshUuJhpGCLxdkaMKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593522; c=relaxed/simple;
	bh=fWcstKqT77dBHBvIdUcXfvejtkyLY3asd5A/daMoz/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USAFRtJFB9ExF0Lorgo1YT+Avpuywl5hZyzG7EahEqOiP8IpS+xsZxNf3CSEylcIB8TNAjDIzgLv/9eWjoXnGnL2nKN1xCSJ7GeX+8mVFwc7ikzndAbouPb2Ub5CtwFOv6WiNT6qkOym1vNOAk9x9BurUCtTmpMaEZZiW7rnVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GrgjwQkW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so6856065e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593519; x=1739198319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yf+n0TinYo89AREfkQSwcLctOI7KSOhc0INb01KNBSU=;
        b=GrgjwQkWB/8DcD0YTnQDMMJBP8N+eDkBUSivdlrQVxYzqjLmEgLcBlVsaY0vYhKq14
         JODPQuTfWbLoshvA24eeY+XjAbInA0ylpko76WOl9uqzcnmLix7soiIExn2SUQOXWi29
         QAOuIKElX/NUzbvo/e16M2Wyz6+wBTaHDPnV6PYyoBNU/2LSZyAziqYB1GSbjnUeWCLL
         IXiYUDUILo/Q/yWH1m/GxsFkgIiRqa5TWIIqLzlcQloI1HWmMEdtVq9m1R1IF3GgxVzj
         iVbpZ42WDqzaQ7pmxRY8nf5RK0DLDbd94pj+ipE+Yl33cqnMT7OYcAB7833ETC08Vy5e
         7MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593519; x=1739198319;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf+n0TinYo89AREfkQSwcLctOI7KSOhc0INb01KNBSU=;
        b=VXepHMqK2XVAolcSJb0EicE9XntCeC/IAks6MFXtvFJykjVEK9jidZ16iTAbdyh6Do
         SEAxbYA3ligXMuEYYX/0HgWKGa7mIhkA85/3ThiuxtFZtNEV8+rErOMH1tczZ+jJYkOW
         O+qvSqmbR6sj5yTrEQw6gDoQMurSGWrhw22XsvyJd030Dre9DJPKA53pfvhHM89i2IOJ
         HMsEJpHoMgyFUpdbH2YpCThOGXdYc2oK2+/F3DvGyhwQa5A0CZcP4BwOtIe5ay/pnL8d
         WNNyx6ZVHX1kGovJWdLiv7cuD0gky+gX4Azz4yCcuz0Kk+GbVOHlAd/57/rf6Y2hOfxD
         aNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXjd5gbge+b4xchm3411rX5JNcVMavPyzGheOHJ6nd7Qpwm8GUENLtzJFMX+/oAYH9fVjJXDBEYGNZfYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyegS7wvgreGQ9Q2uMyY800NTAE2vSI+V1Tqp1QEhGAq/zVeAtL
	Yc+TQET1BENw0ZyYd/SJFCujWbQjJZwRDTV7jSJU7fm06qIaA8RJOLZfeS+5WvY=
X-Gm-Gg: ASbGncsVsrtRZwbZBkYAY9DkhavgdyXiIxXca5ndLerPLiw3YSu34+y63++re2qw93k
	JQGOJEuMVcILrmZu5m0QkwkC/4V14Yvs3rXKBWyOuxYmxZ9jNK7w6BLXYO+45ADupm8f2WVlsOY
	XCA2l7vVYye3099F51aKchFHedZhrqffqkhQoSoEacgTirKvW1bNxuBd9Gb+efB58Xn+y8Q/kvV
	dS/nVYcCNpWCB43j2YxafHjCotxT0+Jmz/4b38zwiNSBEet9ez9A3ZJPknv6UoH6mFV7ZGF6lfl
	1vfM6egsthoPdwQy4pdFtsNerY+Sd0S0Yts=
X-Google-Smtp-Source: AGHT+IGK+lz6AfjsW3TZZnmmZja5p2ItZdreBVS47rvFsrGMtPtPEHmSE5JsQCcwCGgyAD+WQEsqnA==
X-Received: by 2002:a05:600c:4f01:b0:436:fb10:d583 with SMTP id 5b1f17b1804b1-438dc3a3ee6mr75991205e9.2.1738593519079;
        Mon, 03 Feb 2025 06:38:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11b851sm12770955f8f.43.2025.02.03.06.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:38:38 -0800 (PST)
Message-ID: <b2bcd64e-274e-4b51-9d9f-68bf7c8244ee@linaro.org>
Date: Mon, 3 Feb 2025 15:38:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
 <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
 <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
 <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 15:35, Dmitry Baryshkov wrote:
>>>
>>> PLease add these bits to the corresponding XML file (here and later on)
>>
>>
>> I need some more input from you - I don't know which XML you talk about.
>> Do you think about:
>> drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> 
> Yes
> 
>> and others alike? But doesn't it have only register offsets, not field
>> offsets?
> 
> It can, see for example the mdp5.xml, you can add <bitfield> under the
> <reg> node. Be sure to install python3-lxml and enable
> CONFIG_DRM_MSM_VALIDATE_XML if you are modifying those files.

Ack

Best regards,
Krzysztof

