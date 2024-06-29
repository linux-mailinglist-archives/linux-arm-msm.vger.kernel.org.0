Return-Path: <linux-arm-msm+bounces-24717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3EC91CCD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 14:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD19B1F220AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 12:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C4F7A158;
	Sat, 29 Jun 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkAnT5c/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFDF29429
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719665925; cv=none; b=LsWS+HzX9U9a9SfkUKp7vAt7iOqjr9nyx67S6UQgLsU1HpU7aQkZfue/nxnCo43TwZiS/WNBNAQv1XZIObTsGc9nqVWfsc2q2fPGYK7JKUkh9d3cfCintLAiUey+mjwrKVqYQkMDxg7FvpQ9vieSM0LdsQiaQoa5v6QnB74INu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719665925; c=relaxed/simple;
	bh=vDGWkwSsRo/RHGcWfPYYbGRp6w/yoKtIXAJWPvy2KMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDMWiMkd7R4yvWYEVZ2X9oomzHvJaOIpoPAAlv+bzeGPUi+hOnjRaJ+AOyTpJcdHQ5vgnY+rM3h+vvGg2XnS+kxjIp2OGEWevQNO/UFMoNerZdDMcKOTiBjqukvVbkNFQwM3qPscI+aBN8qBF1BS+7ZPGAHugJDBcaeaK+8Pxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkAnT5c/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d15b85a34so1666741a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719665922; x=1720270722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v2mP7MxtYe2gIOfvr/SrQWWXQkCRmCCOozysmV9oTS4=;
        b=mkAnT5c/ZaNGHGA+UV3fHYG17/mufa707oZ//M8zF0tH6p5F8Nq1WndIWzZdFIKvzT
         RABIz5Q71bzWB7HTwDenHfchx9plhT8OY3IYgwZrr6KsL73qWu4gr4rSHdyNdqhLTuD8
         2ClgB+/XBsNNl58IPnQ95QpcNcJDghGgmHtnP1+Q6enNjtsD2x79mgdb2fYFYebdfNYr
         eGdVFd8M4taJxVcpISxlJh0NJtcEqafltVp3RiFeBQDYf1X0ynPA5+TBqEUV1StpnKmc
         LvAqc6s//pAwZn+CrXnXubewMv4Z6RrUL5wsFVnwzeFmJsN0cjQls0UhJsnHbgVL0+0D
         kveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719665922; x=1720270722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2mP7MxtYe2gIOfvr/SrQWWXQkCRmCCOozysmV9oTS4=;
        b=us9rmIbw407CKTWTp/8TlrVx4n/G2hq/jQaN7k5kWnk9UGzr705YkUJ0fa/PCvUvUg
         rIbgdzuzUh0Dmgsv5J13Qv/zrZslAhN8EmNY/G0sdOoMbmWFYiFSLu8h7RdmOLJqI/Gx
         aG466S4RJMRje596rB5WT0ZS8F0WrrNLuYkt20upQcdL39A0a5P4lxj9+FMk+WW6cutW
         M5sRS7jgm/N0yZmOMIXqHPBnpML4kysDzFeR/FJGaTqsPsCR8rX13tx0vxRoXPUmIv8k
         Xd1sodAXR0E/hNSKJr5TIgLorP6w8avQGtO+B1O65Ik2wnXILCjuq6wV5MCrdL/FmJSx
         s26Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMpQHsu8aZygmthpuUiVsXRBmzxwxj2pp9MRu4BoxJFU6jbpFIcW0NpctXNLhRmSAeHVNB7kJPju6CQ7WOb/MiR/Z3yAPLJHjEF6qsdQ==
X-Gm-Message-State: AOJu0Yy1LoyNG5mYzXisXu4wG6KSVvNr+JekJbMl4eVvtT9py8IMYdI1
	pKdLfYLNNaGZhTE5BxJWeEReba5XaNmqhqcg7AnQfu3s2/frnflOuaV74R5rgAc=
X-Google-Smtp-Source: AGHT+IGfBm1kNYL6sngRYMXntB+6Klbn8GdkkN+/Rh8GYMfmy08RaQLGcqeGMqMAGWneA8ZdDwkf3w==
X-Received: by 2002:a17:906:e289:b0:a6f:51d0:d226 with SMTP id a640c23a62f3a-a75144a7c20mr64191666b.66.1719665921901;
        Sat, 29 Jun 2024 05:58:41 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0657f1sm164707366b.141.2024.06.29.05.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 05:58:41 -0700 (PDT)
Message-ID: <7854b136-7a10-42c1-8384-278e22922c2a@linaro.org>
Date: Sat, 29 Jun 2024 14:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm6115: add apr, its services and
 simple sound node
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, elder@linaro.org, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-5-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240628010715.438471-5-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 3:07 AM, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB4210 RB2 platform.
> Also, add an empty sound{} device node. This allows board dts
> files to fill in required board specific properties.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

