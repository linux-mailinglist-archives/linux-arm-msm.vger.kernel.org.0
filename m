Return-Path: <linux-arm-msm+bounces-22584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259890720F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 14:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22420B21C47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEF51F937;
	Thu, 13 Jun 2024 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcBFu9AL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB21C32
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282563; cv=none; b=N38LAZ9i6fxIt2RZ6crefDbGt6IfjKKPhc6+XGoJtA7lsva0PCUQ+COui0NPrdZl8DxzNKkQvWM2JCyjD1YAuRYEY//y89lgDlyf/1Evcs/SA5wzWSbX1SLyKa6UY1CfdbOSG7tB5M9VqqN58AYW12NldOhDTzmxYv/exIKh1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282563; c=relaxed/simple;
	bh=Ba0f2L0qBaPnNOoB5ZkJeLek3EUUQwCaD5yKAe23nSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlO6gJ5TfcoOioIj7skdV2pOguOwMQMxOey4cHQBYBrhrn80gWFjQVxMvmV0v9qt0+zmGMrWBke2fptWGQaFyrPw8tpGrKueBlcjBYO+WfXvu/Jajzig4nkuWsZvMgBYzs4zQuiap6QX4H7ktm2v3W+aWopMh4e5pVLj9dgrdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcBFu9AL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6ef64b092cso122940466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282560; x=1718887360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDen0vJUW+xT9L+oF3bv30VDdb8wwl+RQxO77NA+7JU=;
        b=pcBFu9ALlgkRRPXPR2qlqttv/a7kdoHKegtfR7z9gfkNnnPTWRCp90Sr3KUgzRr9yJ
         bffQTofk9xO60KQGTm4tgKZAxzcHt2VHiTA0h1XeLSB5BKJzZWe0n/Ir0BMyBh42O8u5
         xZyXBR+S93IOQonBvoLIY42vuf6WtlOD1AG1XdAZt35ZNn2uvnXujQZ6nnyKrKKWcvfF
         B8vKSB1ARZQ3spuJv1iQXp2DdDYxem0TA+Zq3VHQuZstbmMwdtmvmY02W+8xR9I5Ny+v
         DR1PirsF3eE2jFtKeDfVQtiIrK237taoKvtZ8Afr2Z4PlqQLq/X9j86bjF8QVnLxNIk0
         hk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282560; x=1718887360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDen0vJUW+xT9L+oF3bv30VDdb8wwl+RQxO77NA+7JU=;
        b=fZjbGvSgGUjYv5noMANj5jeLVKFtuJ0HsToZRsAn3ypSv7TOw+XKb1yV+H5dsfAW7Q
         fBJkM0nx6hQmC/m2agKClC9Ck5thu9Dxuvwg510WjRW4cDsv6biIKETXrO/BYrWHeL0t
         tm2vF6MOMxVJxYom7daCtvEopa7y+bi2fx9i41YeHwQ7qH2nnSGYCjHv9WoR6H4nb4ql
         jTtYCu+Y2QecZjxgeAJoozs60Sx7xGGVTu9X9q5wGb1Z9BubxmgKGqsT7BtIWnuGC/Ed
         76v2cwL5yESXEmuikbhteMpernICRocxzkvlObtclkE168tBC1X1sfdcD/XgmT4lKdWh
         9hLg==
X-Forwarded-Encrypted: i=1; AJvYcCX21NuHGvSxwvMUnpq0NjS6Km5ZQzeb6kZOMQoy/vr+xZeyZtogLME5u8zF9ciqVdNDWD/vue1rXM+eqj1cKgj0sjAPexTswzYeNZHN9g==
X-Gm-Message-State: AOJu0Yy6PU0y0umQPEEBSAGd6Ym+v3AnoMPx3rXFU3Sc2fXohltFCPqn
	kYtp3AQkzxOfGvUXNsQrZF9aVBq/2+LEUX6qsPqB83oqhuz1iV/IIoth0s7PAi0=
X-Google-Smtp-Source: AGHT+IHhniSGyoEipOniastD+bMxg3ST8u3KBQmi75/UrvUJzOGUDP3BZAKq+V+k4xmYl27dFY/zmQ==
X-Received: by 2002:a17:906:dfe6:b0:a6e:f91f:672c with SMTP id a640c23a62f3a-a6f47f8c006mr276509466b.25.1718282559957;
        Thu, 13 Jun 2024 05:42:39 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56fa6a1esm68319166b.216.2024.06.13.05.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 05:42:39 -0700 (PDT)
Message-ID: <4de45d93-6ffe-4357-9aca-b9fadb3850f3@linaro.org>
Date: Thu, 13 Jun 2024 13:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
 <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 13:37, Dmitry Baryshkov wrote:
> [...]
> 
>> ---
>> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> Note: this didn't go to linux-arm-msm, probably because of the use of
> an outdated tree for submission. This commit is v6.10-rc1, it probably
True I sent my patches on top if rc1 which is why b4 did not pick up all 
Cc's.

--srini

