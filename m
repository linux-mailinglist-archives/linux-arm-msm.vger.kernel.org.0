Return-Path: <linux-arm-msm+bounces-40471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639449E51C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D7A167CC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C4A1DF26F;
	Thu,  5 Dec 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yd1WbUu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9D01DF251
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392401; cv=none; b=n6Q9563lAgzwjLB+Fkz/uyKg1dq8rw8w873S7lYzZXgkcmTOoxTWljIKDHplIUFP9FGb9BqaEN6T166ZeuNFxOMxYbHYkGqRTKGPQaKF93BSRxPNBBRSey/ulnH7xaZ+e1ymMAeCDhlVMvfCiZ87g16Ss4MnmxWOZxYpgJOIVJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392401; c=relaxed/simple;
	bh=fcUD1G+KSAjumj93FjMt++z+am/RSCtRwF7W26pQ08g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciMT9lLRTtoM6EE0BArZEMf6lPpZNPEfeXkQkUHKP4cy2bau1INj58uECkvI1fv8YOm1RCimxCqvbfYXtMQWsHthOxrgiiCxHW3b6SCF1y6tdwbUCZdgWG8thRa8C+j9Mcohe7DsSL+7sMnkfdyQR8rFpGz1eQIlTQoleNfqXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yd1WbUu3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e1f12c82so504679f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 01:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733392397; x=1733997197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=;
        b=yd1WbUu3Zb/E8mN5vYA9A3FoobZHzLvOc1usZV+ZQ6SlgHg7HQYK7lgifqpRTh7QOu
         FGoxfxFkIRnbxZrOzsVdRYBS9aJZdpCgsQUjYW2NfnZYQmCH30zj1qX+bTgc5aZIwn8T
         rnTPAL4AiVpXRfDDF+RgEzq0wiopc7MVq+1jb3QIzVnJr7Q+C56XGBtGAR496oSRz9Wi
         VYhZzvNiZXbKFcsFlyqv0Xy5PG5hyPTdgAomRvCh7ndZbQK/EmKczTlyga59iBCZmH5H
         AFW28ApPo+n7Bsje/daRcCuFNSxMkdbEsyhpJQdTto3OM4iNOaScCpNErLGINb43DFrL
         ZO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733392397; x=1733997197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=;
        b=iaQal+cCqsAEHnQ/eP0xj3kwiQoXG2BCR67ZAhmfFOpu+ymzp6fnTrssNAQtNLF2E+
         KH+b+//edIFoVoBtJu0U2Ei5VjdbpihwAnhA6Sno1v68t5X4wM4cJMU6E6jxogZmWu8A
         CwDYZo/yz6oPzDzeQkauTC8nnoWTAsv3G0HSdM/5eDzHNCEUSEykVy2GG+01ftLwscBA
         O3uttdZ/w6O0dfUeGfn6F9QTCDvWEesoBy3zEp6XpgpkgMMhIfwsQT3A4SG/EUMmQCtI
         Jhf49q9Q4qccwRhnrs6RTSIDhDxW4a3diaOrv3lalIblfm61/12y7N75qV9ZnoiGrknH
         iAzg==
X-Forwarded-Encrypted: i=1; AJvYcCWMeGAARKUDNY9YY4P/Y3G6aEJJrDVwdLYm+Z24EcTKz135uOPTvfC5iI2hhOUuZHHz+BrRMQI+hmJT0Lvp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Jg0h/QN4uhh8Js/bkN/twgFIh4e3a6z3u+BiaWUIUF/uiV4e
	mzUgLJtwH3P0HM7dOO5m/xgEf2nyQQDeb9JyXb7T3iZUWl/QXYP8IZNOzzlO6KQ=
X-Gm-Gg: ASbGnct8GkUmIDZFCUYa2fEwS4S1vBBRipSRrDguzbP5UwY2XBlcJw0Zwo1b7QWu8cS
	luaz/Ayst6JqaxkOh1EhESGRs/8yLViZ7MmBpuxvy7ZlBKbrhQvCWAewRyryYnrCqoWuPCqSjB4
	fiHlLJDd9vpd8R/O0TgjwvTeziyCNjRHR4VawcHYvlRTUgUkbkMke+Bv64N0zTHvAD3aL8kgGDX
	6aYoGBLA6YF0cqQ1h7wfxgUlDws9hKOcAN0KnqIIvwycgb6VygfeE+xxXvjsA4=
X-Google-Smtp-Source: AGHT+IEVsK2hb41ndk08DsAN+R8x9yzNiSD3Xnxn/d42LtoWyp9X9Q3Lvp8+NitADR+4PPEFGgGGsA==
X-Received: by 2002:a05:6000:4009:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-385fd43556bmr9734740f8f.38.1733392397068;
        Thu, 05 Dec 2024 01:53:17 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4087sm1529194f8f.5.2024.12.05.01.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:53:16 -0800 (PST)
Message-ID: <02a2660f-b577-42b5-9c3d-4fb0429d8c67@linaro.org>
Date: Thu, 5 Dec 2024 09:53:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
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
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2024 09:59, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

