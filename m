Return-Path: <linux-arm-msm+bounces-80869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66122C43DE6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 13:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237703AD14F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 12:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9664A2ECD31;
	Sun,  9 Nov 2025 12:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGw7p8hN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD9F2EC54A
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762692226; cv=none; b=n57VVXiDRq1X3sWSSZ+yhEmBlWms6fS8vD5dWVfpY1juhwkj/aBWucxk6TYGLrHOVupqD63mgikD3WBCbQ2yf7Hh2yCLsM9HTnfa3k8EIh8nPvptvko9V9wGwhyvnaX+YSFVc8ThyariV6aqFreMWf1eHcRw8Oxi5VjyhJX1xGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762692226; c=relaxed/simple;
	bh=BS5KrCiw8PRT9pORU3Re/5WSroIZAKASnJGIlF3es7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZGXzMOykuQ66fmct+nJq+cJWMMJWM3pd7KN8yq86J4jVC91UBn1fTreClPnXgxC1GnHtHIVpoRkiAWrN5c4sF806xIRJXWOq8kcjCGusGzWYWJjBGKrXr8DE6AlaKgFGI+6SO2pzR5oI6rNYdMOHkw/rnxDwX+Yn6H8PvNfWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGw7p8hN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640f0f82da9so4277004a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 04:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762692223; x=1763297023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWErFsO2tEX/BOEFeY/JUuqvBv8pyRA62qDCMk8OHC0=;
        b=RGw7p8hNtL1ayOFEGVZTU4WouxNqK8yu2MEPSf5gx2EU7tVz01TOOgDt0KklgcbsWW
         mt9pfTmAXtzl8xEXjW7hV9P0SUiDz9nUaj4+ywh0YFutzB1TCTANBBXKi3v9kMnoSsba
         ljY56Sm/xgNKoeqOVnm/mqw7zLoJpZhvXIxbbX2Soxl4pQebys9n232zR58dzp+2VxXk
         7u/598z3jDO8PCP9uBd+BZwAQvLO3QmHq3XQ4Jw+8eDynnuO2hWrsEWZV9+grYQUOHka
         4wsCgKbtr1b6Q6+yrj1jxXtKzEA2XM4EXUqK6mkXl+nBdzkeNElVuGBtMb9udl1I2FBK
         n//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762692223; x=1763297023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWErFsO2tEX/BOEFeY/JUuqvBv8pyRA62qDCMk8OHC0=;
        b=f3w6H3llsQlKUE46gR+GK68eiWuXwR2+2ngCCHHgcR23NfOp5CZXCab4VasaIev1lD
         hkieWEC+qZ5aKM5k1/z26v2NkXpQ/HGoqenCkZPk4dvshduX9Tx7WxAmNa+9YTRi6D3E
         6zLOqPf9ShyscNkUAOYgqd7BghnWs5vwMt0KtqSrskjQhpLv6Xdu2O5l4z+kNAClRWn/
         kwLyO5Nyi3pqiJdvzjeKLbm+2tDIfadcaQsVlOM4UZMSAYDmCSb1KtZlo/yGHDCr+fgk
         +rbN9KKJVeZy9P0mLrLPktZ5YdgqFiS7C32JtHJNtbiBijPnLTzeYuwUw6ANEE7wLxB1
         mh6w==
X-Forwarded-Encrypted: i=1; AJvYcCV2d0qkx/ync+6+P5jTI29uY7AMGC0Npu2SiIyzVUVQbAo6WK4sr4c6nNlQuqsO4A6/iIyoe+tFBtY9kknL@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJlqz5qUmD5kw2thpxOeylgHbH1U+N78xI1rdjBF1M8yYnhzq
	2uZlYNEuHXamcV0Q0LfK0JMpjEv23Zkr7sMm8JwsxLulPUSlC7U4nvb25WKo425bups=
X-Gm-Gg: ASbGncs0cNNrfZMqFiDh3s8TnpRsaidGCJyy+XenE3y5FGUoFGs+QLnW486UveKYnib
	DshbhCCpcj7zyriPodl2CYD+MMDsOWi5zjMn1hbrVPWwRpjddFQkMBu26e0l/0DEpOAE+0Jpn2F
	7PAcky7bSD3RpKlumCko3E9VS11rY50ShCtjUHCn5/ivLlZ00lTJ4KOXDtIIE0p3GhU249XZy9f
	BG5HrpQLl0PcEHt20APzHkldN8mPUW5ir2QkXUFAkJg1l8C4OgqK1pBX/BUdvlq/fy7uvE+bpvA
	yGNZgYGpAg8pL0Dp+hOJvIN3rBJOIfTYw1uOBaxL4vCbPNOY5YvBtqHZeXwm5Ili1j3BmlNN6r4
	SKCxrXTfTrnJ89vrNvKDaaH9YSpNXu6UcfxW4fxPQIN9WgMqcucwp90Bw+40zG/WXGS7PDYvswJ
	+4fPK+CtQAMSgCPzG6HEVoEKPPDkJ1AIEfOnAKA65iTpMN7jCX+gAsYTLF5Px8d2nHI2Z6p7BqX
	3WqxheUlLsYUzJ7L4VhbobcQjIvFMteN+e39QnAslYCEANZUxwyKWYBmZf7e9miaoJdloMP0wZ/
	zXI/+muuoVk=
X-Google-Smtp-Source: AGHT+IEmKraCtXyz5pwfItQXmoPTPeRlR1wlc8EhkGzafL7gDnpHwT7RooYHeCo6KYAU03Bhf73/iA==
X-Received: by 2002:a05:6402:3042:20b0:640:c918:e3b with SMTP id 4fb4d7f45d1cf-6415e80b1d2mr3448160a12.26.1762692222982;
        Sun, 09 Nov 2025 04:43:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6? (2001-1c00-3b8a-ea00-4729-b0ef-dcc4-b0b6.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e9d7sm8852874a12.36.2025.11.09.04.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 04:43:42 -0800 (PST)
Message-ID: <a13b5b89-ee13-4fe6-b57c-5e4ea724522f@linaro.org>
Date: Sun, 9 Nov 2025 13:43:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/8] media: qcom: camss: Remove D-PHY-only endpoint
 restriction
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/25 10:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> C-PHY mode is now supported, so the endpoint bus-type restriction to
> D-PHY can be removed.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 248aa6b21b5ad..1408e8a03f0bd 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4044,15 +4044,6 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	/*
> -	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> -	 * D-PHY is supported in the driver.
> -	 */
> -	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> -		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> -		return -EINVAL;
> -	}

Might be better to just expand the check to include C-phy, since there 
are other bus types that are also unsupported.> -
>   	csd->interface.csiphy_id = vep.base.port;
>   
>   	mipi_csi2 = &vep.bus.mipi_csi2;
> 


