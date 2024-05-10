Return-Path: <linux-arm-msm+bounces-19715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF22A8C29D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FB981F24932
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5EA29CF4;
	Fri, 10 May 2024 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPtFgsqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65717BA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365642; cv=none; b=MiJt9IbrYMyg6NQCHydjVKEUXqbcz5XEt6Z5gT/oSx0rncZNK35oqIOP5K4nr4442ng/l6rBlql3ivywLzYr+GI2qOR6OXZ6g3c8DT0WWz+8gXKRT5Wz+/bgirg+bfVDOLqh819g7Rg4jxFhouRBz+qhacbC6lwcxB6nqpzpv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365642; c=relaxed/simple;
	bh=SjX/kCfSrJi2GY2ka8pKL65+RnH5+NTpFGW2SRgh7jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nz9cby088MQSa31Ea0uyFTlmOUmWhdEcjNg/stnYZQZpHL7IIReZX7Z38Bnb5VKSHWk03bGq116oi1HF0vMKEdUJXLBK0r/ihNI0GtrsoiSDUMonC9dJrCcnHfFwq1Ax1kiCKab7m86A+r07xVodutBp8DAbUxZmaTaYB8c1e4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPtFgsqh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34eb52bfca3so1958133f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365639; x=1715970439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBvdzVQWJU8MypKGBKD1JTF1bR2eY0ug4Y9S+vmlZ9s=;
        b=fPtFgsqhuXB4ZOxfuYGN3ld2R+L1HwXave8/w4i8d3f6AZFxU1R+razLqqnZG4j/fu
         IozTPVIl1LYmMn0qK39saGRaRVURBCVB53zgWLgLUw5KWoI5xky8QdLcJmMYUUtfr0/p
         qQmpsGUIogtYQM5kWcJp9fuR5S0P+N1T5NBm/LdeFNMl7soTG3YJISSnJDU7WIh20Wb/
         qY8VNI4a9+wqkBXd6qRRDbossrDZ4CXAwNcsDPPlCvXFLRdTc+pcf64ay4Ty0IjLZqrC
         e1RPbTNOT037+VbSowRmBfBd6/G/9/G/QpCGT7sRMAol+4ciYZIjR/gY+WPmAJ52JHMj
         WAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365639; x=1715970439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBvdzVQWJU8MypKGBKD1JTF1bR2eY0ug4Y9S+vmlZ9s=;
        b=K4ROw0UUTcUdU7g9q5+VRtWs6+Z8ZC/6vJkl87wSt/IddSYe/Hjb6XH7+DApyXWHN2
         VruwclTUdAd++2GH//qbRjlFaRkSRq2NLONo/e3Te/VSmax3/uWRVxagdcIl/ueOyt5j
         qNyYQ7pjS3C2bpRBN6ZfWm8Xf49CBRM72ztMd9i5uDqWw9mez49oHOsN81pjB8ZMp6VV
         8W/NDUVcnrqPs8GyB9JkO6OvwdnCSSTVJc9h9AsTW/N1PJSd21uvugjzIlCqe4iEneda
         lXNKuBoOFX8LWPsrOyhyn/BO111NMzEkGKVIpWzS9tBQA/QnFkOFi9PakvojFp8XRcPV
         nEhw==
X-Forwarded-Encrypted: i=1; AJvYcCUVD0JgdtWWHf+wmcnigqdiZbFQWy53iKO4SY+ovnFEsTIOULyY4l1WE1vALZ3oXT/I8XwH/TxNeGiYlwG9EWLY0EE1hl3pScex6chfYQ==
X-Gm-Message-State: AOJu0YxN19PiiaCr4rnAASfg+esGGkelFKFHW/w/6aeY52VGU4UYTay3
	h2BtOZuDPOtLkWeq7RgJ1sjx+kY4IO40GgMy71zoPmT9a6sa1xFWgLbwpeD1pxKt+iT84f9531M
	DsS7qpA==
X-Google-Smtp-Source: AGHT+IGm3ZJPZIaVeyhqvPKG3KsEL8oP5CEmzp6dKKS61dLQ3zEWx23D8sgmpT/NRgTHUEHS0ibzUQ==
X-Received: by 2002:a5d:5490:0:b0:34a:4227:e9e8 with SMTP id ffacd0b85a97d-3504a9694f2mr3126219f8f.47.1715365638824;
        Fri, 10 May 2024 11:27:18 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a791esm5198463f8f.64.2024.05.10.11.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:27:18 -0700 (PDT)
Message-ID: <320ba508-56aa-4ef2-9fab-3752f4181da1@linaro.org>
Date: Fri, 10 May 2024 19:27:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: Attach formats to VFE
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-3-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-3-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Video node formats have direct dependency by the sub-device pad formats.
> Remove dependency for SoC version and move format definitions in device
> which creates video node.
> 
> This commit attaches a struct to the VFE resources that holds format
> description, so it is much easier to assign them to the video node.
> No need to use a switch-case.
> 
> NOTE: The mbus_bpp is used to calculate the clock rates and is different
> from bpp which is the bits per pixel written to memory. We need to keep
> both values to not break the calcualtions.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


