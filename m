Return-Path: <linux-arm-msm+bounces-71374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C465EB3DCDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 10:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567351885EC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDFB2FE04C;
	Mon,  1 Sep 2025 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXhpOICq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B52FDC5A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716377; cv=none; b=duXXj1zSbherJ5HYeZyW/W5YwucZswNsD0GUZbsx99S0Lfy318taAgbAfZV+tCPXWiaYCUCryUxbF2leISS5zJdE8A7wZXLowPvSOgKfklYbdyh+YTGL30F2RYNqAQS3miDygLjg4Kf2RfY8IPIlovQKgwGMAl26PpMWf8+ahJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716377; c=relaxed/simple;
	bh=QoCdfFwHTIhOjBwrsgIE/hHcr1xYXegmqPtRl8bOr48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVlQ6DAieWq0vPcCRrwZY+FExf5jTf9wx/txV8uOqBcUzAdoy5ZbnN4xyBzYcfFM0RpH2h6+k+AtVGmPcloYZX7AoTxGtjyxBAupbl6UIDbLAPHzui48bYw0HdsW603yjgAKyUujXhLWxjQhrarn+UxH+vyll2Q+OtVJkZSEfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXhpOICq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61ce9bcc624so4414046a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716374; x=1757321174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCuDvCcZtXrgauUzDw46OP3GVMHfHfFOYH0ITU3ZEfo=;
        b=FXhpOICqDBMtI/Tx6BqwrNKTDDbxeMlX1+r0qq3CD+xUoGahK7wURA6FxIWjEtycbM
         Bbl5CFWBxAO5o3kwM6KYp+AxkqZZfxCLxMv10ijf4T4nsKqJ17GjZjkuxkLsb00iTWZq
         eZPiVm/+gNjhpMNGLIVd81N78ttD7BurRKDblujnxO2kFOGqmCb6WGXueSPsMPCIdVzc
         zKzLf/4xZ3p6HgPthkWzcBjVFLmXXwoV+s6vRsRtLo7ClueWwrBRcDam6BEKI8U7Gmcq
         tC/XzQyvEkm8hUnzMVGtKgZeQmJhC+mgNEfxZw1uPKvqyrIY8op5qKehrZD5sBTd0iJF
         9cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716374; x=1757321174;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCuDvCcZtXrgauUzDw46OP3GVMHfHfFOYH0ITU3ZEfo=;
        b=RnWJh2GPQ4lH/ql+GyOcWKoqfxk/hcdWFIvPkAHCMmXyZPFOxDFVet487NuNFFcEgo
         C9MjOO+WxNRPwm4964V4Fb+AsgCTzWRJYHW75LcflZvSC6E35l7/NJ3590sk7aE2r/sq
         siVuczp4Adl9uBHD3XTLD2fyST5sHlEWihULzm+ta9CzhnTAG1vlsRhVST1i11b/Mt2/
         otfpcMscsqEbIhWuZWo3WW4PvlvYqQxwi6Y5wlmsn0f7sCiflDtkBob5RRB8NBP9Sr8q
         0wHaVcaVt5ytwq6xG55JUCekcQa1Pq80qTFWDiOzUIOAgvuMOUSkQxvQu0VwL1JxvDOz
         CDMg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ITYCmynaEKFOglMRM+rZDb4+MVZ6HpMKvSlFPFV0CySD8rZAfdZrIzsDHU1/UMgiHW7SiiDqzZcAaeC+@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvL3NF37djs7Kg1dsbjSjaNbNZWrhSmiCKgvEYLL6MCf1eImR
	zv45rwWm/ClGhRnDYOIj0WcPR8Cxaer6eN8C7q6HDA5OYZxkyMhpje2Q8KQVXlrF1h8=
X-Gm-Gg: ASbGncsjZUu9Y3szs8mT3ZQtYloFSGrfQEZImsAYodmlqv+oAunEun/ww64bLMSqa3S
	Kg6XovYRQjuMOGgK02eayb6L7/p59hWOx9MH9tm/oo1ddHWSyE08Q9/INU99r47gKvAR9q6L/1k
	lFQcwGJ0euuwouttJ0ODqLQ1bf8L57I2Iv1idNL12EkOtWXw6wix/V3ry12s2ZJudHCABo+FaiG
	XrwTrIPuS95FMDaBUVWI9lLVTAUfB7sEt5n8xCtL7ueRZPBVIEF3eNP0smC+SrjeNVyCH0FFfof
	cM3awXq7fxwNkGFD/NNcsJ1++VEH9NM/v+R+6WgIM07rpVyBgwjfp6V30g54aUp6GH9qKXSSLqm
	+ja8NnJPovwOOpzVeaajkaQ1v4H6fDv8JPTIAByEETZAdfoZVa+se2y/U+e5v5naI4IAfAezLVM
	Jk52D0VVlDWMCzI+IPeI5L67q1LVWvww==
X-Google-Smtp-Source: AGHT+IEwgaLMLaFBKFr/PWcWKPlujPF7MSGDJTrP82Ursog0u8JoY9Z+hSv7cNIFvoZlLeRqHrBOgg==
X-Received: by 2002:a05:6402:2693:b0:61d:dd9:20db with SMTP id 4fb4d7f45d1cf-61d26d79f49mr5756112a12.31.1756716374144;
        Mon, 01 Sep 2025 01:46:14 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4ea764sm6686462a12.40.2025.09.01.01.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:46:13 -0700 (PDT)
Message-ID: <dda29710-4997-4c23-8620-b43ba402b7ec@linaro.org>
Date: Mon, 1 Sep 2025 09:46:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: update Dikshita Agarwal's email
 addresses
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
 <20250901-update-email-v1-1-8fd49d58c0e5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250901-update-email-v1-1-8fd49d58c0e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2025 08:33, Dikshita Agarwal wrote:
> Use dikshita.agarwal@oss.qualcomm.com as the main address for kernel
> work as quic_dikshita@quicinc.com will go away in some time.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64ecfa45540c3e10cdef4fc10fc10e854b396c99..fe9253d6fe49c33828a79ddcf59d024495661774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20818,7 +20818,7 @@ F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>   
>   QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>   M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> -M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
> +M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
>   R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   L:	linux-media@vger.kernel.org
> @@ -20890,7 +20890,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>   
>   QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>   M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> -M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
> +M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>   R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   L:	linux-media@vger.kernel.org
>   L:	linux-arm-msm@vger.kernel.org
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

