Return-Path: <linux-arm-msm+bounces-40466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322489E5178
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21D61881C7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A901D5AD3;
	Thu,  5 Dec 2024 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtY1vNeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B81CF7A1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733391338; cv=none; b=SwvrU899vs2G0AfbJHSRjaLI4PJDVyKdGjZrWKvqlLrkNz3fUvQFypnYUi4IQ+dthWIg/HtjksDgxAsl7XiRhMfwxOcZck7R2SWubqCuem2FB6qULU6nqJ8pMH2UXcUmGpcTy+Lndk07H1F7fwr9J92BOAhvJUgPvnS90HgUV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733391338; c=relaxed/simple;
	bh=ioj11kRVt4ZzslmCkvbLnmBtMfYRxYdlCp3WQpO83Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xm04HaHe2xeC+4pyOngwM26DBjd82xuVcxAAlcg+rM/wkUXB1VeBlQdZZSqAq+bxqokMmJqzZWurB1GskvbDytJYKVZ1DpNAXrEvQ9UdfdtNkCTl2QWx+3pRkKfgzqJaUwtWxipF09l/UZRfgQ1trkj3bB3Vs01Ra23QxL2boXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtY1vNeR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so132432766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391335; x=1733996135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=;
        b=TtY1vNeRwVPA7C2f9kOILVD+K2JN3BjkhbBN2fmGzwDDKHyiLYZtWnri0Miffn1ZbS
         wy4wJLHVt21F28iQNiEnstnDe5BoksA5p3WJ+C34lJgKv/T3glfpSCvq9AVnidOH5TeO
         qlbK0q3+fr67YVsAqBjDz8AwqI4HoFGyqtG2oxDPLxvLQ2HSaEMTcglOtaqgx6xK5tSe
         zS0u6gxtecC2MPKzDZBc3edT9wgXcOPBKJh1Vw5Za94xAAlV9jCA4gm2VUykMu6QmkW9
         A+e1KdLLnZNP3pl/zkN13Niju0bZhfd2/IFaSjsvyczB9LZaF0uyxWCvIKrINFgJy+rM
         APXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391335; x=1733996135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=;
        b=HD7fKrU956L1DtB0G5PIqxX7EW600F97fPdcCHay/c90WAbs9dUR3dGhplRYTRUl9m
         a7zgsyKEHrI/q460091YSyQ3oAdzryVev94hvTiUyXKBS7+UoSuMo9jQpTPLhlBoip5F
         5LXWRdm7hLZ5toZWdASi+JwgmUDS5v02W9+ATF2g0vlrw/1TLx6z96H65whA/hmV863N
         NNJAqIgM0rKQpW+6BHnpgxkFHB0kK8SoCAq16WUzUO6z5jg3un9QC7Pg3zgSqFupxyZQ
         QlSaEq41ep056VHvUTRiaUEgs0kVOqC2jzu0NEpWlrX3U6erjr9/Phg34dx4sX2GM0M9
         23Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWW9UgqGsNSA1RGRQnSLUsD5Q5KKBg8287GUaOynp1G9ssLwxtGSeCDXJ1Mp/rYMxbVP8wAgiFnTVKDU8xP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvon0CgMJ1NYJjjkM4s/gTIS6RxItnJkO8NWWSQCoavMILetcS
	uzZ0kt0ZxRd+OImr5yP1wdkmgso5KSEJPqm/GcKZrC8hO49kM9DMfe684WPLXOY=
X-Gm-Gg: ASbGnctrp18CvAWQqHx5WeUzCrRZRX0ak4E2kdGaUUBVfFar8rUKtE0snZFoSEHQpM7
	dZ0nDNmpA0YBK5WCJ1uRrcqokvJQzC2K6R5MZMs8pt8m+GJwdm9FNmVY41qbidVM+9pCTgq1NSO
	bNlX18tlKRer0LZWwWpoFf3UYJy/MO2PnrvKqQ1YILSd8rCRXDEYUbDZMUl9+q/Hj2srk+mS3mB
	AqqD+TMmfhoAqYcWTfcCjKwC3tDGvLqZFCtVIzirkGOK9x6iWIjsTFyzwFpJos=
X-Google-Smtp-Source: AGHT+IHFm4UZarfubQus9XeHuRq9CcZZpSvgMn+7LHQv0GsiN/Tz1ExqT9VocSpHFgTuSVRxvEIx3A==
X-Received: by 2002:a17:907:b98:b0:aa6:1678:fdc with SMTP id a640c23a62f3a-aa616781260mr394843066b.58.1733391335136;
        Thu, 05 Dec 2024 01:35:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b609sm66188266b.109.2024.12.05.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:35:34 -0800 (PST)
Message-ID: <51d340e1-a62a-4851-a2be-545580bf4088@linaro.org>
Date: Thu, 5 Dec 2024 09:35:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2024 10:00, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 172 +++++++++++++++++++++++++++
>   1 file changed, 172 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..e363996602d6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

