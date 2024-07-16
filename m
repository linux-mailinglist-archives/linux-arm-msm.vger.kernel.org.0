Return-Path: <linux-arm-msm+bounces-26312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEDA93244F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBEB281473
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73414198A3D;
	Tue, 16 Jul 2024 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBl/yiu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8142070
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721126758; cv=none; b=Y/zUKfpszYITfRgDdnZ4FBMm3rAZpq8WoXBWvodsBwGEjnvmAxdjj7gCzz4C/UZ4aay0gCr5NyZ0uB7u5l2iI3tmc1PznZD9HM4CKBjTZbe0b0NR/uzLc4JPDtIWmxWwpee9LIzgFK9D39hUpUHm6kUJ7tsLlLr5F/PRPQB4Cb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721126758; c=relaxed/simple;
	bh=CqqWOTYGSICF/9Ty7Y0z7fySVIc8NgEtF9kUlEJDeLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSZznH4qygHCuRg+s4n5aTVs1IXGKXMNDqMbueoom+zrKonoXUdTXX+Cntqk+qM6Q6gGv6m/D7OVgbUnOyYeZ9VcVzRpjbEj47L2PAa8V/hRvhIwSZBUVMrKQqyZl7ITVQJUM0JyZTR4088S0NQGxO3AQaHxG4UH2MYf5I4uB9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBl/yiu4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eedec7fbc4so35327521fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721126755; x=1721731555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ukELGrBCNAzk7mJWOqRXfVvmx1it0iPC3eVeirNIJVo=;
        b=IBl/yiu41kXRNEhmjydP46yjAphzK7P408TGZCUZfxOspYrWQaOvNuJjtibygPwX77
         4Wt3ipFdO1Oa7rY3JWn4FoezoOgqeFMS2DcIvwvg1IuWElXi2ARbL/zBe8XEBvk3cAd9
         Ke8nNhDw1jd6Caezbq1QVcCoY3+MyZGcwKGuvUE2Xorn4AHNI31y3unVVCv/OXSMC4Xn
         5AGoc90nnR4cZSmfe5v1UtG503sFja6v8ukvjjyqsoIz2+dS7pIRGtWzo5DsjqZrI7IT
         1qeP4OeYeKFcJ3M3QF+Ide/S1OPjRKqY+kbmaNAITCEVZbwCdWvCFLwpBhon+ezjEFoU
         DWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721126755; x=1721731555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukELGrBCNAzk7mJWOqRXfVvmx1it0iPC3eVeirNIJVo=;
        b=etatw90biGTacXOh75JuI3S615X+Z26gj9xj82Az6GDS1Vigq/TgedtXLpac20HRnl
         UepSu/nHxaxtbOoDnh03QJqhPkLYafJsTovJIUALpfkSLPcsOzb5EGwDRabXRkxhwUFT
         ByS40p1cSUgeJD9AMZqleO3VqI5XG/fiGryzJftCgmVsYbzYFaZIARhfrZBVE2usMN+Q
         ZBCeik+PqOK+1TeI0qTFxHn+lgjTNLdBvkl4wp+mkJ2AF8SxMKkUHVsNvC7CCGS9HQc6
         XmohzuG+JokVBNg9jdiOAJ20LIzVWqOhQv3wEssQWsmzRvdKfPO1iMx+ksLsDd71aUqw
         dM9w==
X-Forwarded-Encrypted: i=1; AJvYcCXFi/lE3PEWWcgPYcq3riHlqpXdy4V9ZjnaBBjFS31oUyORrFzqEnjVP0bI2YR9kGnUMUgW8G7J+tpr1AeS1p9sJBl5YvLGZPVJ6ik+sw==
X-Gm-Message-State: AOJu0YwRv+O2kzhIDqiCDzs0GALq2XXcKFP1EcyHrVJKi3C37q3LXZnY
	+5g8HFe6E8Xst6R4Jqpc72T7rxjdiJxw25tlW1yg0FWs2/hqq39A08boLk/fx84=
X-Google-Smtp-Source: AGHT+IGOgiREm8ELGy2+mmoIwWs2pds3P5VYdtK25QKhXhuiHGK3SyeLdyPNZ+zUYZAtJ30N9ljNDQ==
X-Received: by 2002:a05:6512:2308:b0:52e:9e70:d06e with SMTP id 2adb3069b0e04-52edf032b6dmr1030082e87.53.1721126754585;
        Tue, 16 Jul 2024 03:45:54 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b48dbsm295189266b.57.2024.07.16.03.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 03:45:54 -0700 (PDT)
Message-ID: <3335d95d-d5eb-41cf-b18f-90894967d713@linaro.org>
Date: Tue, 16 Jul 2024 12:45:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com,
 quic_psodagud@quicinc.com, abel.vesa@linaro.org
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240612124056.39230-6-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 2:40 PM, Sibi Sankar wrote:
> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

