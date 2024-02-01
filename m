Return-Path: <linux-arm-msm+bounces-9392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9F8460F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 20:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD1628709C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 19:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B058528A;
	Thu,  1 Feb 2024 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqGUAQiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E747C6DD
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706815789; cv=none; b=mLUquKYUtllyUWr7vObnvwOOhs6iqNIaJNtEaNKI/2xMfv6jzx+MTGVk3iGtpEY0scDZcTLQ4ZTMycVrhGIeguMWphAIRaUag90uqBzc6AIidWpJOl5kJf2tgVfX6X2M4+E38rND0Vo7zOVlhL/LhB8S46dJ+77X63tW+URsJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706815789; c=relaxed/simple;
	bh=ZexgBnj9+P+HNS0+9UtNEUHSiaUdR/z3HRLQucDKiV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0bFqdpOs409O3UtYCvTOI9cBkVh4SnSsYAMMlf8iRfYBxN+nyJ9ldtm5IOIWKHkTmYMSCJ9Fzn1ldR028tCQCMf2e0lU0SClGPzsEBbA6Qj6CkNxnvDiRqhbcUGR7bjaeb/p2ZA0SWMKg5besyP+D30ocpmzm1Vxj//qyts2Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EqGUAQiR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so1740566a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706815784; x=1707420584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNDd9KylMgBkCjd0/fdM2YLWRb1RKk4GsS0b8U1stB0=;
        b=EqGUAQiRHJ9wT9CkcJHRj0uN/uP/jlKxrVwn/KHj4KV5TOwh6AoJPutEaKqnu3Qa+U
         j/XsCdebMF3uR5EMec0LZL3bRKik7dBG3kGA6O33O0BzSonu3Wl0WUXB9tdQ61vxm23D
         QBenDPe8xmbU3yqPSvxoLEzMkHWL1Zl4CrbP5nPRjfvJVBoRNO4bs1odNTfiTvaVcpez
         tNwLyP6MZC+oyFaubSKoR5OaYjz5GrXc8cm1Ot+1NJjP2pAV0s4/mjk9pD5KQbZbVT5Y
         QVLTEn09szhBu7xf/5qg929dNKgrCODuF3R6X8k0iHyfYzQPZPwijG61UeyIUhf+J6Wv
         RvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706815784; x=1707420584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNDd9KylMgBkCjd0/fdM2YLWRb1RKk4GsS0b8U1stB0=;
        b=eGbVafh5V8k86bMQzDvplDhqlTbOHexnWlOigPYtWtpNwZv9a1eNqOiMJLDG+KiGWV
         GVtOkL8iqU4o3glIvq+leSHuXb5HXcWsNPijgvTjHSY1lx1vRTmMBK/8fpUIHs79vgJH
         VCZCOu9tswX50CupwQ/TareZYU9yie2W24V3680eI5ZxpYzyhMhdhH2vI68gsLFnszA2
         UQf3gwNlUlPkTwROdPc+vKt7dao2zptIwMcsU67BwFVJcZn8NxoUm8D2cxPtbMQMZHNb
         xYdMs+xljpMYXVJyVrOqVY9h21sTWVr0iT7x/RrJ5kXuUCjJT+pn/W5XnuWk6UWG+lzZ
         Ch6w==
X-Gm-Message-State: AOJu0Ywm/LVl+MJxiG3BZ/892M6vXSXSjaRKC7xcPFp7rxnPqaEETCkd
	CFHrYk3ONfUlsSH2AUD02L58zkUD7ROfK0rG22hZ1Iq4Q01G9EvM+Pu0x58X9GA=
X-Google-Smtp-Source: AGHT+IHLvP0FY/xY99UvEDkVM9+uUcdil8kywgvtvWB4nLcH46Sa0+fvJ6E2EefUXlyLFMCmenhceg==
X-Received: by 2002:a05:6402:796:b0:55f:c4a7:a08d with SMTP id d22-20020a056402079600b0055fc4a7a08dmr1719114edy.19.1706815784717;
        Thu, 01 Feb 2024 11:29:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUQ/kzH0Mg1BcZt+TRgxL0KjyYQmLFlUoFTIMG5saRR+c6EnMi5omZRL8ztRDYQ3I3BORlC6GSo30bJBIm56qK6G2v2dnusd95yQIEv4LTE26Pt15aDVBdMHXS+84PsvZn2+C66c9RheBnOpn9X++5mpQNjo7IWoPyA8Q3KSJ+cuWaxxPQNzXdFr0jqjwddxyeb9R0q71dk3fyWRc4qZxUEA0BxSIpHkabTkbx5fYnyPdEcrIvhKtvPR/ipnYJCs3FrzE0SjPEpKxWZ
Received: from [192.168.159.104] (178235179129.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.129])
        by smtp.gmail.com with ESMTPSA id h2-20020a0564020e0200b0055eed9cac54sm110982edh.12.2024.02.01.11.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 11:29:44 -0800 (PST)
Message-ID: <b7d5e877-47fd-41a8-a7a7-a4639ed7338b@linaro.org>
Date: Thu, 1 Feb 2024 20:29:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] arm64: dts: qcom: sc8180x-lenovo-flex-5g: set
 touchpad i2c frequency to 10 kHz
Content-Language: en-US
To: Anton Bambura <jenneron@postmarketos.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240130202755.2289952-1-jenneron@postmarketos.org>
 <20240130202755.2289952-5-jenneron@postmarketos.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130202755.2289952-5-jenneron@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 21:27, Anton Bambura wrote:
> This solves the issue when touchpad gets stuck on right or middle
> click. This also makes touchpad working smoother.
> 
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---

You mean to 1 MHz?

Konrad

