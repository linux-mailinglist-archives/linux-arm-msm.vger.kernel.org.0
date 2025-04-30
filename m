Return-Path: <linux-arm-msm+bounces-56210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E6AA4532
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202A43B0410
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8931EFF92;
	Wed, 30 Apr 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MT6BVCvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE51EF38F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001458; cv=none; b=QxOo9JTfHZGKsH+gf/j+1uEx2oqjTdQ9gpdLhZQm2G5jG0WGXAuwPp8ufQPr8JWEbtBKiwXanpmcrpedLvKTNowTK7tSg6EWsBj7Faou+JG7SGgfOoczZEoLuqNzOCTyfdNzNiyBKZ3BeO/4cZk/Q66AWobYoCUva5ZRp0O9LPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001458; c=relaxed/simple;
	bh=jE4PEp33a5PU1lnBYNlqWTkmTy/oubM5i2hDNHSJbAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOfYSZ3Td2Kh36aP4ZJBvGvEXTrUVNcq2v8iIXmJIcFEB+80o4eroiNwsLBRolHfjs2vN3qoEwsTnf8At2aO32VHf9QgPG5fWqSq8ab8UjWngJLoBx7YVPV8nyqcRy+Soh8FJycDKpT4/vu1lDVkvUXw6/gUYWWMEmJUwwKHo/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MT6BVCvi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a823036so68227365e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001454; x=1746606254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufqPEbOwWYWB18ZCf6Yh3nDmouH/kkXVRtJyRpSOlpU=;
        b=MT6BVCvi4SjxHWopj6rBSu7AnH/4VuaLDr2PkcC/8L6gpfME+CZDsRgjnx/MDxpX1f
         p97tH65b5RveQsOu48w1vURisczLNAotr/jt/Q9SfEWk9mgFTORUfzz+MLUa6B9nPkoX
         ZsrdCC5gPY7/FhCRgZax709889dSGfCo9H+gvyG9z3nr3jwTJgEjJYYHuEAnoYDDTXvu
         jwDX+832UnaLyL44zHbV6nhpGSfiG7bY5RTCcKCa+mZkr4X60w7F3j5+W9SIn4EzQTdd
         T606BMMmZc8vcT9+/FoF1Y/1gIcVMsqwotdI2Y3tKrC03I44+/QIzLclNONGF72mKdwF
         AMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001454; x=1746606254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufqPEbOwWYWB18ZCf6Yh3nDmouH/kkXVRtJyRpSOlpU=;
        b=UEbDoN5uFZ0E9PFaiC0MZKqMv5mR96BzAIY7qVZVCz1YP4vqLR+RTbkRcRnPv0oyYI
         S9rs5XEyQKipJNerSWYzbdzXI6knSXwT4kLPUJR7zym9SaksILyJYRQfJplMOgRzfakL
         /Ha56objuixGDwW+TNqakW25bAKkosSFF3U5QsewEX6Aw5VHe5a6dVCXz2WxI99AakhD
         P/vShx2qLKiOdeCQpkmca89xjb3wYDtjWmXKNSn/zcLOXMTgLQQQsz4w/KmbHuV8/ICu
         uyL2W+/SIJqidVwPrBr3mVc82ebDDelyVttJ6mwEi0aTG7g1uKTkozdbE20a4h47RIwv
         H8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGkMK5y76IKf1fAH++0cRgSXFhtpW4zY2scIrnEjhDIRkg1K2SjnM2xaRBueTr8bApkdSDTUXRSM2KDhaF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8FaP6o938YB33nKPUHCg6JZa7YvrxbQ8h4NkpgZGnHath+H2
	b4y77Au/XdfE2vsB31YJYvoOP29cwrncY/qrTzABdOSLI01I9JxhCuc0Rol+Dg8=
X-Gm-Gg: ASbGncsjHlPeaMWHa95B0Xan1HxyLolRbR0YXg1qI8kfRGz48a+J/gJYYCCfrXsYnWC
	M+ZQKqzS+X90EoOS5incIHmoyaLK9cl3QkhgHQh8LG565pUK3YHVut0uc3OwV8yXSwqCwGRp1fM
	RinfHVRWWoe8i9/FmlVeAnLoZsL29+epMTj490NagVWlZDRdSFpEEECrahW5xC58dWGGmfRBpuB
	chG+dyrCajgcLj33CjF8esJbbE7q9gAyNzjknxK6wNFBQBSqyygsGn5EzW6pYTZR52xQX7Fj5xC
	0QGB6vt0XjqaGSjKIj8vQQo4ZSnBQnep97g1MB+k0c+T6pIoLOMZ0Pry5lVIxxMxiqob7OitKpX
	FvMnAjw==
X-Google-Smtp-Source: AGHT+IEC343GJFUazvyxQ/kBdVhvDtloUR9+rS6OZvl6aiNt5CYM4RgWteI3bMKGtRqRGwvmyMmn9A==
X-Received: by 2002:a05:600c:3153:b0:440:6a37:be09 with SMTP id 5b1f17b1804b1-441b1f3865fmr19065115e9.16.1746001454638;
        Wed, 30 Apr 2025 01:24:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbf046sm15474325e9.35.2025.04.30.01.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:24:14 -0700 (PDT)
Message-ID: <c2ba9738-a383-4a53-a7ad-fc65a97d1c4a@linaro.org>
Date: Wed, 30 Apr 2025 09:24:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Johan Hovold <johan@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 08:25, Johan Hovold wrote:
> Unfortunately, it seems Bryan missed that this was a regression that
> should be fixed in 6.15 and only included them in a pull request for 6.16:
> 
> 	https://lore.kernel.org/all/20250410233039.77093-1-bod@kernel.org/
> 
> Bryan, has your PR been merged? Can you try to get my fixes into 6.15
> since this is a regression in 6.15-rc1?

Let me see.. there's a -fixes branch, I think I should be able to PR 
anything with a Fixes: tag there.

---
bod

