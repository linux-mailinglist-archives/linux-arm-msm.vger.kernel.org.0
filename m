Return-Path: <linux-arm-msm+bounces-55453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FEDA9B2C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 17:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4CE1B8830C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18DE27F749;
	Thu, 24 Apr 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3HqOTgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E113F27F72C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509548; cv=none; b=Wi5BatqMYQppi8URgUkPr9p3ABiDzuyWPe7rDmV1WLs2hCaLe7ccwOPWW/0CJso0WnubYFCXz9BNo6Z/IDUt3O9Cwno4qICi6gbxf7LahjGKygOBHHfRuwGheLymLcxoEBgkCWdXjqH9HSy9nKAgHQmlAhLDdtNhixQKF3pabPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509548; c=relaxed/simple;
	bh=m4WbnWF7hOg6KRt7LappWX+88S14yt6lsIPXp9lyGP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFbLEKSnlFYsnVZe1+Y08JY8VEVS/o3G6IgCGXzm43szdXkkhU07baVYYktMMowQEx965SGcAbPrge52sCTsovJJCE2d+5su8aq0bjfvT8Ozy68O1n0zPEw2AbU+CcwivBN3d+/wlEse/DEuxSfnS2GKpl70OOOda7Acb7SrF0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V3HqOTgh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso9243645e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745509544; x=1746114344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYKmLWCuVbbnS6eIg6jW3CASv6d/Gi88yqzFbMCKwu0=;
        b=V3HqOTghesXjI28RkthhqQQRY43uzseyK/+bT9ZASfgV8mNPmgHjJYv759F+uJeti4
         RyXx1Ysebgl0Mpx5b+xgYBMVUcEaY5GZytod7Gu7REVygHKQiaXTLdjDutPPfWzIY1RD
         4VsqYDSfiPig0vq924xREfgbBOAGjSYfGUP3jBPn6eXwmojVpy/1po9WDeDi4bNiGURp
         WvE9/AZyhhpp+hJaBuRkY0hmg+/1E0d/r+zskMpgfOzqZ6kjAXKj8XdoDMEueBRrQsbC
         qRB5W86h0QVY6RZ/7X+L9x7+2UZLxk5T0Oop1INDceToyNk59+p4FMnxDJvwa2T7916w
         VjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509544; x=1746114344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYKmLWCuVbbnS6eIg6jW3CASv6d/Gi88yqzFbMCKwu0=;
        b=QlNMHH8LEr6c4VxPwctY2t1+SVcdsUJVNxwkq4S6CBUiqIGjyx0e3MT9LBXeyWHf5S
         owXPCT38BtjSjdLrKOjsE4mPOYBRClpf9Z5Ti1gL5LiT7JNWiT7GUxqRpVkjTBRDTyvd
         lS8Rd/8EjJn+TYhfs2s+w58tK8UM50FoAHDs9yctavGv/tj7TVJlkGNGdPvvVKE8pxNy
         BCIdgxQsLvkWlca39ppm1dOZT8aJoyTTOrHMZTsNkv++k/espAMJKEpCn74fQka1fneR
         9Z5KENFdNjIQqA7Q3vF8HdcKitI+oqRKPEllQNq28bRDq+GlJEJP9q4G/2ykwDgr2Foy
         wKIg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1M9DIVaq7umhrmNnT2TzUmBod+ZWHCUfmA2MQ6q3awawrp7Tj3rOaDp1KsU3si1LrXETvJ9Bzo3gKROk@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUje0IJipkgvZFuI7zMrd3o4uOzRwUosf7VaYtIcTyU84hg51
	pE8i75MoWspqq8oQZglGfdwHBOgXdqdO6Q5kPpCdM508A4cFOrpzsWd331rfplQ=
X-Gm-Gg: ASbGncvfamStM/BUnY5qNg27X+JVIA8+rjvBU1jJIUmUldnADdtNiCtwC314HfUWXnI
	bLntVXIAX6jZEd8qQLxLBSk3YXPxLd2yKLO8o3SEXD+oBG7jQO0hTljQr/DVYtk9GAPIrVvUnpE
	05FEjVN8MEYgRvm0i2axVOC45eUKtdnPNKrB4zbKZ6Ktnsl96Rbm9OpIHetPFmdvST70r5pz17K
	+iAz6PMZ4KyVKg9IaWiTDiNmj8wFsVeCGjka2ikz5vB7a52ZYN3rE4ypFumHFxyKTSM9te+mZtD
	KuW64sOaT4eMgcyO3gIYoqORIK27POaBC9G95zHUTknZPLTsFzwvppiblZp1lk5NJFL3nkDkhY9
	DFoymzA==
X-Google-Smtp-Source: AGHT+IHqzSozUZBGJRu1+oc+heY9EUUpamdaoOpxogVzGWw2jOs4uYMoj3kczTLG+0fz4WAByZJEXw==
X-Received: by 2002:a05:600c:1d86:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-440a3055814mr329155e9.0.1745509544048;
        Thu, 24 Apr 2025 08:45:44 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d88cdsm25225555e9.25.2025.04.24.08.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 08:45:43 -0700 (PDT)
Message-ID: <b356cbb9-0a7b-49a8-8c2d-8dd3de3f7c2b@linaro.org>
Date: Thu, 24 Apr 2025 16:45:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add x1e Dell Inpsiron 14p
To: Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
 <CAF6AEGtiMLQ6xWrmbkmdkpb7gsdbkXaFw7V84nXDDWtLA=4f9A@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAF6AEGtiMLQ6xWrmbkmdkpb7gsdbkXaFw7V84nXDDWtLA=4f9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 16:42, Rob Clark wrote:
>> - Bugs
>>    Occasionally when resuming I get a fencing error with hyperlock and
>>    freedreno, TBH it looks like something in the GPU or SMMU according to
>>    Rob Clark:https://pastebin.com/AWjCyaap
> Did you have the same issues on v6.14 or earlier?
> 
> The smmu pm usage count underflow is concerning, the smmu pm should be
> tied to the GPU device via device_link_add().  I've never seen
> something similar, but I'm still on v6.14.
> 
> Could you try reverting commit 0a679336dc17 ("iommu/arm-smmu: Set rpm
> auto_suspend once during probe")
> 
> BR,
> -R

6.15-rc1

I've seen this bug exactly twice. NP to revert but not so sure with only 
a sample set of two, I could say the change fixes.

Anyway, I'll revert and if I see the bug again, we know its not that.

---
bod

