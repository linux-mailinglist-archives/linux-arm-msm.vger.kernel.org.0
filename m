Return-Path: <linux-arm-msm+bounces-29949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2B964042
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FBA51F22208
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5794A18CC0D;
	Thu, 29 Aug 2024 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WRsyJLdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C818C904
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924177; cv=none; b=dfUtyJ4Q6gtzvJOBuCVkw+I4M5wPyNAY4hBwfrBTJ6XemI0ieJ+IyVqVumcgk3DCwbndU/vKSlAiHQlUOSuAVKaQdii/fmOP1Eb9gdycymG7eDbKAkJalmA+jY/fRuxiG6tsY9bmRecxzeHzAZ1mTwjqly95dfjaBNs/hcsQxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924177; c=relaxed/simple;
	bh=hlhLXUxpMLkHBSg7g/cTYCnIZnJZv5ajArX+OuxbXH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=As5zbuWbmJEo75LR/OLX4WnjRVnD+0LldLRamtbTItJ2TiHFW5D+YH4DG7sQxcoRBQBTBGE0MYeE6fMKIbMOl5yGVvdUsi3ZN8UaAfCJYZweGZXhBEKFS5htzeqATwohSMurxvRkeTds9jffRiRsvKRUFlsGS9E+i6tfusnvIro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WRsyJLdc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a866cea40c4so45164766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724924174; x=1725528974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTNT9yXQN3AdBsM7Hvo07QH96T8VU0K/yy0t8WqdH2U=;
        b=WRsyJLdc542bqCIAoRcV7iTvzWoeP8/enVkZrbWNJE2JWakwRvs6fVFdA7tS0Qlydx
         O5KHgFIqIFWnnznnbmeRSj5319r3AcW3MqBaZ2W3giLYLmksTmHHTZb5Wr5jW9yfXE77
         cNOySTsaFafUBkcYhqKVLIlBNo4IIgh1DK6nB5tQSx9QIwK4zkaEHOfgVusYf/kiRCmR
         1jfFMgSfscJS9JC8OJB6Dl46o9gmATaDD94fWrtpvLQdg0Xn/gYYu6DbyHmzocqBdFDc
         eCgqq0BG1GWvKEgfTo+8ICI/ZtstkjYkETjfiKiu9Rn9V14bMFjxg+7gZ9K9Dusmo11I
         1u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724924174; x=1725528974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTNT9yXQN3AdBsM7Hvo07QH96T8VU0K/yy0t8WqdH2U=;
        b=UTmzrH3v3KY0axBw9u59LlGGDgQEp7jeQVxq3pGG4nlZMVki/sklHc4o20TUe0jbdy
         66r3cPx13U2ITciiXDNwkjBvcUZhe22/Tb3VhVA37Bm3RMGMsygDDiVSnYYJGg4IBdxZ
         /V7mHR2UWwiOE0wqBPGsul5v0pV5OWSayYNmg4b8b6geebkGGAYFPXY2/pICS7dRtYK2
         wieNvpIh17tOk5MaLT0mtu/PD1AHeUQy1rTtu99zrps7TO+MAJqytnBQ1ngcW480cPVa
         fFA8goBzzkKYqCstMhT0cNJEfWyhUkH0rrgWY5In699NkdvPFIuLrRk10AJFHf/33ayL
         Mamw==
X-Forwarded-Encrypted: i=1; AJvYcCW7c6DTjkbueXaaUBDiVWCM26xv/wT9A+exvVF7iXJ9GyXcXx7oMNiF40MzjlKXxWq+X6xxpvKuSR2Y6puD@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+EATFg72SPGauMec4qdaKkaHVyy9Fe0M351c5bpYa492dFRj
	FqIo1VN2atNNa9Spw5jY/Ha3jGQBt9QN6gmZp4Dcdw9DqB2PSltxBrezD+PSjTs=
X-Google-Smtp-Source: AGHT+IHN4C+WjAhb4ex1nVFmDZJXbTcRQA8CBNgpx2jfiHDO6/IuX96/T2C2Msyq3LgA0L+u9SV5Ag==
X-Received: by 2002:a17:907:96a2:b0:a86:e9ab:f6c6 with SMTP id a640c23a62f3a-a897fad4ed5mr131683266b.68.1724924173489;
        Thu, 29 Aug 2024 02:36:13 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989222588sm54389466b.200.2024.08.29.02.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 02:36:13 -0700 (PDT)
Message-ID: <3e44ffa2-f680-4bb8-bacc-65fbb65c110f@linaro.org>
Date: Thu, 29 Aug 2024 10:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/29] media: iris: add platform driver for iris video
 device
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
 <74126160-57f9-4abf-a26c-3491c8f3dd78@linaro.org>
 <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:13, Dmitry Baryshkov wrote:
>   What about adding sm8550 at this point and adding sm8250
> at the end?

That works too.

