Return-Path: <linux-arm-msm+bounces-16883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CA89D600
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 11:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B941F243F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 09:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5918060B;
	Tue,  9 Apr 2024 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCkap/fY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0080043
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656339; cv=none; b=bpyzgBpRTLTgGzhxhzkYDMcppxuif74kClzjnq4f6Z591bMotvWyEVYQnPse03OmAAu6ddJLXtH50eg9fxOgbePMuuCgcJFa8TbbP8y6fh2A8IH0wadFcPYE+Fm2hMJMnxU0pb+nPRwpnswxCZgZVsiXd6M/PmTaR7vXjkMY8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656339; c=relaxed/simple;
	bh=HtKXs0Etk6gS37HFadGfB8oT0JktoNvRrMmwI0N+q/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biRdruNYfrolMvJAF+dCEOnQN1l9mqbRp5kxhDqfLUSL40zvSDsDyRB95ldkzC665tu5jw5ojrbivB6icz/dbANRPkqb7NYkI5rnUdOaqgxdoZ9xHo8lszjuiiVvq/RQhe5hRA0qzGv76TlT+XQE9o9YWn8F+vUMF7s9hxSNEQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCkap/fY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d3a470d5so4887282e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712656335; x=1713261135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2IH83nxdfMs5gmaAN2Imsfr0nksOYUNwqs3T7nU16g=;
        b=dCkap/fYFB49VJOtywGGah20vMod8nuxRBogApNHRel0dRK2Mv3rT5pOztfBVRJOY3
         FJLWxDtzVImmD3s4Y4TNdUjZ7b9zWrYonR8zYjevTLPn3/0HCUpwmcpzP3TzgILZCGp6
         nbkSeu8soxPX+Ey2MC9RZo6bd1dHiktUe/tEKG+zDEKwhNbuj4qjXrJpWCaCUY0Ejkng
         Gtw0hTnkMyJGJNnWuQU8gFHKhMO+L8rW6uYPRAlSeimOcBUiT4o9Tq//OUm8VGRLzt27
         OGV+t8S3zf8mp1Ax/Iyo8o0mKCW2grznp0arWbLHGTT1XMVOdKFcAMJw2CD2BqmsYfcG
         KABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712656335; x=1713261135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2IH83nxdfMs5gmaAN2Imsfr0nksOYUNwqs3T7nU16g=;
        b=sKpf9o07LqCg8edhkyy1VUrMO3S0F6NuLF1XhVb0NWzrqOx1mZL2bA+2oFQJeTx016
         lWyBUl0us7uaEKercd0JPRWAggSivujBBy0hBA7C8KVR6G8h4/dCs51QKIHAaKbI3zRQ
         Jq3vJoBwXT6hrwNRcaLN5L5OJ6gnosbIzbihX6X7JJH4DfRdUYTZy2hONfwohBz/Ybed
         plB4igtYkWkZWWdz4jveXrkuvxvIiZDSjktoorzbomN13XjFwPjHHzrcAiXIF/cSFgta
         1DLtpGqeEua1Bx0TfRFhVndqco//S+P2k/iRKkGfPDEuYQOAw/HeGo+DYfq0vCBF070r
         W5bg==
X-Forwarded-Encrypted: i=1; AJvYcCUIK/clUZnBsdolq4BPYcY6lcpsUK2PXeaP+YJFMdAu6Q3N2SV2gF+F/V/jN+fionUYMVFOxiIbb/M+U0fRzcCGXbNNdCAPDDBJnls79w==
X-Gm-Message-State: AOJu0YxVZVmQJ2IEe9oKlrILc9b/lWNKTAgilpqP61XzWoPXa91eyGsA
	jyfWrCmgWGVW5IyrsS5kcDjfhs1z4QQfj7vJ+gBbdg/QbiqvcMziGFbbEL+dLnM=
X-Google-Smtp-Source: AGHT+IHefyYPTqOj0xa3bmDBUujh11XgRGUf0XCoxaABy8nlD9HEldzp1P2bWOks506TlvyIrCxkDw==
X-Received: by 2002:a19:6413:0:b0:516:c1d9:c0ef with SMTP id y19-20020a196413000000b00516c1d9c0efmr8799272lfb.53.1712656335292;
        Tue, 09 Apr 2024 02:52:15 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25462000000b00515cc918069sm1510848lfn.150.2024.04.09.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 02:52:14 -0700 (PDT)
Message-ID: <2cd986c0-8663-4143-9d35-4af94fe5e4bb@linaro.org>
Date: Tue, 9 Apr 2024 11:52:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: thermal: tsens: Fix null pointer dereference
To: Aleksandr Mishin <amishin@t-argos.ru>,
 Christian Marangi <ansuelsmth@gmail.com>
Cc: Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240405090720.16419-1-amishin@t-argos.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240405090720.16419-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/5/24 11:07, Aleksandr Mishin wrote:
> compute_intercept_slope() is called from calibrate_8960() (in tsens-8960.c)
> as compute_intercept_slope(priv, p1, NULL, ONE_PT_CALIB) which lead to null
> pointer dereference (if DEBUG or DYNAMIC_DEBUG set).
> Fix this bug by adding null pointer check.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: dfc1193d4dbd ("thermal/drivers/tsens: Replace custom 8960 apis with generic apis")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---

Maybe we can replace p2[i] with p2 ? p2[i] : 0

Konrad

