Return-Path: <linux-arm-msm+bounces-72568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1EB48DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 489CA16B020
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0C23002DE;
	Mon,  8 Sep 2025 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5CszTA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3A52FFDE6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335126; cv=none; b=jw702+l32bJsOGlnSDur6iNzToWzxhTcH3DeXVjym83AgMDf/8P7sGTSKvIIj2G+GZDdcjPvdwpx8CZXfTR40XIq0n/Lb7AOCXjS3TRdjG/y6MGpWt5RiIQizZwbzD1lnzUlD+D06cMJNNg9dgEmGJeBLyJVJEVsZrwsE7Qckvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335126; c=relaxed/simple;
	bh=SGPY8M2Qd3kuoLDKFRoDhwJ0VxrlXDznpzVLSQgYxNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJokFJ79Sxyxn0H4HqcT2296jwnYskY1jSSDnh2Nzv7/Q+HBU+CasaxUCvgkbHp3Gru2OjTCbWEe+wzRhoKZdmwV7YlQXm8t/JeEvl6kFSCDziSeP1BSBWTjBkzB9xKNqGHlBvFUyLGTEoYv1U1WVGCdA2mFzDx4eQLmC/4AocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5CszTA7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cdc54cabb1so1561729f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757335123; x=1757939923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wBkxa/yGQ7mP70MIUjvPeodJiXweeDDEtqNWsYtFII=;
        b=d5CszTA7xJRtXNWef+1wbbv37BZr2y0B81NaHDnMCQgmvqvswMAQ2Zwo1E8ysIuIbL
         W915IESn239L7536C8ADvADkeIoxV4Wa4y6Vbe1IH468MGIo0XDKGDc9f6/lXAGF/jMI
         4aP51aEqSSHxqSEDbBjJopZAo8LLmpKRQjlcLQh/ppUdsy+M0iENM7JJ1FbMeKH7zuGw
         KNvPe/tpzrzEf++JfgOF9KM/GyVVq6lWOYLdpSH4bMqIRpZ9/g6n9VBr/d046UjZx1N2
         AXz54aRqquEeDkTu+qRkXUs6fKgCOXF1dEa5bT1ImLt8ULglIhp0/vf/EcWMH6BMACQC
         p0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757335123; x=1757939923;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wBkxa/yGQ7mP70MIUjvPeodJiXweeDDEtqNWsYtFII=;
        b=FXxjtpkEEg14igkndIPmZVyB16/+rvLhQxMI5vBlPTvkvPLkGDqaGgMH4TrXDV7QnN
         8jqnvR97kNHc4v22m1GrMhB8cbpI6omhuPDErj0xAPPM1tUFX3iLhjHGuY6WPIm03bf9
         2TaJIWvOewO6/ru+g/EKTZ61O3MPBMR1MLBhwhh+Iq+ypLb3EWalW3z14LPEL/s2C9WL
         8SWPt65MTXNNJ3zKZugn3f6LafWVJRTFkcBbtuC9nkUOh58D8lInpxSEVuw+MQw5y67G
         7Pi/v8hkfVtUnRUIEJlM/VATKzcNHR0INcray5mBYU2iTC57cHogvkqfon/6mdUkfnPi
         3qNg==
X-Forwarded-Encrypted: i=1; AJvYcCVWE7qfSTfq5cPixirjIs08iaAXawtoSXqoCTBoVi5RlRQUtajCMHKbQOMiUOCdSdynIcSz+gKDZnt8my6I@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6asNsNXWQtS+CLr49u9pqL1W1351Ka//45qbJX1/Awnv9Cd/
	A5/IqDrpjNAmdpKqWunTkVp5sBGs/fiInFAey2+T7vAzQCQdFomSUIjY1Qg0FY0oQVU=
X-Gm-Gg: ASbGncvWodUonwcKS9bRYmRLSO12NuXzHyLwUvX/HCQV73JDe0pQD8FfR27uKlYkrVN
	mQ95g5fw23a6kSFBACYTo3zuT8cUlKJpfaLHc6KEKA8jnISrExnEaMNAEFV2rOawLSA28QxGcHJ
	1yGp6aDCMr+bYLPfSPdSTvaVdkpkPCm50eWcW04Gttt7wKl3Q+kt+gZ4XGU/s3Js4GEmjP14oPR
	o9DbwASvo9+dY0lP3lfa2fnjLSy327vWh5G587OZCJazwb5QlErmV2YPOz2YYu52YYpcrl0b7Gc
	M7j1K/TigOg8N3WsF8gK43z7kB8Trq0Ar+tMO1/nmDI3/XjLjhPiM3PkQS7F2nx6oaph6SKUWfd
	N40Cp1cyoLmD41QmvgJpC+bvIDSTSSQV7p6dWBGAj1ow5OJ+3paS+DuaCTSn0LAdc8fXcL5iDUL
	mODwy2R2DgFwvwFVsSr27pk++O/zlhnQ==
X-Google-Smtp-Source: AGHT+IEhnBeD2VT2hd/mBiSwfbFr8jrq1cYimX0QHes+yKVAo+vJbOIIBqAhykAh6gs4D05hHSw0Fg==
X-Received: by 2002:a05:6000:24c1:b0:3e2:ac0:8c55 with SMTP id ffacd0b85a97d-3e643c1a48cmr6364184f8f.55.1757335123380;
        Mon, 08 Sep 2025 05:38:43 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm437799005e9.19.2025.09.08.05.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 05:38:42 -0700 (PDT)
Message-ID: <1d72c06a-1a44-4364-bde1-afc4514520a1@linaro.org>
Date: Mon, 8 Sep 2025 13:38:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
 <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 01:22, Vladimir Zapolskiy wrote:
> Since a few called V4L2 functions operate with fwnode arguments the change
> from OF device nodes to fwnodes brings a simplification to the code.
> 
> The camss_parse_endpoint_node() function is called once by camss_probe(),
> and there is no use of knowing a number of asynchronously registered
> remote devices, so it makes sense to remove the related computation from
> the function.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
I think we should keep the code as is here until after merging csiphy 
changes.

https://gitlab.com/Linaro/arm64-laptops/linux

---
bod

