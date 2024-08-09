Return-Path: <linux-arm-msm+bounces-28238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1324694CE90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 12:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BF57B21408
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9EC191F9E;
	Fri,  9 Aug 2024 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te9uz/g9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88572191F65;
	Fri,  9 Aug 2024 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723199050; cv=none; b=S3NTGbCUD4FdWCPOtqzj6vzAFdaZMjYCKUG4kCVHheoiU6WY0UST0vjIpY564rcs8dXs7+qLEuICZvt4yhthB9MDhtEuPieIDE1scgy8HdD/s65xoudxEA2g8ae9eGz7XGDY3jqdAbV4dUNiiw0jRaVv+bsrfzULY+T9Nar1fag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723199050; c=relaxed/simple;
	bh=sPmPA7nvgoWT133grIF62UjaeQNHtfqRTgbNMO3fquQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NL9Y3DNhpLggxTbYM+gCo88o8XQbfC65FvImxVXxYBHGp9do10h19QQI4JU+8fIxmqELfF8Meo2lAKe7j8TF/Gireeq2xMVGMvtJCmh2DSPWu3pCZOlxvPyl2JeMW/JCR18lGtXdev7AFK9qGWS15mmnRb5af0m1mFA3/Rgi++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te9uz/g9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so2340836a12.2;
        Fri, 09 Aug 2024 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723199047; x=1723803847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJW+iVcJ/clFKPyBfykIqZak8eXrp6eEyX7SMQvRc3g=;
        b=Te9uz/g9G73SCDx5FyV9Iy1REmolrhPty+RXmjF/Op0MJkiv1YNHC36wbrrJoWZc4Y
         TC+oZU63kFxIGrn2I2feyYOALoDyvfbAUfUsEzdOxPFKQIVjU1E+YKuLBdjuMGR0SdqY
         RO2E6FVvHE2pEOOZmi2sPzzx1kEwVEC3/uOKSU18x3c2b0H69YTVY6YDaguLDIVv43Ug
         b/18PuSZMkffl5eJupxXmSn8MDPZq9vUdqBrEILdAUrfGjRZnQc+UDtqdP8KUGP1N4t5
         5H0zct98h7oO9Qdldze03wJH55eSG6H1Y5bsZjMDU29e+BXEk5qGhNJDTdDw2gvsSekm
         VxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723199047; x=1723803847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJW+iVcJ/clFKPyBfykIqZak8eXrp6eEyX7SMQvRc3g=;
        b=O5uvUboo0fy4PcIAm+KldIqZDF1TMpfKEIugSo4l8imar6/ED75bqgwA6bcIiMwVLa
         HX+lQke4XDAEUrsyebx00Axnk1t1FBGavv6p+Yq6vMkF+xS70w9ipv7fWl9rFY3Kaw8T
         bxCWoENRj48RmIauOiRNzTz/5N6lAKlNDZkRNdcAeXRuJCpN+JehADFjxcrfSE04hp/g
         PpNa9n+1t1J9+a4LtlGsPwYlDpLVLzJaQ0U9uIl13pitEyPbZWd8YLdyHpuLjopMAyQS
         7JavA+MVhj8rNwFKZivejORWH0zcWqcGF0z5vDDwn+hhFqDEu5P7hr0kzC8Gl3ghxjQw
         iN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfuEjWZr+6gZUJyMi6EgFQaQKDS0ZtQVHRL0dHjjcaMUcL1/aZ02M/28KveQK4dMNYOH8TLQtVK+mQk11AHBKOPL/enn6SWuw8OCRNZP7ZIyiSwmsTfmJOFlWajxu5HtFVJGw/3kxUWvr+JHaNFjpBvTKXy/IxxdGHyDA9fIwOtfTLUK5RSMk=
X-Gm-Message-State: AOJu0YzJGGylXuXlz7jSrDmK70gGwYsPjDzFYb9Qt0BTR1LNaksNVr57
	Nms44qGYls8oFsJw2dJ4dyHwNPwyt7ulvrZRTJvAww/VsW50XX8R21g0F4DD
X-Google-Smtp-Source: AGHT+IE1RN8UnSRH5xm0prfSvoysCcyk9EvBRg6dmNlTb3mp1SdB/nizgVyozxJA/QCWGXJxYrNadQ==
X-Received: by 2002:a17:907:6d15:b0:a7a:9ba8:f890 with SMTP id a640c23a62f3a-a80aa54aba5mr75623466b.13.1723199046258;
        Fri, 09 Aug 2024 03:24:06 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0c185sm825942166b.61.2024.08.09.03.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 03:24:05 -0700 (PDT)
Message-ID: <b9b02bc4-1abd-4a56-bb6e-ac2c59e8f609@gmail.com>
Date: Fri, 9 Aug 2024 12:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: x1e80100: Add UART2
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
 <20240809-topic-sl7-v1-3-2090433d8dfc@quicinc.com>
 <ZrXWPQVXfdL-QLnt@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <ZrXWPQVXfdL-QLnt@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.08.2024 10:41 AM, Stephan Gerhold wrote:
> On Fri, Aug 09, 2024 at 03:43:22AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>>
>> GENI SE2 within QUP0 is used as UART on some devices, describe it.
>>
>> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
>> ---

[...]

> 
> Can you combine these into a single entry, i.e.
> 
> 				pins = "gpio8", "gpio9", "gpio10", "gpio11";
> 
> if they are all the same?

Keeping it as-is gives us

a) better hw description
b) an easier ability to add a label and change e.g. the bias

Konrad

