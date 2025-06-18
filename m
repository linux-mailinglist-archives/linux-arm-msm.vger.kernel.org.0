Return-Path: <linux-arm-msm+bounces-61734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E3ADEEB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 16:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 032461BC00C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBF62EAB77;
	Wed, 18 Jun 2025 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPlFu2a7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C32EAB65
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255285; cv=none; b=k/+4AFbk+1YkvjCv2u0TbsM7V2TI/xaeoygsG9iy+ikgZO2fooJ6iPzgSueWCpOz7Yt8jgEGlxa99Ju9QyZhO/xK/hPQdGZRDSAEWbPbjmdKdcy1inCeaZReZ8XMf7XunJf2sc+P9L1Xvebck1Dnd9gCiATlziA3+5XpnyYve+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255285; c=relaxed/simple;
	bh=ZLGt+M4oBpND3dBGcxJtJVboCBMPZ8HGMPGxWUIqf3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udGr8LZX/coEkIarEoJUjAPq9r24iI3G2svPLfb8oWIUxCrkJcAT67KQNlkEKEJGEj3hAgmNKCNbkYji3lcuHCvIqGaYEq58xf7RyjnrUpl1zxaf7HLbZ8JnUELHtaQyLSH/1dZaS4kwJk89nHbjwocTsrdXuvcxcXhAEJ76mvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPlFu2a7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-606b39b19b6so1262310a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750255281; x=1750860081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yNBX/m708IWteet4DlkrcpHB7CaXDOgqPr9oiiJLqjM=;
        b=YPlFu2a7Lqwgs5gOhL6bh/aX+t72OrXOKSiiALC6DZy7rW2rMlbX/0rSi8zKA+VDcP
         OTfYX9Xn0VDZkYToBZ/XCQvSeAS4iI5J7r3lKBy6bHDodcfcOGtPKL38W/kIRG4M6xhY
         niO1aYlJtXuUjA6ZXIQLKadDq0kRsB0AuUXn0x2e3pIBHJ1aI8ZRF6q8hrXxrC8Rp0bu
         P45eu9CR2RkErq16mUkm3wiTiPxQprzER5Ex63wpLDVAf6jr0BiJ099+5OPi4+FqHnwj
         z2vFU4HqC9nrjrCUqesyCapiG2uEfXeBk9VjK4irewTJJCJ+OxRf7vz0QpOMiSCuQf7+
         Bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255281; x=1750860081;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNBX/m708IWteet4DlkrcpHB7CaXDOgqPr9oiiJLqjM=;
        b=coo7ocs7EykxsbdxnWj7NIdaRsQLJQpdANYNzwlOLwqDi1vw8VLQVvIsEKKJMsSzuN
         B7DFVRL1a7wLCV49plxTGpbP2L1WUCUntGLX3JXqPq8RodkrF/Jc18biwgCqPhp9fSoq
         jqck/UZdMAHWgG2SBM+5bJq+hsqUpPFiK+IZ5tiBBG08jD9TJ3J3uHnRRuROGXtML2g/
         Orm7qwx421i6qJNE7M360X2zk7ws7Yd+O2SSu8Bb3GaGVJG4blEGRhGK+xZ5kss+++KD
         Y8bpVrM2E+beqfZVzG0WKiPgiHXOG29gl8JxVHUL4g3y15AnbxTwKULeFhnKzYGJKljN
         IYcg==
X-Forwarded-Encrypted: i=1; AJvYcCVlPf2tw0Wd3JeX6Jn/pKMZM/tPFtoEA21eI0vUC5SQKDB8VdFtnPlSuhtDhvOdixkk0HJZjZolp2+9Jyky@vger.kernel.org
X-Gm-Message-State: AOJu0YwYuoezF+I71U/sPrXdHGTxQ6zjdJbzw3rPKpUbo97+n32xSoYq
	/K7weEEAJWM/tK9VDUlzTDGnFWyNx3TNGKHSpaX6qv8sV4PT4IubwGctYgblYAjbDpo=
X-Gm-Gg: ASbGncvGOcKOyv12erYwlXRdjTgC5gT78Bi489fGeUjyYuJtCfMlbsnKdeI+eHymr56
	2LiZr5kBtEEXEWtwK0JNmHYCBuBI1+bYyJGEU009sJbMWJV/Kzg8/G2Si/QZ5cQ+PKEQWcJ8hFU
	v3TbBdTrrWKvlIzWdseTuMvAKMnhNXxf/0CCOJkJ4S6VwbA/pOTCtg+ZGNLBqT1/PfHH2nDX8aN
	xnwKegozNUrcnRaHfGNVffm1R0K34l8Pzga0sPAUcdPvJBaFFlT4QQX7cfC0Jilk+OuddLHgOG1
	7DJnhykSEPIdRu8M10orD82f4HIrFeMdobHmpAINiltVdhttGdhJC9msKfzwK6vHEspMK3L2ien
	IxQYc7Ys=
X-Google-Smtp-Source: AGHT+IHuYoQ3kQ1OLnKnBhyzJNq4b6cK861XY1mac3pE+KRnuI0Lvpb4iIeKA4kLtASLXRV1ukctZw==
X-Received: by 2002:a17:907:7f15:b0:ad8:9c64:e9ca with SMTP id a640c23a62f3a-adffa90a1bbmr265034566b.0.1750255279768;
        Wed, 18 Jun 2025 07:01:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88feb23sm1063387766b.96.2025.06.18.07.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:01:18 -0700 (PDT)
Message-ID: <185f6038-d280-4e6f-9f52-daea3f827f01@linaro.org>
Date: Wed, 18 Jun 2025 16:01:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
 <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
 <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
 <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
 <07af3f49-6992-4897-acec-b2d46158fa00@linaro.org>
 <28992d6c-eb98-412e-86d8-d35a96f69fd1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <28992d6c-eb98-412e-86d8-d35a96f69fd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 15:58, Dmitry Baryshkov wrote:
>>>
>>> In this case you can send a fix for 10nm separately, but please post a
>>> fix for that platform too.
>>>
>>>>
>>>> Or merge this code without this patch if a fix for reading PLL as zero
>>>> anyhow is questionable for you.
>>>
>>> I think I've asked it at some point, to split the generic code parts and
>>> the DSI enablement into two different patch series, so that they could
>>> be picked up separately.
>>>
>>> No, the fix is not questionable. The patch causes questions though.
>>
>> I have no interests in fixing DRM code. This is not my subsystem, this
>> is not part I am responsible for. If it raises questions, why not
>> devoting your time to fix it?
> 
> Then why are you submitting patches towards the DRM driver? I think the 
> usual rules apply, you not having interest doesn't lower the bar for 
> your submissions.


I have interest in solving one particular problem, not solving unrelated
DRM issues. One is not necessary for the other.

Best regards,
Krzysztof

