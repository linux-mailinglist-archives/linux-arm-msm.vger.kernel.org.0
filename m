Return-Path: <linux-arm-msm+bounces-17098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1B89FF26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9EE2878E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA317F37B;
	Wed, 10 Apr 2024 17:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NChVpYqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919F17F372
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771568; cv=none; b=lKh2g0N1N6HuicxRuNrHZdC+dVExwhcWdO5azRCgAWupddhcAS3VHorgQEN+b3AHX1aStlZkpWUfyzGYz7cqI4kKFdgLMSPZv+/wMJUROrVDyVUosub3gx0tlSWFmZ6+1+A2cKIQImQczKR8RgIeyDibDIsIVMI+k+iJC0e30c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771568; c=relaxed/simple;
	bh=767o7xvkZkE5AQMsnF/zYn8G1hq61jQzSHPrrqakIms=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UWdc7EIxaSTdql8TsEDmYG7IZiOr+5Jm+WxPCWKrd6mD+RjL7EVIrz8YPQHSo+2OHZuW2073p0cU+kzFLHmcOFkZd20115I79EP1n2vqqWMwP4kNq1ajZez6wYHTM1DWHUMkXykp3AeV68I4PX1SAYZhgMvl4aV11g43OQaAp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NChVpYqB; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso51731381fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771564; x=1713376364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOVHA2xlzK7je7ttjy1nhrPlXlPuAp2xezIP2Gu8nIM=;
        b=NChVpYqBHbSAiaCkhnBtbML0SQ3clrOE0QexSV+3o7bhupaWXmVtZcmUxuQuI2ibsV
         jWlcCOpQGZb5xBOuTu/4dwjReDfdML1jxYoY+sP0X1OtLiNetersEMznvDTubuyzFU3M
         zHA4An29eKS46OJdg4uV0bX/1Cub5ghDNTJMHBUd4ewA8+RNl9QyYnI7FjxyVZuciyGX
         B2tKKOeeNbXVPzgsp5yuJBMpDipGZ7C5IMMC3E3Nq9D3B6ndz9PoWM89Q3jCWbfkokqB
         wjGuTpmdIQGk06bWSRNeIWjgWSblJzCy9U4sFmBFH6RatuBqYrUELC7F7UBlU0HokwTt
         YDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771564; x=1713376364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOVHA2xlzK7je7ttjy1nhrPlXlPuAp2xezIP2Gu8nIM=;
        b=BKYuW1lGlgeGfQoSt4r5gRAEnkgcsmyauC3708xdRQA0xYHgsdtlTSXVWZjNudZSHm
         eVB2wstobaqfyV1orZseJicHHi5AdCuh0hMS+AVW0//dU3fqCQTo8LmNu9pFWQ9yEObS
         ODtVHG+coOsIF2fNXqx0ZT1syoV8QwUAs1AMCGvvsXqdJ6Fbam4NVpjU6xip+W1fHVFH
         hHaqZxIJ4pjZuC0cUyX8fc+FIxzbYxzo8ItyxtSx/CyMpnerTOgewug2RMZ5f1eOqpUs
         EpncEOI8g8Ligeo7N4nsEgI3++A2Xnp+senjYGQm+VFg7cnGRNAXKdynzNVWiB1t3KtU
         cvlA==
X-Forwarded-Encrypted: i=1; AJvYcCUbONzE24yjKWIdBIazX38fcwKQASqE/ODbg1hWqnDbLHuRJ66oPc1G8eQE0tPosWxLmo2ZSxQYK6vQ7DIn/BxjQPg6T/ctfBx6V6YK4A==
X-Gm-Message-State: AOJu0Yxrsu/oN8B1ZuEb89DRtkFZ8Za36F70Vhy9if95yMuMHphJTe50
	8oeX3AcGkHfCVw2pvV3H4FIb7VpwRZjxogxAgu/IwDRl+aWManJ1Smfmy9BqVoq++5JkPZN+Vcz
	OwbA=
X-Google-Smtp-Source: AGHT+IEOlj4YMG9ismhRXJyrEXTIOfXs991+9TpCiZiqMR8fC8jAZzGSCXGqag0xPmiMZ4gXU+5/0g==
X-Received: by 2002:a2e:300b:0:b0:2d8:71a3:aafd with SMTP id w11-20020a2e300b000000b002d871a3aafdmr2448469ljw.27.1712771563497;
        Wed, 10 Apr 2024 10:52:43 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c20-20020a2e6814000000b002d82f0f14c3sm1844665lja.130.2024.04.10.10.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:52:43 -0700 (PDT)
Message-ID: <148157a4-7f78-4d03-8a12-44658ca6ab51@linaro.org>
Date: Wed, 10 Apr 2024 19:52:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: qcom_glink_ssr: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410164058.233280-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410164058.233280-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 18:40, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

