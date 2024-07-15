Return-Path: <linux-arm-msm+bounces-26138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A39931115
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A782A1C21329
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 09:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBAF186E31;
	Mon, 15 Jul 2024 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDiQVj0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51731862B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721035324; cv=none; b=jlLHiKgSW4jNLTatpmfX0aQCv0qHjb6gHLEuvTDDkDkwlNnHjq2gKsenmnyFVEBtkJT1oijzIzVQ8yco0UQaIjZMA+d6PctDCqj9xSLtnEAOjqo9FJyE7matElgRNIm1ei3GY9oO/SlgLtOKFuU5/J59bWwkjeVIuixsCBdAx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721035324; c=relaxed/simple;
	bh=gQwFkfYUsyCNMfYcisVu8rGAr0bAMxYc/UTVv9C0Lws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSGGqnfjV4n1+J48XFZcAOnqytXe7TDEf4mqfVoNYNHrZdRtJRX6uurYwA86f8ghX8jHkaBtuSu328N7Ci9Jx3vfFQ/TyYp73/2GQJHxcmf+rXyb6yY3Q5GHBB2YIomPpyKxkSVqX0n9N9AIctwX11BEThHqbHEwmccZLiqJGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDiQVj0m; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eede876fccso24924141fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721035321; x=1721640121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzUrcSKPOx3F10gumq/RtLo0BiUspDhF63mAJeflmlw=;
        b=pDiQVj0mKE7a5n/IbC55rtkNVGYTYeCowQ4c/Ekt42J73wRE/WRu8w8ToXgWNDj88D
         JjqkvfIbEYd9fCj89AY51o7wkIWEH4EEGJJ8hUEyDVq/CuAPsM9d1XKp3OB6AjjQD6nC
         MqS2g6XF/EX5CBcm+x2Y2h+kJL0zkWVWCGba6N75GDEEkRqGjfjer3YV8ifUffxXf9pO
         tPTkxHxZ9qcxGcWEKdc5qzDk+aaI6ivV275z1WOj23WCNPerM3NyxhUQj4Kk760V8/w9
         Lz8KrtoTQ1UGiF3jR1QEWEIKWI/xFQ7Qf2Hi3ELJ0ueA0knA3TR8Is8B6eS9BJQ6hgkP
         gFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721035321; x=1721640121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzUrcSKPOx3F10gumq/RtLo0BiUspDhF63mAJeflmlw=;
        b=L1OPPJlcbouY3tXvH/ABzUOZ0DJ1mpJGtVw6SE9uUKWCfkNrS01svRVPMGkfnpaxij
         XGg+v0WXGpd5/et/8ADTl6WJrSXCqorlQWbeAli/Evd1b59vWkI5F64kAy2VJYx2YDLR
         y25PEzWU7V2KBEUsZuQAVfqNmlBn5Ge+sllVpIupb8lZxq7TKOTNbz5BMEg1tiOPKhFW
         7JAE5fbOxSY2xi+ecHltpKDA+s2FjAwMwrK+P8CzwaYki0H7E9oncPplYC9U77838iQg
         RgMuGa8CaPTkRfwF5iRfWUrtmGD1Oi3bYTJePQp4gcKO9aMhjMHePJCygVtnsc3Msgxq
         f4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUoVdGuZsDhGga7P2GkwBeX9SUKwY6Phb4fVrEOFmzGhJkM2OOPV9ghTqDARyIJGaY0KCjPp1RyRbPIfMlnrioO8WLrsGSp6e/jyK5apg==
X-Gm-Message-State: AOJu0YzcVm/uGpbVFNUS+jfL5sgSdgOkh0Asw+Xpjqu7YjJGwnxywpj8
	nRCCUjgke1msGhRBWDMSAjCpxCEMMC+AtPm++NHgjzGZwBJX/tKdQI1gRS21J3c=
X-Google-Smtp-Source: AGHT+IF/+AJbHLXohqSQ0XRGQc/GKg4cNhF8cuLtHAuiUlm5z+UVxHHPYV/1+FE6SNp+cer/mIRn8g==
X-Received: by 2002:a2e:9dd3:0:b0:2ee:8777:f86a with SMTP id 38308e7fff4ca-2eeb3188d1cmr119886761fa.37.1721035320730;
        Mon, 15 Jul 2024 02:22:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e709:abf9:48b3:5079? ([2a05:6e02:1041:c10:e709:abf9:48b3:5079])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dafbec3sm5764675f8f.85.2024.07.15.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 02:22:00 -0700 (PDT)
Message-ID: <343175eb-ac00-4a41-844d-ae1c9901cf1d@linaro.org>
Date: Mon, 15 Jul 2024 11:21:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] thermal/drivers: simplify probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/07/2024 14:59, Krzysztof Kozlowski wrote:
> Simplify error handling in probe() and also fix one possible issue in
> remove().
> 
> Best regards,
> Krzysztof
> 
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


