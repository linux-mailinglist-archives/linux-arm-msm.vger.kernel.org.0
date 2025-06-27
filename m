Return-Path: <linux-arm-msm+bounces-62851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07819AEBD76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 18:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75DEA16FCF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A2E2EBB90;
	Fri, 27 Jun 2025 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3ju6iLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55072EA48D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041824; cv=none; b=tZ49ng0nleTqxHsDK3FLnPUto4hAOUSAUr2QRYto739X9+7sCrhZPPchLeI2Z1adOKWGtdxA9+nEiOa+TIeIgzyCbSWnmJsODiv60NFsukBlHhHBUvvZW64kB2AlJ6KosfcTQB9NAkk0vWv+AeW8wWDGY8/2rEjOCWpeRIk3194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041824; c=relaxed/simple;
	bh=+ky15PA9sAU81b8+V7nmFYxwth/v2pUQufrrrH6DTSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWpUqZlIkchVH+zLL/3e0fFBMbEOAPzVVBD1foc6yMhZQeTocmyp5MQfjyGMLPnvzEO+cVfjyAewAuwQ8UOmGF+aiTTWjK1GW4YRraU5UBtsGho+8bix+/FMKIP+aiT2ZLC9XJ4tkv8dekYtIy+ee5fIQB0PIBdv4abWlEjuqv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3ju6iLw; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-453643020bdso21333225e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751041821; x=1751646621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMfsTlgLNGWbyjCpDV2kNGIGNepZ5m2Z+f7NA8cGiMI=;
        b=a3ju6iLw0ZHfoLG6cZru2H0lhvbNIw1nR7Vy73N3HMsS04XQUMiGpx52+JWXqofAXB
         cZv/r1tFU4BkfExWCCITskeMRvYA1JHcHFiz8YVAvYBDIB14Qg1jXZqaSsTQp3KPSRql
         Erybc5dAYUMmKI0lxVrohxgwlRL789vnOtkOE8vNT5vrbkgOT/+VfGrJGCpHZzad0jBu
         XTcaQEcGkH599Gwi8wYMS6Lqov8Bcf5LN8kL7Sk4dbv8pWLpJz1AV4i+w8z55RAYSACB
         7vDz/+z1aU3pHEDSdDZ0lEkD3t+PgjqFiTqKImsZOhRWqINX6oMgE+UmfhjZvszolUsq
         ucmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041821; x=1751646621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMfsTlgLNGWbyjCpDV2kNGIGNepZ5m2Z+f7NA8cGiMI=;
        b=PpLmTi0E1wBkBbHNUaP8Ail2/rrfQniZQ0+c2ezfhCe4T2LXGjwMxlxdxbyof4+Np3
         WiKQLXDnArx4ex30/y7t5ZYAFnwsQ/DhaRTbzveEHQFPT3sygh/bSi8Hls47OahsOJVy
         LV7Z4hhXUgcHlzwbxOTFIQZKvzbp+kScavQ3/wTRq/COeu1lhPDeX+h5vfV7eiy3RmhU
         7rIAgfmTUVS30T5WpJtVyv2zhDZ0+WNnnIVb2ia3md0ibvsbD0/aH2MldQcTzImMYp1i
         F3bMIAFw/qy95nfv7L8ljrYB+9tMr9RIlB+bofyNXkbkqlu5JJwSmj3lU8V3u5wrWmvB
         spug==
X-Forwarded-Encrypted: i=1; AJvYcCWaI2ELvoBBGtSG2EKGmxKejXygDv2W4DXSZadtq23O4p/LDrdCzh/WbP8Kwaawbqgvlrz1w5idT7k/Txf5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz769v5DShGmz0Xb5w3MYlJIp0Ec238V34hAoL9H+qvaazBnhZE
	1klSwS6ik9j+iZMAAEPr0LBHwrQTAiiwANrXqiXBt9hQxgmEH3mk/o4JPkbg89hLlC0=
X-Gm-Gg: ASbGncvf/yClfkt7Lipn06LRqPdRi+phjStPwiFs6ajTl7cV7+SfyEgAC6t3zRZ5BTD
	jOsjuhM9LPgz2DrxVr6SCrBOzhX4BFovk5XkB5DyzlLKRbaJ9GYiX8dotzhfnnUFe6kfaZtK2kx
	8yKcn0ruH+ycPYHy2n9kaQwlQVGzjvZoKcGBe4B75soATHtiAQkgGDYBrKMuE/vnGVV7JD3bKS7
	gkmKFmBcM/Hf6sJAPp3El3Vu4QRtmnKMRsSICj0iGtk5C1ZUmu7yIaH9UASu/DH3HF3LNEMAIjH
	BEp9FuM3NoHBLkSIHx33s2GY9mWa/fDQwbNq+lTQ6Sva6PqQd704zYUmX+OygoK8F54gYZST545
	4Hgl8wYg6bfnRFUJCXFzZvVRb+h8=
X-Google-Smtp-Source: AGHT+IE6RvCylbJtuXzitjd3EIhVHVaEWYawghuzYHxPMnQLEtrSpXpyi025NQRd8ywU2ZWXXTQ42A==
X-Received: by 2002:adf:b64f:0:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3a8ffcc979fmr3582621f8f.27.1751041821125;
        Fri, 27 Jun 2025 09:30:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3110493f8f.24.2025.06.27.09.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:30:20 -0700 (PDT)
Message-ID: <306223e7-b760-4d37-b5d2-ac04e3c98842@linaro.org>
Date: Fri, 27 Jun 2025 17:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> Changes in v3:
> - Add info about change in iommus binding (Thanks Krzysztof)
> - Link to v2:https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com

Hmm.

I would be nice to see what also _wasn't_ done i.e. why you didn't do 
what Dmitry was suggesting, IMO that's as important as stating what you 
did change.

Not a huge deal you explained in a response email your logic already but 
just as suggestion for future, I think its good practice to go through 
each point and say what you did do, what you didn't do, perhaps what you 
tried and then decided to do in a different way.

---
bod

